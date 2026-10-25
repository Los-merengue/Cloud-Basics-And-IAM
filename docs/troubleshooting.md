# Troubleshooting

- **Cannot change account-level S3 settings:** Your account may be governed by AWS Organizations or your identity may lack permission. Do not bypass organizational controls; ask the administrator.
- **CloudTrail access denied:** Confirm the authorized identity and required permissions. Do not blindly attach broad administrator permissions.
- **Cannot see S3 object reads:** Management events do not automatically record all S3 object-level data events. Configure data events separately only if needed and after reviewing cost.
- **Budget alert not received:** Check threshold, notification type, email destination, and any subscription confirmation. Alerts are not instantaneous spending caps.
- **CLI profile errors:** Run `aws sts get-caller-identity --profile YOUR_PROFILE`. Never paste credentials into issue reports or commit credential files.
- **AccessDenied:** It may be an expected least-privilege result. Check the action, resource, and identity before changing permissions.
