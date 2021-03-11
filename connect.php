<?php
    define("hostname","localhost");
    define("user","user3");
    define("password","JTrEAI6RiZcMSpNb");
    define("dbname","bookstore");
?>
<?php
    $conn=new mysqli(hostname,user,password,dbname);
    $conn->query("SELECT * FROM bookstore WHERE 1");
    if($conn->connect_error) echo "not connect";
    else echo "Connect success";
   
?>