# Step 5 — Configure Billing Alerts

## Objective
Make unexpected cloud spending easier to notice.

## Steps
1. Review current AWS Budgets pricing and billing features for your account.
2. Open Billing and Cost Management. Enable any required billing-data or alert setting available for your account.
3. Open AWS Budgets and create a cost budget.
4. Choose a realistic amount based on the services you intend to use; do not blindly copy a sample amount.
5. Configure at least one threshold, such as an actual-cost threshold. Add a forecast threshold if useful and available.
6. Add an email notification destination and confirm any subscription.
7. Review the budget scope and filters.
8. Save a redacted screenshot of the budget and notification settings.

## Why it matters
Cloud resources can continue generating charges. A budget alert is a notification mechanism, not a guaranteed hard spending cap. Review and remove lab resources when finished.

## Validation
- [ ] Cost budget exists.
- [ ] At least one notification threshold is configured.
- [ ] Notification destination is correct and confirmed where required.
- [ ] Budget scope understood.
- [ ] You know how to review and stop resources.

## Deliverables
- `screenshots/after/E07-budget-alert.png`
- Decision-log note explaining the threshold choice. Do not publish private billing details.

## What you learned
You can explain cost monitoring and distinguish an alert from an automatic spending limit.
