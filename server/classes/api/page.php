<?php
namespace Api;

class Page {
    
    private $page_t = "pages";
    
    public function get($f3)
    {
        if(!$f3->get("PARAMS.id"))
            $result = $this->_get_list($f3);
        else
            $result = $this->_get_single($f3);
        
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
    
    private function _get_list($f3)
    {
         $data = $f3->get("GET");

         $sql = $f3->get('dbb')->select("t2.*, t1.*")
                               ->from($this->page_t, 't1')
                               ->join($this->page_t . '_lang',
                                      "t1.id = t2.id_ AND t2.locale = ?",
                                      "t2",
                                      $f3->get('locale'));
         
         if(isset($data['filter']))
         {
             if(isset($data['filter']['id']))
             {    
                 $data['filter']['id_'] = $data['filter']['id'];
                 unset($data['filter']['id']);
             }
             $sql->where($data['filter']);
         }
         
         
         if(isset($data['order'][0]))
         {
             $dir = isset($data['order'][1]) ? $data['order'][1] : 'ASC';
             $sql->order($data['order'][0],$dir);
         }
         
         if(isset($data['limit'][0]))
         {
             $offset = isset($data['limit'][1]) ? $data['limit'][1] : 0;
             $sql->limit($data['limit'][0], $offset);
         }
         
         $result = $sql->run()->result();
         
         if(!$result)
             $f3->get('messages')->msg('P_NONE');  

         return $result;
    }
    
    private function _get_single($f3)
    {
        $id = $f3->get('PARAMS.id');
        
        $sql = $f3->get('dbb')->select("t2.*, t1.*")
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
            $f3->get('messages')->msg('P_FOUND');  
        
        return $result;
    }
}
