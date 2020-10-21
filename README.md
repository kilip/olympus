Olympus
====
My Homelab Infrastructure

### Overview
This repo contains ansible installation for all machine in my homelab. It will installs/configures:
* Workstation Setup (work in progress)
* Squid  (work in progress)
* Freeradius Server  (work in progress)
* High Availability K3S cluster using etcd


### Prerequisites
* Python: version 3
* Go Tasks, install it from [here](https://taskfile.dev/#/installation)
* Ubuntu focal 20.04 desktop/server installed on cluster nodes and workstation

### Installation
#### Clone And Create Your Inventory
Clone this repository:
```console
$ git clone https://github.com/kilip/olympus.git
$ cd olympus
$ cp -r ./inventory/sample ./inventory/your-inventory-name
```

Edit ```./inventory/your-inventory-name``` files to match your environment:
* ```hosts.ini``` contains a list of machine in your environment
* ```group_vars/k3s_nodes.yml```: configures your kubernetes cluster


#### Converge your machines
Initialize python environment
```console
$ task pyenv
```

Activate python environment:
```console
$ source venv/bin/activate
```

Install python dependencies:
```console
$ task deps
```

Ensure that all of your machines is on:
```console
$ task ping
```

Converge nodes
```console
$ task converge
```