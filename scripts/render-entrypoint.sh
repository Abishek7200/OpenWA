#!/bin/bash
# Render Entrypoint Wrapper
# Intercepts 'docker compose' commands and runs the app directly

if [[ "$*" == *"docker compose"* ]]; then
  echo "INFO: Detected 'docker compose' command from Render config."
  echo "INFO: Render Web Services do not support Docker Compose natively."
  echo "INFO: Redirecting to 'node dist/main'..."
  exec node dist/main
fi

# Fallback to executing the provided command
exec "$@"
