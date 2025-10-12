# GitHub Deployment History Cleaner
# This script removes deployment history from a GitHub repository
# You have to be logged in to GitHub CLI tool (gh)

# Disable pager for gh commands
export GH_PAGER=""

# Prompt for GitHub username
read -p "Enter your GitHub username: " USERNAME

# Prompt for repository name
read -p "Enter the repository name: " REPO_NAME

# Construct the full repo path
REPO="$USERNAME/$REPO_NAME"

# Ask user what they want to do
echo ""
echo "Choose an option:"
echo "1. Delete ALL deployment history"
echo "2. Delete all deployment history EXCEPT the latest one"
read -p "Enter your choice (1 or 2): " CHOICE

if [ "$CHOICE" = "1" ]; then
    echo "This will deactivate and delete ALL deployment history for $REPO and it can't be undone!"
    JQ_FILTER=".[] | .id"
elif [ "$CHOICE" = "2" ]; then
    echo "This will deactivate and delete all deployment history for $REPO except the latest deployment and it can't be undone!"
    JQ_FILTER=".[1:] | .[] | .id"
else
    echo "Invalid choice. Operation cancelled."
    exit 0
fi

read -p "Do you want to continue? (y/n): " CONFIRM

if [ "$CONFIRM" != "y" ]; then
    echo "Operation cancelled."
    exit 0
fi

# Get deployment IDs based on user choice
for ID in $(gh api --paginate --method GET "/repos/$REPO/deployments" | jq -r "$JQ_FILTER")
do
    gh api -H "Accept: application/vnd.github+json" -H "X-GitHub-Api-Version: 2022-11-28" --method POST /repos/$REPO/deployments/$ID/statuses -f "state=inactive"
    gh api -H "Accept: application/vnd.github+json" -H "X-GitHub-Api-Version: 2022-11-28" --method DELETE /repos/$REPO/deployments/$ID
done
