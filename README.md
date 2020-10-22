Olympus
====
My Homelab Infrastructure

[![GitHub Actions](https://img.shields.io/github/workflow/status/kilip/olympus/CI/master?style=flat-square)](https://github.com/kilip/olympus/actions?query=workflow%3ACI+branch%3Amaster)

### Overview
View Network Diagrams [here](https://viewer.diagrams.net/?highlight=0000ff&layers=1&nav=1&title=olympus.drawio#Uhttps%3A%2F%2Fdrive.google.com%2Fuc%3Fid%3D1IUUgyap_ueUx6EJSruuhZQEtDLzQllD1%26export%3Ddownload)

This repo contains ansible installation for all machine in my homelab. It will installs/configures:
* Workstation Setup (work in progress)
* Squid
* Freeradius Server  (work in progress)
* High Availability K3S cluster using etcd


### Prerequisites
* Python: version 3
* Go Tasks, install it from [here](https://taskfile.dev/#/installation)
* Ubuntu focal 20.04 desktop/server installed on cluster nodes and workstation

### Installation
#### Clone And Create Your Inventory
Clone this repository:
```sh
$ git clone https://github.com/kilip/olympus.git
$ cd olympus
$ cp -r ./inventory/sample ./inventory/your-inventory-name
```

Edit ```./inventory/your-inventory-name``` files to match your environment:
* ```hosts.ini``` contains a list of machine in your environment
* ```group_vars/k3s_nodes.yml```: configures your kubernetes cluster


#### Converge your machines
Initialize python environment
```sh
$ task pyenv
```

Activate python environment:
```sh
$ source venv/bin/activate
```

Install python dependencies:
```sh
$ task deps
```

Ensure that all of your machines is on:
```sh
$ task ping
```

Converge nodes
```sh
$ task converge
```