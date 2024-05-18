#! /bin/bash

export CLOUDFLARE_API_KEY=$(op item get quanianitis_cloudflare_api_key --format json | jq -r '.fields[] | select(.id == "credential") | .value')
