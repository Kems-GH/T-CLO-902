
# Reporting

Report to Microsoft Teams, the number of product, on a daily basis.

(over webhooks)

## Webhooks

Doc: https://docs.microsoft.com/en-us/microsoftteams/platform/webhooks-and-connectors/how-to/add-incoming-webhook

```bash
export DB_URI=foo:bar@tcp(127.0.0.1:3306)/mydb
export WEBHOOK_URL=https://outlook.office.com/webhook/xxxxxxxxxxxxxxx

go mod download
go run main.go
```

# Variables

```bash
DB_URI MySQL URI
WEBHOOK_URL Microsoft Teams Webhook URL
```