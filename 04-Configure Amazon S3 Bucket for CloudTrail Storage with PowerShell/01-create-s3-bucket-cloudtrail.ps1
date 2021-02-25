#region Create Amazon Simple Storage Service (S3) Bucket
# First things first, we need an Amazon S3 Bucket to store CloudTrail logs
Get-Command -Module AWS.Tools.S3

$BucketName = 'trevor-usw2-cloudtrail2'
New-S3Bucket -BucketName $BucketName

$BucketPolicy = @'
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "AWSCloudTrailAclCheck20150319",
          "Effect": "Allow",
          "Principal": {"Service": "cloudtrail.amazonaws.com"},
          "Action": "s3:GetBucketAcl",
          "Resource": "arn:aws:s3:::BUCKETNAME"
      },
      {
          "Sid": "AWSCloudTrailWrite20150319",
          "Effect": "Allow",
          "Principal": {"Service": "cloudtrail.amazonaws.com"},
          "Action": "s3:PutObject",
          "Resource": "arn:aws:s3:::BUCKETNAME/AWSLogs/ACCOUNTID/*",
          "Condition": {"StringEquals": {"s3:x-amz-acl": "bucket-owner-full-control"}}
      }
  ]
}
'@.Replace('BUCKETNAME', $BucketName).Replace('ACCOUNTID', (Get-STSCallerIdentity).Account)
Write-S3BucketPolicy -BucketName $BucketName -Policy $BucketPolicy
#endregion
