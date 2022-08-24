$storage = Get-AzStorageAccount -ResourceGroupName "build-agents-powershell-westeurope" -Name "capgemstorageaccount"

New-AzStorageContainer -Name capgemstoragecontainer -Context $storage.Context

$sasUrl = New-AzStorageContainerSASToken -Name capgemstoragecontainer -Permission rwdl -Context $storage.Context -ExpiryTime 2022-08-29 -FullUri

Edit-AzWebAppBackupConfiguration -ResourceGroupName build-agents-powershell-westeurope -Name capgem-windows-webapp -StorageAccountUrl $sasUrl -FrequencyInterval 1 -FrequencyUnit Day  -RetentionPeriodInDays 10