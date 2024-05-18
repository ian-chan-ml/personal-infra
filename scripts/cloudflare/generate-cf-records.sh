#! /bin/bash

cf-terraforming import -t $CLOUDFLARE_API_TOKEN -z $CLOUDFLARE_ZONE --resource-type "cloudflare_record" -v > imports-command.sh
