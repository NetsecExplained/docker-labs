<?php 
if(isset($_GET['id'])){
    $qry = $conn->query("SELECT * FROM invoice_list where id = '{$_GET['id']}' ");
    if($qry->num_rows > 0){
        foreach($qry->fetch_array() as $k=>$v){
            $$k= $v;
        }

        $qry_meta = $conn->query("SELECT i.*,s.name,s.description FROM invoice_services i inner join services_list s on i.service_id = s.id where i.invoice_id = '{$id}'");
    }
}
?>
<style>
    .select2-container--default .select2-selection--single{
        border-radius:0;
    }
</style>
<div class="card card-outline card-primary">
    <div class="card-header">
        <h5 class="card-title"><?php echo isset($id) ? "Update Invoice - ".$invoice_code : 'Create New Invoice' ?></h5>
    </div>
    <div class="card-body">
        <div class="container-fluid">
            <form action="" id="invoice-form">
                <input type="hidden" name="id" value="<?php echo isset($id) ? $id : '' ?>">
                <div class="col-md-12">
                    <fieldset class="border-bottom border-info">
                        <div class="row">
                            <div class="form-group col-sm-4">
                                <label for="client_id" class="control-label text-info">Client</label>
                                <select name="client_id" id="client_id" class="custom-select custom-select-sm rounded-0 select2" data-placeholder="Please Select Client Here" required>
                                    <option <?php echo !isset($client_id) ? "selected" : '' ?> disabled></option>
                                    <?php 
                                    $client_qry = $conn->query("SELECT * FROM client_list where `status` = 1 ".(isset($client_id) && $client_id > 0 ? " OR id = '{$client_id}'":"")." order by fullname asc ");
                                    while($row = $client_qry->fetch_assoc()):
                                    ?>
                                    <option value="<?php echo $row['id'] ?>" <?php echo isset($client_id) && $client_id == $row['id'] ? "selected" : '' ?>><?php echo $row['client_code'].' - '.$row['fullname'] ?></option>
                                    <?php endwhile; ?>
                                </select>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset class="border-bottom border-info">
                        <legend>Services</legend>
                        <div class="row align-items-end">
                            <div class="form-group col-sm-4">
                                <label for="service_id" class="control-label text-info">Service</label>
                                <select id="service_id" class="custom-select custom-select-sm rounded-0 select2" data-placeholder="Please Select Service Here">
                                    <option <?php echo !isset($service_id) ? "selected" : '' ?> disabled></option>
                                    <?php 
                                    $service_arr = array();
                                    $service_qry = $conn->query("SELECT * FROM services_list where `status` = 1 order by name asc ");
                                    while($row = $service_qry->fetch_assoc()):
                                        $service_arr[$row['id']] = $row;
                                    ?>
                                    <option value="<?php echo $row['id'] ?>" <?php echo isset($service_id) && $service_id == $row['id'] ? "selected" : '' ?>><?php echo $row['name'] ?></option>
                                    <?php endwhile; ?>
                                </select>
                            </div>
                            <div class="form-group col-sm-4">
                               <button class="btn btn-flat btn-primary btn sm" type="button" id="add_to_list"><i class="fa fa-plus"></i> Add to List</button>
                            </div>
                        </div>
                        <table class="table table-hover table-striped table-bordered" id="service-list">
                            <colgroup>
                                <col width="10%">
                                <col width="30%">
                                <col width="40%">
                                <col width="20%">
                            </colgroup>
                            <thead>
                                <tr class="bg-lightblue text-light">
                                    <th class="px-2 py-2 text-center"></th>
                                    <th class="px-2 py-2 text-center">Service</th>
                                    <th class="px-2 py-2 text-center">Description</th>
                                    <th class="px-2 py-2 text-center">Price</th>
                                </tr>
                            </thead>
                            <tbody>
                            <?php 
                                $total = 0;
                                if(isset($id)):
                                while($row = $qry_meta->fetch_assoc()):
                                    $total += $row['price'];
                            ?>
                                <tr>
                                    <td class="px-1 py-2 text-center align-middle">
                                        <button class="btn-sn btn-flat btn-outline-danger rem_btn" onclick="rem_row($(this))"><i class="fa fa-times"></i></button>
                                    </td>
                                    <td class="px-1 py-2 align-middle service">
                                        <span class="visible"><?php echo $row['name'] ?></span>
                                        <input type="hidden" name="service_id[]" value="<?php echo $row['service_id'] ?>">
                                        <input type="hidden" name="price[]" value="<?php echo $row['price'] ?>">
                                    </td>
                                    <td class="px-1 py-2 align-middle description"><?php echo $row['description'] ?></td>
                                    <td class="px-1 py-2 text-right align-middle price"><?php echo number_format($row['price'],2) ?></td>
                                </tr>
                            <?php endwhile; ?>
                            <?php endif; ?>
                            </tbody>
                            <tfoot>
                                <tr class="bg-lightblue text-light disabled">
                                    <th class="px-2 py-2 text-right" colspan="3">
                                        Sub-total
                                    </th>
                                    <th class="px-2 py-2 text-right sub_total"><?php echo number_format($total,2) ?></th>
                                </tr>
                                <tr class="bg-lightblue text-light disabled">
                                    <th class="px-2 py-2 text-right" colspan="3">
                                        Discount
                                        <input type="number" style="width:50px" name="discount_perc" min="0" max="100"  value="<?php echo isset($discount_perc) ? $discount_perc : 0 ?>">
                                        <input type="hidden" name="discount" value="<?php echo isset($discount) ? $discount : 0 ?>">
                                        %
                                    </th>
                                    <th class="px-2 py-2 text-right discount"><?php echo isset($discount) ? number_format($discount,2) : "0.00" ?></th>
                                </tr>
                                <tr class="bg-lightblue text-light disabled">
                                    <th class="px-2 py-2 text-right" colspan="3">
                                        Tax <small><i>(Inclusive)</i></small>
                                        <input type="number" style="width:50px" name="tax_perc" min="0" max="100"  value="<?php echo isset($tax_perc) ? $tax_perc : 0 ?>">
                                        <input type="hidden" name="tax" value="<?php echo isset($tax) ? $tax : 0 ?>">
                                        %
                                    </th>
                                    <th class="px-2 py-2 text-right tax"><?php echo isset($tax) ? number_format($tax,2) : "0.00" ?></th>
                                </tr>
                                <tr class="bg-lightblue text-light disabled">
                                    <th class="px-2 py-2 text-right" colspan="3">
                                        Grand Total
                                        <input type="hidden" name="total_amount" value="<?php echo isset($total_amount) ? $total_amount : 0 ?>">
                                    </th>
                                    <th class="px-2 py-2 text-right grand_total"><?php echo isset($total_amount) ? number_format($total_amount,2) : "0.00" ?></th>
                                </tr>
                            </tfoot>
                        </table>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="remarks" class="control-label text-info">Remarks</label>
                                <textarea name="remarks" id="remarks" class="form-control rounded-0" rows="3" style="resize:none"><?php echo isset($remarks) ? $remarks : "" ?></textarea>
                            </div>
                            <?php if(isset($status)): ?>
                            <div class="form-group col-md-6">
                                <label for="status" class="control-label text-info">Payment Status</label>
                                <select name="status" id="status" class="custom-select selevt">
                                    <option value="0" <?php echo isset($status) && $status == 0 ? 'selected' : '' ?>>Pending</option>
                                    <option value="1" <?php echo isset($status) && $status == 1 ? 'selected' : '' ?>>Paid</option>
                                </select>
                            </div>
                            <?php endif; ?>
                        </div>
                    </fieldset>
                </div>
            </form>
        </div>
    </div>
    <div class="card-footer text-center">
        <button class="btn btn-flat btn-sn btn-primary" type="submit" form="invoice-form">Save</button>
        <a class="btn btn-flat btn-sn btn-dark" href="<?php echo base_url."admin?page=invoice" ?>">Cancel</a>
    </div>
