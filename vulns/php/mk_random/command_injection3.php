<?php

$host = $_GET["cmd"];

// prevent command injection attacks and downloading files
$host = str_ireplace(array("\n","\t",'`',';','\\','','\'','\"','#','>','-o','-O',' '), '', $host);

system("curl --head http://$host");

?>
