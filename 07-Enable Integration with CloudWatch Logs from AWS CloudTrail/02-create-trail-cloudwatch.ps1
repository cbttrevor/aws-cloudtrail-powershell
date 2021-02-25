$LogGroupName = 'cbtcloudtrail'
New-CWLLogGroup -LogGroupName $LogGroupName

# This returns an array of matching log groups
$LogGroup = Get-CWLLogGroup -LogGroupNamePrefix $LogGroupName

New-CTTrail -CloudWatchLogsRoleArn arn:aws:iam::665453315198:role/CBTCloudTrail

$CloudTrail = @{
  CloudWatchLogsRoleArn = 'arn:aws:iam::665453315198:role/CBTCloudTrail'
  CloudWatchLogsLogGroupArn = $LogGroup[0].Arn
  Name = 'cbtcloudwatch'
  S3BucketName = 'trevor-usw2-cloudtrail'
}
New-CTTrail @CloudTrail