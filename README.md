# UPGer | CVE-2022-4060 - User Post Gallery
Automatic Mass Tool for checking vulnerability in CVE-2022-4060 - WordPress Plugin : User Post Gallery <= 2.19 - Unauthenticated RCE<br>Using GNU Parallel. You must have parallel for running this tool.<br>
- <b>If you found error like "$'\r': command not found" just do "dos2unix upger.sh"</b>
# Install Parallel
- Linux : <code>apt-get install parallel -y</code><br>
- Windows : You can install WSL (windows subsystem linux) then do install like linux<br>if you want use windows (no wsl), install <a href="https://git-scm.com/download/win">GitBash</a> then do this command for install parallel: <br>
[#] <code>curl pi.dk/3/ > install.sh </code><br>[#] <code>sha1sum install.sh | grep 12345678 </code><br>[#] <code>md5sum install.sh </code><br>[#] <code>sha512sum install.sh </code><br>[#] <code>bash install.sh</code><br>
# How To Use
- [#] <code>bash upger.sh yourlist.txt thread</code>
# Reference
- https://nvd.nist.gov/vuln/detail/CVE-2022-4060
- https://wpscan.com/vulnerability/8f982ebd-6fc5-452d-8280-42e027d01b1e
- https://github.com/advisories/GHSA-g823-9xxv-px4q
