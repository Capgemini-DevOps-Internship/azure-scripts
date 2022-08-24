$rule1 = New-AzNetworkSecurityRuleConfig -Name rdp-rule -Description "Allow RDP" `
    -Access Allow -Protocol Tcp -Direction Inbound -Priority 100 -SourceAddressPrefix `
    Internet -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 3389

$rule2 = New-AzNetworkSecurityRuleConfig -Name incoming-rule -Description "Deny All" `
    -Access Deny -Protocol Tcp -Direction Inbound -Priority 100 -SourceAddressPrefix `
    Internet -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange *

$rule3 = New-AzNetworkSecurityRuleConfig -Name outgoing-rule -Description "Allow All" `
    -Access Allow -Protocol Tcp -Direction Outbound -Priority 101 -SourceAddressPrefix `
    Internet -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange *

New-AzNetworkSecurityGroup -ResourceGroupName build-agents-powershell-westeurope -Location westeurope -Name `
    "linux-nsg" -SecurityRules $rule2,$rule3

New-AzNetworkSecurityGroup -ResourceGroupName build-agents-powershell-westeurope -Location westeurope -Name `
    "windows-nsg" -SecurityRules $rule1,$rule3
