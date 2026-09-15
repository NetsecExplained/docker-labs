<?php 
    $qry = $conn->query("SELECT * FROM client_list where id = '{$_settings->userdata('id')}' ");
    if($qry->num_rows > 0){
        foreach($qry->fetch_array() as $k=>$v){
            $$k= $v;
        }

        $qry_meta = $conn->query("SELECT * FROM client_meta where client_id = '{$id}'");
        while($row = $qry_meta->fetch_assoc()){
            if(!isset(${$row['meta_field']}))
            ${$row['meta_field']} = $row['meta_value'];
        }
    }
?>
<style>
	img#cimg{
		height: 15vh;
		width: 15vh;
		object-fit: scale-down;
		object-position: center center;
		border-radius: 100% 100%;
	}
    .select2-container--default .select2-selection--single{
        border-radius:0;
    }
</style>
<div class="card card-outline card-primary">
    <div class="card-header">
        <h5 class="card-title">Update Information and Credentials</h5>
    </div>
    <div class="card-body">
        <div class="container-fluid">
            <form action="" id="client-form">
                <input type="hidden" name="id" value="<?php echo isset($id) ? $id : '' ?>">
                <div class="col-md-12">
                    <fieldset class="border-bottom border-info">
                        <legend class="text-info">Personal Information</legend>
                        <div class="row">
                            <div class="form-group col-sm-4">
                                <label for="lastname" class="control-label text-info">Last Name</label>
                                <input type="text" class="form-control form-control-sm rounded-0" id="lastname" name="lastname" value="<?php echo isset($lastname) ? $lastname : '' ?>" required>
                            </div>
                            <div class="form-group col-sm-4">
                                <label for="firstname" class="control-label text-info">First Name</label>
                                <input type="text" class="form-control form-control-sm rounded-0" id="firstname" name="firstname" value="<?php echo isset($firstname) ? $firstname : '' ?>" required>
                            </div>
                            <div class="form-group col-sm-4">
                                <label for="middlename" class="control-label text-info">Middle Name</label>
                                <input type="text" class="form-control form-control-sm rounded-0" id="middlename" name="middlename" value="<?php echo isset($middlename) ? $middlename : '' ?>" placeholder="optional">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-sm-4">
                                <label for="gender" class="control-label text-info">Gender</label>
                                <select name="gender" id="gender" class="custom-select custom-select-sm rounded-0" required>
                                    <option <?php echo isset($gender) && $gender == 'Male' ? "selected" : '' ?>>Male</option>
                                    <option <?php echo isset($gender) && $gender == 'Female' ? "selected" : '' ?>>Female</option>
                                </select>
                            </div>
                            <div class="form-group col-sm-4">
                                <label for="dob" class="control-label text-info">Date of Birth</label>
                                <input type="date" class="form-control form-control-sm rounded-0" id="dob" name="dob" value="<?php echo isset($dob) ? $dob : '' ?>" required>
                            </div>
                            <div class="form-group col-sm-4">
                                <label for="contact" class="control-label text-info">Contact #</label>
                                <input type="text" class="form-control form-control-sm rounded-0" id="contact" name="contact" value="<?php echo isset($contact) ? $contact : '' ?>" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-sm-12">
                                <label for="address" class="control-label text-info">Address</label>
                                <textarea type="text" class="form-control form-control-sm rounded-0" id="address" name="address" required placeholder="Street, Apartment Unit #/Building, City, State/Province, ZIP Code"><?php echo isset($address) ? $address : '' ?></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-sm-4">
                                <label for="email" class="control-label text-info">Email</label>
                                <input type="email" class="form-control form-control-sm rounded-0" id="email" name="email" value="<?php echo isset($email) ? $email : '' ?>" required>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset class="border-bottom border-info">
                        <legend class="text-info">Update Image</legend>
                        <div class="row">
                            <div class="form-group col-sm-4">
                                <div class="custom-file rounded-0">
                                    <input type="file" class="custom-file-input rounded-0" id="avatar" name="avatar" onchange="displayImg(this,$(this))">
                                    <label class="custom-file-label rounded-0" for="avatar">Choose file</label>
                                </div>
                            </div>
                            <div class="form-group col-sm-4 text-center">
                                <img src="<?php echo validate_image(isset($id) ? "uploads/client-".$id.".png" :'')."?v=".(isset($date_updated) ? strtotime($date_updated) : "") ?>" alt="" id="cimg" class="img-fluid img-thumbnail">
                            </div>
                        </div>
                    </fieldset>
                    <fieldset class="border-bottom border-info">
                        <legend class="text-info">Update Password</legend>
                        <div class="row">
                            <div class="form-group col-sm-4">
                                    <label for="password" class="control-label text-info">New Password</label>
                                    <input type="password" class="form-control form-control-sm rounded-0" id="password" name="password">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-sm-4">
                                <label for="cpassword" class="control-label text-info">Confirm New Password</label>
                                <input type="password" class="form-control form-control-sm rounded-0" id="cpassword" name="cpassword">
                            </div>
                        </div>
                        <small class="text-info"><i>Leave the above fields blank if you don't want to update your password.</i></small>
                    </fieldset>
                    <fieldset class="border-bottom border-info">
                        <legend class="text-info">Confirm User</legend>
                        <div class="row">
                            <div class="form-group col-sm-4">
                                    <label for="cur_password" class="control-label text-info">Enter Current Password</label>
                                    <input type="password" class="form-control form-control-sm rounded-0" id="cur_password" name="cur_password" required>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </form>
        </div>
    </div>
    <div class="card-footer text-center">
        <button class="btn btn-flat btn-sn btn-primary" type="submit" form="client-form">Update</button>
        <a class="btn btn-flat btn-sn btn-dark" href="<?php echo base_url ?>">Cancel</a>
    </div>
</div>
<script>
    $(function(){
		$('.select2').select2({
			width:'resolve'
		})

        $('#client-form').submit(function(e){
			e.preventDefault();
            var _this = $(this)
            $('#cpassword,#password').removeClass('boder-danger')
			 $('.err-msg').remove();
             if($('#password').val() != $('#cpassword').val()){
                 $('#cpassword').after("<span class='text-danger err-msg'>Password does not match.</span>")
                 $('#cpassword,#password').addClass('boder-danger')
                 return false;
             }
			start_loader();
			$.ajax({
				url:_base_url_+"classes/Master.php?f=update_client",
				data: new FormData($(this)[0]),
                cache: false,
                contentType: false,
                processData: false,
                method: 'POST',
                type: 'POST',
                dataType: 'json',
				error:err=>{
					console.log(err)
					alert_toast("An error occured",'error');
					end_loader();
				},
				success:function(resp){
					if(typeof resp =='object' && resp.status == 'success'){
						location.reload()
					}else if(resp.status == 'failed' && !!resp.msg){
                        var el = $('<div>')
                            el.addClass("alert alert-danger err-msg").text(resp.msg)
                            _this.prepend(el)
                            el.show('slow')
                            end_loader()
                    }else{
						alert_toast("An error occured",'error');
						end_loader();
                        console.log(resp)
					}
                    $('html,body').animate({scrollTop:0},'fast');
				}
			})
		})
	})
	function displayImg(input,_this) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	        	$('#cimg').attr('src', e.target.result);
                _this.siblings('label').text(input.files[0].name)
	        }
	        reader.readAsDataURL(input.files[0]);
	    }else{
            $('#cimg').attr('src', "<?php echo validate_image('no-image-available.png') ?>");
            _this.siblings('label').text('Choose file')
        }
	}
</script>