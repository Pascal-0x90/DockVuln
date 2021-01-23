<?php

// Variables for IP
$IP = "localhost";

$page = $_GET['page'];

if($page == "source") {
    echo show_source("./vuln.php");
} else {
    echo "<center><h1>Welcome to the training grounds.</h1></center>";
    echo "<center><h2>View the source <a href=\"http://$IP:8081/index.php?page=source\">here</a></h2></center>";
    echo "<center><h2>Attack the target <a href=\"http://$IP:8082/vuln.php\">here</a></h2></center>";
    echo "</html>";
}

?>

