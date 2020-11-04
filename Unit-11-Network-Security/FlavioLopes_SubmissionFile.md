## Network Security Homework Submission File

### Part 1
#### Security Control Types

With the understanding that Defense in Depth can be broken down into three different security control types, answer the following questions:

1. Walls, bollards, fences, guard dogs, cameras, and lighting are what type of security control?

    Answer:
````
Physical
````


2. Security awareness programs, BYOD policies, and ethical hiring practices are what type of security control?

    Answer:
```
Administrative
```

3. Encryption, biometric fingerprint readers, firewalls, endpoint security, and intrusion detection systems are what type of security control?

    Answer:
```
Technical
```

#### Intrusion Detection and Attack indicators

1. What's the difference between an IDS and an IPS?

    Answer:
````
The main difference between the two is mostly timing. An IDS allows some malicious traffic to pass (and create a copy) before the IDS can respond. An IPS drops it before the malicious traffic reaches its target.
````

2. What's the difference between an Indicator of Attack and an Indicator of Compromise?

   Answer:
````
IOA: indicates an attack is in progress; focus on intent of the attck, regardless of the malware or exploit used in an attack. Do not intervene when the attack has already happened, but rather when it is taking place, or even before it can become a real threat.
   
IOC: technical indicator that identifies potential instrusions on a system based on forensic data or evidence. Identifies an attack or a vulnerability found once the breach has already conclusively taken place. .
````


#### The Cyber Kill Chain

Name each of the seven stages for the Cyber Kill chain and provide a brief example of each.

```
1. Stage 1: Reconnaissance - gathers information from a target (email addresses, credentials, etc.)

2. Stage 2: Weaponization - establishes attacks vectors and technical profiles of targets (vulnerabilities, software, application, OS, connection type, security type, etc.) Also creates payloads ( virus, worms, malwares, dll updates, java executable files, etc.)

3. Stage 3: Delivery - delivers weaponized payload (email, website, USB, etc.)

4. Stage 4: Exploitation - exploits vulnerability to execute code on victim's system by ompromising target’s applications and servers while averting security controls.

5. Stage 5: Installation - installs malware on the target's asset.

6. Stage 6: Command and Control (C2) - commands remote control channel.

7. Stage 7: Actions on Objectives - grants access for intruder to accomplish their goals.
```

#### Snort Rule Analysis

Use the Snort rule to answer the following questions:

Snort Rule #1

```bash
alert tcp $EXTERNAL_NET any -> $HOME_NET 5800:5820 (msg:"ET SCAN Potential VNC Scan 5800-5820"; flags:S,12; threshold: type both, track by_src, count 5, seconds 60; reference:url,doc.emergingthreats.net/2002910; classtype:attempted-recon; sid:2002910; rev:5; metadata:created_at 2010_07_30, updated_at 2010_07_30;)
```

1. Break down the Sort Rule header and explain what is happening.

   Answer:
````
Alert any incoming TCP traffic from EXTERNAL_NET (internet) going to HOME_NET (Home Network) with port range 5800:5820
````

2. What stage of the Cyber Kill Chain does this alert violate?

   Answer:
````
Reconnaissance
````

3. What kind of attack is indicated?

   Answer:
````
"ET SCAN Potential VNC Scan 5800-5820" - possibility of Emerging Threat Network Scan, Virtual Network Computing Services listening to port 5800-5820"
````

Snort Rule #2

```bash
alert tcp $EXTERNAL_NET $HTTP_PORTS -> $HOME_NET any (msg:"ET POLICY PE EXE or DLL Windows file download HTTP"; flow:established,to_client; flowbits:isnotset,ET.http.binary; flowbits:isnotset,ET.INFO.WindowsUpdate; file_data; content:"MZ"; within:2; byte_jump:4,58,relative,little; content:"PE|00 00|"; distance:-64; within:4; flowbits:set,ET.http.binary; metadata: former_category POLICY; reference:url,doc.emergingthreats.net/bin/view/Main/2018959; classtype:policy-violation; sid:2018959; rev:4; metadata:created_at 2014_08_19, updated_at 2017_02_01;)
```

1. Break down the Sort Rule header and explain what is happening.

   Answer:
````
Alert any TCP EXTERNAL_NET (Internet) HTTP_PORTS (Web or Port 80) traffic going to Home Network
````


2. What layer of the Defense in Depth model does this alert violate?

   Answer:
````
Policies, Procedures, Awareness.
````


3. What kind of attack is indicated?

   Answer:
