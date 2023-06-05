
#!/bin/bash

REPO="dmonakh/Wordpress-Tekton-atK8s-inGCP"
WEBHOOK_URL="http://34.70.146.116/hooks"

response=$(gh api repos/$REPO/hooks)

if [ "$response" = "[]" ]; then
  create_response=$(gh api repos/$REPO/hooks --input - <<< '{
    "name": "web",
    "active": true,
    "events": [
      "watch"
    ],
    "config": {
      "url": "'$WEBHOOK_URL'",
      "content_type": "json"
    }
  }')

  echo "Webhook created: $create_response"
else
  echo "Webhook already exists"
fi
