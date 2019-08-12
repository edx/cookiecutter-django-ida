.DEFAULT_GOAL := test

.PHONY: requirements test upgrade clean

requirements:
	pip install -r requirements.txt

test: clean
	# Create a new project with the default values
	cookiecutter . --no-input

	virtualenv -p python3.6 repo_name/.venv

	# Execute the project's tests
	. repo_name/.venv/bin/activate && cd repo_name && make piptools validation_requirements
	. repo_name/.venv/bin/activate && cd repo_name && python manage.py makemigrations
	. repo_name/.venv/bin/activate && cd repo_name && make migrate
	. repo_name/.venv/bin/activate && cd repo_name && make validate

	# Ensure translations can be compiled
	. repo_name/.venv/bin/activate && cd repo_name && make fake_translations

	# Ensure documentation can be compiled
	. repo_name/.venv/bin/activate && cd repo_name && make doc_requirements
	. repo_name/.venv/bin/activate && cd repo_name/docs && make html

upgrade: .venv
	. .venv/bin/activate && cd \{\{cookiecutter.repo_name\}\} && make upgrade

.venv:
	virtualenv -p python3.6 .venv

clean:
	rm -rf .venv
	rm -rf repo_name
