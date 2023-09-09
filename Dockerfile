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
# 1 create venv
# 2 upgrade pip for venv
# 3 install requeriments
# 4 install dev requirements if in dev mode
# 5 remove tmp directory (we hould keep docker images as light as possible)
# 6 add a new user inside our image for more safety
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ $DEV = "true" ]; \
        then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    rm -rf /tmp &&\
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

# update the env varible in image
ENV PATH="/py/bin:$PATH"

# Last line user we are swithcing to
USER django-user