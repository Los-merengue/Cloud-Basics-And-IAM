# Sample Report — Illustrative Only

> Fictional example only; it is not evidence that any account was tested. Replace all content with your verified results.

## Executive summary
The account is being reviewed against a baseline covering root MFA, IAM access, CloudTrail, billing notifications, and S3 public-access protection. Final status must be based on saved evidence. Anything not checked must remain **Not tested**.

## Example findings

### F-01 — Root MFA status not verified
- **Severity:** Pending verification
- **Observation:** No evidence has been recorded in this example.
- **Risk:** Without MFA, a stolen root password may be sufficient to sign in.
- **Recommendation:** Verify root MFA and enable it if missing.
- **Validation:** Save a redacted screenshot of the enabled state.

### F-02 — Broad IAM permissions require review
- **Severity:** Depends on actual policy and business need
- **Observation:** Review wildcard actions/resources and administrator access that is not required.
- **Risk:** Excessive permissions can increase the impact of compromised credentials or mistakes.
- **Recommendation:** Replace unnecessary broad access with task-specific permissions after testing.
- **Validation:** Review effective access and confirm the task still works.

### F-03 — S3 public-access protection not verified
- **Severity:** Pending verification
- **Observation:** Account-level settings have not been verified in this sample.
- **Risk:** Public policies or ACLs can expose data.
- **Recommendation:** Enable all four account-level Block Public Access settings and review relevant bucket policies/ACLs.
- **Validation:** Confirm all four settings and document the result.

## Conclusion
Finalize only after verifying each control. A screenshot of one setting does not prove every identity's effective permissions or every bucket's exposure has been fully assessed.
