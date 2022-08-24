#!/bin/bash

resources="$(az resource list --resource-group "build-agents-cli-01" | grep id | awk -F \" '{print $4}')"

for id in $resources; do
    az resource delete --resource-group "build-agents-cli-01" --ids "$id" --verbose
done