````
"ET POLICY PE EXE or DLL Windows file download HTTP - REVERSE ENGINEERING ATTACKS or DLL INJECTION"
````


Snort Rule #3

- Your turn! Write a Snort rule that alerts when traffic is detected inbound on port 4444 to the local network on any port. Be sure to include the `msg` in the Rule Option.

    Answer:
````
alert tcp $EXTERNAL_NET 4444 -> $HOME_NET any (msg:"Cross-Protocol Scripting Possible Trojan Activity on Port 4444")
````


### Lab: "Drop Zone"

#### Log into the Azure `firewalld` machine

Log in using the following credentials:

- Username: `sysadmin`
- Password: `cybersecurity`

#### Uninstall `ufw`

Before you get started, it's generally best practice to ensure that you do not have any instances of `ufw` running in order to avoid conflicts with your `firewalld` service. Additionally, this ensures that `firewalld` will be your default firewall.

- Run the command that removes any running instance of `ufw`.

    ```bash
    $ 'sudo ufw disable'
    ```

#### Enable and start `firewalld`

By default, these service should be running. If not, then run the following commands:

- Run the commands that enables and starts `firewalld` upon boots and reboots.

    ```bash
    $ `sudo systemctl enable firewalld'
    $ `sudo systemctl start firewalld'

    `sudo systemctl restart firewalld'
    ```

  Note: This will ensure that `firewalld` service remains active after each reboot.

#### Confirm that the service is running.

- Run the command that checks whether or not the `firewalld` service is up and running.

    ```bash
    $ `sudo systemctl status firewalld'
    ```


#### List all firewall rules currently configured.

Next, lists all currently configured firewall rules. This will give you a good idea of what's currently configured and save you time in the long run by not doing double work.

- Run the command that lists all currently configured firewall rules:

    ```bash
    $ 'sudo firewall-cmd --list-all'
    ```

- Take note of what Zones and settings are configured. You many need to remove unneeded services and settings.

#### List all supported service types that can be enabled.

- Run the command that lists all currently supported services to see if the service you need is available

    ```bash
    $ 'sudo firewall-cmd --get-services'
    ```

 Note: that we can see that the `Home` and `Drop` Zones are created by default.


#### Zone Views

- Run the command that lists all currently configured zones.

    ```bash
    $ 'sudo firewall-cmd --list-all-zones'
    ```

- We can see that the `Public` and `Drop` Zones are created by default. Therefore, we will need to create Zones for `Web`, `Sales`, and `Mail`.

#### Create Zones for `Web`, `Sales` and `Mail`.

- Run the commands that creates Web, Sales and Mail zones.

    ```bash
    $ 'sudo firewall-cmd --zone=Web'
    $ 'sudo firewall-cmd --zone=Sales'
    $ 'sudo firewall-cmd --zone=Mail'
    ```

#### Set the zones to their designated interfaces:

- Run the command that sets your `eth0` interface to your zones.

    ```bash
    $ 'sudo firewall-cmd --zone=Web --add-interface=eth1'
    $ 'sudo firewall-cmd --zone=Sales --add-interface=eth2'
    $ 'sudo firewall-cmd --zone=Mail --add-interface=eth3'
    $ 'sudo firewall-cmd --zone=Public --change-interface=eth0'
    ```

#### Add services to the active zones:

- Run the commands that add services to the **public** zone, the **Web** zone, the **sales** zone,and the **mail** zone.

- Public:

    ```bash
    $ 'sudo firewall-cmd --zone=public --add-service=https --permanent'
    $ 'sudo firewall-cmd --zone=public --add-service=dns --permanent'
    $ 'sudo firewall-cmd --zone=public --add-service=ssh -permanent'
    $ 'sudo firewall-cmd --zone=public --add-service=http --permanent'
    ```

- Web:

    ```bash
    $ 'sudo firewall-cmd --zone=Web --add-service=http --permanent'
    ```

- Sales

    ```bash
    $ 'sudo firewall-cmd --zone=Web --add-service=https --permanent '
    ```

- Mail

    ```bash
    $ 'sudo firewall-cmd --zone=Mail --add-service=smtp --permanent'
    $ 'sudo firewall-cmd --zone=Mail --add-service=pop3 --permanent'
    ```

- What is the status of `http`, `https`, `smtp` and `pop3`?

#### Add your adversaries to the Drop Zone.

- Run the command that will add all current and any future blacklisted IPs to the Drop Zone.

     ```bash
    $ sudo firewall-cmd --zone=Drop --add-rich-rule='rule family="ipv4" source address="10.208.56.23'
    $ sudo firewall-cmd --zone=Drop --add-rich-rule='rule family="ipv4" source address="135.95.103.76'
    $ udo firewall-cmd --zone=Drop --add-rich-rule='rule family="ipv4" source address="76.34.169.118'
    ```

