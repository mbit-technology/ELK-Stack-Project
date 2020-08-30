backupsysadmin.sh
#!/bin/bash
mkdir -p /var/backup
tar cvf /var/backup/sysadmin.tar /home/sysadmin
mv /var/backup/sysadmin.tar /var/backup/sysadmin.last.tar
tar cvf /var/backup/system.tar /home/sysadmin 	
ls -lh /var/backup > /var/backup/file_report.txt
free -h > /var/backup/disk_report.txt