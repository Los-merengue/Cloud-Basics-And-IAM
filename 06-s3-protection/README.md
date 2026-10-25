# Step 6 — Protect S3 Against Accidental Public Access

## Objective
Enable account-level S3 Block Public Access and review bucket exposure without making real data public.

## Part A — Enable account-level Block Public Access
1. Open Amazon S3 in the console.
2. Open account-level or account and organization settings for Block Public Access.
3. Enable all four settings:
   - Block public access granted through new ACLs.
   - Ignore public access granted through any ACLs.
   - Block public access granted through new public bucket/access-point policies.
   - Restrict public and cross-account access through any public bucket/access-point policies.
4. Save and confirm.
5. If settings are controlled by AWS Organizations, do not bypass the control; document it and ask the administrator.
6. Run `validation-commands.sh` if using the AWS CLI.

## Part B — Review buckets
Review each relevant bucket's Block Public Access settings, bucket policy, and ACL. These are separate controls. Do not assume a bucket is private just because one obvious public policy is absent.

## Part C — Optional policy template
`policies/bucket-policy-private-transport.json` is an additional defense-in-depth example. Replace placeholders and review it before use. Its explicit deny for principals outside the account can break legitimate cross-account access. The policy denies insecure transport, but it does not replace account-level Block Public Access or constitute a universal public-access prevention policy.

## Why it matters
Misconfigured buckets can expose reports, backups, application files, or personal data. Account-level Block Public Access provides a broad guardrail against public ACLs and policies.

## Validation
- [ ] All four account-level settings enabled.
- [ ] Relevant bucket settings, policies, and ACLs reviewed.
- [ ] No real bucket was made public for the lab.
- [ ] Any additional bucket policy reviewed for application and cross-account impact.

## Deliverables
- `screenshots/after/E08-s3-block-public-access.png`
- Validation entry and a note explaining why a bucket policy alone is insufficient.

## What you learned
You can distinguish S3 Block Public Access from bucket policies and ACLs, and validate protections without exposing data.
