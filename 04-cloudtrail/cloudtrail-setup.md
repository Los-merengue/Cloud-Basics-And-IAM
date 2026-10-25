# Step 4 — Enable AWS CloudTrail

## Objective
Record account management activity for change review and investigations.

## Steps
1. Open CloudTrail in the AWS console.
2. Create a trail with a clear name such as `account-hardening-trail`.
3. Configure it as a multi-Region trail.
4. Enable management events for read and write activity.
5. Select an S3 destination bucket. Keep the destination private and protect it against unauthorized modification or deletion.
6. Create the trail and verify that its status indicates logging.
7. Perform a harmless management action and inspect CloudTrail Event history for a recent event.
8. Save redacted screenshots of trail settings and an event.
9. Review costs before enabling optional features. S3 object-level data events are separate from management events and may incur additional charges.

## Why it matters
CloudTrail records API activity and supports accountability, change review, and investigation. Protect the log destination as well as enabling logging.

## Validation
- [ ] Multi-Region trail exists and is logging.
- [ ] Management read/write events configured.
- [ ] Recent event visible.
- [ ] Log destination private and appropriately protected.
- [ ] Optional data events and costs considered.

## Deliverables
- `screenshots/after/E05-cloudtrail-trail.png`
- `screenshots/after/E06-cloudtrail-event.png`
- Decision-log note explaining event scope.

## What you learned
You can explain CloudTrail management events, multi-Region coverage, and why data events are a separate configuration decision.
