<?php
/**
 * Helpers\Utils
 * 
 * This is a helper class that will contain all miscellaneous functions that do not
 * fall into any other category.
 * 
 * @version 1.0
 * @author Teodor Klissarov
 */
namespace Helpers;

class Utils {
    
    /**
     * respond function
     * 
     * This function converts an array or object to pretty printed json and prints a 
     * response to the client. This function is intended for successful responses
     * 
     * @param mixed the data we need to convert
     * @param boolean if this is set to true returns the result instead of printing it
     * @return string|null
     */
    public function respond($data, $return = FALSE) 
    {
        $resp = json_encode(array(
            "success" => 1,
            "data" => $data
        ), JSON_PRETTY_PRINT);
        
        if($return)
            return $resp;
        
        echo $resp;
    }
    
    /**
     * function reserrors
     * 
     * This function does prety much the same thing as the above, only it is intended
     * to return errors.
     * 
     * @param mixed the errors to be encoded
     * @param boolean @see respond()
     * @return string|null
     */
    public function reserrors($errors, $return = FALSE)
    {
        $resp = json_encode(array(
            "success" => 0,
            "data" => $errors
        ), JSON_PRETTY_PRINT);
        
        if($return)
            return $resp;
        
        echo $resp;
    }
    
    /**
     * This function takes an array and removes all key-value pairs whose keys
     * aren't alphanumeric. This is to prevent SQL injection through keys which
     * are normally column names and are not escaped.
     * 
     * @param array the data to sanitize
     * @return array
     */
    public function sanitize($data)
    {
        if(!is_array($data))
            return $data;
        
        foreach($data as $key => $val)
            if(!preg_match('#^[a-zA-Z0-9_\.]*$#',$key))
                unset($data[$key]);
            
        return $data;
    }
}
