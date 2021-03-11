<!-- <?php
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
   
?> -->
<?php

    class database{
        public $dbConn = null;
 public function connect() //เชื่อมต่อฐานข้อมูล
 {
 define("host", "localhost");
 define("username", "user3");
 define("pass", "JTrEAI6RiZcMSpNb");
 define("database", "bookstore");
 $this->dbConn = new mysqli(host, username, pass, database);
 if ($this->dbConn->connect_error) //แสดง error เมอื่ เชมิ่ ต่อไม่ได้
 die("Database Connection Error,Error No.:" .
 $this->dbConn->connect_errno . " | " . $this->dbConn->connect->connect_error);
 $this->dbConn->query("SET NAMES UTF8");
 }


        public function show_information() //แสดงขอ้มลู ท้งัหมดใน table
        {
        $sql = "SELECT * FROM `book`";
        $result = $this->dbConn->query($sql);
        echo "<table border='1'>";
        $counter = 0;
        while ($row = $result->fetch_assoc()) {
        if ($counter == 0) {
        echo "<tr>";
        foreach ($row as $key => $value) {
        echo "<th>{$key}</th>";
        }
        $counter++;
        }
        echo "<tr>";
        foreach ($row as $key => $value) {
        echo "<td>{$value}</td>";
        }
       ;
        echo "</tr>";
        }
        echo "</table>";
        }

        public function insertData($info){
        $insertQuery = "INSERT INTO `book`(`BookName`, `TypeID`, `StatusID`, `Publish`, `UnitPrice`, `UnitRent`) VALUES('{$info['bname']}','{$info['typeid']}' ),'{$info['statusid']}'),'{$info['statusid']}'),'{$info['publish']}'),'{$info['unitprice']}'),'{$info['unitrent']}')";
        echo $insertQuery;
        $rsInsert = $this->dbConn->Query($insertQuery);
        }
        
    }

?>