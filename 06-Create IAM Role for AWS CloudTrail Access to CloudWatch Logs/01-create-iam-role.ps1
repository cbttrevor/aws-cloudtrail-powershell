# There is a service-linked role for AWS CloudTrail
# The policies on this role cannot be modified, as service-linked roles are managed by AWS
help New-IAMServiceLinkedRole
New-IAMServiceLinkedRole -AWSServiceName cloudtrail.amazonaws.com
Get-IAMRole -RoleName  AWSServiceRoleForCloudTrail | Format-List -Property *


$TrustPolicy = @'
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudtrail.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
'@
New-IAMRole -AssumeRolePolicyDocument $TrustPolicy -RoleName CBTCloudTrail -Description 'Allows CloudTrail access to Amazon CloudWatch Logs'

# Find Amazon CloudWatch Policy in IAM to attach to CloudTrail role
Get-IAMPolicyList | ? PolicyName -match CloudWatch | Select-Object -ExpandProperty Arn | Sort-Object

# Attach the managed IAM policy to the CloudTrail role
Register-IAMRolePolicy -RoleName CBTCloudTrail -PolicyArn arn:aws:iam::aws:policy/CloudWatchLogsFullAccess

Get-IAMRole -RoleName CBTCloudTrail | Format-List -Property *