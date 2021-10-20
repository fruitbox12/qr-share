FROM python:3.9-slim

ENV APP_HOME /app
WORKDIR $APP_HOME

RUN rm -rf /tmp/*

COPY . ./

RUN pip install -r requirements.txt

EXPOSE $PORT

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 app.app:app