# UofT-CyberBootCamp
Homework for UofT CuberSecurity Bootcamp Course

Components


VMs:

vm1

Docker container:cyberxsecurity/dvwavm2

Jump-Box-Provisioner

IP: 10.0.0.4
Public IP: 52.188.36.51

DNS: jumpflaviolopes.eastus.cloudapp.azure.com

OS: Ubuntu 18.04-LTS
Size: Standard B1s (1 vcpus, 1 GiB memory)
Access Key: jumpbox.pem
Docker container:cyberxsecurity/ansible

ELK



Virtial Network:

RedTeamNet

Network Security Group:

RedTeamNet-SG



Virtial Network:

ELK-Vnet

Network Security Group:

ELKnsg891



Load Balancing:

Red-Team-LB

IP: 40.71.30.218

DNS: loadbalanceflavio.eastus.cloudapp.azure.com

Backend pool: 

RedTeamPool

web1

web2

Health probes:

RedTeamProbe

TCP port 80

Load Balance rules:

PentestLBR

40.71.30.218:80 > RedTeamPool:80