<?php
require_once('../config.php');
Class Master extends DBConnection {
	private $settings;
	public function __construct(){
		global $_settings;
		$this->settings = $_settings;
		parent::__construct();
	}
	public function __destruct(){
		parent::__destruct();
	}
	function capture_err(){
		if(!$this->conn->error)
			return false;
		else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
			return json_encode($resp);
			exit;
		}
	}
	function save_service(){
		extract($_POST);
		$data = "";
		foreach($_POST as $k =>$v){
			if(!in_array($k,array('id'))){
				if(!empty($data)) $data .=",";
				$data .= " `{$k}`='{$v}' ";
			}
		}
		$check = $this->conn->query("SELECT * FROM `services_list` where `name` = '{$name}' ".(!empty($id) ? " and id != {$id} " : "")." ")->num_rows;
		if($this->capture_err())
			return $this->capture_err();
		if($check > 0){
			$resp['status'] = 'failed';
			$resp['msg'] = "Service Name already exist.";
			return json_encode($resp);
			exit;
		}
		if(empty($id)){
			$sql = "INSERT INTO `services_list` set {$data} ";
			$save = $this->conn->query($sql);
		}else{
			$sql = "UPDATE `services_list` set {$data} where id = '{$id}' ";
			$save = $this->conn->query($sql);
		}
		if($save){
			$resp['status'] = 'success';
			if(empty($id)){
				$res['msg'] = "New Service successfully saved.";
				$id = $this->conn->insert_id;
			}else{
				$res['msg'] = "Service successfully updated.";
			}
		$this->settings->set_flashdata('success',$res['msg']);
		}else{
			$resp['status'] = 'failed';
			$resp['err'] = $this->conn->error."[{$sql}]";
		}
		return json_encode($resp);
	}
	function delete_service(){
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `services_list` where id = '{$id}'");
		if($del){
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success',"Service successfully deleted.");
		}else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);

	}
	function save_designation(){
		extract($_POST);
		$data = "";
		foreach($_POST as $k =>$v){
			if(!in_array($k,array('id'))){
				$v = $this->conn->real_escape_string($v);
				if(!empty($data)) $data .=",";
				$data .= " `{$k}`='{$v}' ";
			}
		}
		$check = $this->conn->query("SELECT * FROM `designation_list` where `name` = '{$name}' ".(!empty($id) ? " and id != {$id} " : "")." ")->num_rows;
		if($this->capture_err())
			return $this->capture_err();
		if($check > 0){
			$resp['status'] = 'failed';
			$resp['msg'] = "Designation already exists.";
			return json_encode($resp);
			exit;
		}
		if(empty($id)){
			$sql = "INSERT INTO `designation_list` set {$data} ";
			$save = $this->conn->query($sql);
		}else{
			$sql = "UPDATE `designation_list` set {$data} where id = '{$id}' ";
			$save = $this->conn->query($sql);
		}
		if($save){
			$resp['status'] = 'success';
			if(empty($id))
				$this->settings->set_flashdata('success',"New Designation successfully saved.");
			else
				$this->settings->set_flashdata('success',"Designation successfully updated.");
		}else{
			$resp['status'] = 'failed';
			$resp['err'] = $this->conn->error."[{$sql}]";
		}
		return json_encode($resp);
	}
	function delete_designation(){
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `designation_list` where id = '{$id}'");
		if($del){
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success',"Designation  successfully deleted.");
		}else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);

	}
	function save_client(){
		if(empty($_POST['id'])){
			$prefix = date("Y");
			$code = sprintf("%'.04d",1);
			while(true){
				$check_code = $this->conn->query("SELECT * FROM `client_list` where client_code ='".$prefix.$code."' ")->num_rows;
				if($check_code > 0){
					$code = sprintf("%'.04d",$code+1);
				}else{
					break;
				}
			}
			$_POST['client_code'] = $prefix.$code;
			$_POST['password'] = md5($_POST['client_code']);
		}else{
			if(isset($_POST['password'])){
				if(!empty($_POST['password']))
				$_POST['password'] = md5($_POST['password']);
				else
				unset($_POST['password']);
			}
		}
		$_POST['fullname'] = ucwords($_POST['lastname'].', '.$_POST['firstname'].' '.$_POST['middlename']);
		extract($_POST);
		$data = "";
		foreach($_POST as $k =>$v){
			if(in_array($k,array('client_code','fullname','status','password'))){
				if(!is_numeric($v))
				$v= $this->conn->real_escape_string($v);
				if(!empty($data)) $data .=", ";
				$data .=" `{$k}` = '{$v}' ";
			}
		}
		if(empty($id)){
			$sql = "INSERT INTO `client_list` set {$data}";
		}else{
			$sql = "UPDATE `client_list` set {$data} where id = '{$id}'";
		}
		$save = $this->conn->query($sql);
		if($save){
			$resp['status'] = 'success';
			if(empty($id))
			$client_id = $this->conn->insert_id;
			else
			$client_id = $id;
			$resp['id'] = $client_id;
			$data = "";
			foreach($_POST as $k =>$v){
				if(in_array($k,array('id','client_code','fullname','status','password')))
				continue;
				if(!empty($data)) $data .=", ";
				$data .= "('{$client_id}','{$k}','{$v}')";
			}
			if(!empty($data)){
				$this->conn->query("DELETE FROM `client_meta` where client_id = '{$client_id}'");
				$sql2 = "INSERT INTO `client_meta` (`client_id`,`meta_field`,`meta_value`) VALUES {$data}";
				$save = $this->conn->query($sql2);
				if(!$save){
					$resp['status'] = 'failed';
					if(empty($id)){
						$this->conn->query("DELETE FROM `client_list` where id '{$client_id}'");
					}
					$resp['msg'] = 'Saving client Details has failed. Error: '.$this->conn->error;
					$resp['sql'] = 	$sql2;
				}
			}
			if(isset($_FILES['avatar']) && $_FILES['avatar']['tmp_name'] != ''){
				$fname = 'uploads/client-'.$client_id.'.png';
				$dir_path =base_app. $fname;
				$upload = $_FILES['avatar']['tmp_name'];
				$type = mime_content_type($upload);
				$allowed = array('image/png','image/jpeg');
				if(!in_array($type,$allowed)){
					$resp['msg'].=" But Image failed to upload due to invalid file type.";
				}else{
					$new_height = 200; 
					$new_width = 200; 
			
					list($width, $height) = getimagesize($upload);
					$t_image = imagecreatetruecolor($new_width, $new_height);
					imagealphablending( $t_image, false );
					imagesavealpha( $t_image, true );
					$gdImg = ($type == 'image/png')? imagecreatefrompng($upload) : imagecreatefromjpeg($upload);
					imagecopyresampled($t_image, $gdImg, 0, 0, 0, 0, $new_width, $new_height, $width, $height);
					if($gdImg){
							if(is_file($dir_path))
							unlink($dir_path);
							$uploaded_img = imagepng($t_image,$dir_path);
							imagedestroy($gdImg);
							imagedestroy($t_image);
					}else{
					$resp['msg'].=" But Image failed to upload due to unkown reason.";
					}
				}
			}
		}else{
			$resp['status'] = 'failed';
			$resp['msg'] = 'An error occured. Error: '.$this->conn->error;
		}
		if($resp['status'] == 'success'){
			if(empty($id)){
				$this->settings->set_flashdata('success'," New Client successfully added.");
			}else{
				$this->settings->set_flashdata('success'," Client's Details Successfully updated.");
			}
		}

		return json_encode($resp);
	}
	function delete_client(){
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `client_list` where id = '{$id}'");
		if($del){
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success',"cclient Details Successfully deleted.");
			if(is_file(base_app.'uploads/client-'.$id.'.png'))
			unlink(base_app.'uploads/client-'.$id.'.png');
		}else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);

	}
	function save_invoice(){
		if(empty($_POST['id'])){
			$prefix = date("Y");
			$code = sprintf("%'.05d",1);
			while(true){
				$check_code = $this->conn->query("SELECT * FROM `invoice_list` where invoice_code ='".$prefix.$code."' ")->num_rows;
				if($check_code > 0){
					$code = sprintf("%'.05d",$code+1);
				}else{
					break;
				}
			}
			$_POST['invoice_code'] = $prefix.$code;
		}
		extract($_POST);
		$data = "";
		foreach($_POST as $k =>$v){
			if(!in_array($k,array('id')) && !is_array($_POST[$k]) ){
				if(!is_numeric($v))
				$v= $this->conn->real_escape_string($v);
				if(!empty($data)) $data .=", ";
				$data .=" `{$k}` = '{$v}' ";
			}
		}
		if(empty($id)){
			$sql = "INSERT INTO `invoice_list` set {$data}";
		}else{
			$sql = "UPDATE `invoice_list` set {$data} where id = '{$id}'";
		}
		$save = $this->conn->query($sql);
		if($save){
			$resp['status'] = 'success';
			if(empty($id))
			$invoice_id = $this->conn->insert_id;
			else
			$invoice_id = $id;
			$resp['id'] = $invoice_id;
			$data = "";
			foreach($service_id as $k =>$v){
				if(!empty($data)) $data .=", ";
				$data .= "('{$invoice_id}','{$v}','{$price[$k]}')";
			}
			if(!empty($data)){
				$this->conn->query("DELETE FROM `invoice_services` where invoice_id = '{$invoice_id}'");
				$sql2 = "INSERT INTO `invoice_services` (`invoice_id`,`service_id`,`price`) VALUES {$data}";
				$save = $this->conn->query($sql2);
				if(!$save){
					$resp['status'] = 'failed';
					if(empty($id)){
						$this->conn->query("DELETE FROM `invoice_list` where id '{$invoice_id}'");
					}
					$resp['msg'] = 'Saving invoice Details has failed. Error: '.$this->conn->error;
					$resp['sql'] = 	$sql2;
				}
			}
		}else{
			$resp['status'] = 'failed';
			$resp['msg'] = 'An error occured. Error: '.$this->conn->error;
		}
		if($resp['status'] == 'success'){
			if(empty($id)){
				$this->settings->set_flashdata('success'," New Invoice successfully added.");
			}else{
				$this->settings->set_flashdata('success'," Invoice's Details Successfully updated.");
			}
		}

		return json_encode($resp);
	}
	function delete_invoice(){
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `invoice_list` where id = '{$id}'");
		if($del){
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success',"Invoice Details Successfully deleted.");
		}else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);

	}
	function reset_password(){
		extract($_POST);
		$update = $this->conn->query("UPDATE `client_list` set `password` = md5(`client_code`) where id = '{$id}'");
		if($update){
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success',"Client's Password successfully reset.");
		}else{
			$resp['status'] = 'failed';
			$resp['msg'] = "Client's Password has failed to reset.";
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
	function update_client(){
		if(md5($_POST['cur_password']) == $this->settings->userdata('password')){
			$update = $this->save_client();
			if($update){
				$resp = json_decode($update);
				if($resp->status == 'success'){
					$qry = $this->conn->query("SELECT * FROM `client_list` where id = '{$this->settings->userdata('id')}'");
					foreach($qry->fetch_array() as $k => $v){
						$this->settings->set_userdata($k,$v);
					}
					$this->settings->set_flashdata('success',"Your Information and Credentials are successfully Updated.");
					return json_encode(array(
						"status"=>"success"
					));
				}else{
					return json_encode($resp);
				}
			}
		}else{
			return json_encode(array(
				"status"=>"failed",
				"msg"=>"Entered Current Password does not Match"
			));
		}
	}
}

$Master = new Master();
$action = !isset($_GET['f']) ? 'none' : strtolower($_GET['f']);
$sysset = new SystemSettings();
switch ($action) {
	case 'save_service':
		echo $Master->save_service();
	break;
	case 'delete_service':
		echo $Master->delete_service();
	break;
	case 'save_designation':
		echo $Master->save_designation();
	break;
	case 'delete_designation':
		echo $Master->delete_designation();
	break;
	case 'get_designation':
		echo $Master->get_designation();
	break;
	case 'save_client':
		echo $Master->save_client();
	break;
	case 'delete_client':
		echo $Master->delete_client();
	break;
	case 'save_invoice':
		echo $Master->save_invoice();
	break;
	case 'delete_invoice':
		echo $Master->delete_invoice();
	break;
	case 'reset_password':
		echo $Master->reset_password();
	break;
	case 'update_client':
		echo $Master->update_client();
	break;
	default:
		// echo $sysset->index();
		break;
}