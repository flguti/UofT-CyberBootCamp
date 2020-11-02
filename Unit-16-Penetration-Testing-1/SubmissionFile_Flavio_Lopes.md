## Week 16 Homework Submission File: Penetration Testing 1

#### Step 1: Google Dorking


- Using Google, can you identify who the Chief Executive Officer of Altoro Mutual is:
```
Karl Fitzgerald
Chairman & Chief Executive Officer
Altoro Mutual
```

- How can this information be helpful to an attacker:
```
yes, this name can be used in a phishing email or any social engineering atack
```

#### Step 2: DNS and Domain Discovery

Enter the IP address for `demo.testfire.net` into Domain Dossier and answer the following questions based on the results:

  1. Where is the company located: 
```
    Address:        9725 Datapoint Drive, Suite 100
    City:           San Antonio
    StateProv:      TX
    PostalCode:     78229
    Country:        US
```

  2. What is the NetRange IP address:
```
    NetRange:       65.61.137.64 - 65.61.137.127
```

  3. What is the company they use to store their infrastructure:
```
5000 Walzem Rd\nSan Antonio\nTX\n78218\nUnited States
```

  4. What is the IP address of the DNS server:
```
23.211.61.64
```

#### Step 3: Shodan

- What open ports and running services did Shodan find:
```
80, 443 and 8080
```

#### Step 4: Recon-ng

- Install the Recon module `xssed`. 
- Set the source to `demo.testfire.net`. 
- Run the module. 

Is Altoro Mutual vulnerable to XSS: 
```
yes
```

### Step 5: Zenmap

Your client has asked that you help identify any vulnerabilities with their file-sharing server. Using the Metasploitable machine to act as your client's server, complete the following:

- Command for Zenmap to run a service scan against the Metasploitable machine: 
```
nmap -sV 192.168.0.10
```

- Bonus command to output results into a new text file named `zenmapscan.txt`:

- Zenmap vulnerability script command: 

```
nmap--script ftp-vsftpd-backdoor 192.168.0.10
```

- Once you have identified this vulnerability, answer the following questions for your client:
  1. What is the vulnerability:
```
      - CVE-2011-2523: `vsftpd 2.3.4` downloaded between 20110630 and 20110703 contains a backdoor which opens a shell on port 6200/tcp.
```

  2. Why is it dangerous:
```
A remote attacker can therefore use this backdoor, in order to access to the system.
```

  3. What mitigation strategies can you recommendations for the client to protect their server:
```
Solutions for this threat 
vsftpd: version 2.3.4 posterior to the 3rd of July 2011.
If vsftpd 2.3.4 was downloaded between the 30th of June 2011 and the 3rd of July 2011, the new version has to be downloaded:
  https://security.appspot.com/downloads/vsftpd-2.3.4.tar.gz
  https://security.appspot.com/downloads/vsftpd-2.3.4.tar.gz.asc
```

---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.  

