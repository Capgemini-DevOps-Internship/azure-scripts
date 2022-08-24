#!/bin/bash

az disk create -g build-agents-cli-westeurope -n agent-disk --tier P4 -z 30

az vm create -g build-agents-cli-westeurope -n agent --image UbuntuLTS --vnet-name build-agents-vnet --subnet agents-subnet --size Standard_DS1_v2 --public-ip-address-allocation dynamic --public-ip-address-dns-name capgemagent 

az vm disk attach --vm-name agent -n agent-disk

az disk create -g build-agents-cli-westeurope -n jumpbox-disk --tier P10 -z 127

az vm create -g build-agents-cli-westeurope -n jumpbox --image Win2022Datacenter --vnet-name build-agents-vnet --subnet jumpbox-subnet --size Standard_DS1_v2 --public-ip-address-allocation static 
        
az vm disk attach --vm-name jumpbox -n jumpbox-disk
