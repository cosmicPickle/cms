<?php
/**
 * Api\Page
 * 
 * This class handles API calls that require display and/or manipulation pages
 * 
 * @version 1.0
 * @author Teodor Klissarov
 */
namespace Api;

class Page {
    
    /**
     * The table that contains pages data
     * @var type 
     */
    private $page_t = "pages";
    
    /**
     * get function
     * 
     * Entry point for get requests at the page node.
     * 
     * @param object f3 instance
     */
    public function get($f3)
    {
        if(!$f3->get("PARAMS.id"))
            //If we don't have an id we have to load a list of pages
            $result = $this->_get_list($f3);
        else
        {    
            //Otherwise we have to load a single page
            $result = $this->_get_single($f3);
            
            //If the load_modules parameter is true then we need to load module
            //information into the page.
            if($result && $f3->get("GET.load_modules"))
                $this->_load_modules($f3, $result);
        }
        
        //Generating the response
        if($f3->get('messages')->errcount())
            $f3->get('utils')->reserrors($f3->get('messages')->clear());
        else
            $f3->get('utils')->respond($result);
    }
    
    public function post($f3)
    {
        
    }
    
    public function put($f3)
    {
        
    }
    
    public function delete($f3)
    {
        
    }
    
    /**
     * _get_list function 
     * 
     * Returns a list of pages by using \Helper\Builder::default_select() 
     * and \Helper\Builder::default_filters()
     * 
     * @see \Helper\Builder::default_select(), \Helper\Builder::default_filters()
     * 
     * @param object f3 instance
     * @return array
     */
    private function _get_list($f3)
    {
         $result = $f3->get('dbb')->default_select($this->page_t, $f3->get('locale'))
                                  ->default_filters($f3->get("GET"));
 
         if(!$result)
             $f3->get('messages')->msg('P_NONE');  

         return $result;
    }
    
     /**
     * _get_single function 
     * 
     * Returns a single page by using \Helper\Builder::default_select()
     * 
     * @see \Helper\Builder::default_select(), \Helper\Builder::default_filters()
     * 
     * @param object f3 instance
     * @return array
     */
    private function _get_single($f3)
    {
        $id = $f3->get('PARAMS.id');
        
        $sql = $f3->get('dbb')->default_select($this->page_t, $f3->get('locale'));
                
        if(is_numeric($id))
            //The first parameter is an id
            $sql->where(array('t1.id' => $id));
        else
            //We have been given an alias
            $sql->where(array('t1.alias' => $id));
        
        $result = $sql->run()->result();
        
        if(!$result)
            $f3->get('messages')->msg('P_FOUND');  
        
        return $result;
    }
    
    /**
     * _load_modules function 
     * 
     * Loads the modules of a page and adds them to it.
     * 
     * @param object f3 instance
     * @param reference the page 
     */
    private function _load_modules($f3, &$page)
    {
        $page[0]['modules'] = $f3->get('dbb')->select('bundle,alias')
                               ->from('modules')
                               ->where(array( 'id-in' => json_decode($page[0]['modules'])))
                               ->run()->result();
    }
}
