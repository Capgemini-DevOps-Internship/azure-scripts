$AdminUser = "azureuser"
$AdminSecurePassword = ConvertTo-SecureString "windowsp@55word" -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($AdminUser, $AdminSecurePassword)
$virtualmachine1 = New-AzVM -Name agent -ResourceGroupName build-agents-powershell-westeurope -Image UbuntuLTS -Size Standard_DS1_v2 -VirtualNetworkName build-agents-vnet -SubnetName agents-subnet -AllocationMethod Dynamic -DomainNameLabel agentdns -Credential $Credential
$diskconfig1 = New-AzDiskConfig -Tier P4 -DiskSizeGB 30 -Location westeurope -CreateOption Empty -SkuName Premium_LRS
$datadisk1 = New-AzDisk -DiskName agent-disk -Disk $diskconfig1 -ResourceGroupName build-agents-powershell-westeurope
$vm1 = Get-AzVM -Name agent -ResourceGroupName build-agents-powershell-westeurope
$vm1 = Add-AzVMDataDisk -VM $vm1 -Name agent-disk -CreateOption Attach -lun 1 -DeleteOption delete -ManagedDiskID $datadisk1.Id
Update-AzVM -VM $vm1 -ResourceGroupName build-agents-powershell-westeurope 

$virtualmachine2 = New-AzVM -Name jumpbox -ResourceGroupName build-agents-powershell-westeurope -Image Win2019Datacenter -Size Standard_DS1_v2 -VirtualNetworkName build-agents-vnet -SubnetName jumpbox-subnet -AllocationMethod Static -PublicIpAddressName reserved-ip -Credential $Credential
$diskconfig2 = New-AzDiskConfig -Tier P10 -DiskSizeGB 127 -Location westeurope -CreateOption Empty -SkuName Premium_LRS
$datadisk2 = New-AzDisk -DiskName jumpbox-disk -Disk $diskconfig2 -ResourceGroupName build-agents-powershell-westeurope 
$vm2 = Get-AzVM -Name jumpbox -ResourceGroupName build-agents-powershell-westeurope
$vm2 = Add-AzVMDataDisk -VM $vm2 -Name jumpbox-disk -CreateOption Attach -lun 1 -DeleteOption delete -ManagedDiskID $datadisk2.Id
Update-AzVM -VM $vm2 -ResourceGroupName build-agents-powershell-westeurope
