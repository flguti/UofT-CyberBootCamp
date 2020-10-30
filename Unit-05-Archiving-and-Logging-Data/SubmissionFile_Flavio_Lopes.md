## Submission File for Unit 5: Archiving and Logging Data Homework

Please edit and save this file while updating it with the commands and file (configuration and rules) edits you used to solve your homework.

---

### `tar`: Create, extract, compress, and manage tar backup archives

Command to **extract** the `TarDocs.tar` archive to the current directory:

- `sudo tar xvvf TarDocs.tar` 

Command to **create** the `Javaless_Doc.tar` archive from the `TarDocs/` directory, while excluding the `TarDocs/Documents/Java` directroy:

- `sudo tar cvvW --exclude='TarDocs/Documents/Java' -f Javaless_Doc.tar TarDocs/` 

Ensuring `Java/` is not in the new `Javaless_Docs.tar` archive:

- `tar tvf Javaless_Docs.tar | grep Documents/Java` 

**Bonus:** Command to create an incremental archive called `logs_backup_tar.gz` with only changed files to `snapshot.file` for the `/var/log` directory.

- `sudo tar -zcvf logs_backup_tar.gz --listed-incremental=/var/log/logs_backup_tar.snar --level=0 /var/log` : 



#### `tar` Critical Thinking

Why wouldn't you use the options `-x` and `-c` at the same with `tar`?
--- It will have an error. A tar command cannot create and extract an archive file at the same time.

### `cron`: Create, manage and automate various cron jobs

Cron job for backing up the `/var/log/auth.log` file:
   - This cronjob should create an archive of the following file:         `/var/log/auth.log`
   - The filename and location of the archive should be:                  `/auth_backup.tgz`
   - The archiving process should be scheduled to run every Wednesday at  `6AM`
   - Use the correct archiving zip option to compress the archive using   `gzip`

- `0 6 * * 3 -zcvf /var/log/auth_backup.tgz /var/log/auth.log ` 
---

### `bash scripting`: Write basic bash scripts

Brace expansion command to create the four subdirectories:

- ` mkdir backup/freemem
    mkdir backup/diskuse
    mkdir backup/openlist
    mkdir backup/freedisk`


Command and file edit to create `system.sh` (you can copy and paste it here).

- `sudo nano system.sh`



- Within the script (system.sh), have the following.

    ```bash
    `#!/bin/bash
    sudo free -h >          ~/backups/freemem/free_mem.txt
    sudo du -h >          ~/backups/diskuse/disk_usage.txt
    lsof         >          ~/backups/openlist/open_list.txt
    sudo df -Hh >          ~/backups/freedisk/free_disk.txt`  


    ```
Command to make the `system.sh` script executable : sudo sh system.sh

`   Confirm script's execution. 
    To check system.sh : sudo bash -n system.sh
    To check individual files do the following : 
        tail ~/backups/freemem/free_mem.txt
        tail ~/backups/diskuse/disk_usage.txt
        tail ~/backups/openlist/open_list.txt
        tail ~/backups/freedisk/free_disk.txt


### `journalctl`: Perform various log filtering techniques

Command to return `journalctl` messages with priorities from emergency to error.

- `sudo journalctl -b -0 -p emerg..err`

Command to return `systemd-journald` messages.

- `sudo journalctl -b -0 -u systemd-journald | less` 

Command to prune archived journal files except the most recent 2:

- `sudo journalctl --vacuum-files=2` 

**Bonus** Command to filter all log messages with priority levels between 0 and 2, output to `/home/sysadmin/Priority_High.txt`

- `sudo journalctl -p emerg..crit > /home/sysadmin/Priority_High.txt0` 

**Bonus 2** Command and file edit to automate the last command in a daily cronjob:

- `sudo crontab -e` 
 
- Within the `crontab` file, add the following:

    ```bash
        @daily sudo journalctl -p emerg..crit >> /home/sysadmin/Priority_High.txt
    ```
---

### `rsyslog`: Priority based log file creation

Command and file edit to record all `mail` log messages, except for `debug` to `/var/log/mail.log`:

- `sudo nano /etc/rsyslog.d/50-default.conf` 

Command and file edit to record all `boot` log messages, except for `info` and `debug` to `/var/log/boot.log`:

- `sudo nano /etc/rsyslog.d/50-default.conf` 

- Add within the configuration file:

    ```bash
    daemon.!info,!debug             -/var/log/daemon.logc
    ```

---

### `logrotate`: Manage log file sizes

Command and file edit that backs up authentication messages to `/var/log/auth.log`:

- Run `sudo nano /etc/logrotate.conf` to edit the `logrotate` configuration file.

- Add within the configuration file: 

```bash 
    /var/log/auth.log {
        rotate 7
        weekly
        missingok
        notifempty
        delay compression
        endscript
}
```
`sudo logrotate -vf /etc/logrotate.conf'


### BONUS ACTIVITY `auditd`: Check for policy and file violations.

Command to verify `auditd` is active:

- `systemctl status auditd` 

Command and file edit to set number of retained logs and maximum log file size:

- `sudo nano /etc/audit/auditd.conf` 

- Add within the configuration file.
      
     ```bash
        num_logs = 10
        max_log_file = 50
    ```

Command and file edit using `auditd` itself to set rules for `/etc/shadow`, `/etc/passwd` and `/var/log/auth.log`:

- `sudo nano /etc/audit/rules.d/audit.rules` 

- Add within the `rules` file:

    ```bash
    `-w /etc/shadow -p wa -k shadow`
    `-w /etc/passwd -p wa -k passwd'
    '-a always,exit -F arch=b32 -F uid=33 -S execve -k programs -k www'
    '-a exit,always -S unlink -S rmdir'
    '-a exit,always -S stime.*'
    '-a exit,always -S setrlimit.*'
    '-w /etc/group -p wa'
    '-w /etc/sudoers -p wa'

    ```

Command to restart `auditd`. 
- `sudo systemctl restart auditd` 

Command to list all `auditd` rules.
- `sudo auditctl -l` 

Command to produce an audit report.
- `sudo aureport -aue` 

Command to use `auditd` to watch `/var/log/cron`.
- `sudo auditctl -w /var/log/ -k cron*`  

Command to re-verify `auditd` rules.
- `sudo auditctl -l` 

--- 
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
