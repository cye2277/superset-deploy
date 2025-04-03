FROM apache/superset:latest

ENV SUPERSET_HOME=/app/superset_home
ENV FLASK_APP=superset

# 複製自訂設定檔
COPY superset_config.py ${SUPERSET_HOME}/superset_config.py


# 自動建立帳號用到的變數
ENV ADMIN_USERNAME=${ADMIN_USERNAME}
ENV ADMIN_PASSWORD=${ADMIN_PASSWORD}
ENV ADMIN_EMAIL=${ADMIN_EMAIL}

# 初始化 Superset 並建立管理者帳號
RUN superset db upgrade && \
    superset fab create-admin \
      --username $ADMIN_USERNAME \
      --firstname Superset \
      --lastname Admin \
      --email $ADMIN_EMAIL \
      --password $ADMIN_PASSWORD && \
    superset init

CMD ["gunicorn", "--bind", "0.0.0.0:8088", "superset.app:create_app()"]