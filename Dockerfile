FROM python:3.7.6-stretch

ENV PYTHONUNBUFFERED 1

RUN mkdir /code

WORKDIR /code

COPY Pipfile /code/
COPY Pipfile.lock /code/

RUN pip install pipenv && pipenv install --deploy --system && pip install src/django-docketsearch

COPY . /code/

RUN useradd -ms /bin/bash gunicorn

USER gunicorn

CMD ["gunicorn", "egdocketsearch.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "4"]