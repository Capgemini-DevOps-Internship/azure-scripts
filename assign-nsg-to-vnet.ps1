$virtualNetwork = Get-AzVirtualNetwork -Name build-agents-vnet -ResourceGroupName build-agents-powershell-westeurope

$nsg1 = Get-AzNetworkSecurityGroup -Name linux-nsg -ResourceGroupName build-agents-powershell-westeurope

$nsg2 = Get-AzNetworkSecurityGroup -Name windows-nsg -ResourceGroupName build-agents-powershell-westeurope

Set-AzVirtualNetworkSubnetConfig -Name agents-subnet -VirtualNetwork $virtualNetwork -AddressPrefix "10.0.0.0/24" -NetworkSecurityGroupId $nsg1.Id

Set-AzVirtualNetworkSubnetConfig -Name jumpbox-subnet -VirtualNetwork $virtualNetwork -AddressPrefix "10.0.1.0/24" -NetworkSecurityGroupId $nsg2.Id

$virtualNetwork | Set-AzVirtualNetwork