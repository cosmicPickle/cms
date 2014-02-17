<?php
namespace Api;

class Page {
    
    //This will contain the object mapper
    private $page_t = "pages";
    
    public function get_list($f3)
    {

    }
    
    public function get_single($f3)
    {
        $id = $f3->get('PARAMS.id');
        
        $select = array("t1.id" , "t1.alias", "t1.template",
                        "IFNULL(t2.title, t1.title) as title",
                        "IFNULL(t2.keywords, t1.keywords) as keywords",
                        "IFNULL(t2.description, t1.description) as description",
                        "IFNULL(t2.content, t1.content) as content",
                        "IFNULL(t2.created_at, t1.created_at) as created_at",
                        "IFNULL(t2.updated_at, t1.updated_at) as updated_at");
        
        $sql = $f3->get('dbb')->select($select)
                              ->from($this->page_t, 't1')
                              ->join($this->page_t."_lang", 
                                     "t1.id = t2.id_ AND t2.locale = ?",
                                     "t2",
                                     $f3->get('locale'));
                
        if(is_numeric($id))
            //The first parameter is an id
            $sql->where(array('t1.id' => $id));
        else
            //We have been given an alias
            $sql->where(array('t1.alias' => $id));
        
        $result = $sql->run()->result();
        
        if(!$result)
        {
            $f3->get('messages')->msg('P_FOUND');  
            $f3->get('utils')->respond(array(
               "success" => 0,
               "errors"  => $f3->get('messages')->clear(),
            ));
        }
        else
        {
            $f3->get('utils')->respond($result);
        }
       
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
}
