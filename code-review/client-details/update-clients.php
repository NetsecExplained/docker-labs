<?php
session_start();
include'dbconnection.php';
include("checklogin.php");
check_login();
if(isset($_POST['submit']))
{
    $fname=$_POST['fname'];
    $lname=$_POST['lname'];
    $uname=$_POST['uname'];
    $email=$_POST['email'];
    $phone=$_POST['phone'];
    $plan=$_POST['plan'];
    $pprice=$_POST['pprice'];
    $proofno=$_POST['proofno'];
    $caddress=$_POST['caddress'];
    $haddress=$_POST['haddress'];
    $rdate=$_POST['rdate'];
    $bdate=$_POST['bdate'];
    $multiLine=$_POST['multiLine'];
    $depatment=$_POST['depatment'];

    $msg=mysqli_query($con,"UPDATE `cdetails` SET `fname`='fname',`lname`='$lname',`uname`='$uname',`email`='$email,`phone`='$phone',`plan`='$plan',`pprice`='$pprice',`proofno`='$proofno',``caddress`='$caddress',`haddress`='$haddress',`rdate`='$rdate',`bdate`='$bdate',`multiLine`='$multiLine',`depatment`='$depatment' where ID='".$_GET['uid']."'");
	
$_SESSION['msg']="Profile Updated successfully";
}
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Admin | Update Profile</title>
    <link href="admin/assets/css/bootstrap.css" rel="stylesheet">
    <link href="admin/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="admin/assets/css/style.css" rel="stylesheet">
    <link href="admin/assets/css/style-responsive.css" rel="stylesheet">
  </head>

  <body>

  <section id="container" >
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <a href="#" class="logo"><b>Admin Dashboard</b></a>
            <div class="nav notify-row" id="top_menu">
               
                         
                   
                </ul>
            </div>
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li><a class="logout" href="logout.php">Logout</a></li>
            	</ul>
            </div>
        </header>
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><a href="#"><img src="admin/assets/img/ui-sam.jpg" class="img-circle" width="60"></a></p>
              	  <h5 class="centered"><?php echo $_SESSION['login'];?></h5>
              	  	
                  <li class="mt">
                      <a href="welcome.php" >
                          <i class="fa fa-users"></i>
                          <span>Manage Users</span>
                      </a>
                   
                  </li>

                  <li class="sub-menu">
                      <a href="create.php" >
                          <i class="fa fa-users"></i>
                          <span>Create users</span>
                      </a>
                   
                  </li>

                  <!--<li class="sub-menu">
                      <a href="clientview.php" >
                          <i class="fa fa-users"></i>
                          <span>Client Details</span>
                      </a>
                   
                  </li>

                  <li class="sub-menu">
                      <a href="change-password.php">
                          <i class="fa fa-file"></i>
                          <span>Change Password</span>
                      </a>
                  </li>-->
                 
              </ul>
          </div>
      </aside>
      <?php $ret=mysqli_query($con,"SELECT * FROM `cdetails` WHERE ID='".$_GET['uid']."'");
	  while($row=mysqli_fetch_array($ret))
	  
	  {?>
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> <?php echo $row['fname'];?>'s Information</h3>
             	
				<div class="row">
				
                  
	                  
                  <div class="col-md-12">
                      <div class="content-panel">
                      <p align="center" style="color:#F00;"><?php echo $_SESSION['msg'];?><?php echo $_SESSION['msg']=""; ?></p>
                           <form class="form-horizontal style-form" name="form1" method="post" action="" onSubmit="return valid();">
                           <p style="color:#F00"><?php echo $_SESSION['msg'];?><?php echo $_SESSION['msg']="";?></p>
                           <!--Start first name-->
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">First Name </label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="fname" value="<?php echo $row['fname'];?>" >
                              </div>
                          </div>
                          <!--End First Name-->
                          
                          <!--Start last name-->    
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">Last Ename</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="lname" value="<?php echo $row['lname'];?>" >
                              </div>
                          </div>
                          <!--End last name-->
                          
                          <!--Start username name -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">Username </label>
                                <div class="col-sm-10">
                                <input type="text" class="form-control" name="uname" value="<?php echo $row['uname'];?>" >
                            </div>
                        </div>
                        <!--End username name -->   
                                
                        <!--Start Email name -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">Email Address </label>
                                <div class="col-sm-10">
                                <input type="text" class="form-control" name="email" value="<?php echo $row['email'];?>" >
                            </div>
                        </div>
                        <!--End Email name -->

                        <!--Start Phone name -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">Phone No </label>
                                <div class="col-sm-10">
                                <input type="text" class="form-control" name="phone" value="<?php echo $row['phone'];?>" >
                            </div>
                        </div>
                        <!--End Phone name -->


                        <!--Start Plan name -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">Plan Name </label>
                                <div class="col-sm-10">
                                <input type="text" class="form-control" name="plan" value="<?php echo $row['plan'];?>" >
                            </div>
                        </div>
                        <!--End plan name -->

                        <!--Start Plan Price -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">Plan Price </label>
                                <div class="col-sm-10">
                                <input type="text" class="form-control" name="pprice" value="<?php echo $row['pprice'];?>" >
                            </div>
                        </div>
                        <!--End plan Price -->

                        <!--Start Proof No -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">ID Proof No </label>
                                <div class="col-sm-10">
                                <input type="text" class="form-control" name="proofno" value="<?php echo $row['proofno'];?>" >
                            </div>
                        </div>
                        <!--End proof NO --> 

                        <!--Start Company Address -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">Company Address </label>
                                <div class="col-sm-10">
                                <input type="text" class="form-control" name="caddress" value="<?php echo $row['caddress'];?>">
                            </div>
                        </div>
                        <!--End Company Address -->

                        <!--Start Home Address -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">Home Address </label>
                                <div class="col-sm-10">
                                <input type="text" class="form-control" name="haddress" value="<?php echo $row['haddress'];?>" >
                            </div>
                        </div>
                        <!--End Home Address -->

                        <!--Start Regester date -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">Regester Date </label>
                                <div class="col-sm-10">
                                <input type="date" class="form-control" name="rdate" value="<?php echo $row['rdate'];?>" >
                            </div>
                        </div>
                        <!--End Regester date -->    

                        <!--Start Billing date -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">Billing Date </label>
                                <div class="col-sm-10">
                                <input type="date" class="form-control" name="bdate" value="<?php echo $row['bdate'];?>">
                            </div>
                        </div>
                        <!--End Billing date -->

                        <!--Start Additionl information -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">Additional Information </label>
                                <div class="col-sm-10">
                                <textarea class="form-control" name="multiLine" value="<?php echo $row['multiLine'];?>" ></textarea>    
                            </div>
                        </div>
                        <!--End Additionl information -->
                                
                        <!--Start Departmeent -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">Department name </label>
                                <div class="col-sm-10">
                                <select class="form-control" name="depatment" value="<?php echo $row['depatment'];?>">
                                    <option>A</option>
                                    <option>B</option>
                                    <option>C</option>
                                    <option>D</option>
                                </select>   
                            </div>
                        </div>
                        <!--End Department -->



                          <div style="margin-left:100px;">
                          <input type="submit" name="submit" value="Update" class="btn btn-theme"></div>
                          </form>
                      </div>
                  </div>
              </div>
		</section>
        <?php } ?>
      </section></section>
    <script src="admin/assets/js/jquery.js"></script>
    <script src="admin/assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="admin/assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="admin/assets/js/jquery.scrollTo.min.js"></script>
    <script src="admin/assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="admin/assets/js/common-scripts.js"></script>
  <script>
      $(function(){
          $('select.styled').customSelect();
      });

  </script>

  </body>
</html>
