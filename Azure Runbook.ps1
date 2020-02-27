$Conn = Get-AzAutomationConnection -Name AzureRunAsConnection
Add-AzAccount -ServicePrincipal -Tenant $Conn.-TenantID -ApplicationId $Conn.-ApplicationId -CertificateThumbprint $Conn.-CertificateThumbprint
$VMs = Get-AzVM | where {$_.Tags.Values -like "Diesried Value"}
$VMs = Start-AzVM
Write-Output $VMs.Name
