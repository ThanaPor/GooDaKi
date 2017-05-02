# GooDaKi
A Higher-Education Infrastructure based on Knowledge Chunks that facilitates the production and consumption of knowledge.

# Project Setup Procedure
1. from a terminal that is able to run docker, `cd` to project-root folder. 
2. Execute `docker-compose build`.
3. Execute `docker-compose up`.
4. You can now access the application from `localhost:5000`.

In case of database structure change (i.e. change in `/db/` folder), please execute `docker-compose down` to destroy previous containers and then proceed above procedures.

# Project Structures
- The project contains 3 microservices: main, course, and chunk.
- The folders of this projects are named after the services
- In each microservice folder `api-doc.txt` defines every api exposed by each service.
- In each microservice folder (`/main/`, `/course/`, `/chunk/`): 
	- `/.../app/` contains application related files
		- `/.../app/main.py` is the main application file
		- `/.../app/requirements.txt` is the list of Python module required (use at installation time)
		- `/.../app/run.sh` is the application starter (it'll wait for database server to become available and trigger initial setup)
		- `/.../app/setup.sh` is for application initial setup (such as add user)
	- `/.../db/` contains database related files
		- `/.../db/sql/` contains SQL files for defining database structures
		- `/.../db/setup.sh` is for database initial setup including executing SQL file from `/db/sql/`
- `/docs/` contains the information about the endpoints and APIs for each service
- `/docker-composer.yml` base Docker Composer file
- `/docker-composer.override.yml` default Docker Composer file override for development environment