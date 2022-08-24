#!/bin/bash

az network vnet create -g build-agents-cli-westeurope --name build-agents-vnet -l westeurope --address-prefixes 10.0.0.0/16 --subnet-name agents-subnet --subnet-prefixes 10.0.0.0/24

az network vnet subnet create -g build-agents-cli-westeurope --vnet-name build-agents-vnet --name jumpbox-subnet --address-prefixes 10.0.1.0/24
