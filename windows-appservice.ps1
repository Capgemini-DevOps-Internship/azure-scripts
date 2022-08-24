New-AzAppServicePlan -ResourceGroupName "build-agents-powershell-westeurope" -Name "windows-appservice-plan" -Location "westeurope" -Tier "Standard" -NumberofWorkers 1

New-AzWebApp -ResourceGroupName build-agents-powershell-westeurope -Name "capgem-windows-webapp" -Location "westeurope" -AppServicePlan "windows-appservice-plan"

Set-AzWebApp -ResourceGroupName "build-agents-powershell-westeurope" -Name "capgem-windows-webapp" -NetFrameworkVersion 6.0