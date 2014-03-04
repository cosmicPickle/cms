<?php

namespace Helpers;

class Auth {
    
    
    private $f3;
    private $user_t = 'users';
    private $salt = 'cJgYIJ2OqOoaPiPFcxX2';

    public function __construct($f3)
    {
        $this->f3 = $f3;
        new \Session();
    }
    
    public function check($level = 0)
    {
        if($level == 0)
           return TRUE;
        
        if(!$this->f3->get('SESSION.logged'))
        {    
            $this->f3->get('messages')->msg('AUTH_FAIL');
            return FALSE;
        }   
        
        if($this->f3->get('SESSION.level') < $level)
        {
            $this->f3->get('messages')->msg('AUTH_FAIL');
            return FALSE;
        }
        
        return TRUE;
    }
    
    public function login($user, $pass)
    {
        $exists = $this->f3->get('dbb')->select('user, email, level')
                                 ->from($this->user_t)
                                 ->where(array('user' => $user, 'password' => $this->_hash($pass)))
                                 ->run()->result();
        
        if(!$exists)
        {
            $this->f3->get('messages')->msg('AUTH_INV');
            return FALSE;
        }
        
        $this->f3->set('SESSION.logged', 1);
        
        foreach($exists[0] as $key => $val)
            $this->f3->set('SESSION.'.$key, $val);
        
        return TRUE;
    }
    
    public function logout()
    {
        $this->f3->clear('SESSION');
        return TRUE;
    }
    
    private function _hash($pass)
    {
        return md5($pass.$this->salt);
    }
}