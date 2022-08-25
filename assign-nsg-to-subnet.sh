#!/bin/bash

az network vnet subnet update -g build-agents-cli-westeurope  -n agents-subnet --vnet-name build-agents-vnet  --network-security-group linux

az network vnet subnet update -g build-agents-cli-westeurope -n jumpbox-subnet --vnet-name build-agents-vnet --network-security-group windows
