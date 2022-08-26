#!/bin/bash

az vm disk detach -g build-agents-cli-westeurope --vm-name agent --name agent-disk --force-detach
az vm disk detach -g build-agents-cli-westeurope --vm-name jumpbox --name jumpbox-disk --force-detach

az network vnet subnet update -g build-agents-cli-westeurope -n agents-subnet --vnet-name build-agents-vnet --network-security-group ""
az network vnet subnet update -g build-agents-cli-westeurope -n jumpbox-subnet --vnet-name build-agents-vnet --network-security-group ""

resources="$(az resource list --resource-group "build-agents-cli-westeurope" | grep id | awk -F \" '{print $4}')"

for id in $resources; do
    az resource delete --resource-group "build-agents-cli-westeurope" --ids "$id" --verbose
done
