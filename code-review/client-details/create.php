<?php
session_start();
include('dbconnection.php');
include("checklogin.php");
check_login();

if(isset($_POST['csubmit']))
{
    $fname=$_POST['fname'];
    $lname=$_POST['lname'];
    $uname=$_POST['uname'];
    $email=$_POST['email'];
    $phone=$_POST['phone'];

    $uimg=$_FILES['uimg']['name']; //storing file name code
    $tempuimg = $_FILES['uimg'] ['tmp_name']; //tempname set

    $plan=$_POST['plan'];
    $pprice=$_POST['pprice'];
    $proofno=$_POST['proofno'];

    $proof1=$_FILES['proof1']['name']; //storing file name code
    $tempproof1 = $_FILES['proof1'] ['tmp_name']; //tempname set

    $proof2=$_FILES['proof2']['name']; //storing file name code
    $tempproof2 = $_FILES['proof2'] ['tmp_name']; //tempname set

    $caddress=$_POST['caddress'];
    $haddress=$_POST['haddress'];
    $rdate=$_POST['rdate'];
    $bdate=$_POST['bdate'];
    $multiLine=$_POST['multiLine'];
    $depatment=$_POST['depatment'];

    move_uploaded_file($tempuimg,"img/$uimg");  //image upload direction and store path
    move_uploaded_file($tempproof1,"imgproof1/$proof1");  //image upload direction and store path
    move_uploaded_file($tempproof2,"imgproof2/$proof2");  //image upload direction and store path

    $msg=mysqli_query($con,"INSERT INTO `cdetails`(`fname`, `lname`, `uname`, `email`, `phone`, `uimg`, `plan`, `pprice`, `proofno`, `proof1`, `proof2`, `caddress`, `haddress`, `rdate`, `bdate`, `multiLine`, `depatment`) values('$fname','$lname','$uname','$email','$phone','$uimg','$plan','$pprice','$proofno','$proof1','$proof2','$caddress','$haddress','$rdate','$bdate','$multiLine','$depatment')");
$_SESSION['msg']="Client Details Upload successfully";
}
if(isset($_POST['csubmit']))
{
    echo "Insert data successfully";
    header("Location: welcome.php");
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

    <title>Client Details </title>
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
                  <li><a class="logout" href="#"><?php echo $_SESSION['name'];?></a></li>
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
                      <a href="Welcome.php" >
                          <i class="fa fa-users"></i>
                          <span>Manage Clients</span>
                      </a>
                   
                  </li>

                  <li class="sub-menu">
                      <a href="create.php" >
                          <i class="fa fa-users"></i>
                          <span>Create Client</span>
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
        

        <section id="main-content">
          <section class="wrapper">
            <h3><i class="fa fa-angle-right"></i>Customer Details</h3>
                
                <div class="row">
                
                  
                      
                  <div class="col-md-12">
                      <div class="content-panel">
                      <p align="center" style="color:#F00;"><?php echo $_SESSION['msg']=""; ?></p>
                           
                            <form class="form-horizontal style-form" name="registration" method="post" action="" enctype="multipart/form-data">


                        <!--Start First name -->
                        <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">First Name </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" value=""  name="fname" required >
                            </div>
                        </div>
                        <!--End First name -->  


                        <!--Start Last name -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">Last Name </label>
                                <div class="col-sm-10">
                                <input type="text" class="form-control" value="" name="lname"  required >
                            </div>
                        </div>
                        <!--End Last name -->

                        <!--Start username name -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">Username </label>
                                <div class="col-sm-10">
                                <input type="text" class="form-control" value="" name="uname"  required >
                            </div>
                        </div>
                        <!--End username name -->   
                                
                        <!--Start Email name -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">Email Address </label>
                                <div class="col-sm-10">
                                <input type="text" class="form-control" value="" name="email" required >
                            </div>
                        </div>
                        <!--End Email name -->

                        <!--Start Phone name -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">Phone No </label>
                                <div class="col-sm-10">
                                <input type="text" class="form-control" value="" name="phone" required >
                            </div>
                        </div>
                        <!--End Phone name -->

                        <!--Start image name -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">User Image </label>
                                <div class="col-sm-10">
                            <input type="file" class="form-control" accept="image/*" value="" name="uimg" required >
                            </div>
                        </div>
                        <!--End image name -->

                        <!--Start Plan name -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">Plan Name </label>
                                <div class="col-sm-10">
                                <input type="text" class="form-control" value="" name="plan" required >
                            </div>
                        </div>
                        <!--End plan name -->

                        <!--Start Plan Price -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">Plan Price </label>
                                <div class="col-sm-10">
                                <input type="text" class="form-control" value="" name="pprice" required >
                            </div>
                        </div>
                        <!--End plan Price -->

                        <!--Start Proof No -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">ID Proof No </label>
                                <div class="col-sm-10">
                                <input type="text" class="form-control" value="" name="proofno" required >
                            </div>
                        </div>
                        <!--End proof NO --> 

                        <!--Start Proof 1 -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">ID Proof 1 </label>
                                <div class="col-sm-10">
                                <input type="file" class="form-control" value="" name="proof1" multiple="multiple"/ required >
                            </div>
                        </div>
                        <!--End proof 1 --> 

                        <!--Start Proof 2 -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">ID Proof 2 </label>
                                <div class="col-sm-10">
                                <input type="file" class="form-control" value="" name="proof2" multiple="multiple"/ required >
                            </div>
                        </div>
                        <!--End proof 2 -->

                        <!--Start Company Address -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">Company Address </label>
                                <div class="col-sm-10">
                                <input type="text" class="form-control" value="" name="caddress" required >
                            </div>
                        </div>
                        <!--End Company Address -->

                        <!--Start Home Address -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">Home Address </label>
                                <div class="col-sm-10">
                                <input type="text" class="form-control" value="" name="haddress" required >
                            </div>
                        </div>
                        <!--End Home Address -->

                        <!--Start Regester date -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">Regester Date </label>
                                <div class="col-sm-10">
                                <input type="date" class="form-control" value="" name="rdate" required >
                            </div>
                        </div>
                        <!--End Regester date -->    

                        <!--Start Billing date -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">Billing Date </label>
                                <div class="col-sm-10">
                                <input type="date" class="form-control" value="" name="bdate" required >
                            </div>
                        </div>
                        <!--End Billing date -->

                        <!--Start Additionl information -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">Additional Information </label>
                                <div class="col-sm-10">
                                <textarea class="form-control" name="multiLine" required ></textarea>    
                            </div>
                        </div>
                        <!--End Additionl information -->
                                
                        <!--Start Departmeent -->
                        <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" style="padding-left:40px;">Department name </label>
                                <div class="col-sm-10">
                                <select class="form-control" name="depatment">
                                    <option>A</option>
                                    <option>B</option>
                                    <option>C</option>
                                    <option>D</option>
                                </select>   
                            </div>
                        </div>
                        <!--End Department -->
                                 

                        
                        <!--Start Submit button-->   
                        <div class="sign-up" style="margin-left:100px;">
                                <input type="reset" class="btn btn-theme" value="Reset">
                                <input type="submit" class="btn btn-theme" name="csubmit"  value="Submit" >
                                <div class="clear"> </div>
                        </div>
                            </form>
                        <!--End Submit button-->       
                      
                  </div>
              </div>
        </section>
      </section>
      


        </div>

        <br><br>


    
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
