# Architecture and Security Baseline

```text
Account owner
  ├─ Root user: MFA enabled; reserved for root-only tasks
  ├─ Everyday administration: separate protected identity / temporary credentials
  │    └─ Task-specific IAM permissions (least privilege)
  ├─ CloudTrail: multi-Region management events → private, protected S3 destination
  ├─ Billing budget: notification when configured thresholds are crossed
  └─ S3 account-level Block Public Access: all four settings enabled
       └─ Individual buckets: review settings, policies, and ACLs
```

## Design decisions
1. Protect root with MFA and avoid routine use.
2. Prefer temporary credentials for human and workload access where practical.
3. Grant only task-specific permissions.
4. Log management activity and protect the destination.
5. Use account-level S3 Block Public Access as a broad guardrail.
6. Use budget notifications for visibility, not as a hard spending limit.

## Scope limitations
This is a learning baseline, not a complete production landing zone. It does not implement all multi-account governance, organization policies, immutable log retention, AWS Config, Security Hub, centralized alerting, or incident response.
