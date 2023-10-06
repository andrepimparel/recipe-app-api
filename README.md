# recipe-app-api
 Recipe API project with Django abd Docker

# Docker
ligar a app do docker para funcionar
docker build .
docker-compose build (update dos requirements por exemplo)
docker-compose down (fechar os container)
docker-compose up
dea
# Linting
install flake8 package
docker-compose run --rm app sh -c "flake8"

# Unit Test
docker-compose run --rm app sh -c "python manage.py test"

# Create Django
docker-compose run --rm app sh -c "django-admin startproject app ." (create project)
docker-compose run --rm app sh -c "python manage.py startapp core" (create app)

# Run Service
docker-compose up

# Tests classes
SimpleTestCase - No database
TestCase - Database
tens de estar numa pasta "tests" e o nome do ficheiro e metodo por "test_"

# Migrations 
docker-compose run --rm app sh -c "python manage.py makemigrations"
docker-compose run --rm app sh -c "python manage.py migrate"

# Volume
docker volume ls
docker volume rm "nomeVolume" (eliminar)

# Django admin
docker-compose run --rm app sh -c "python manage.py createsuperuser"

# Create app
docker-compose run --rm app sh -c "python manage.py startapp user"