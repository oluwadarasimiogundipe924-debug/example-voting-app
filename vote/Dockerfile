FROM python:3.11-slim-bookworm@sha256:0a310eeecf4e1f5a0743f9a6520c90c88d089c903ca5fd283f501e3a805f5f89 AS base

RUN apt-get update &&     apt-get install -y --no-install-recommends curl &&     rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/app
COPY requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

RUN groupadd --gid 10001 appuser &&     useradd --uid 10001 --gid 10001 --create-home appuser &&     chown -R 10001:10001 /usr/local/app

FROM base AS dev
RUN pip install --no-cache-dir watchdog
ENV FLASK_ENV=development
USER 10001:10001
CMD ["python", "app.py"]

FROM base AS final
COPY --chown=10001:10001 . .
EXPOSE 8080
USER 10001:10001
CMD ["gunicorn", "app:app", "-b", "0.0.0.0:8080", "--log-file", "-", "--access-logfile", "-", "--workers", "4", "--keep-alive", "0"]
