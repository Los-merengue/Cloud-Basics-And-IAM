#!/usr/bin/env bash
# Read-only AWS CLI checks. Some commands require additional read permissions.
set -euo pipefail
PROFILE="${AWS_PROFILE:-YOUR_PROFILE}"
echo "== Caller identity =="
aws sts get-caller-identity --profile "$PROFILE"
echo "== IAM users =="
aws iam list-users --profile "$PROFILE" --query 'Users[].{User:UserName,Created:CreateDate}' --output table
echo "== IAM groups =="
aws iam list-groups --profile "$PROFILE" --query 'Groups[].{Group:GroupName,Created:CreateDate}' --output table
echo "== IAM roles =="
aws iam list-roles --profile "$PROFILE" --query 'Roles[].{Role:RoleName,Created:CreateDate}' --output table
echo "== CloudTrail trails =="
aws cloudtrail describe-trails --profile "$PROFILE" --include-shadow-trails --query 'trailList[].{Name:Name,MultiRegion:IsMultiRegionTrail,S3Bucket:S3BucketName}' --output table
ACCOUNT_ID="$(aws sts get-caller-identity --profile "$PROFILE" --query Account --output text)"
echo "== Account-level S3 Block Public Access =="
aws s3control get-public-access-block --profile "$PROFILE" --account-id "$ACCOUNT_ID" --output json
echo "NOTE: AccessDenied may mean insufficient read permission; it does not prove the control is disabled."
