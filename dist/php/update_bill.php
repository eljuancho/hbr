<?php 
require 'bd.php';

$errors = array();
$resolve_data = array();

foreach($_POST as $key=>$value) {		
    if(!empty($_POST[$key])){				
        $$key = MysqliDB::double_scape(MysqliDB::getInstance()->mysql_real_escape_string($_POST[$key]));
    }
    else {
        $$key = null;
    }    
}

if (empty($errors)){
    MysqliDB::getInstance()->query("UPDATE `bills` SET `quantity`= ".$quantity.",`totalweight`=".(float)$total_weight.",`remaining_quantity`= ".(int)$remaining_quantity.",`bill_state`= ".(int)$bill_state.",`totalprice`=".(float)$total_price.",`totalweight`=".(float)$total_weight." WHERE `bill_id`= ".$bill_id."");

	$resolve_data['success'] = true;	
	MysqliDB::getInstance()->close();
	echo json_encode($resolve_data);
} else {
    $resolve_data['errors'] = $errors;
	MysqliDB::getInstance()->close();
    echo json_encode($resolve_data);
}

?>