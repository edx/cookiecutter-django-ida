Part of `edX code`__.

__ http://code.edx.org/

cookiecutter-django-ida  |Travis|_
==================================
.. |Travis| image:: https://travis-ci.org/edx/cookiecutter-django-ida.svg?branch=master
.. _Travis: https://travis-ci.org/edx/cookiecutter-django-ida

A cookiecutter_ template for edX Django projects.

.. _cookiecutter: http://cookiecutter.readthedocs.org/en/latest/index.html


This cookiecutter template is intended for new edX independently deployable apps (IDAs). It includes the following packages:

* Django 1.8.x
* Django REST Framework
* Django Waffle

The necessary configuration is also in place to support:

* i18n
* Documentation (using Sphinx_)
* Authentication with edX Open ID Connect
* Loading settings from YAML (for production)
* Pylint/PEP8 validation
* Travis CI.

.. _Sphinx: http://sphinx-doc.org/

Usage
-----
As with any new project, you will need to create a virtual environment. Once this is set up, install cookiecutter and
edx-lint:

.. code-block:: bash

    $ pip install cookiecutter
    $ pip install edx-lint

cookiecutter has the ability to pull templates directly from git, so there is no need to clone this repo. To access the
template, provide the repo path as an argument:

.. code-block:: bash

    $ cd <workspace>
    $ cookiecutter  https://github.com/edx/cookiecutter-django-ida.git

You will be prompted for a few basic details (described below). These will be used to create the new project.

..  list-table::
    :widths: 25 75
    :header-rows: 1

    * - Variable
      - Description
    * - project_name
      - Full name of the project. (e.g. E-Commerce Service)
    * - repo_name
      - Short (Python-friendly) name of the project. This should ideally also be the name of the repository. (e.g. ecommerce)
    * - author_name
      - The author of the documentation. Leave this as the default ("edX") unless you have a good reason to change it.
    * - description
      - A short description of the project, used to initialize the documentation.

Requirements
~~~~~~~~~~~~
The ``requirements`` files do NOT define package versions for many requirements because you should use the latest
versions available when initializing a new project. Once you initialize your project run ``pip freeze``, and update
the files in the ``requirements`` directory with pinned versions. Failure to do so could cause unexpected results
when running tests or deploying.

User Model Customization
~~~~~~~~~~~~~~~~~~~~~~~~
The project includes a custom Django user model in ``core/models.py``. You must further customize this model
as your IDA requires. You MUST generate migrations for this model before Django can start:

.. code-block:: bash

    $ python manage.py makemigrations

Documentation
~~~~~~~~~~~~~
Sphinx is set up for your project in the ``docs`` directory. All developer documentation should be added here (as
opposed to a long README file). Doing this also has the added benefit of giving you a good starting point when the time
comes to open source your project!


How To Contribute
-----------------
Contributions are very welcome.

Please read `How To Contribute <https://github.com/edx/edx-platform/blob/master/CONTRIBUTING.rst>`_ for details.

Although written with ``edx-platform`` in mind, the guidelines should be followed for Open edX code in general.

Testing
~~~~~~~
The ``Makefile`` includes a ``test`` target that runs basic validation on this template. This validation includes::

    * Create a new project using the template.
    * Run the project's migrations and validations.
    * Extract and compile translations.
    * Compile documentation.

Run this validation using the command below.

.. code-block:: bash

    $ make test


Reporting Security Issues
-------------------------
Please do not report security issues in public. Please email security@edx.org.


Mailing List and IRC Channel
----------------------------
You can discuss this code in the `edx-code Google Group`__ or in the ``#edx-code`` IRC channel on Freenode.

__ https://groups.google.com/forum/#!forum/edx-code
