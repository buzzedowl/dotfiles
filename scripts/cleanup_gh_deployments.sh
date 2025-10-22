#!/usr/bin/env bash
# Clean up GitHub deployment history
# Requires: gh CLI tool and jq

set -e

# Disable pager for gh commands
export GH_PAGER=""

# Get repository info
read -p "Enter your GitHub username: " USERNAME
read -p "Enter the repository name: " REPO_NAME
REPO="$USERNAME/$REPO_NAME"

# Choose cleanup option
echo ""
echo "Choose cleanup option:"
echo "1. Delete ALL deployment history"
echo "2. Delete all EXCEPT the latest deployment"
read -p "Enter your choice (1 or 2): " CHOICE

case "$CHOICE" in
    1)
        echo "⚠️  This will delete ALL deployment history for $REPO"
        JQ_FILTER=".[] | .id"
        ;;
    2)
        echo "⚠️  This will delete all deployment history EXCEPT the latest for $REPO"
        JQ_FILTER=".[1:] | .[] | .id"
        ;;
    *)
        echo "❌ Invalid choice. Operation cancelled."
        exit 0
        ;;
esac

# Confirm action
read -p "Do you want to continue? (y/n): " CONFIRM
if [ "$CONFIRM" != "y" ]; then
    echo "❌ Operation cancelled."
    exit 0
fi

# Clean up deployments
echo "🧹 Cleaning up deployments..."
for ID in $(gh api --paginate --method GET "/repos/$REPO/deployments" | jq -r "$JQ_FILTER"); do
    gh api --method POST "/repos/$REPO/deployments/$ID/statuses" -f "state=inactive"
    gh api --method DELETE "/repos/$REPO/deployments/$ID"
done

echo "✅ Deployment cleanup completed!"