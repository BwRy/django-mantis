===================================================================================
QUICKSTART
===================================================================================

In the ``django-mantis`` folder, do the following:

- For easy demo usage with SQLite, do::

     (mantis)$ bash quickstart.sh 

- For usage with exisiting and configured postgresql database, do::

     (mantis)$  bash quickstart_psql 

Then try out the following:

- Download: http://stix.mitre.org/downloads/APT1-STIX.zip and extract the files

- For the files Mandiant_APT1_Report.xml and Appendix_G_IOCs_Full.xml do
  the following:

  - If you are using postgresql::

      python manage.py mantis_stix_import --settings=mantis.settings.local_psql  --trace\
          --marking_json=quickstart_examples/markings/minimal_marking.json\
          --marking_pfill=source "Mandiant APT 1 Report"\
          <file_path>

  - If you are using sqllite::

      python manage.py mantis_stix_import --settings=mantis.settings.local  --trace\
          --marking_json=quickstart_examples/markings/minimal_marking.json\
          --marking_pfill=source "Mandiant APT 1 Report"\
          <file_path>

  Start with Mandiant_APT1_Report.xml: that goes relatively fast;
  Appendix_G_IOCs_Full.xml will take about 20 minutes or so to import.

  **ATTENTION**: The import of large files takes quite a bit of memory (probably there is a memory leak
  somewhere, which will be ironed out in a future release). Be sure to give the system/virtual machine
  you are running the import of ``Appendix_G_IOCs_Full.xml`` on a fair amount of memory (4 GB definitely
  works).


- Start the server (if the quickstart-script has not started it already for you)
  with 

  - If you are using postgresql::

      python manage.py runserver 8000 --traceback --settings=mantis.settings.local_psql

  - If you are using sqllite::

      python manage.py runserver 8000 --traceback --settings=mantis.settings.local


 
 - Browse to::   
   
        127.0.0.1:8000/mantis/View/InfoObject

  and start looking around:

  - Select a filter for ``stix.mitre.org:STIX_Package``
    in the filter box in the top-right corner. 

  - This will show you all ``STIX_Package``
    objects that are in the system (two, if you imported both ``Mandiant_APT1_Report.xml``
    and ``Appendix_G_IOC_Full.xml``). 

  - Click on one of the two objects and start
    exploring (have a look at the screenshots in the documentation for
    a quick guide through the application.)





