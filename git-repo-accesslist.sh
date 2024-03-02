#!/bin/bash

# Providing GitHub URL
GitHub_API_URL="https://api.github.com"

# Providing GitHub username and Personal access token
USERNAME=$username
TOKEN=$token

# User and Repository information at the time of exec
REPO_OWNER=$1
REPO_NAME=$2

# Function to make a GET request from GitHub API
function github_api_get {
	local endpoint="$1"
	local url="${GitHub_API_URL}/${endpoint}"

	# Send a GET request to the GitHub API  with authentication
	curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to listout users with read access to the repository
function list_users_with_read_access {
	local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

	# Fetch the list of collaborators in the repository with json jq perser
	collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

	# Display the list of collaborators with the read access 
	if [ -z "$collaborators" ]; then
		echo "No Users with read access found for : ${REPO_OWNER}/${REPO_NAME}."
	else
		echo "The Users with read access to : ${REPO_OWNER}/${REPO_NAME}:"
		echo "$Collaborators"
	fi
}

# Main script
echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}:"
list_users_with_read_access
