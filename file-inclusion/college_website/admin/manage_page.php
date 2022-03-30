<?php 
include 'db_connect.php'; 

?>

  <link rel="stylesheet" href="assets/wysiwyg/css/froala_editor.css">
  <link rel="stylesheet" href="assets/wysiwyg/css/froala_style.css">
  <link rel="stylesheet" href="assets/wysiwyg/css/plugins/code_view.css">
  <link rel="stylesheet" href="assets/wysiwyg/css/plugins/draggable.css">
  <link rel="stylesheet" href="assets/wysiwyg/css/plugins/colors.css">
  <link rel="stylesheet" href="assets/wysiwyg/css/plugins/emoticons.css">
  <link rel="stylesheet" href="assets/wysiwyg/css/plugins/image_manager.css">
  <link rel="stylesheet" href="assets/wysiwyg/css/plugins/image.css">
  <link rel="stylesheet" href="assets/wysiwyg/css/plugins/line_breaker.css">
  <link rel="stylesheet" href="assets/wysiwyg/css/plugins/table.css">
  <link rel="stylesheet" href="assets/wysiwyg/css/plugins/char_counter.css">
  <link rel="stylesheet" href="assets/wysiwyg/css/plugins/video.css">
  <link rel="stylesheet" href="assets/wysiwyg/css/plugins/fullscreen.css">
  <link rel="stylesheet" href="assets/wysiwyg/css/plugins/file.css">
  <link rel="stylesheet" href="assets/wysiwyg/css/plugins/quick_insert.css">
  <link rel="stylesheet" href="assets/wysiwyg/css/plugins/help.css">
  <link rel="stylesheet" href="assets/wysiwyg/css/third_party/spell_checker.css">
  <link rel="stylesheet" href="assets/wysiwyg/css/plugins/special_characters.css">
<div class="container-fluid">
	<form action="" id="manage-page">
		<input type="hidden" name="filename" value="<?php echo $_GET['edit'].'.html' ?>">
	<!-- <div class="form-group row">
		<div class="col-md-6">
			<label for="" class="control-label">Page Name</label>
			<input type="text" class="form-control">
		</div>
	</div> -->
	<div class="form-group">
		<textarea  id="page_content" name="page_content" cols="30" rows="10"><?php if(is_file('../'.$_GET['edit'].'.html')) include '../'.$_GET['edit'].'.html'; ?></textarea>
	</div>
	<div class="row">
		<button class="btn btn-primary">Save</button>
	</div>
	</form>
</div>
  <script type="text/javascript" src="assets/wysiwyg/js/froala_editor.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/align.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/char_counter.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/code_beautifier.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/code_view.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/colors.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/draggable.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/emoticons.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/entities.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/file.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/font_size.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/font_family.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/fullscreen.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/image.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/image_manager.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/line_breaker.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/inline_style.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/link.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/lists.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/paragraph_format.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/paragraph_style.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/quick_insert.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/quote.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/table.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/save.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/url.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/video.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/help.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/print.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/third_party/spell_checker.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/special_characters.min.js"></script>
  <script type="text/javascript" src="assets/wysiwyg/js/plugins/word_paste.min.js"></script>

<script>
	(function () {
      const editorInstance = new FroalaEditor('#page_content',{
      	heightMin:'40vh',
      	saveInterval: 5000,
	    saveParam: 'page_content',
	    saveURL: 'ajax.php?action=save_page',
	    saveMethod: 'POST',
	    saveParams: {filename: '<?php echo $_GET['edit'].'.html' ?>'},
	    imageUploadParam: 'img',
	    imageUploadURL: 'ajax.php?action=save_page_img',
	    imageUploadParams: {},
	    imageUploadMethod: 'POST',
	    imageMaxSize: 5 * 1024 * 1024,
	    imageAllowedTypes: ['jpeg', 'jpg', 'png'],
	    events: {
		      'image.beforeUpload': function (images) {
		        start_load()
		      },
		      'image.uploaded': function (response) {
		        end_load()
		      },
		      'image.replaced': function ($img, response) {
		        // Image was replaced in the editor.
		        console.log($img,response)
		      },
		  }
      })
    })()
	$('.select2').select2({
		placeholder:'Please Select Here',
		width:"100%"
	})
	$('.datetimepicker').datetimepicker({
		format:"Y-m-d H:i"
	})
	$('#manage-page').submit(function(e){
		e.preventDefault()
		start_load()
		$('#msg').html('')
		$.ajax({
			url:'ajax.php?action=save_page',
			data: new FormData($(this)[0]),
		    cache: false,
		    contentType: false,
		    processData: false,
		    method: 'POST',
		    type: 'POST',
			success:function(resp){
				if(resp==1){
					alert_toast("Page content successfully saved.",'success')
						setTimeout(function(){
							location.reload()
						},1000)
				}
			}
		})
	})
</script>