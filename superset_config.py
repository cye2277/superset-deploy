import os

SECRET_KEY = os.getenv("SUPERSET_SECRET_KEY", "fallback-unsafe-key")
SQLALCHEMY_DATABASE_URI = os.getenv("DATABASE_URL")