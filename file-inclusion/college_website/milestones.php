
<?php 
include 'admin/db_connect.php';
$data = array();
$qry = $conn->query("SELECT * FROM milestones order by unix_timestamp(`datetime`)");
while($row= $qry->fetch_assoc()){
	$data[date("Y",strtotime($row['datetime']))][] = $row;
}
?>
<div class="container pt-4">
	<div class="col-lg-12">
		<div class="card mb-4">
			<div class="card-body">
				<div class="container-fluid">
				<div id="timeline">
					<div class="row timeline-movement timeline-movement-top">
					</div>
					
					<?php foreach($data as $k => $v): ?>
					<div class="row timeline-movement">

					    <div class="timeline-badge">
					        <span class="timeline-balloon-date-year"><?php echo $k ?></span>
					    </div>

					<?php foreach($v as $row): ?>

					    <div class="col-sm-6  timeline-item">
					        <div class="row w-100">
					            <div class="col-sm-11">
					                <div class="timeline-panel credits">
					                    <ul class="timeline-panel-ul">
					                        <li><span class="importo"><?php echo $row['title'] ?></span></li>
					                        <li><span class="causale"><?php echo $row['content'] ?></span> </li>
					                        <li><p><small class="text-muted"><i class="glyphicon glyphicon-time"></i> <?php echo date("M d, Y",strtotime($row['datetime'])) ?></small></p> </li>
					                    </ul>
					                </div>

					            </div>
					        </div>
					    </div>
					<?php endforeach; ?>
					</div>
					<?php endforeach; ?>
				</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$('#new_milestone').click(function(){
		uni_modal('New Entry','manage_milestone.php','mid-large');
	})
</script>