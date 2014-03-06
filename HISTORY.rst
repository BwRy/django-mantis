.. :changelog:

History
-------

0.2.1 (2014-03-06)
++++++++++++++++++

* Changed dependencies for Mantis components
    
  * Mantis now requires DINGOS in version 0.2.1. The differences to 0.2.0 are as follows:

    * Bugfixes
    
      * *CRITICAL* Remediation of painfully slow import for systems with lot's of imported data
    
        An illformed query led to extremely slow import of new data in systems
        that already have lot's of data inside. This bug has been fixed.
    
      * Problem in link to InfoObjects in which a certain fact can be found on Unique Search Page fixed
    
        The link was faulty in that it carried a '&page=...' parameter that needed to be removed. 
    
      * Long repetition of '_' in a string lead to HTML display spilling over, because '_' was
        not regarded as place to insert a possible line break. This has been changed.
      
    * New/Modified views
    
      * View for listing *all* InfoObjects, also those used internally by DINGOS
        for bookkeeping (e.g., user preferences). The view is restricted to
        Django-superusers.
    
    * New/Modified command-line commands
    
      * In 'dingos_manage_user_settings', added the ability to overwrite settings for 'ALL'
        users.
    

0.2.0 (2014-02-26)
++++++++++++++++++

* Changed dependencies for Mantis components
    
  * Mantis now requires DINGOS in version 0.2.0. The differences to 0.1.0 are as follows:

    * New base functionality
      
      * Added framework for managing user-specific data (user configurations,
        saved searches, etc.) and querying user-specific data in templates and views.
    
      * Added tracking of namespace information per component of a fact term
    
    * New/Modified views

      * Modifications to all views

        * Added possibility to switch between horizontal and vertical layout ...
          or have automatic adjustment of the layout depending on screen width.
    
      * Modifications to filter views
    
        * Modified date-picker in filters to enable addition of timespans without
          changing saved searches or messing up order of timespans
    
        * Added several further filter criteria in InfoObject filter
    
      * Added view with basic and still rather restricted editing capabilities for
        InfoObjects -- currently only used for editing user preferences or
        edits by the superuser
    
      * Added view to edit user configuration
    
      * Added view to edit saved searches
    
      * Added per-column ordering to list views
    
      * Added new filter/search that shows unique Facts rather than all
        InfoObjects containing a certain fact.
    
    * New/added capabilities for writing views
    
      * Added framework for ordering list views
    
      * Added per-user configuration for:
    
        * layout (horizontal vs. vertical)

        * number of rows to show in list views

        * number of rows to show in widget displaying objects in which a
          displayed object is embedded
    
    * Bug fixes / Improvements

      * Generation of filter views became unbearably slow when many
        (> 40,000) InfoObjects are in the system. This was, because
        of a badly built query within the dynamically built filter
        form. This has been fixed.
    
      * Further development of JSON export (still needs work to make
        the to_dict function of InfoObjects generic and configurable such as
        the from_dict function)
    
      * Fixed bug in generation of InfoObjects: when a placeholder for a given
        ID already existed, it was not reliably found.
    
    * New/Modified command-line commands
    
      * Import command now fails gracefully if import of a file
        throws an exception: it continues with import of the next file.
    
      * Added command line arguments to basic import command:

        * ability to add IDs of marking objects to be added to imported objects

        * ability to automatically move imported XML files to other folder after
          import
    
      * Added command to reset user-settings and saved searches for a given user.
    
      * Added command to re-calculate object names.
    
        This is useful to run right after an import, recalculating the
        names of 'Observable' InfoObjects created in the past few minutes.  Thus, the
        problem that those Observables that are to be named after the (single)
        object they contain do not carry a proper name (because at creation time
        of the Observable, the Object usually does not exist, yet) can be fixed.

  * Mantis now requires the Mantis-Core in version 0.2.0.
    The differences to 0.1.0 are as follows:
 
    * Added corresponding abstract model classes for
      models introduced in DINGOS 0.2.0.
 
  * Mantis now requires the STIX/CybOX Importer in version 0.2.0.
    The differences to 0.1.0 are as follows:
    
    * Added ability to generate identifier for top-level element
      (usually a STIX_Package) if an identifier for that element is
      missing: if a default namespace has been defined, then
      an identifier is generated by taking the MD5-hash of the
      xml file.
    
    * Markings present in STIX_Package are read out and attached
      to all InfoObjects generated from the STIX_Package. 
    
      Note: Mantis does currently not interpret the XPATH expression
      that specifies the scope of the marking (which is not much
      of an issue, since it seems that the feature to restrict
      the scope of a marking is not much used at the moment).
    
    * Timestamp present in `STIX_Header/Information_Source/Time/Produced_Time` 
      is read.
    
    * Added a command-line argument to add a default-timestamp to the STIX import
      command.
        
    * Bug fixes:
    
      * Attributes other than `id` and `idref` that contained a namespace were not
        handled correctly. The handler function `attr_with_namespace_handler`
        fixes this.

      * In `0.1.0`, the `xsi:type` attribute was not recorded, because in most cases,
        its information is used for determining the data type of elements and
        InfoObjects. But there are cases, e.g., in Markings, where this is not the
        case. For these cases, the `xsi:type` attribute is kept in the InfoObject.

      * Family revision info was not recorded; this has been fixed.

  * Mantis now requires the OpenIOC Importer in version 0.2.0.
    The differences to 0.1.0 are as follows:

    * Fixed bug in import of timestamp.
        

    
0.1.0 (2013-12-19)
++++++++++++++++++

* Initial release

 
