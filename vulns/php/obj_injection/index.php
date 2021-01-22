<?php

$page = $_GET['page'];

if($page == "source") {
    echo show_source("./vuln.php");
} else {
    $ip = $_SERVER['HTTP_SERVER_IP'] + ;
    echo "<center><h2>The source code for the target machine can be found <a href=\"$ip\">here</a></h2></center>";
}
?>

