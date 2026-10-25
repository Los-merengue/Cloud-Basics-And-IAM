# Step 2 — Secure the AWS Root User

## Objective
Protect the account's highest-privilege identity and minimize routine root use.

## Steps
1. Sign in as the root user.
2. Open the account security credentials area.
3. Configure MFA. Prefer a passkey or security key where available; a virtual authenticator app is also an option.
4. Test the MFA method before signing out.
5. Store recovery information securely. Never commit MFA secrets, QR codes, or recovery codes.
6. Review root access keys. The target state is no root access keys. Safely remove any unnecessary keys only after checking whether they are in use.
7. Sign out and use a separate protected identity for everyday administration.
8. Capture a redacted screenshot showing MFA enabled; do not capture the enrollment QR code.

## Why it matters
The root user has broad authority. MFA reduces the chance that a stolen password alone is sufficient for sign-in, while limiting root use reduces exposure.

## Evidence
- `screenshots/after/E01-root-mfa.png`
- `screenshots/after/E02-root-access-keys.png`
- Add a note to `docs/decision-log.md`.

If MFA was already enabled, document that fact and capture the verified state; do not fabricate a before screenshot.

## Validation
- [ ] Root MFA enabled.
- [ ] No root access keys, or a justified exception documented.
- [ ] Root not used for daily work.
- [ ] Recovery method safely available.

## What you learned
You can distinguish the root user from IAM identities and explain why root MFA is foundational.
