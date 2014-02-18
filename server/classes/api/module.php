<?php

namespace Api;

class Module {
    
    private $mod_t = "modules";
    
    public function get($f3)
    {
        
        if(!$f3->get("PARAMS.id"))
            //If no module id is specified fetch a list
            $result = $this->_get_settings_list($f3);
        else
        {
           //We have a module id, so lets get the settings first
           $result = $this->_get_settings_single($f3);
           
           //If we have a result, then the module exists. If the table param is
           //specified then we need to retrieve the data.
           
           //Ofcourse we have to check if the specified table belongs to the module 
           if($result && $f3->get('PARAMS.table'))
           {
               if(!in_array($f3->get('PARAMS.table'), json_decode($result[0]['data_tables'])))
                    $f3->get('messages')->msg('T_FOUND');
               else
               {
                    $class = '\\Api\\Modules\\' . ucfirst($result[0]['alias']);
                    if(class_exists($class) && method_exists($class, 'get'))
                    {
                        $child = new $class();
                        $child->get($f3);
                    }
                    else
                        $this->_get_data($f3);
               }
           }  
        }
        
        
        if($f3->get('messages')->errcount())
            $f3->get('utils')->reserrors($f3->get('messages')->clear());
        else
            $f3->get('utils')->respond($result);
            
    }
    
    private function _get_settings_list($f3)
    {
        
    }
    
    private function _get_settings_single($f3)
    {
        $mod_id = $f3->get('PARAMS.id');
        
        $sql = $f3->get('dbb')->select("md_lang.*, md.*")
                              ->from($this->mod_t, 'md')
                              ->join($this->mod_t."_lang",
                                     "md.id = md_lang.id_ AND md_lang.locale = ?",
                                     "md_lang",
                                     $f3->get('locale'));
        
         if(is_numeric($mod_id))
            //The first parameter is an id
            $sql->where(array('md.id' => $mod_id));
        else
            //We have been given an alias
            $sql->where(array('md.alias' => $mod_id));
        
        $result = $sql->run()->result(); 
        
        if(!$result)
            $f3->get('messages')->msg('M_FOUND');
        
        return $result;
    }
    
    private function _get_data($f3)
    {
        
    }
    
    private function _get_data_list($f3)
    {
        
    }
    
    private function _get_data_single($f3)
    {
        
    }
    
    
}

