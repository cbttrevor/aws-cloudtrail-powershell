
help Find-CTEvent

Find-CTEvent -StartTime (Get-Date).AddHours(-3) -EndTime (Get-Date)

$CTData = Find-CTEvent -StartTime (Get-Date).AddHours(-3) -EndTime (Get-Date)

$Attribute = [Amazon.CloudTrail.Model.LookupAttribute]::new()
$Attribute.AttributeKey = ''
$Attribute.AttributeValue = ''