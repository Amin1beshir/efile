<?php
use ProjectSend\Classes\I18n;


if ( !defined( 'SITE_LANG' ) ) {
	define( 'SITE_LANG', 'en' );
}
$lang = SITE_LANG;
$default_domain = 'cftp_admin';

/**
 * If a user selected a language on the log in form, use it
 */
if ( isset( $_SESSION['lang'] ) ) {
	$lang_sess = $_SESSION['lang'];
	$lang_file = ROOT_DIR . DS . 'lang' . DS . $lang_sess . '.mo';
	if ( file_exists( $lang_file ) ) {
		$lang = $lang_sess;
	}
}
/**
 * If not, check if the admin selected the option to use
 * the browser's language (if available)
 */
else {
	if ( defined('USE_BROWSER_LANG') ) {
		switch ( USE_BROWSER_LANG ) {
			case '0':
			default:
				break;
			case '1':
				$browser_lang	= substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
				$lang_file		= ROOT_DIR . DS . 'lang' . DS . $browser_lang . '.mo';
				if ( file_exists( $lang_file ) ) {
					$lang = $browser_lang;
				}
				break;
		}
	}
}

define('LOADED_LANG', $lang);

I18n::LoadDomain(ROOT_DIR.DS."lang".DS."{$lang}.mo", 'cftp_admin' );
