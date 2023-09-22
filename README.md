# recipe-app-api
 Recipe API project with Django abd Docker

# Docker
ligar a app do docker para funcionar
docker build .
docker-compose build
docker-compose down
docker-compose up

# Linting
install flake8 package
docker-compose run --rm app sh -c "flake8"

# Unit Test
docker-compose run --rm app sh -c "python manage.py test"

# Create Django
docker-compose run --rm app sh -c "django-admin startproject app ."
docker-compose run --rm app sh -c "python manage.py startapp core"

# Run Service
docker-compose up

# Tests classes
SimpleTestCase - No database
TestCase - Database
