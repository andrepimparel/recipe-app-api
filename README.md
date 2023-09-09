# recipe-app-api
 Recipe API project with Django abd Docker

 # Docker
 docker build .
 docker-compose build

 # Linting
 install flake8 package
 docker-compose run --rm app sh -c "flake8"

 # Unit Test
docker-compose run --rm app sh -c "python manage.py test"

# Create Django
docker-compose run --rm app sh -c "django-admin startproject app ."

# Run Service
docker-compose up
