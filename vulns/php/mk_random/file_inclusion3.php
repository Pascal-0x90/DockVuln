<?php

$file = $_GET['page'];
$file = str_ireplace(array("flag"), '', $file);
include("$file");
?>

