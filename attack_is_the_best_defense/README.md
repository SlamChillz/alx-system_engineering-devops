# Attack is the best defense

The objects of this project are:

- Hacking
- Network sniffing
- ARP spoofing
- Dictionary attack
- Network and interface security
- Connecting to sendGrid's SMTP relay using telnet

## ARP spoofing and sniffing unencrypted traffic

The mission is to execute this script [user_authenticating_into_server](./https://alx-intranet.hbtn.io/rltoken/GE_FoAUArlVccQlt7CuBGA) locally on your machine and, using `tcpdump`, sniff the network to find my password. Once you find it, paste the password in your answer file, [0-sniffing](./0-sniffing). Below is a simulation of the script.
```
sylvain@ubuntu$ telnet smtp.sendgrid.net 587
Trying 167.89.121.145...
Connected to smtp.sendgrid.net.
Escape character is '^]'.
220 SG ESMTP service ready at ismtpd0013p1las1.sendgrid.net
EHLO ismtpd0013p1las1.sendgrid.net
250-smtp.sendgrid.net
250-8BITMIME
250-PIPELINING
250-SIZE 31457280
250-STARTTLS
250-AUTH PLAIN LOGIN
250 AUTH=PLAIN LOGIN
auth login           
334 VXNlcm5hbWU6
[base64 encoding of username]
334 UGFzc3dvcmQ6
[base64 encoding of user password]
235 Authentication successful
mail from: sylvain@kalache.fr
250 Sender address accepted
rcpt to: julien@google.com
250 Recipient address accepted
data
354 Continue
To: Julien
From: Sylvain
Subject: Hello from the insecure world

I am sending you this email from a Terminal.
.
250 Ok: queued as Aq1zhMM3QYeEprixUiFYNg
quit
221 See you later
Connection closed by foreign host.
sylvain@ubuntu$
```

#### Solution
- Open a terminal1 and run the following command `sudo tcpdump -A -i any src host <your-ip-addr>`
	- This prints outgoing packets from your device in plain text
- Open terminal2 and run the given script `./user_authenticating_into_server`
	- At the end of this script execution, analyse terminal1 to find the `[base64 encoded user password]`
- Using the base64 terminal command of the web application GUI, decode the base64 string to get the password.


## Dictionary attack
Password-based authentication systems can be easily broken by using a dictionary attack. Let’s try it on an SSH account.

- Install Docker on your machine Ubuntu
- Pull and run the Docker image `sylvainkalache/264-1` with the command `docker run -p 2222:22 -d -ti sylvainkalache/264-1`
- Find a password dictionary (you might need multiple of them)
- Install and use `hydra` to try to brute force the account `sylvain` via SSH on the Docker container
- Because the Docker container is running locally, hydra should access the SSH account via IP `127.0.0.1` and port `2222`
- Hint: the password is 11 characters long

#### Solution
- Password Dictionary used [rockyou.txt](./https://www.kaggle.com/datasets/wjburns/common-password-list-rockyoutxt)
- Command ran `hydra -l <user> -P <dictionary> ssh://127.0.0.1:2222` 
