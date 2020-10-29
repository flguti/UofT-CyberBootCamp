## Week 4 Homework Submission File: Linux Systems Administration

### Step 1: Ensure Permissions on Sensitive Files

1. Permissions on `/etc/shadow` should allow only `root` read and write access.

- Command to inspect permissions:  
```
ls -la /etc/shadow
-rw-r----- 1 root shadow 2888 Jun 10 08:45 /etc/shadow
```
- Command to set permissions (if needed):

```    
sudo chmod 600 /etc/shadow
ls -la /etc/shadow
-rw------- 1 root shadow 2888 Jun 10 08:45 /etc/shadow
```

2. Permissions on `/etc/gshadow` should allow only `root` read and write access.

- Command to inspect permissions: 
    
```
ls -la /etc/gshadow
-rw-r----- 1 root shadow 1076 Jun 10 08:45 /etc/gshadow
```

- Command to set permissions (if needed): 
```
sudo chmod 600 etc/gshadow
ls -la /etc/gshadow
-rw------- 1 root shadow 1076 Jun 10 08:45 /etc/gshadow
```

3. Permissions on `/etc/group` should allow `root` read and write access, and allow everyone else read access only.

- Command to inspect permissions: 
```
ls -la /etc/group
-rw-r--r-- 1 root root 1303 Jun 10 08:45 /etc/group
```

- Command to set permissions (if needed): 
```
no need but that would be sudo chmod 644 /etc/group 
```

4. Permissions on `/etc/passwd` should allow `root` read and write access, and allow everyone else read access only.

- Command to inspect permissions:  
```
ls -la /etc/passwd
-rw-r--r-- 1 root root 3214 Jun 10 08:45 /etc/passwd
```

- Command to set permissions (if needed):  
```
no need but that would be sudo chmod 644 /etc/passwd
``` 

### Step 2: Create User Accounts

1. Add user accounts for `sam`, `joe`, `amy`, `sara`, and `admin`.

- Command to add each user account (include all five users):
```
    users=(sam joe amy sara admin)
    for u in "${users[@]}"; 
    do
      sudo adduser $u
    done  
```

2. Force users to create 16-character passwords incorporating numbers and symbols.

- Command to edit `pwquality.conf` file: 
```
    vi /etc/security/pwquality.conf
```

- Updates to configuration file:
```
find the lines
# minlen = 8
# dcredit = 0
# ocredit = 0
# minclass = 0
change these lines to:
minlen = 16
dcredit = 1
ocredit = 1
minclass = 1
```


3. Force passwords to expire every 90 days.

- Command to to set each new user's password to expire in 90 days (include all five users): 
```
for new users, created from now on:
vi /etc/login.defs
find the lines
PASS_MAX_DAYS   99999
change these lines to:
PASS_MAX_DAYS   90
save the file

to change in the 5 created users:
    users=(sam joe amy sara admin)
    for u in "${users[@]}"; 
    do
      sudo chage --maxdays 90 $u
    done 

```  

4. Ensure that only the `admin` has general sudo access.

- Command to add `admin` to the `sudo` group:
```
sudo usermod -aG sudo admin
```

### Step 3: Create User Group and Collaborative Folder

1. Add an `engineers` group to the system.

- Command to add group:
```
sudo groupadd engineers 
```

2. Add users `sam`, `joe`, `amy`, and `sara` to the managed group.

- Command to add users to `engineers` group (include all four users):
```
    users=(sam joe amy sara )
    for u in "${users[@]}"; 
    do
      sudo usermod -aG engineers $u
    done 
```

3. Create a shared folder for this group at `/home/engineers`.

- Command to create the shared folder:
```
sudo mkdir -p /home/engineers
```

4. Change ownership on the new engineers' shared folder to the `engineers` group.

- Command to change ownership of engineer's shared folder to engineer group:
```
sudo chgrp -R engineers /home/engineers
```

5. Add the SGID bit and the sticky bit to allow collaboration between engineers in this directory. 

- Command to set SGID and sticky bit to shared folder:
```
sudo chmod o+t /home/engineers
sudo chmod g+s /home/engineers
```

### Step 4: Lynis Auditing

1. Command to install Lynis:
```
sudo apt install lynis
```

2. Command to see documentation and instructions:
```
man lynis
sudo lynis show options
```

3. Command to run an audit:
```
sudo lynis audit system
```

4. Provide a report from the Lynis output on what can be done to harden the system.

- Screenshot of report output:
```
lynis.report file is the full report
```


### Bonus
1. Command to install chkrootkit:
```
sudo apt install chkrootkit
```

2. Command to see documentation and instructions:
```
sudo chkrootkit -h
man chkrootkit
```

3. Command to run expert mode:
```
sudo chkrootkit -x
```

4. Provide a report from the chrootkit output on what can be done to harden the system.
- Screenshot of end of sample output:
```
chkrootkit.report file is the full report
```

---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
