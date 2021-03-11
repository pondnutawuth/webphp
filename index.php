<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>Document</title>
</head>
<body>
 <h1>BOOK</h1>
 <a href="insert.php">เพิ่มข้อมูล</a>
 <form action="formEdit.php" method="post">
 <?php
 include_once "connect.php";
 $myconn = new Database();
 $myconn->connect();
 ?>
 <?php
 $myconn->show_information();
 ?>
 </form>
</body>
</html>