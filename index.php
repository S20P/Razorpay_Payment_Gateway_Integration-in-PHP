<?php
// Include configuration file  
include_once 'config.php';  
  
// Include database connection file  
include_once 'dbConnect.php'; 
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Using Checkout and PHP with Razorpay</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/optimize.css">

  <style>


  </style>
</head>
<body>


<div class="container">
          <div class="row">
    
          <?php   $result = $db->query("SELECT * FROM package");

while($row = $result->fetch_assoc()){
  $days = 0;
if($row['type']=='weekly'){
   $days = 7; 
}
if($row['type']=='monthly'){
  $days = 30; 
}
    ?>
              <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                  <div class="blocks active-block">
                      <div class="block-header">
                          <h4><img width="300px" src="assets/images/service.jpg" alt=""/></h4>
                      </div>
                      <div class="block-container">
                          <p> </span>Name:<?php echo $row['name'];?><br></p>
                          <p> </span><?php echo $row['description'];?></p>
                          <p> </span>Plan : <?php echo $days;?> Days<br></p>
                          <p class="price"><i style="font-size: 25px;"><?php echo $row['currency'];?></i><?php echo $row['amount'];?><sub><small class="renew-price"></small></sub></p>
                      </div>
                      <div class="block-footer">
                          
                          <form action="payment.php" method="POST"> 
 <!-- Identify your business so that you can collect the payments. -->
<input type="hidden" name="type" value="<?php echo $row['type'];?>">
 <!-- Specify details about the item that buyers will purchase. -->
 <input type="hidden" name="name" value="<?php echo $row['name'];?>">
 <input type="hidden" name="description" value="<?php echo $row['description'];?>">
 <input type="hidden" name="amount" value="<?php echo $row['amount'];?>">
 <input type="hidden" name="currency" value="<?php echo $row['currency'];?>">

<!-- Display the payment button. -->
<script
        src="https://checkout.razorpay.com/v1/checkout.js"
        data-key="rzp_test_dFkNprWDfzVPXb" 
        data-amount="<?php echo $row['amount']*100;?>"
        data-currency="<?php echo $row['currency'];?>"
        data-order_id=""
        data-buttontext="Buy Service"
        data-name="Satish p."
        data-description="Test transaction"
        data-image="https://respinor.com/wp-content/uploads/2017/04/logo-dummy.png"
        data-prefill.name="Satish Kumar"
        data-prefill.email="satish6073@gmail.com"
        data-prefill.contact="9999999999"
        data-theme.color="#F37254"
    ></script>
    
    <input  type="hidden" custom="Hidden Element" name="hidden">
</form>
                      </div>
                  </div>
              </div>
              
              <?php
}
?>
          </div>
      </div>

</body>
</html>