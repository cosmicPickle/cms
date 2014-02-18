<?php
/**
 * Description of Utils
 *
 * @author Teodor
 */
namespace Helpers;

class Utils {
    
    public function respond($data, $return = FALSE) 
    {
        $resp = json_encode(array(
            "success" => 1,
            "data" => $data
        ));
        
        if($return)
            return $resp;
        
        echo $resp;
    }
    
    public function reserrors($errors, $return = FALSE)
    {
        $resp = json_encode(array(
            "success" => 0,
            "data" => $errors
        ));
        
        if($return)
            return $resp;
        
        echo $resp;
    }
}
