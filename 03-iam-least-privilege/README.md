# Step 3 — IAM, Least Privilege, and Access Auditing

## Concepts
- **Identity:** a user or role making AWS requests.
- **Policy:** JSON permissions that allow or deny actions on resources, optionally under conditions.
- **Role:** an identity assumed by a trusted principal; it supplies temporary credentials.
- **Trust policy:** controls who or what can assume a role.
- **Least privilege:** only the actions, resources, and conditions required for the task.
- **Effective access:** may involve identity policies, groups, resource policies, permissions boundaries, session policies, and organization controls.

## Part A — Review access
In IAM, inspect users, groups, roles, attached policies, inline policies, and role trust relationships. Flag administrator-level access without clear need, wildcard actions/resources, stale identities, and unclear ownership. Record findings in `access-review-template.csv`.

## Part B — Review example policies
- `policies/s3-report-reader.json`: list one named bucket and read only objects under `reports/`. Replace the placeholder bucket name before use.
- `policies/s3-security-auditor-readonly.json`: illustrative read-only review permissions; it is not a complete account-wide audit policy.

Do not attach a policy without reviewing it and understanding its effect. A policy file in a repository is not proof that it was deployed.

## Deliverables
- [ ] Completed access review.
- [ ] One least-privilege policy explained action-by-action.
- [ ] At least one role trust policy reviewed if roles are present.
- [ ] Excessive permissions documented with remediation.
- [ ] Sanitized evidence saved.

## What you learned
You can distinguish identity, permissions, and trust; identify excessive access; and justify scoped permissions.
