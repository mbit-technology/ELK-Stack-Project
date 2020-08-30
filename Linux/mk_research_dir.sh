!#/bash/bin

mkdir ~/research && sudo cp -r /var/log/* /etc/passwd /etc/shawod /etc/hosts ~/research
sudo find / -type f -permissions /4000 > ~/research/suid_lst.txt
ps aux --sort -%mem | awk {'print $1, $2, $3, $4, $11'} | head > ~/research/top_processes.txt
cat top_processes.txt 
ps aux --sort -%mem | awk '{print $1, $2, $3, $4, $11}' | head > ~/research/top_processes2.txt
cat top_processes2.txt
s /home > ~/research/users.txt && cat /etc/passwd | awk -F ":" '{if ($3>=1000) print $0}' >> ~/research/users.txt
cd ~/research
tail users.txt