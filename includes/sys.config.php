<?php

define('DB_DRIVER', 'mysql');

/** Database name */
define('DB_NAME', 'file');

/** Database host (in most cases it's localhost) */
define('DB_HOST', 'localhost');

/** Database username (must be assigned to the database) */
define('DB_USER', 'root');

/** Database password */
define('DB_PASSWORD', 'root');

/**
 * Prefix for the tables. Set to something other than tbl_ for increased
 * security onr in case you want more than 1 installations on the same database.
 */
define('TABLES_PREFIX', 'tbl_');

/*
 * Global site language definition
 *
 * For this setting to work on the back-end (log-in, administration,
 * and the installation pages, and the e-mails sent by the system), a file named
 * x.mo (where x is the value that you define here) must exist on the folder
 * /lang.
 *
 * The uploader language strings are loaded from the file x.mo (see above) that
 * is located on the folder /includes/plupload/js/i18n/
 *
 * If you want to apply this setting to the client's file lists, you must
 * have a file named x.mo (see above) on your selected template folder
 * (eg: /templates/default/lang).
 *
 * English language files are included by default.
 *
 * This setting can be changed at anytime and the language will be applied
 * immediately.
 *
 */
define('SITE_LANG','en');

/**
 * Define a maximum size (in mb.) that is allowed on each file to be uploaded.
 */
define('MAX_FILESIZE','2048'); 

/**
 * Encoding to use on the e-mails sent to new clients, users, files, etc.
 */
define('EMAIL_ENCODING', 'utf-8');