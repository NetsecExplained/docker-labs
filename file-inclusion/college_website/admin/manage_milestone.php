<?php 
include 'db_connect.php'; 
if(isset($_GET['id'])){
$qry = $conn->query("SELECT * FROM milsetones where id= ".$_GET['id']);
foreach($qry->fetch_array() as $k => $val){
	$$k=$val;
}
}
?>
<div class="container-fluid">
	<form action="" id="manage-milestone">
		<input type="hidden" name="id" value="<?php echo isset($id) ? $id : '' ?>">
		<div id="msg"></div>
		<div class="form-group">
	        <label for="" class="control-label">Title</label>
			<input type="text" class="form-control" name="title"  value="<?php echo isset($title) ? $title :'' ?>" required>
			
		</div>
		<div class="form-group">
			<label for="" class="control-label">Content</label>
			<textarea class="form-control" name="content" cols="30" rows="5"><?php echo isset($content) ? $content :'' ?></textarea>
		</div>
		<div class="form-group">
			<label for="" class="control-label">Date</label>
			<input type="date" class="form-control" name="datetime"  value="<?php echo isset($datetime) ? date('Y-m-d',strtotime($datetime)) :'' ?>" required>
		</div>
	</form>
</div>
<script>
	$('.select2').select2({
		placeholder:'Please select here.',
		width:'100%'
	})

	$('#manage-milestone').submit(function(e){
		e.preventDefault()
		start_load()
		$('#msg').html('')
		$.ajax({
			url:'ajax.php?action=save_milestone',
			data: new FormData($(this)[0]),
		    cache: false,
		    contentType: false,
		    processData: false,
		    method: 'POST',
		    type: 'POST',
			success:function(resp){
				if(resp==1){
					alert_toast("Data successfully saved.",'success')
						setTimeout(function(){
							location.reload()
						},1000)
				}
			}
		})
	})
</script>