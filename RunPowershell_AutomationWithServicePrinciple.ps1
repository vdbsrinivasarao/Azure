$tenantId = "XXXb89a427d-adcd-41d0-X-XXXXX"
$appId = "XXXXX-814f-434c-b53b-XX"
$secret = "XX~XXXXXXXXX"
$webhookURI = "https://c38af8d8-9848-4799-b30c-cb5cfd36f695.webhook.eus2.azure-automation.net/webhooks?token=l5o0%2bfo94mfQb4jn2eNuhtBgXVetUAsNjtwP7bs68L0%3d"
$securePassword = ConvertTo-SecureString -String $secret -AsPlainText -Force
$credential = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $appId, $securePassword
Connect-AzureRMAccount -ServicePrincipal -Credential $credential -Tenant $tenantId
# Get the storage account context
$storageAccount = Get-AzureRMStorageAccount -ResourceGroupName "DefaultResourceGroup-EUS" -Name "testtodayapril20"
# List containers within the storage account
$containers = Get-AzureStorageContainer -Context $storageAccount.Context
# Output the list of containers
$containers | ForEach-Object { $_.Name }
