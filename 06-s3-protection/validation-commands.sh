#!/usr/bin/env bash
# Read-only check. Use only with an account you own or are authorized to review.
set -euo pipefail
PROFILE="${AWS_PROFILE:-YOUR_PROFILE}"
ACCOUNT_ID="$(aws sts get-caller-identity --profile "$PROFILE" --query Account --output text)"
aws s3control get-public-access-block --account-id "$ACCOUNT_ID" --profile "$PROFILE" --output json
echo "Expected: BlockPublicAcls, IgnorePublicAcls, BlockPublicPolicy, RestrictPublicBuckets are all true."
