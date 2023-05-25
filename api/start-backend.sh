#!/bin/bash
if [[ -z "${FLASK_RUN_PORT}" ]]; then
  FLASK_PORT="Some default value because FLASK_RUN_PORT is undefined"
else
  FLASK_PORT="${FLASK_RUN_PORT}"
fi

gunicorn -w 4 -b :${FLASK_PORT} --log-level INFO --timeout 120 runserver:api