# Interview Notes — Explain Your Lab

1. **Why not use root daily?** Root has extensive privileges; MFA and limited use reduce compromise and accidental-change risk.
2. **Policy versus role?** A policy defines permissions. A role is an assumable identity with temporary credentials; its trust policy controls who can assume it.
3. **How did you apply least privilege?** Explain actions, resource scope, and why broader permissions were unnecessary.
4. **How did you audit access?** Discuss users, groups, roles, attached/inline policies, trust policies, and what you did not inspect.
5. **What does CloudTrail record?** Explain management events and why S3 object-level data events are a separate configuration.
6. **Does a budget stop all charges?** No; it sends notifications at configured thresholds and is not a guaranteed hard spending cap.
7. **Why account-level S3 Block Public Access?** It provides a broad guardrail against public access via policies and ACLs, but other permission sources still need review.
8. **What proves the lab worked?** Cite your actual screenshots, CLI output, and validation checklist.
9. **What would you add in production?** Depending on requirements: multi-account governance, organization-level controls, protected centralized logs, alerting, AWS Config, Security Hub, formal access reviews, and incident response.
