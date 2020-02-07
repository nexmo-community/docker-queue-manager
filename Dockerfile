FROM python:3.6-slim-buster

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

RUN pip install gunicorn gevent psycopg2-binary

COPY . /app

WORKDIR /app

CMD python create_db.py && gunicorn -k gevent -b 0.0.0.0:$PORT main:app