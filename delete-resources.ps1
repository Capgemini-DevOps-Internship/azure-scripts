$VirtualMachine1 = Get-AzVM -ResourceGroupName "build-agents-powershell-westeurope" -Name "agent"
Remove-AzVMDataDisk -VM $VirtualMachine1 -Name "agent-disk"
Update-AzVM -ResourceGroupName "build-agents-powershell-westeurope" -VM $VirtualMachine1

$VirtualMachine2 = Get-AzVM -ResourceGroupName "build-agents-powershell-westeurope" -Name "jumpbox"
Remove-AzVMDataDisk -VM $VirtualMachine2 -Name "jumpbox-disk"
Update-AzVM -ResourceGroupName "build-agents-powershell-westeurope" -VM $VirtualMachine2

Remove-AzureNetworkSecurityGroupAssociation -Name "linux-nsg" -VirtualNetworName "build-agents-vnet" -SubnetName "agents-subnet" -Force
Remove-AzureNetworkSecurityGroupAssociation -Name "windows-nsg" -VirtualNetworName "build-agents-vnet" -SubnetName "jumpbox-subnet" -Force

Remove-AzVM -ResourceGroupName "build-agents-powershell-westeurope" -Name "agent" -Force
Remove-AzVM -ResourceGroupName "build-agents-powershell-westeurope" -Name "jumpbox" -Force
Get-AzResource -ResourceGroupName build-agents-powershell-westeurope | Remove-AzResource -Force
