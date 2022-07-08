<?php

session_start();
$_SESSION['last_call'] = time();
/*
$img = imagecreate( 1, 1 );
header( "Content-type: image/jpeg" );
imagejpeg($img);
imagedestroy($img);
*/
$random = rand( 1,1000000 );
$timestamp = preg_replace( '/[^0-9]/', '', $_GET['timestamp'] );
echo $timestamp . '-' . $random;