#### Make rules permanent then reload them:

It's good practice to ensure that your `firewalld` installation remains nailed up and services across reboots. This ensures that the network remains secured after unplanned outages such as, power failures.

- Run the command that reloads the `firewalld` configurations and writes it to memory

    ```bash
    $ 'sudo firewall-cmd --runtime-to-permanent'
    $ ' sudo firewall-cmd --reload '
    ```

#### View active Zones

Now we'll want to provide truncated listings of all currently active zones. This a good point to verify your zone settings.

- Run the command that displays all zone services.

    ```bash
    $ 'sudo firewall-cmd --get-active-zones'
    $ 'sudo firewall-cmd --list-all-zones'
    ```


#### Block an IP address

- Use a rich-rule that blocks the IP address `138.138.0.3`.

    ```bash
    $ sudo firewall-cmd --zone=Drop --add-rich-rule='rule family="ipv4" source address="138.138.0.3" reject'
    ```

#### Block Ping/ICMP Requests

You've decided to harden your network against `ping` scans by blocking `icmp ehco` replies.

- Run the command that blocks `pings` and `icmp` requests in your `public` zone.

    ```bash
    $ 'sudo firewall-cmd --zone=public --add-icmp-block=echo-reply --add-icmp-block=echo-request'
    ```

#### Rule Check

Now that you've set up your brand new `firewalld` installation, it's time to verify that all of the settings have taken effect.

- Run the command that lists all  of the rule settings. Do one command at a time for each zone.

    ```bash
    $ 'sudo firewall-public --zone=home --list-all'
    $ 'sudo firewall-Web --zone=home --list-all'
    $ 'sudo firewall-Sales --zone=home --list-all'
    $ 'sudo firewall-Mail --zone=home --list-all'
    $ 'sudo firewall-Drop --zone=home --list-all'
    ```

- Are all of our rules in place? If not, then go back and make the necessary modifications before checking again.


Congratulations! You have successfully configured and deployed a fully comprehensive `firewalld` installation.

---
---

### Part 2

Now, we will work on another lab. Before you start, complete the following review questions.

#### IDS vs. IPS Systems

1. Name and define two ways an IDS connects to a network.

   Answer 1:
````
Network TAP (Test Access Port): hardware device that accesses to a network. Works for both inbound and outbound data streams on separate channels at the same time.
````


   Answer 2:
````
SPAN (Switched Port Analyzer): port mirroring, sends a mirror image of all network data to another physical port, where the packets can be captured and analyzed.
````


2. Describe how an IPS connects to a network.

   Answer:
````
IPS connects inline with the flow of data, typically between the firewall and network switch.
````


3. What type of IDS compares patterns of traffic to predefined signatures and is unable to detect Zero-Day attacks?

   Answer:
````
Signature based.
````


4. Which type of IDS is beneficial for detecting all suspicious traffic that deviates from the well-known baseline and is excellent at detecting when an attacker probes or sweeps a network?

   Answer:
````
Anomaly based.
````


#### Defense in Depth

- For each of the following scenarios, provide the layer of Defense in Depth that applies:

1.  A criminal hacker tailgates an employee through an exterior door into a secured facility, explaining that they forgot their badge at home.

    Answer:
````
Physical.
````


2. A zero-day goes undetected by antivirus software.

    Answer:
````
Application.
````


3. A criminal successfully gains access to HR’s database.

    Answer:
````
Data.
````


4. A criminal hacker exploits a vulnerability within an operating system.

    Answer:
````
Host.
````


5. A hacktivist organization successfully performs a DDoS attack, taking down a government website.

    Answer:
````
Internl network.
````


6. Data is classified at the wrong classification level.

    Answer:
````
Policies, procedures, Awareness.
````


7. A state sponsored hacker group successfully firewalked an organization to produce a list of active services on an email server.

    Answer:
````
Perimeter.
````


- Name one method of protecting data-at-rest from being readable on hard drive.

    Answer:
````
Hard drive Ecryption.
````


- Name one method to protect data-in-transit.

    Answer:
````
VPN.
````


- What technology could provide law enforcement with the ability to track and recover a stolen laptop.

   Answer:
````
GPS.
````


- How could you prevent an attacker from booting a stolen laptop using an external hard drive?

    Answer:
````
Firmware passwords.
````


### Lab: "Green Eggs & SPAM"

