#!/bin/bash

az webapp up -n capgemwindowswebapp -g build-agents-cli-westeurope -l westeurope --os-type Windows --sku S1 -r dotnet:6
