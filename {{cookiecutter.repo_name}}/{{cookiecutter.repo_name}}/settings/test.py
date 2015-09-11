import os

from {{cookiecutter.repo_name}}.settings.base import *
from {{cookiecutter.repo_name}}.settings.utils import get_logger_config


# TEST SETTINGS
INSTALLED_APPS += (
    'django_nose',
)

TEST_RUNNER = 'django_nose.NoseTestSuiteRunner'

NOSE_ARGS = [
    '--with-ignore-docstrings',
    '--logging-level=DEBUG',
]

LOGGING = get_logger_config(debug=False, dev_env=True, local_loglevel='DEBUG')
# END TEST SETTINGS


# IN-MEMORY TEST DATABASE
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': ':memory:',
        'USER': '',
        'PASSWORD': '',
        'HOST': '',
        'PORT': '',
    },
}
# END IN-MEMORY TEST DATABASE
