<?php
/**
 * Description of Utils
 *
 * @author Teodor
 */
namespace Helpers;

class Utils {
    
    public function respond($resp) 
    {
        echo json_encode($resp);
    }
}
