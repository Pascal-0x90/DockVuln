<?php

$page = $_GET['page'];

if($page == "source") {
    echo show_source("./vuln.php");
} else {
    $friendly = "localhost"; 
    $foe = "127.0.0.1";
    echo "<center><h1>Welcome to the training grounds.</h1></center>";
    echo "<center><h2>View the source <a href=\"http://$friendly/index.php?page=source\">here</a></h2></center>";
    echo "<center><h2>Attack the target <a href=\"http://$foe/vuln.php\">here</a></h2></center>";
    echo "</html>";
}

?>

