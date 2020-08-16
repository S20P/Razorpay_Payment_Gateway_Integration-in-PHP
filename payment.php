<?php 

/*
* @Author: Satish p.
* @ purpose: Using Checkout and PHP with Razorpay
*/

// Include configuration file 
include_once 'config.php'; 
 
// Include database connection file 
include_once 'dbConnect.php'; 

$api_key = API_KEY;  //Key Id : rzp_test_dFkNprWDfzVPXb
$api_secret = SECRET_KEY;   //Key Secret : g6ST5SCGLSgQSpp0LDbd7qmd
 // Include Razorpay PHP library 
 require_once('vendor/autoload.php');

// require_once('vendor/razorpay/razorpay/Razorpay.php'); 


 use Razorpay\Api\Api;
 $api = new Api($api_key, $api_secret);

 $response = [];

//  Request Parameters for Plan
    // 7 days
    $period = $_POST['type'];   //daily ,weekly ,monthly ,yearly
    $interval = 1;
    $amount = $_POST['amount'];
    $currency = $_POST['currency'];
    $name = $_POST['name'];
    $description = $_POST['description'];

   $item = array(
    'name' => $name,
    'description' => $description,
    'amount' => $amount,
    'currency' => $currency
   );
//  Request Parameters for Plan end

//  Request Parameters for Subscription

    $quantity = 1;
    $customer_notify = 1;
    $addons =    array(
        array(
          'item' => array(
            'name' => $name,
            'amount' => $amount,
            'currency' => $currency
            )
        )
          );
//  Request Parameters for Subscription end

    //  Create a Plan#
        try{
            $plan = $api->plan->create(array(
                'period' => $period,
                'interval' => $interval,
                'item' => $item
                )
            );

            $response["plan"] = $plan;

            if($plan){
                //Create a Subscription
                try{ 
                   $plan_id = $plan->id;
                   $total_count = 2;
                   $subscription  = $api->subscription->create(array(
                    'plan_id' => $plan_id,
                    'customer_notify' => $customer_notify,
                    'total_count' => $total_count,
                    'addons' => $addons
                    )
                  );
                  $response["subscription"] = $subscription;

                  if (!empty($subscription)) {
                    $subscription_id = $subscription->id;
                    $plan_id = $subscription->plan_id;
                    $payment_status = $subscription->status;
                    $current_start = $subscription->current_start;
                    $current_end = $subscription->current_end;
                    $quantity = $subscription->quantity;
                    $payment_status = $subscription->status;

                    $insert = $db->query("INSERT INTO subscription(plan_id,subscription_id,current_start,current_end,quantityd,currency,payment_status)
                    VALUES('" . $plan_id . "','" . $subscription_id . "','" . $current_start . "','" . $current_end . "', '" . $quantity . "','" . $currency . "','" . $payment_status . "')");

                    echo  '<h1>subscription has been successful.</h1>';
                   
                    } else {
                        echo "<h1>failed.</h1>";
                    }

                 }catch(Exception $e) {
                    $response["Subscription-error"] = $e;
                }
            }

        }catch(Exception $e) {
            $response["plan-error"] = $e;
        }

      echo "<pre>";
      print_r($response);
die; 



//  @Author: Satish p. end code
?>