</div>
<table id="tbl-clone" class="d-none">
    <tr>
        <td class="px-1 py-2 text-center align-middle">
            <button class="btn-sn btn-flat btn-outline-danger rem_btn"><i class="fa fa-times"></i></button>
        </td>
        <td class="px-1 py-2 align-middle service">
            <span class="visible"></span>
            <input type="hidden" name="service_id[]">
            <input type="hidden" name="price[]">
        </td>
        <td class="px-1 py-2 align-middle description"></td>
        <td class="px-1 py-2 text-right align-middle price"></td>
    </tr>
</table>
<script>
    var services = $.parseJSON('<?php echo json_encode($service_arr) ?>');
    $(function(){
		$('.select2').select2({
			width:'resolve'
		})

        $('#invoice-form').submit(function(e){
			e.preventDefault();
            var _this = $(this)
			 $('.err-msg').remove();
             if($('#service-list tbody tr').length <= 0){
                 alert_toast("Please Add at least 1 Service on the List.","warning")
                 return false;
             }
			start_loader();
			$.ajax({
				url:_base_url_+"classes/Master.php?f=save_invoice",
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
						location.href = _base_url_+"admin?page=invoice/view_invoice&id="+resp.id;
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
				}
			})
		})
        $('input[name="discount_perc"],input[name="tax_perc"]').on('input',function(){
            calc()
        })
        $('#add_to_list').click(function(){
            var service_id = $('#service_id').val()
            if(service_id <= 0)
            return false;
            if($('#service-list tbody tr[data-id="'+service_id+'"]').length > 0){
                alert_toast("Service already exists on the list.","warning")
                return false;
            }
            var name = services[service_id].name || 'N/A';
            var description = services[service_id].description || 'N/A';
            var price = services[service_id].price || 'N/A';
            var tr = $('#tbl-clone tr').clone()
            tr.attr('data-id',service_id)
            tr.find('input[name="service_id[]"]').val(service_id)
            tr.find('input[name="price[]"]').val(price)
            tr.find('.service .visible').text(name)
            tr.find('.description').text(description)
            tr.find('.price').text(parseFloat(price).toLocaleString('en-US'))
            $('#service-list tbody').append(tr)
            $('#service_id').val('').trigger('change')
            calc()
            tr.find('.rem_btn').click(function(){
                rem_row($(this))
            })
        })
	})
    function rem_row(_this){
        _this.closest('tr').remove()
        calc()
    }
    function calc(){
        var sub_total = 0;
        var grand_total = 0;
        var discount = 0;
        var tax = 0;


        $('#service-list tbody input[name="price[]"]').each(function(){
            sub_total += parseFloat($(this).val())
        })
        $('.sub_total').text(parseFloat(sub_total).toLocaleString('en-US',{style:'decimal',minimumFractionDigits:2,maximumFractionDigits:2}))
        discount = sub_total * (parseFloat($('input[name="discount_perc"]').val()) / 100)
        $('.discount').text(parseFloat(discount).toLocaleString('en-US',{style:'decimal',minimumFractionDigits:2,maximumFractionDigits:2}))
        $('input[name="discount"]').val(parseFloat(discount))
        tax = sub_total * (parseFloat($('input[name="tax_perc"]').val()) / 100)
        $('.tax').text(parseFloat(tax).toLocaleString('en-US',{style:'decimal',minimumFractionDigits:2,maximumFractionDigits:2}))
        $('input[name="tax"]').val(parseFloat(tax))
        grand_total = sub_total - discount;
        $('.grand_total').text(parseFloat(grand_total).toLocaleString('en-US',{style:'decimal',minimumFractionDigits:2,maximumFractionDigits:2}))
        $('input[name="total_amount"]').val(parseFloat(grand_total))

    }
</script>