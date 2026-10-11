#!/bin/sh
# Places the player's flag (CTF_FLAG_MAIN, given by the launcher) as the ticket of a seeded admin user with the fixed user id 1;
# without one (CI, a run by hand) the development flag.
dev='FLAG{dev-secdevlabs-ecommerce-api}'
flag="${CTF_FLAG_MAIN:-$dev}"
i=0; until mongo --quiet --eval 'db.runCommand({ping: 1})' >/dev/null 2>&1; do i=$((i+1)); [ $i -gt 90 ] && exit 1; sleep 2; done
mongo --quiet DB --eval "var flag = '$flag'; db.users.deleteMany({userID: '1'}); db.users.insertOne({username: 'admin', hashedPassword: 'not-a-bcrypt-hash', userID: '1', ticket: flag});"
