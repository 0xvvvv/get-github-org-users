#!/bin/bash

TOKEN="ghp_token"
ORG_NAME="org_name"

function get_members {
  local page=$1
  local response=$(curl -s -H "Authorization: token $TOKEN" "https://api.github.com/orgs/$ORG_NAME/members?page=$page&per_page=100")

  echo "$response"

  if [[ $page -le 10  ]]; then
    page=$((page + 1))
    get_members $page
  fi
}

get_members 1
