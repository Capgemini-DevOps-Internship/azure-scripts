New-AzAppServicePlan -ResourceGroupName "build-agents-powershell-westeurope" -Name "linux-webapp-plan" -Location "westeurope" -Tier "Standard" -NumberofWorkers 1 -Linux 

$azureSecuredPassword = ConvertTo-SecureString ${env:DOCKER_HUB_PASSWORD} -AsPlainText -Force
New-AzWebApp -ResourceGroupName build-agents-powershell-westeurope -Name "capgem-linux-webapp" -Location "westeurope" -AppServicePlan "linux-webapp-plan" -ContainerImageName static-website-01:hello_world -ContainerRegistryURL https://hub.docker.com/repository/docker/herbertmoore/static-website-01 -ContainerRegistryUser ${env:DOCKER_HUB_USERNAME} -ContainerRegistryPassword $azureSecuredPassword
