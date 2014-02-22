<?php
/**
 * Api\Module
 * 
 * This class handles API calls that require display and/or manipulation of a
 * module's settings or data.
 * 
 * @version 1.0
 * @author Teodor Klissarov
 */

namespace Api;

class Module {
    
    /**
     * The name of the table containing settings for modules
     * @var string
     */
    private $mod_t = "modules";
    
    /**
     * The modules' namespace as a string
     * @var string
     */
    private $mod_ns = "\\Api\\Modules\\";
    
    /**
     * get function 
     * 
     * This function is an entry point for get requests at the module node. 
     * It routes them to the appropriate handler.
     * 
     * @param object the f3 object instance
     */
    public function get($f3)
    {
        $result = array();
        
        if(!$f3->get("PARAMS.id"))
            //If no module id is specified fetch a list of modules (settings only, 
            //no data)
            $result['settings'] = $this->_get_settings_list($f3);
        else
        {
           //We have a module id, so lets get the settings first
           $result['settings'] = $this->_get_settings_single($f3);
           
           //If we have a result, then the module exists. If the table param is
           //specified then we need to retrieve the data.
           if($result['settings'] && $f3->get('PARAMS.table'))
           {
               //Ofcourse we have to check if the specified table belongs to the module 
               if(!in_array($f3->get('PARAMS.table'), json_decode($result['settings'][0]['data_tables'])))
                    //If this table does not belong to this module fire a table not found error
                    $f3->get('messages')->msg('T_FOUND');
               else
               {
                    //We need to fetch data
                    
                    //This will be the class name (including namespace) of the module in question
                    $class = $this->mod_ns .  ucfirst($result['settings'][0]['bundle']) . '\\' 
                             . ucfirst($result['settings'][0]['alias']);
                    
                    if(class_exists($class) && method_exists($class, 'get'))
                    {
                        //If the class exists and it has a method named get, it will be 
                        //used to fetch table data
                        $child = new $class();
                        $result['mdata'] = $child->get($f3);
                    }
                    else
                        //Otherwile we fallback to default
                        $result['mdata'] = $this->_get_data($f3);
               }
           }  
        }
        
        //If any errors occured sent them as response
        if($f3->get('messages')->errcount())
            $f3->get('utils')->reserrors($f3->get('messages')->clear());
        else
            //Otherwise send the data
            $f3->get('utils')->respond($result);
            
    }
    
    private function _get_settings_list($f3)
    {
        
    }
    
    /**
     * _get_settings_single function
     * 
     * This function is used to retrieve the settings of a single module from the
     * module table
     * 
     * @param object f3 instance
     * @return array
     */
    private function _get_settings_single($f3)
    {
        $mod_id = $f3->get('PARAMS.id');
        
        $sql = $f3->get('dbb')->default_select($this->mod_t, $f3->get('locale'));
        
         if(is_numeric($mod_id))
            //The first parameter is an id
            $sql->where(array('t1.id' => $mod_id));
        else
            //We have been given an alias
            $sql->where(array('t1.alias' => $mod_id));
        
        $result = $sql->run()->result(); 
        
        //Module not found
        if(!$result)
            $f3->get('messages')->msg('M_FOUND');
        
        return $result;
    }
    
    /**
     * _get_data function 
     * 
     * This is the default data retriever entry point for modules. Can be overrided
     * by creating a module file in the mod_ns namespace with a function get
     * 
     * @param object f3 instance
     * @return array
     */
    private function _get_data($f3)
    {
       //If d_id parameter is set we return a single data entry
       //otherwise we return a list
       return (!$f3->get("PARAMS.d_id")) ? $this->_get_data_list($f3) :
                                           $this->_get_data_single($f3);    
    }
    
    /**
     * _get_data_list
     * 
     * Returns a list of data entries by using \Helper\Builder::default_select() 
     * and \Helper\Builder::default_filters()
     * 
     * @see \Helper\Builder::default_select(), \Helper\Builder::default_filters()
     * @param object f3 instance
     * @return array
     */
    private function _get_data_list($f3)
    {
        $result = $f3->get('dbb')->default_select($f3->get('PARAMS.table'), $f3->get('locale'))
                                 ->default_filters($f3->get('GET'));
        
        return $result;
    }
    
    /**
     * _get_data_single
     * 
     * Returns a sihngle data entry by using \Helper\Builder::default_select() 
     * 
     * @see \Helper\Builder::default_select()
     * @param object f3 instance
     * @return array
     */
    private function _get_data_single($f3)
    {
        $id = $f3->get('PARAMS.d_id');
        return $f3->get('dbb')->default_select($f3->get('PARAMS.table'), $f3->get('locale'))
                              ->where(array('t1.id' => $id))->run()->result();
    }
    
    
}

