#!/bin/bash

az appservice plan create -n linux-appservice-plan -g build-agents-cli-westeurope -l westeurope --is-linux --number-of-workers 1 --sku S1

az webapp create -n capgemlinuxwebapp -g build-agents-cli-westeurope -p linux-appservice-plan -i herbertmoore/static-website-01:hello_world -s herbertmoore -w ATsSvK32T95b
