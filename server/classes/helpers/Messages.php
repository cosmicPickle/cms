<?php
/**
 * Helpers\Messages
 * 
 * This is a helper class that handles the creation of messages/errors. 
 * 
 * @version 1.0
 * @author Teodor Klissarov
 */

namespace Helpers;

class Messages {
    
    /**
     * This will hold the fat free framework instance
     * 
     * @var object 
     */
    private $f3;
    
    /**
     * The name of the Messages table in the database
     * 
     * @var string
     */
    private $msg_t = "messages";
    
    /**
     * This will hold an array of messages that were logged during execution
     * 
     * @var array
     */
    private static $log;
    
    /**
     * __construct
     * 
     * The class constructor.
     * 
     * @param object
     */
    public function __construct($f3)
    {
        $this->f3 = $f3;
    }
    
    /**
     * msg function
     * 
     * Logs a message with the appropriate tag into the log variable
     * 
     * @param string 
     */
    public function msg($tag){

        $result = $this->f3->get('dbb')->select("t2.*, t1.*")
                                       ->from($this->msg_t,'t1')
                                       ->join($this->msg_t."_lang",
                                              "t1.id=t2.id_ AND t2.locale=?",
                                              "t2",
                                              $this->f3->get('locale'))
                                       ->where(array('t1.tag' => $tag))
                                       ->run()->result();
 
        if($result)
            self::$log[] = $result[0];
        else
            //If we do not have a result then we need an uknown error to flag
            $this->msg('E_UKNW');
    }
    
    /**
     * errcount function
     * 
     * Returns the number of messages of specific type or the number of all messages
     * if the argument is null
     * 
     * @param string|null the requested type or NULL to count all
     * @return int number of errors
     */
    public function errcount($type = NULL)
    {
        return count(!$type ? self::$log 
                            : array_filter(self::$log, function($msg) use ($type) {
                                  return $msg['type'] == $type;
                              }));
    }
    
    /**
     * Returns all messages and clears the log
     * 
     * @return array
     */
    public function clear()
    {
        $resp = self::$log;
        self::$log = array();
        
        return $resp;
    }
}
