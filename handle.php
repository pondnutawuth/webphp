<?php
include_once("connect.php");
$mycon = new Database();
$mycon->connect();
if (isset($_POST['insert_username'])) { //เพิ่มขอ้ มูล เอาข้อมูลเก็บใน array data
 $data['username'] = $_POST['insert_username'];
 $data['password'] = $_POST['insert_password'];
 $data['role'] = $_POST['insert_role'];
 $mycon->insertData($data); //ส่งตัวแปร data ไป
 header("location: index.php"); //กลับหน้าแรก
} else if (isset($_REQUEST['delete_id'])) { //ลบ
 $mycon->deleteId($_REQUEST['delete_id']);
 header("location: index.php"); //กลับหน้าแรก
} else if (isset($_POST['update_id'])) { //แก้ไขข้อมูล
 $data['id'] = $_POST['update_id'];
 $data['username'] = $_POST['edit_username'];
 $data['password'] = $_POST['edit_password'];
 $data['role'] = $_POST['edit_role'];
 $mycon->update_data_all($data);
 header("location: index.php"); //กลับหน้าแรก
} else if (isset($_POST['log_user'])) { //เข้าสู่ระบบ
 $result = $mycon->varify_user($_POST['log_user'], $_POST['log_pass']);
 session_start();
 if ($result['n'] == 1) {
 if ($result['role'] == 'user') {
 $_SESSION['id'] = $result['id'];
 $_SESSION['name'] = $result['username'];
 $_SESSION['type'] = $result['role'];
 header("location: home.php");
 } else {
 $_SESSION['id'] = $result['id'];
 $_SESSION['name'] = $result['username'];
 $_SESSION['type'] = $result['role'];
 header("location: index.php");
 }
 } else {
 echo "รหัสผ่านไม่ถูกต้อง";
 }
}
