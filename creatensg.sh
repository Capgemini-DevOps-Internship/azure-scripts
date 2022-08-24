#!/bin/bash

az network nsg create -n linux -g build-agents-cli-westeurope -l westeurope

az network nsg rule create -n denyincomingconnections -g build-agents-cli-westeurope --nsg-name linux --priority 100 --access Deny --direction Inbound --destination-port-ranges *

az network nsg rule create -n denyincomingconnections -g build-agents-cli-westeurope --nsg-name linux --priority 200 --access Allow --direction Outbound --destination-port-ranges *

az network nsg create -n windows -g build-agents-cli-westeurope -l westeurope

az network nsg rule create -n AllowRDPconnections -g build-agents-cli-westeurope --nsg-name windows --priority 100 --access Allow --direction Inbound --destination-port-ranges 3389

az network nsg rule create -n AllowRDPconnections -g build-agents-cli-westeurope --nsg-name windows --priority 200 --access Allow --direction Outbound --destination-port-ranges *
