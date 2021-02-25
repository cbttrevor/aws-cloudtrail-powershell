Get-Command -Module AWS.Tools.CloudTrail -CommandType Cmdlet

#region Create Trail in AWS CloudTrail

# Do we have any multi-region trails in other AWS regions?
$RegionList = (Get-AWSRegion).Region -match '^us-[ew]'

# Iterate over $RegionList and look for CloudTrail trails
$RegionList | % { Get-CTTrail -Region $PSItem }

New-CTTrail -Name trevorcbt -S3BucketName $BucketName

Remove-CTTrail -Name trevorcbt -Force

#endregion