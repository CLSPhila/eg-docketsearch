FROM python:3.7.6-stretch

ENV PYTHONUNBUFFERED 1

RUN mkdir /code && mkdir /data

WORKDIR /code

COPY Pipfile /code/
COPY Pipfile.lock /code/

RUN pip install pipenv==2018.11.26 && pipenv install --deploy --system && pip install src/django-docketsearch

COPY . /code/

RUN useradd -ms /bin/bash gunicorn && chown gunicorn:gunicorn /data

USER gunicorn

CMD ["gunicorn", "egdocketsearch.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "4"]
