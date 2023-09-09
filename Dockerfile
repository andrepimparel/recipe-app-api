FROM python:3.9-alpine3.13
LABEL maintainer="andrepimparel"

ENV PYTHONUNBUFFERED 1

#copy requirements to docker image
COPY ./requirements.txt /tmp/requirements.txt
# copy only dev requirements
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app
# where the cmd are run
WORKDIR /app
EXPOSE 8000

# default dev is false
ARG DEV=false

# run a cmd on a image (&& \ to have multiple lines)
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    apk add --update --no-cache postgresql-client && \
    apk add --update --no-cache --virtual .tmp-build-deps  \
        build-base postgresql-dev musl-dev && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ $DEV = "true" ]; \
        then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    rm -rf /tmp &&\
    apk del .tmp-build-deps && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

# update the env varible in image
ENV PATH="/py/bin:$PATH"

# Last line user we are swithcing to
USER django-user