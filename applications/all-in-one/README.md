# All-in-one application

## Two apps deployment

In order to deploy two applications running in two different processes, run the command:

```bash
./applications/all-in-one/supevirsord/entrypoint.sh multiprocess
```

This will run `supervisord` with two `gunicorn` servers:

- 1 gunicorn server listening on `0.0.0.0:8001` for app1. The application is served under the root path: `/`

- 1 gunicorn server listening on `0.0.0.0:8002` for app2. The application is served under the root path: `/`

> It is recommended to configure a reverse-proxy (such as nginx) in front of gunicorn servers with such setup.

## Composite app deployment

In order to deploy two applications within a single ASGI app (I.E, in a single process), run the command:

```bash
./applications/all-in-one/supevirsord/entrypoint.sh composite
```

This will run `supervisord` with a single `gunicorn` server listening on `0.0.0.0:8000`:

- app1 is served under `/app1`

- app2 is served under `/app2`

> It is recommended to configure a reverse-proxy (such as nginx) in front of the gunicorn server with such setup.

## Single app deployment (app1)

In order to deploy the application `app1`, run the command:

```bash
./applications/all-in-one/supevirsord/entrypoint.sh app1
```

This will run `supervisord` with a single `gunicorn` server listening on `0.0.0.0:8001`:

- app1 is served under the root path: `/`

## Single app deployment (app2)

In order to deploy the application `app2`, run the command:

```bash
./applications/all-in-one/supevirsord/entrypoint.sh app2
```

This will run `supervisord` with a single `gunicorn` server listening on `0.0.0.0:8002`:

- app2 is served under the root path: `/`
