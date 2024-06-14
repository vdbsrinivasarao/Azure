$azureUsername = "seconduser@XXXXXXgmail.onmicrosoft.com"
$azurePassword = ConvertTo-SecureString "P2ssword_123456" -AsPlainText -Force
$azureCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $azureUsername, $azurePassword
Connect-AzureRMAccount -Credential $azureCredential -TenantId "XXXXXX-8a8b-8d516ed9006c"
# Get the storage account context
$storageAccount = Get-AzureRMStorageAccount -ResourceGroupName "DefaultResourceGroup-EUS" -Name "testtodayapril20"
# List containers within the storage account
$containers = Get-AzureStorageContainer -Context $storageAccount.Context
# Output the list of containers
$containers | ForEach-Object { $_.Name }
