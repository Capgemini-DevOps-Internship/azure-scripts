$agentsSubnet = New-AzVirtualNetworkSubnetConfig -Name agents-subnet -AddressPrefix "10.0.0.0/24"
$jumpboxSubnet  = New-AzVirtualNetworkSubnetConfig -Name jumpbox-subnet  -AddressPrefix "10.0.1.0/24"
New-AzVirtualNetwork -Name build-agents-vnet -ResourceGroupName build-agents-powershell-westeurope -Location westeurope -AddressPrefix "10.0.0.0/16" -Subnet $agentsSubnet,$jumpboxSubnet