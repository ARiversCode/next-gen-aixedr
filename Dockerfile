FROM python:3.10-slim-bookworm

WORKDIR /app

RUN addgroup --system --gid 1000 app && adduser --system --no-create-home --uid 1000 --ingroup app --disabled-password app

COPY --chown=0:1000 --chmod=550 / /app

RUN chmod +x /app/main.py

# Switch to app user
USER 1000

# Run app.py when the container launches
ENTRYPOINT ["python", "main.py"]
