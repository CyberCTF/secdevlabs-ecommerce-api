# Upstream's deployments/mongo.Dockerfile (mongo:4.0.3 with a mongo-init.js that creates the
# API's database user). Upstream generates that script at `make install` with a random password;
# here it is mongo-init.js next to this file, with the fixed values of build/api/Dockerfile.
FROM docker.io/library/mongo:4.0.3

ADD mongo-init.js /docker-entrypoint-initdb.d/
