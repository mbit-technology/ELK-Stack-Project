Cron and Scheduled Jobs 
A cron job is a script or command designated to run at regular or periodic , pre-determined intervals. They can be used for both user-level or system level tasks. 
User level cron jobs- can automate the process of deleting cache, emptying trash and backup documents. 
System level cron jobs- can automate daily updates. 
Daemon - is a computer program that runs as a background process, rather than being under the direct control of an interactive user. 

Cron is most suitable for scheduling repetitive tasks.  
Cron tasks are scheduled in a file called crontab or cron table 

Users have their own individual crontab files, which are private to them.  
Tasks scheduled by users are run under that user's current privilege level. 
Root users can have a crontab too. 
    cron Syntax 
    values range in minutes 0-59 
    Hour 0-23 
    Day of month 1-31 
    Month 1-12 OR first three letters of month 

Day of week 0-7. 0 is Sunday. Can also accept first 3 letters of month 
    root - execute command as user root 
    Normally do not include? 
Script location 

cron Syntax 
Let's look at crontab on the command line. 
While they may seem intimidating, crontab rules can be learned relatively easily with some practice. 
# Execute backup . sh script every Sunday at 2:36 a.m. 
36 2 * * 7 root/usr/local/sbin/backup.sh 
0-59 0-23 
36 
Value 
Range 
Value 
Range 
Value 
Range 
1-31 
Value 
Range 
1-12 
Value 
Range 
0-7 
/usr/local/sbin/backup.sh 
root 
- Execute command as user root 
Sunday O, Monday = 1. Tuesday = 2. Wednesday = 3, 
Have any first impressions? 
- Day of Week 
Thursday 4, Friday 5, Saturday 6, Sunday 7 
- Month 
- Day of Month 
- Hour 
- Minute 
source: 
January 1. February 2, March 3, April 4, May 5, June 6. July 7, 
August 8. September 9, October 10, November 1, December 12 
    crontab.guru      # this website checks your syntax.  

You create a crontab, with the permissions that you currently have at the time of creation. 
    crontab -e 
    Edits crontab. Choose Nano.  
    crontab -l 
    Lists the crontabs for current user. 
    sudo crontab -e 
    This runs a crontab with root priviliedges. Malicious scripts can be placed here. 

 (Five arerisks are for minute, hour, day, week, month, SCRIPT) 
Five arterisks with spaces in between. Then the script you want to run. 
Cron tab accepts one automated schedule per line. 

Cron jobs run under the same permissions as the user who creates them.  
    Security audit: inspecting root crontabs is important to identify malicious scripts. 
    systemctl 
    Identify if crontab was running 
        00 18 star star star cp ~/Downloads/doctors*.docx ~/Documents/doctors 
        every day at 6pm, copy <from directory><destination directory> 
00 18 1 star star cp <from directory> <destination directory> 
1st day of the moth, 6pm, copy <from directory><destination directory> 
00 star star star wed 
On wednesdays, copy all <from directory><destination directory> 
User Level - Runs for a specific user under their priviledge 
System Level - Runs for the system as a whole under root priviledge 
Introduction to Scripts 
Cron is useful for single tasks like backing up a single user directory. But not for backing up severl users' directories.  
Remember, for scripts used in bash, must have shebang below 
#! /bin/bash 
Remember, to make  a script executable, must do  
chmod +x <script>. 
apt update -y && apt upgrade -y && apt full-upgrade -y && apt autoremove --purge -y 
OR 
apt update -y  
This command downloads updates and answers yes to the prompted question 
apt upgrade -y 
apt full-upgrade -y 
Upgrades entire system 
apt autoremove --purge -y 
Gets rid of unneeded packages. 
Scheduling jobs 
System-wide cron direcories 
/etc/cron.d 
/etc/cron.daily 
/etc/cron.weekly 
/etc/cron.monthly 
0anacron  
# Is under /etc/cron.daily which runs overdues scripts/tasks 


In cron.daily , is a good place to put malicious files. 


Lynis is a security auditing system. You can self audit. It’s a security scanner used to scan for vulnerabilities.  
    sudo lynis show groups 
    Finds all groups in the system 
    sudo lynis audit --quick 
    Uses Lynis to audit  
    sudo lynis --tests-from-group <group> 
    Uses lynis to conduct a test on a specific group 
    With the right permissions, you can place scripts in the cron.weekly , cron.monthly, and cron.daily  etc directories. 

 # ! / bin/ bash 
# Create /var/backup if it doesn't exist 
mkdir —p /var/backup 
# Cr
eate new /var/backup/home. tar 
tar cvf /var/backup/home.tar / home 
# Moves the file /var/backup/home.tae to /var/backup/home. last. tars . 
mv /var/backup/home.tar /var/backup/home. last. tar 
# Creates an archive of /home• and saves it to /var/backup/home.tae . 
tar cvf /var/backup/system. tar / home 
# List all files in %/var/backu$ , including file sizes, and save the output to S/var/backup/fiie report.txe . 
is —Ih /var/backup > /var/backup/fiie report. txt 
# Print how much free memory your machine has left. Save this to a file called S/var/backup/disk_report.txe . 
free —h > /var/backup/disk_report. txt 
 

#! /bin /bash 
# Clean up terv directories 
m —rf /tmp/* 
m —rf /var/trnp/* 
# Clear apt cache 
apt clean —Y 
# Clear thumbnail cache for sysadmin, instructor, 
and student 
rm 
rm 
rm 
rm 
—rf 
—rf 
—rf 
—rf 
/home/sysadmin/. cache/thumbna i ts 
/home/ inst ructo r/. cache/thÄnaits 
/home/student/. cache/thumbnai Is 
/ root/. cache/thumbnaits 
 

 # ! /bin/bash 
# Ensure apt has att available updates 
apt update —Y 
# Upgrade atl installed packages 
apt upgrade —Y 
# Install new packages, and uninstall any old packages that 
# must be removed to install them 
apt full—upgrade —y 
# Remove unused packages and their associated configuration files 
apt autoremove —purge —y 
— Perform with a single tine of code. 
# Bonus 
apt update —y apt upgrade —y apt full—upgrade 
—y apt—get autoremove 
—purge —Y 
 