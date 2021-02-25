Find-Module -Name AWS*

Install-Module -Name AWS.Tools.CloudTrail, AWS.Tools.CloudWatchLogs, AWS.Tools.IdentityManagement, AWS.Tools.S3

Set-DefaultAWSRegion -Region us-west-2