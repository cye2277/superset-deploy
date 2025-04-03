import os

SECRET_KEY = os.getenv("SUPERSET_SECRET_KEY", "fallback-unsafe-key")