

$tenantId = "XXXb89a427d-adcd-41d0-X-XXXXX"
$appId = "XXXXX-814f-434c-b53b-XX"
$secret = "XX~XXXXXXXXX"
$webhookURI = "https://c38af8d8-9848-4799-b30c-cb5cfd36f695.webhook.eus2.azure-automation.net/webhooks?token=l5o0%2bfo94mfQb4jn2eNuhtBgXVetUAsNjtwP7bs68L0%3d"
$securePassword = ConvertTo-SecureString -String $secret -AsPlainText -Force
$credential = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $appId, $securePassword
Connect-AzureRMAccount -ServicePrincipal -Credential $credential -Tenant $tenantId
$Names  = @(
            @{ Name="Hawaii"},
            @{ Name="Seattle"},
            @{ Name="Florida"}
        )
$body = ConvertTo-Json -InputObject $Names
$response = Invoke-WebRequest -Method Post -Uri $webhookURI -Body $body -UseBasicParsing
#isolate job ID
$jobid = (ConvertFrom-Json ($response.Content)).jobids[0]
Start-Sleep -Seconds 30
$s = Get-AzureRmAutomationJobOutput -AutomationAccountName "DemoAA" -Id $jobid -ResourceGroupName "TATA_Production"
$s
