<?php
namespace Api;

class Page {
    
    private $page_t = "pages";
    
    public function get($f3)
    {
        if(!$f3->get("PARAMS.id"))
            $result = $this->_get_list($f3);
        else
        {    
            $result = $this->_get_single($f3);
            
            if($result && $f3->get("GET.load_modules"))
            {
                $this->_load_modules($f3, $result);
                
                if($f3->get("GET.parse"))
                    $this->_parse_page ($result);
            } 
        }
        
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
         $result = $f3->get('dbb')->default_select($this->page_t, $f3->get('locale'))
                                  ->default_filters($f3->get("GET"));
 
         if(!$result)
             $f3->get('messages')->msg('P_NONE');  

         return $result;
    }
    
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
    
    private function _load_modules($f3, &$page)
    {
        $page[0]['modules'] = $f3->get('dbb')->select('bundle,alias')
                               ->from('modules')
                               ->where(array( 'id-in' => json_decode($page[0]['modules'])))
                               ->run()->result();
    }
    
    private function _parse_page(&$page)
    {
        foreach($page[0]['modules'] as $mod)
        {
            $replace = '<div ng-include="\'modules/%s/views/%s.html\'" %s></div>';
            $pattern = "#\{\{".$mod['alias']."(:([a-zA-Z0-9\-\._]+)){0,1}(\(([a-zA-Z0-9_;=]+)\)){0,1}\}\}#";
            
            $page[0]['content'] = preg_replace_callback($pattern, 
                function($matches) use ($replace, $mod){
                    
                    $onload = NULL;
                    if(isset($matches[4]) && $matches[4])
                    {
                        $attrs = explode(';', $matches[4]);
                        foreach($attrs as &$attr)
                            $attr = $mod['bundle'].".".$mod['alias'].".".$attr;
                                
                        $onload = 'onload="'.implode(';',$attrs).'"'; 
                    }
                    
                    return sprintf($replace, $mod['bundle'], $mod['alias'].ucfirst($matches[2]), $onload);

                }, $page[0]['content']);
        }
    }
}
