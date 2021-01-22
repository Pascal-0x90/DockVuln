<?php 
class File {
  public function flag() {
    $this->innocent();
  }
  public function innocent() {
    echo "THIS IS NOT THE FLAG :D\n";
  }
}
class GiveFlag extends File {
    public $offset = 23;
    public function innocent() {
    echo file_get_contents("flag.txt");
    }
}
class entry {
  public function __destruct(){
    $this->awesome->flag();
  }
}

$userin = $_GET['fancy'];
$unser = unserialize($userin);

include("index.php");
?>
