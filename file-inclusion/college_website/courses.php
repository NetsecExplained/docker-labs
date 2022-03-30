<?php 
include 'admin/db_connect.php';
$courses = $conn->query("SELECT * FROM courses order by name asc");
?>
<div class="container pt-4">
	<div style="clear: both"></div>
	<div class="col-lg-12">
		<div class="card mb-4">
			<div class="card-body">
				<ul class="list-group">
					<?php while($row= $courses->fetch_assoc()): ?>
						<li class="list-group-item"><h4><b><a href="index.php?page=view_course&f=<?php echo $row['filename'] ?>&id=<?php echo $row['id'] ?>"><?php echo ucwords($row['name']) ?></a></b></h4></li>
					<?php endwhile; ?>
				</ul>
			</div>
		</div>
	</div>
</div>