.DEFAULT_GOAL := test

.PHONY: requirements test clean

requirements:
	pip install -r requirements.txt

test: clean
	# Create a new project with the default values
	cookiecutter . --no-input

	virtualenv -p python3.6 repo-name/.venv

	# Generate requirement pins, install them, and execute the project's tests
	. repo-name/.venv/bin/activate && cd repo-name && make upgrade validation_requirements
	. repo-name/.venv/bin/activate && cd repo-name && python manage.py makemigrations
	. repo-name/.venv/bin/activate && cd repo-name && make migrate validate

	# Ensure translations can be compiled
	. repo-name/.venv/bin/activate && cd repo-name && make fake_translations

	# Ensure documentation can be compiled
	. repo-name/.venv/bin/activate && cd repo-name && make doc_requirements
	. repo-name/.venv/bin/activate && cd repo-name/docs && make html

clean:
	rm -rf .venv
	rm -rf repo-name
