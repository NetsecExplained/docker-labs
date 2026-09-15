# CMS Docker Lab

Vulnerable app used in this code-review series: **"Simple Client Management System"**
by `oretnom23` (SourceCodester, free for educational use). It has known, documented
vulnerabilities (CVE-2021-43510, an unauthenticated SQL injection, plus a published RCE
chain) — that's what this series reviews.

This directory is meant to live as a lab inside a larger `docker-labs` monorepo. The
full app source is committed here alongside the Docker tooling — the build does not
download or fetch anything.

## Spin up

Requires Docker and Docker Compose.

```
docker compose up --build
```

Give MariaDB a few seconds to initialize on first boot; the app will refuse
connections briefly until it's ready. It runs Apache + PHP 8.0 + MariaDB in a single
container.

## Connect

Open <http://localhost:8000/>.

Default login: `admin` / `admin123`

Data persists in a named volume (`mysql_data`) across restarts. To reset to a clean
database, run `docker compose down -v`.

## Layout

```
.
├── Dockerfile          # builds the image from the committed app source below
├── docker-compose.yml
├── docker/
│   └── entrypoint.sh   # starts MariaDB, seeds the schema on first boot, starts Apache
└── ...                 # the app itself (admin/, classes/, database/, etc.)
```

## Disclaimer

This environment intentionally runs known-vulnerable code for security education and
review purposes. Do not expose it to the internet or reuse its patterns in production.
