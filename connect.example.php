<?php
$DB = @mysqli_connect('localhost', 'DB_USER','DB_PASSWORD', 'DB_NAME') or die('no connect MYSQL');


mysqli_query($DB, "SET NAMES 'utf8'");
mysqli_query($DB, "SET CHARACTER SET 'utf8'");
mysqli_query($DB, "SET SESSION collation_connection = 'utf8_general_ci'");
mysqli_query($DB, 'SET NAMES utf8 COLLATE utf8_general_ci');

?>