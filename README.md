# secDevLabs Vulnerable eCommerce API

[secDevLabs](https://github.com/globocom/secDevLabs)' [`owasp-top10-2021-apps/a1/ecommerce-api`](https://github.com/globocom/secDevLabs/tree/10be438496e928c66567749f0aaf0bb976052bc9/owasp-top10-2021-apps/a1/ecommerce-api) app, by Globo.com and the
secDevLabs contributors: a Go (Echo) API backed by MongoDB with a Broken Access Control flaw: a user's ticket is served to whoever asks for their user id. This repository runs it with
[Isoloom](https://www.isoloom.com): [`isoloom.yml`](isoloom.yml) describes the machines, built from
the vendored app folder (see [UPSTREAM.md](UPSTREAM.md)).

| Machine | Service |
| --- | --- |
| api | Vulnerable eCommerce API on port 10005 |
| mongodb | MongoDB 4.0.3 on port 27017 (lab network only) |

## Run it

```bash
isoloom generate
isoloom up docker
```

Then open http://localhost:10005/ (`POST /register`, `POST /login`, `GET /ticket/<id>`). The same spec runs as Docker on a local VM (`docker-vm`), on a cloud VM
(`cloud-docker`) or on Kubernetes. Lab guide: the app's
[README](https://github.com/globocom/secDevLabs/blob/10be438496e928c66567749f0aaf0bb976052bc9/owasp-top10-2021-apps/a1/ecommerce-api/README.md), with the attack narrative and the secDevLabs walkthrough.

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

BSD-3-Clause, as secDevLabs ([LICENSE](LICENSE)). The third-party software inside the images keeps
its own licence. This application is deliberately vulnerable: keep it isolated.
