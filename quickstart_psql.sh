python manage.py syncdb --traceback --settings=mantis.settings.local_psql 
python manage.py migrate  --traceback --settings=mantis.settings.local_psql
python manage.py collectstatic --settings=mantis.settings.local_psql  --trace
python manage.py mantis_openioc_set_naming --settings=mantis.settings.local_psql  --trace 
python manage.py mantis_stix_set_naming --settings=mantis.settings.local_psql  --trace
less quickstart.rst
cat quickstart.rst
python manage.py runserver 8000 --traceback --settings=mantis.settings.local_psql

