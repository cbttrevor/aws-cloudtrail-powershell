1..30 | % {
  $Guid = (New-Guid).Guid
  New-S3Bucket -BucketName $Guid
  Remove-S3Bucket -BucketName $Guid -DeleteBucketContent -Force
}