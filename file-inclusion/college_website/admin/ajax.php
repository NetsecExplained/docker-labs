<?php
ob_start();
$action = $_GET['action'];
include 'admin_class.php';
$crud = new Action();
if($action == 'login'){
	$login = $crud->login();
	if($login)
		echo $login;
}
if($action == 'login2'){
	$login = $crud->login2();
	if($login)
		echo $login;
}
if($action == 'logout'){
	$logout = $crud->logout();
	if($logout)
		echo $logout;
}
if($action == 'logout2'){
	$logout = $crud->logout2();
	if($logout)
		echo $logout;
}
if($action == 'save_user'){
	$save = $crud->save_user();
	if($save)
		echo $save;
}
if($action == 'delete_user'){
	$save = $crud->delete_user();
	if($save)
		echo $save;
}
if($action == 'signup'){
	$save = $crud->signup();
	if($save)
		echo $save;
}
if($action == 'update_account'){
	$save = $crud->update_account();
	if($save)
		echo $save;
}
if($action == "save_settings"){
	$save = $crud->save_settings();
	if($save)
		echo $save;
}
if($action == "save_page"){
	$save = $crud->save_page();
	if($save)
		echo $save;
}

if($action == "save_page_img"){
	$save = $crud->save_page_img();
	if($save)
		echo $save;
}
if($action == "save_carousel"){
	$save = $crud->save_carousel();
	if($save)
		echo $save;
}
if($action == "save_milestone"){
	$save = $crud->save_milestone();
	if($save)
		echo $save;
}
if($action == 'save_course'){
	$save = $crud->save_course();
	if($save)
		echo $save;
}
ob_end_flush();
?>
