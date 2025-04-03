FROM apache/superset:latest

ENV SUPERSET_HOME=/app/superset_home
ENV SUPERSET_SECRET_KEY=your_super_secret_key
ENV FLASK_APP=superset

RUN superset db upgrade && \
    superset init

CMD ["gunicorn", "--bind", "0.0.0.0:8088", "superset.app:create_app()"]