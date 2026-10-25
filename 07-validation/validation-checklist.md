# Step 7 — Final Validation Checklist

## Identity and IAM
- [ ] Root MFA enabled.
- [ ] No root access keys, or exception documented.
- [ ] Routine administration uses a separate protected identity.
- [ ] Users, groups, roles, attached/inline policies, and trust policies reviewed where applicable.
- [ ] Least-privilege policy and its resource scope explained.
- [ ] Broad access and unused identities documented with a decision.

## Logging and cost
- [ ] CloudTrail multi-Region trail is logging management read/write events.
- [ ] Recent management event visible.
- [ ] Log destination private and access restricted.
- [ ] Budget and at least one notification threshold configured.
- [ ] Budget limitations understood; it is not a hard spending cap.

## S3
- [ ] All four account-level Block Public Access settings enabled.
- [ ] Relevant bucket settings, policies, and ACLs reviewed.
- [ ] No real data made public during testing.
- [ ] Additional bucket policy reviewed for cross-account impact.

## Documentation
- [ ] Decision log and validation results completed.
- [ ] Screenshots are genuine and redacted.
- [ ] No secrets, tokens, MFA material, or private billing details committed.
- [ ] Report separates confirmed observations from recommendations.
- [ ] Resume claims match verified work.

Use **Pass** only when configured and verified; **Fail** when checked but not compliant; **Not tested** when no verification was performed.
