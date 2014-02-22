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
}
