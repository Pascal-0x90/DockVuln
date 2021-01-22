<?php

$cmd = $_GET['cmd'];
// prevent catting the flag
$cmd = str_ireplace(array("cat","less",'head','more','awk','ed','sed','nano','vi', 'tail'), '', $cmd);
$cmd = str_ireplace(array("\n","\t",'`',';','\\','','\'','\"','#','>','-o','-O',' '), '', $cmd);
echo system("$cmd");
?>