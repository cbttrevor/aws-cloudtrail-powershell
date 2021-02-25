## Learning Objectives

* AWS CloudTrail is an important security service that should be used by just about everyone
* Logs activities performed via AWS REST APIs and via AWS Management Console
* Unlike most other services in AWS, where you have resources that you interact with (VMs, VPCs, API Gateway) CloudTrail is more of a background service that just runs silently
* CloudTrail just provides auditing. Access controls are provided by AWS IAM policies, permission boundaries, and Organizations Service Control Policies (SCPs)
* CloudTrail provides 90 days of account activity at no additional cost

* Where does AWS CloudTrail store audit logs? Amazon S3 Bucket.
  * Can also [send logs to Amazon CloudWatch Logs](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/send-cloudtrail-events-to-cloudwatch-logs.html)
  * Integrates with SNS when new batch files are delivered into S3 storage

### Use Cases for AWS CloudTrail Data

* Who deleted an Amazon EC2 instance running our critical database server?
* Who created this EC2 instance running `x1e.32xlarge`
* What other resource management events occurred around the same time as this outage?

### AWS Tools for PowerShell 

* Open source, cross-platform automation framework
* Runs natively on MacOS, Linux, and Windows (even ARM devices!)
* Deploy automation tasks in AWS Lambda, Systems Manager Automation, and 

### Related Training at CBT Nuggets

* Automate AWS Account Compliance with AWS Config
* Introduction to AWS Tools for PowerShell