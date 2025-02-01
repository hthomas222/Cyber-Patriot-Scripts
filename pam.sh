#!/bin/bash


apt-get install libpam-pwquality



echo "Enter the minimum password length: "
read minlen
echo "Enter the miminum number of chars classes: "
read minclass
echo "Enter the max number of repeated chars: "
read maxrepeat
echo "Enter the number of chars that differ from old password: "


sed -i "s/^minlen = .*/minlen = $minlen/" /etc/security/pwquality.conf
sed -i "s/^minclass = .*/minclass = $minclass/" /etc/security/pwquality.conf
sed -i "s/^maxrepeat = .*/maxrepeat = $maxrepeat/" /etc/security/pwquality.conf
sed -i "s/^difok = .*/difok = $difok/" /etc/security/pwquality.conf
