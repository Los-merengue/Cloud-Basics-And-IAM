# Step 1 — Create or Select a Learning Account

## Objective
Prepare an authorized AWS learning environment and confirm which identity you are using.

## Steps
1. Create an AWS account only if you do not already have a suitable learning account.
2. Review current AWS pricing and Free Tier terms; eligibility and included usage can change.
3. Keep account contact and recovery information accurate.
4. Use a unique password stored in a password manager.
5. Use root only for tasks that require root credentials.
6. Do not create root access keys.
7. If using AWS CLI, install CLI v2 and configure an approved profile. Prefer temporary credentials where practical.
8. Do not put account IDs, contact details, or billing data in this public repository.

Optional identity check:
```bash
aws sts get-caller-identity --profile YOUR_PROFILE
```

## Why it matters
A dedicated learning account reduces the chance of changing production resources. Verifying the active identity helps prevent changes to the wrong account.

## Deliverables
- [ ] Learning account/sandbox selected.
- [ ] Pricing reviewed.
- [ ] Identity check completed if using CLI.
- [ ] Notes saved without secrets.

## What you learned
Cloud account ownership, cost awareness, and identity verification are part of secure operations.
