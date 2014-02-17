<?php
/**
 * Description of Utils
 *
 * @author Teodor
 */

namespace Helpers;

class Messages {
    
    private $f3;
    private $msg_t = "messages";
    private static $log;
    
    public function __construct($f3)
    {
        $this->f3 = $f3;
    }
    
    public function msg($tag){
        
        $select = array("t1.tag, t1.type, IFNULL(t2.text, t1.text) as text");
        
        $result = $this->f3->get('dbb')->select($select)
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
            $this->msg('E_UKNW');
    }
    
    public function clear()
    {
        $resp = self::$log;
        self::$log = array();
        
        return $resp;
    }
}
