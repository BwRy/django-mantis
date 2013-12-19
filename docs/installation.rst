============
Installation
============

#. Make sure that you have the required
   dependencies on OS level for building the XML-related packages. For
   example, on an Ubuntu system, execute the following commands::

     $ apt-get install libxml2 libxml2-dev
     $ apt-get install python-dev libxslt1-dev

   If you are behind a proxy, you can configure a proxy for
   ``apt-get`` by putting a file ``95proxy`` into ``/etc/apt/apt.conf.d``
   that has the following contents::

      Acquire::http::proxy "<proxy_url>";
      Acquire::ftp::proxy "<proxy_url>";
      Acquire::https::proxy "<proxy_url>";



#. It is recommended to use a virtual python environment.

   - Make sure that ``virtualenv`` is installed::

        $ apt-get install python-virtualenv

   - Create a virtual environment::

        $ virtualenv <path_for_storing_environments>/mantis
        $ source <path_for_storing_environments>/mantis/bin/activate

     Now the virtual environment is activated -- you should see a changed 
     prompt that is prefixed with ``(mantis)``

#. Find out the current version of ``libxml2-python`` by browsing to
   https://pypi.python.org/pypi/libxml2-python and noting done the
   version number (at time of writing, this was ``2.6.21``).

   Install the ``libxml2`` bindings using ``pip``::

      (mantis)$ pip install ftp://xmlsoft.org/libxml2/python/libxml2-python-<libxml2-python-version-nr>.tar.gz 

   If you are behind a proxy, you can provide ``pip`` with the proxy information with the
   commandline argument ``--proxy  <proxy_url>``


#. Go to a location where you want to have the Django Mantis files and check out the git repository::

      (mantis)$ git clone https://github.com/siemens/django-mantis.git
      
   If you are behind a proxy, you can configure a proxy for ``git`` via the following::

       (mantis)$ git config --global http.proxy <proxy_url>

#. Change into the ``django-mantis`` dictionary and do::
      (mantis)$ pip install -r requirements/local.txt

#. Your are now all set for running MANTIS on top of an SQLite database. If that is what you want to do,
   have a look at :doc:`quickstart`. 

#. For running MANTIS on top of Postgresql (which is
   recommended), you need to install and prepare Postgresql:

   - Install it::
 
          $ apt-get install postgresql
          $ apt-get postgresql-server-dev-9.1 

   - Install the Python module for working with postgresql::

          (mantis)$ pip install psycopg2

   - In ``/etc/postgresql/9.1/main/postgresql.conf`` set ``ssl = False``
 
   - (Re)start the server::
         
          /etc/init.d/postgresql start
 
   - Create password for ``postgresql``: as root user, do::
 
       passwd postgres
 
   - Give the postgresql user a database password; As user ``postgres`` do::
 
         su postgres
         psql
         \password postgres;
 
   - Prepare database: 
   
     - As user postgresql do::
 
          createuser -P django;
 
       and do the following:
 
       - give it password ``mantis``
       - do not make it super user
       - allow it to create databases (required for running python unit tests). If you forgot about this step here, you can
         later run (``ALTER USER django CREATEDB;``) on the database prompt to achieve the same.
       - do not allow it to create new roles
 
 
   - In database, do::
 
       CREATE DATABASE django OWNER mantis ENCODING 'UTF-8';
 
   - In ``/etc/posgresql/9.1/main/pg_hba.conf`` enter after the line for the postgres user::
 
        # TYPE  DATABASE        USER            ADDRESS                 METHOD
 
        local [tab] django [tab] mantis [tab][tab]  md5

#. Continue with the  :doc:`quickstart`. 



