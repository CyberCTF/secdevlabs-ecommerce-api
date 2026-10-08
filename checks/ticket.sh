#!/bin/sh
# The ticket route answers without any session: it looks the user up by the id in the URL.
set -e
curl -sS 'http://api:10005/ticket/no-such-user?format=json' | grep -q 'Error finding this UserID'
