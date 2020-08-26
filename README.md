# UofT-CyberBootCamp

## Homework for UofT CuberSecurity Bootcamp Course

## Overview
!(../diagram/FlavioLopesDiagramUnit12.png )

## Components


### VMs:
```
vm1
IP: 10.0.0.5
OS: Ubuntu 18.04-LTS
Size: Standard B1s (1 vcpus, 1 GiB memory)
Access Key: web.pem
Docker container:cyberxsecurity/dvwavm2
published_ports: TPC 80

vm2
IP: 10.0.0.6
OS: Ubuntu 18.04-LTS
Size: Standard B1s (1 vcpus, 1 GiB memory)
Access Key: web.pem
Docker container:cyberxsecurity/dvwavm2
published_ports: TPC 80

Jump-Box-Provisioner
IP: 10.0.0.4
Public IP: 52.188.36.51
DNS: jumpflaviolopes.eastus.cloudapp.azure.com
OS: Ubuntu 18.04-LTS
Size: Standard B1s (1 vcpus, 1 GiB memory)
Access Key: jumpbox.pem
Docker container:cyberxsecurity/ansible

ELK
IP: 10.1.0.5
Public IP: 13.64.242.94
DNS: elkflaviolopes.westus.cloudapp.azure.com
OS: Ubuntu 18.04-LTS
Size: Standard D2s v3 (2 vcpus, 8 GiB memory)
Access Key: web.pem
Docker container:sebp/elk:761
published_ports: TPC 5601, 9200 and 5044
```

### Load Balancing:
```
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
```

### Virtual Network:
```
RedTeamNet
CIDR: 10.0.0.0/16
Network Security Group:
RedTeamNet-SG
Subnets:
Default CIDR 10.0.0.0/24

Virtial Network:

ELK-Vnet
CIDR: 10.1.0.0/16
Network Security Group:
ELKnsg891
Subnets:
Default CIDR 10.0.0.0/24
```

### Network Security Group:


**ELKnsg891** 
### Inbound security rules
|Priority|Name|Port|Protocol|Source|Destination|Action
|---|---|---:|---|---|---|---:|
|300|SSH|22|TCP|Any|Any|Allow|
|4000|kibana_port|5601|Any|104.158.132.134|Any|Allow
|65000|AllowVnetInBound|Any|Any|VirtualNetwork|VirtualNetwork|Allow|
65001|AllowAzureLoadBalancerInBound|Any|Any|AzureLoadBalancer|Any|Allow
65500|DenyAllInBound|Any|Any|Any|Any|Deny

### Outbound security rules
|Priority|Name|Port|Protocol|Source|Destination|Action
|---|---|---:|---|---|---|---:|
|65000|AllowVnetOutBound|Any|Any|VirtualNetwork|VirtualNetwork|Allow
|65001|AllowInternetOutBound|Any|Any|Any|Internet|Allow
|65500|DenyAllOutBound|Any|Any|Any|Any|Deny


**RedTeam-SG**
### Inbound security rules
Priority|Name|Port|Protocol|Source|Destination|Action
|---|---|---:|---|---|---|---:|
3500|AllowAzureLoadBalancerInBound|Any|Any|AzureLoadBalancer|Any|Allow
3600|web_80|80|Any|Any|10.0.0.6,10.0.0.5|Allow
3700|Port_8080|22|Any|10.0.0.4|VirtualNetwork|Allow
3800|SSH|22|Any|104.158.132.134|10.0.0.4|Allow
4000|Default_Deny|Any|Any|Any|Any|Deny
65000|AllowVnetInBound|Any|Any|VirtualNetwork|VirtualNetwork|Allow
65001|AllowAzureLoadBalancerInBound|Any|Any|AzureLoadBalancer|Any|Allow
65500|DenyAllInBound|Any|Any|Any|Any|Deny

### Outbound security rules
Priority|Name|Port|Protocol|Source|Destination|Action
|---|---|---:|---|---|---|---:|
65000|AllowVnetOutBound|Any|Any|VirtualNetwork|VirtualNetwork|Allow
65001|AllowInternetOutBound|Any|Any|Any|Internet|Allow
65500|DenyAllOutBound|Any|Any|Any|Any|Deny


### Load Balancing: 
```
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
```