In this activity, you will target spam, discover its whereabouts, and uncover the malicious deeds that the sender is intending.

- You will assume the role of a Jr. Security administrator working for the Department of Technology for the State of California.

- As a junior administrator, your primary role is to perform the initial triage of alert data: the initial investigation and analysis followed by an escalation of high priority alerts to senior incident handlers for further review.

- You will work as part of a Computer and Incident Response Team (CIRT), responsible for producing a **Threat Intelligence Card** as part of your incident report.

#### Threat Intelligence Card

**NOTE** Log into the Security Onion VM and use the following **Indicator of Attack** to complete this portion of the homework. 

Locate the following Indicator of Attack in Sguil based off of the following:

   - **Source IP/Port** 188.124.9.56:80
   - **Destination Address/Port** 192.168.3.35:1035
   - **Event Message** ET TROJAN JS/Nemucod.M.gen downloading EXE payload

Answer the following:

1. What was the indicator of an attack in Sguil?
   - Hint: Do the packet details tell you anything? 
````
Any TCP incoming external traffic from Web going to any Home Network with a "ET TROJAN" named "JS/Nemucod download EXE" is a RED ALERT Trojan Activity.
````


2. What was the adversarial motivation (purpose of attack)?
````
There may be a few, like steal information or install a malware or ransomware.
````


3. Describe observations and indicators that may be related to the perpetrators of the intrusion. Categorize your insights according to the appropriate stage of the cyber kill chain, as structured in the following table.

| TTP | Example | Findings |
| --- | --- | --- | 
| **Reconnaissance** |  How did they attacker locate the victim? | 
````
Nemucod delivered by e-mail (usually spam), sent out as mass mailings by the malware's distributors and are usually social-engineered to appear legitimate or enticing.
````

| **Weaponization** |  What was it that was downloaded?|
````
ZIP file, DLL File : .js .zip .exe.
````

| **Delivery** |    How was it downloaded?|
````
The victim opens the attached ZIP file which runs the JavaScript file it contains.
````

| **Exploitation** |  What does the exploit do?|
````
It may steal information, get passwords or even deliver ramsonware.
````

| **Installation** | How is the exploit installed?|
````
The Nemucod downloads the file (ddl) to the %TEMP% folder and run it via  rundll32.exe.
````

| **Command & Control (C2)** | How does the attacker gain control of the remote machine?|
````
The Nemucod downloader executes the right ddl file or through username/password to gain control of the victim's unit. The control is consistent even after a system restart.
````

| **Actions on Objectives** | What does the software that the attacker sent do to complete it's tasks?|
````
The Nemucod Downloader will install a malware or ransomware that disables the functionality of the target machine unless it is paid.
````

___

4. What are your recommended mitigation strategies?
````
- Disable Port 80 and enable Port 443 and enable SMTP protocol
- Disable Automatic Update on Clients or Updates are only being controlled by Admin
- Dedicate a bin or temporary cache for downloaded files before being received by the client or
- Disable all download in user mode
- Lock the Integrity System of the Client Computer
- Installation of AntiVirus and AntiMalware 
- Firewall filtering 
````

5. List your third-party references.
````
https://lists.emergingthreats.net/pipermail/emerging-sigs/2015-November/026732.html
https://www.f-secure.com/v-descs/trojan-downloader_js_nemucod.shtml
https://www.lockheedmartin.com/en-us/capabilities/cyber/cyber-kill-chain.html
````


For the final part of the homework, complete a set of review questions about firewall architecture and methodologies:

### Firewall Architectures and Methodologies

1. Which type of firewall verifies the three-way TCP handshake? TCP handshake checks are designed to ensure that session packets are from legitimate sources.

  Answer:
````
Stateless Packet Filtering Firewall.
````


2. Which type of firewall considers the connection as a whole? Meaning, instead of looking at only individual packets, these firewalls look at whole streams of packets at one time.

  Answer:
````
Stateful Packet Filtering Firewall.
````


3. Which type of firewall intercepts all traffic prior to being forwarded to its final destination. In a sense, these firewalls act on behalf of the recipient by ensuring the traffic is safe prior to forwarding it?

  Answer:
````
Application or Proxy Firewalls or Application-Level Gateways.
````



4. Which type of firewall examines data within a packet as it progresses through a network interface by examining source and destination IP address, port number, and packet type- all without opening the packet to inspect its contents?

  Answer:
````
Circuit-level Gateways.
````



5. Which type of firewall filters based solely on source and destination MAC address?

  Answer:
````
Layer 3 firewall.
````



---

© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
