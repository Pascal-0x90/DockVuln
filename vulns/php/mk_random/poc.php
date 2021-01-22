<html> 
<title> RFI/LFI/SQLI/XSS PoC App </title> 
<body> 
<h1>PoC:</h1> 
- Search - sql inj 
<br /> 
- Search2 - concat sql inj 
<br /> 
- cmd - lfi inj 
<br /> 
- cmd2 - rfi inj 
<br /> 
- x - xss parameter 
<br /><br /> 
<?php 
$username="zsltestuser"; 
$password="zsltestpass"; 
$db="zsltestdb"; 
mysql_connect(localhost,$username,$password) or die("NO NO!"); 
mysql_select_db($db); 
$query=$_GET["Search"]; 
if(isset($query)){ 
$results=mysql_query($query); 
if($results != null){ 
print_r (mysql_fetch_row($results)); 
}else{ 
echo "Zero findings..."; 
} 
mysql_close(); 
} 
$s2=$_GET["Search2"]; 
if(isset($s2)){ 
$lq = "select * from testwaf where testzsl ='$s2'"; 
//echo $lq; 
$results2=mysql_query($lq); 
if($results2 != null){ 
print_r (mysql_fetch_row($results2)); 
}else{ 
echo "Zero findings..."; 
} 
mysql_close(); 
} 
$cmd=$_GET["cmd"]; 
if(isset($cmd)){ 
echo "<br /<br />LFI results-"; 
passthru($cmd); 
} 
$cmd2=$_GET["cmd2"]; 
if(isset($cmd2)){ 
echo "<br /><br />RFI results-"; 
include($cmd2); 
} 
$x = $_GET["x"]; 
if(isset($x)){ 
echo "<h2>".$x."</h2>"; 
} 
?> 
</body></html>
