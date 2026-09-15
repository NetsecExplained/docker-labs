<?php 
if(isset($_GET['id'])){
    $qry = $conn->query("SELECT * FROM client_list where id = '{$_GET['id']}' ");
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
    
}
?>
<div class="card card-outline card-primary">
    <div class="card-header">
        <h5 class="card-title">Client Details</h5>
    </div>
    <div class="card-body">
        <div class="container-fluid" id="print_out">
            <style>
                img#cimg{
                    height: 20vh;
                    width: 20vh;
                    object-fit: scale-down;
                    object-position: center center;
                }
            </style>
            <h3 class="text-info">Client: <b><?php echo isset($client_code) ? $client_code :'' ?></b></h3>
                <div class="row">
                    <div class="col-md-4">
                        <img src="<?php echo validate_image(isset($id) ? "uploads/client-".$id.".png" :'')."?v=".(isset($date_updated) ? strtotime($date_updated) : "") ?>" alt="client Image" class="img-fluid bg-dark-gradient" id="cimg">
                    </div>
                </div>
            <div class="row">
                <div class="col-md-6">
                    <dl>
                        <dt class="text-info">Name:</dt>
                        <dd class="fw-bold pl-3"><?php echo isset($fullname) ? $fullname : "" ?></dd>
                        <dt class="text-info">Gender:</dt>
                        <dd class="fw-bold pl-3"><?php echo isset($gender) ? $gender : "" ?></dd>
                        <dt class="text-info">Date of Birth:</dt>
                        <dd class="fw-bold pl-3"><?php echo isset($dob) ? date("F d, Y",strtotime($dob)) : "" ?></dd>
                    </dl>
                </div>
                <div class="col-md-6">
                    <dl>
                        <dt class="text-info">Email:</dt>
                        <dd class="fw-bold pl-3"><?php echo isset($email) ? $email : "" ?></dd>
                        <dt class="text-info">Contact #:</dt>
                        <dd class="fw-bold pl-3"><?php echo isset($contact) ? $contact : "" ?></dd>
                        <dt class="text-info">Address:</dt>
                        <dd class="fw-bold pl-3"><?php echo isset($address) ? $address : "" ?></dd>
                        <dt class="text-info">Status:</dt>
                        <dd class="pl-3">
                            <?php if($status == 1): ?>
                                <span class="badge badge-success rounded-pill">Active</span>
                            <?php else: ?>
                                <span class="badge badge-danger rounded-pill">Inactive</span>
                            <?php endif; ?>
                        </dd>
                    </dl>
                </div>
            </div>
        </div>
    </div>
    <div class="card-footer text-center">
            <button class="btn btn-flat btn-sn btn-success" type="button" id="print"><i class="fa fa-print"></i> Print</button>
            <button class="btn btn-flat btn-sn btn-primary bg-lightblue" id="reset_password" type="button"><i class="fa fa-key"></i> Reset Password</button>
            <a class="btn btn-flat btn-sn btn-primary" href="<?php echo base_url."admin?page=client/manage_client&id=".$id ?>"><i class="fa fa-edit"></i> Edit</a>
            <a class="btn btn-flat btn-sn btn-dark" href="<?php echo base_url."admin?page=client" ?>">Back to List</a>
    </div>
</div>
<script>
    $(function(){
        $('#reset_password').click(function(){
            _conf("Are you sure to reset the password of <b>Client - <?php echo $client_code ?></b>?",'reset_password')
        })
        $('#print').click(function(){
            start_loader()
            var _el = $('<div>')
            var _head = $('head').clone()
                _head.find('title').text("Client Details - Print View")
                _head.append($('#libraries').clone())
            var p = $('#print_out').clone()
            p.find('tr.text-light').removeClass("text-light bg-navy")
            _el.append(_head)
            _el.append('<div class="d-flex justify-content-center">'+
                      '<div class="col-1 text-right">'+
                      '<img src="<?php echo validate_image($_settings->info('logo')) ?>" width="65px" height="65px" />'+
                      '</div>'+
                      '<div class="col-10">'+
                      '<h4 class="text-center"><?php echo $_settings->info('name') ?></h4>'+
                      '<h4 class="text-center">Client Details</h4>'+
                      '</div>'+
                      '<div class="col-1 text-right">'+
                      '</div>'+
                      '</div><hr/>')
            _el.append(p.html())
            var nw = window.open("","","width=1200,height=900,left=250,location=no,titlebar=yes")
                     nw.document.write(_el.html())
                     nw.document.close()
                     setTimeout(() => {
                         nw.print()
                         setTimeout(() => {
                            nw.close()
                            end_loader()
                         }, 200);
                     }, 500);
        })
    })
    function reset_password(){
        start_loader()
        $.ajax({
            url:_base_url_+"classes/Master.php?f=reset_password",
            method:'POST',
            data:{id:"<?php echo $id ?>"},
            dataType:'json',
            error:err=>{
                console.log(err)
                alert_toast("An error occured",'error')
                end_loader()
            },
            success:function(resp){
                if(resp.status == 'success'){
                    location.reload()
                }else{
                    alert_toast(res.msg,'error')
                }
                end_loader()
            }
        })
    }
</script>