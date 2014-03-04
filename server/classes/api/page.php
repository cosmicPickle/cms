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
     * The columns of the main table that are editable through the API
     * 
     * @var type 
     */
    private $columns = array("alias", "modules", "layout");
    
    /**
     * The columns of the language table that are editable through the API
     * @var type 
     */
    private $lang_columns = array("title", "keywords", "description", "content");
    
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
    
    /**
     * This function handles post request to the page node. Inserts a new page.
     * 
     * @param object $f3 instance
     * @return null
     */
    public function post($f3)
    {
        $data = $f3->get('POST');
        $result = $f3->get('dbb')->default_insert($this->page_t, 
                                                  $data, $this->columns, 
                                                  $this->lang_columns, 
                                                  $f3->get('locale'));
        
        
        $f3->get('messages')->msg($result['msg']);
        if($result['success'])
            $f3->get('utils')->respond($f3->get('messages')->clear());
        else
            $f3->get('utils')->reserrors($f3->get('messages')->clear());
    }
    
    /**
     * This function handles put request to the page node. Updates an existing
     * page.
     * 
     * @param object $f3 instance
     * @return null
     */
    public function put($f3)
    {
        $data = $f3->get('POST');
        $id = $f3->get('PARAMS.id');
        
        $result = $f3->get('dbb')->default_update($this->page_t, $id,
                                                  $data, $this->columns, 
                                                  $this->lang_columns, 
                                                  $f3->get('locale'));
        
        
        $f3->get('messages')->msg($result['msg']);
        if($result['success'])
            $f3->get('utils')->respond($f3->get('messages')->clear());
        else
            $f3->get('utils')->reserrors($f3->get('messages')->clear());
    }
    
    /**
     * 
     * This function handles delete requests to the page node. Guess what, deletes
     * an existing page.
     * 
     * @param object f3 instance
     * @return null
     */
    public function delete($f3)
    {
        $id = $f3->get('PARAMS.id');
        
        $key = 'id';
        if(!is_numeric($id))
            $key = 'alias';
        
        //Tables set on foreign keys to cascade. No need to delete the language data
        //separately
        $delete = $f3->get('dbb')->where(array($key => $id))->delete($this->page_t);
        
        //Huh?
        if(!$delete)
        {    
            $f3->get('messages')->msg('DB_FAIL');
            $f3->get('utils')->reserrors($f3->get('messages')->clear());
            return NULL;
        }
        
        //Ok. You deleted the page. Happy?
        $f3->get('messages')->msg('ACT_OK');
        $f3->get('utils')->reserrors($f3->get('messages')->clear());
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
            $sql->where(array($this->page_t.'.id' => $id));
        else
            //We have been given an alias
            $sql->where(array($this->page_t.'.alias' => $id));
        
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
        if(!$page[0]['modules'])
            return NULL;
        
        $page[0]['modules'] = $f3->get('dbb')->select('id,bundle,alias')
                               ->from('modules')
                               ->where(array( 'id-in' => json_decode($page[0]['modules'])))
                               ->run()->result();
    }
}
