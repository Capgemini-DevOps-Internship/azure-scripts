$VirtualMachine1 = Get-AzVM -ResourceGroupName "build-agents-powershell-westeurope" -Name "agent"
Remove-AzVMDataDisk -VM $VirtualMachine1 -Name "agent-disk"
Update-AzVM -ResourceGroupName "build-agents-powershell-westeurope" -VM $VirtualMachine1

$VirtualMachine2 = Get-AzVM -ResourceGroupName "build-agents-powershell-westeurope" -Name "jumpbox"
Remove-AzVMDataDisk -VM $VirtualMachine2 -Name "jumpbox-disk"
Update-AzVM -ResourceGroupName "build-agents-powershell-westeurope" -VM $VirtualMachine2

$virtualnetwork = Get-AzVirtualNetwork -Name build-agents-vnet -ResourceGroupName build-agents-powershell-westeurope
Set-AzVirtualNetworkSubnetConfig -Name agents-subnet -VirtualNetwork $virtualnetwork -AddressPrefix "10.0.0.0/24" -NetworkSecurityGroup $null
Set-AzVirtualNetworkSubnetConfig -Name jumpbox-subnet -VirtualNetwork $virtualnetwork -AddressPrefix "10.0.1.0/24" -NetworkSecurityGroup $null
$virtualnetwork | Set-AzVirtualNetwork

Remove-AzVM -ResourceGroupName "build-agents-powershell-westeurope" -Name "agent" -Force
Remove-AzVM -ResourceGroupName "build-agents-powershell-westeurope" -Name "jumpbox" -Force
Remove-AzWebApp -ResourceGroupName "build-agents-powershell-westeurope" -Name "capgem-linux-webapp" -DeleteAppServicePlan -Force
Remove-AzWebApp -ResourceGroupName "build-agents-powershell-westeurope" -Name "capgem-windows-webapp" -DeleteAppServicePlan -Force

Get-AzResource -ResourceGroupName build-agents-powershell-westeurope | Remove-AzResource -Force
