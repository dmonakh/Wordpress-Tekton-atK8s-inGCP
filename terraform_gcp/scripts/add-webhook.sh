gh api repos/dmonakh/Wordpress-Tekton-atK8s-inGCP/hooks \
   --input - <<< '{
  "name": "web",
  "active": true,
  "events": [
    "watch"
  ],
  "config": {
    "url": "http://34.70.146.116/hooks",
    "content_type": "json"
  }
}'

# gh repo create-commit --allow-empty -m "Empty commit"

# gh repo push

# git commit --allow-empty -m "Empty-Commit"

# git push origin main