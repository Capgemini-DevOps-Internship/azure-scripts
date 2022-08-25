#!/bin/bash

az storage container create -n storagecontainer -g build-agents-cli-westeurope --account-name herbmoorestorageaccount

az storage container generate-sas -n storagecontainer --account-name herbmoorestorageaccount --as-user --auth-mode login --permissions acdlrw --expiry 2022-08-29

az webapp config backup update -g build-agents-cli-westeurope --webapp-name capgemwindowswebapp --frequency 2h --retention 1 --retain-one false --container-url https://herbmoorestorageaccount.blob.core.windows.net/storagecontainer?se=2022-08-29&sp=racwdl&sv=2021-06-08&sr=c&skoid=5327f130-fa27-4ada-8949-dca63b39a281&sktid=50b614f0-0811-4ce5-8ae0-d39df14159c2&skt=2022-08-23T15%3A11%3A34Z&ske=2022-08-29T00%3A00%3A00Z&sks=b&skv=2021-06-08&sig=9FEWA65rKAS394ip8Qm2EfW5qip3rYUGQS7MUe1qMJY%3D
