# Security Decision Log

| ID | Decision | Rationale | Alternative considered | Evidence/status |
|---|---|---|---|---|
| D-01 | Enable root MFA | Reduce password-only compromise risk | Password only | Pending |
| D-02 | Avoid root access keys | Minimize exposure of privileged credentials | Root key for CLI | Pending |
| D-03 | Use task-specific IAM policy | Limit permissions | `s3:*` or administrator access | Pending |
| D-04 | Enable multi-Region CloudTrail management events | Improve account activity visibility | No trail / one Region | Pending |
| D-05 | Configure budget notification | Improve cost visibility | Manual bill checks | Pending |
| D-06 | Enable all four account-level S3 Block Public Access settings | Reduce accidental public exposure | Bucket-level only | Pending |

## For each change, record
- Date/time:
- Change:
- Risk addressed:
- Expected result:
- Validation and result:
- Rollback/recovery:
- Evidence filename:
- Remaining risk:

## Decision Log — Task 02: Root User Security

*Date:* 2026-11-21
*Context:* AWS member account provisioned within an AWS Organization
(managed learning sandbox), account ID ending 559623.

### Finding

Direct root user sign-in and the classic root "Security credentials"
page (MFA setup, access key management) are not exposed to this
account. Navigating to IAM → Security credentials returns:

> *Feature unavailable* — To use this feature, activate advanced
> features.

This is expected behavior for accounts managed under AWS
Organizations. In this configuration, the organization's management
account retains control over root, and member accounts are not
intended to authenticate as root directly.

### Evidence Reviewed

- screenshots/after/E01-root-mfa.png — Security credentials page
  showing root MFA/access-key management as unavailable at the
  member-account level.
- screenshots/after/E02-root-access-keys.png — IAM "Root access
  management" page, showing the organization-mediated mechanism
  (privileged sessions for curated root-only actions, e.g. deleting a
  misconfigured S3 or SQS policy) that replaces direct root login.

### Decision

No root MFA was configured and no root access keys were reviewed or
removed, because neither is reachable from this account. This is
documented as a *justified exception* rather than an incomplete
step.

*Rationale:* The task's underlying objective — minimizing exposure
of the account's highest-privilege identity — is already satisfied by
the organization's design. Root credentials for this account are not
held or accessible by this user at all, which is a stronger control
than enabling MFA on a root login that remains directly reachable.
Privileged actions that would otherwise require root are instead
performed through AWS Organizations' managed "Root access management"
feature, which provides a curated, auditable alternative to
distributing root credentials.

### Validation Checklist

- [x] Root MFA: Not applicable — root sign-in is centrally restricted
  at the organization level; no credential path exists for this
  account to authenticate as root.
- [x] Root access keys: None exist or are accessible from this
  account; consistent with the task's target state of "no root access
  keys."
- [x] Root not used for daily work: Confirmed — this account
  interacts with AWS exclusively through its managed console identity,
  never root.
- [x] Recovery method: Managed at the organization level by the
  account administrator.

### What This Demonstrates

Understanding that root user risk can be mitigated structurally
(organization-level root restriction) as well as procedurally
(root MFA on a standalone account). Both approaches pursue the same
security objective — reducing the blast radius of root credential
compromise — and the correct response depends on which identity model
the account actually uses.

## Decision Log — Task 03: IAM Least Privilege & Access Review

*Date:* 2026-11-21

### Part A — Access Review Findings

- *IAM Users:* 0 — no classic IAM users exist in this account; identity
  is managed externally (organization/SSO layer), which is the expected
  and more secure pattern for a managed account.
- *Roles reviewed:* AccountFullAccessRole, found with the AWS-managed
  AdministratorAccess policy attached.
- *Trust policy for AccountFullAccessRole:* restricts assumption to
  the AWS service principal account-access.amazonaws.com only — not
  an IAM user, not a wildcard (*), and not an external AWS account.
  Evidence: screenshots/after/E03-trust-policy.png.

### Risk Assessment

AdministratorAccess is a wildcard-style policy (broad actions across
all resources), which would normally be flagged immediately as
excessive. However, the trust policy narrows who can actually use
that access to a single AWS-internal service principal. The
combination of broad permissions with a narrow, AWS-managed trust
boundary is a materially different risk profile than broad permissions
with an open or user-assumable trust policy.

### Decision

Accepted as-is for this sandbox environment. The role's broad
permissions are consistent with its stated purpose (account-level
administrative access via AWS's own account-access service), and its
trust policy already enforces least-privilege-by-assumption even
though its least-privilege-by-permission is wide.

### Remediation (if this were a production account or if exposure were broader)

- Replace AdministratorAccess with a custom policy scoped to only the
  specific actions the account-access process requires.
- Add an aws:PrincipalOrgID condition key to the trust policy as a
  defense-in-depth measure, so assumption is restricted to this
  specific organization even among trusted AWS services.
- Enable CloudTrail logging specifically for this role's AssumeRole
  events to maintain an audit trail of when and how it is used.

### Part B — Policy Explained Action-by-Action

See policies/s3-report-reader.json walkthrough below.

*Statement 1 — ListOnlyReportsBucket*
- s3:ListBucket on the named bucket only (not /*) — permits listing
  object keys, not reading content.
- Condition s3:prefix limited to reports and reports/* — without
  this, ListBucket would expose the full bucket listing; with it,
  only the reports/ folder is visible to a list request.

*Statement 2 — ReadOnlyReportObjects*
- s3:GetObject scoped to arn:aws:s3:::BUCKET/reports/* — permits
  reading object content, not writing, deleting, or overwriting.

*Why this is least privilege:* no wildcard resources anywhere; no
write/delete actions granted; the prefix condition on ListBucket
closes a common gap where an identity could otherwise enumerate an
entire bucket while only being able to read one folder within it.