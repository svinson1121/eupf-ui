#!/bin/sh
set -e

# Replace env placeholders in env.template.js with actual values
envsubst < /usr/share/nginx/html/env.template.js > /usr/share/nginx/html/env.js

# Start nginx
exec nginx -g 'daemon off;'

