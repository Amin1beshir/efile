<?php

use ProjectSend\Classes\Session;

/** Extension class to count the total of executed queries */
if ( DEBUG === true ) {
	class PDOEx extends PDO
	{
		private $queries = 0;

		public function query($query, $fetchMode = PDO::ATTR_DEFAULT_FETCH_MODE, $options = array()) {
			++$this->queries;
			return parent::query($query, $fetchMode);
		}

		public function prepare($statement, $options = array()) {
			++$this->queries;
			return parent::prepare($statement);
		}

		public function GetCount() {
			return $this->queries;
		}
	}
}

/** Initiate the database connection */
if ( defined('DB_NAME') ) {
	global $dbh;
	try {
		switch ( DB_DRIVER ) {
			default:
			case 'mysql':
				if ( DEBUG === true ) {
					$dbh = new PDOEx("mysql:host=" . DB_HOST . ";dbname=" . DB_NAME, DB_USER, DB_PASSWORD, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
				}
				else {
					$dbh = new PDO("mysql:host=" . DB_HOST . ";dbname=" . DB_NAME, DB_USER, DB_PASSWORD, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
				}
				break;

			case 'mssql':
				if ( DEBUG === true ) {
					$dbh = new PDOEx("mssql:host=" . DB_HOST . ";dbname=" . DB_NAME, DB_USER, DB_PASSWORD, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
				}
				else {
					$dbh = new PDO("mssql:host=" . DB_HOST . ";dbname=" . DB_NAME, DB_USER, DB_PASSWORD, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
				}
				break;
		}

		$dbh->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
		$dbh->setAttribute( PDO::ATTR_EMULATE_PREPARES, false );
	}
	catch(PDOException $e) {
        echo $e->getMessage();
        exit;
	}
}
