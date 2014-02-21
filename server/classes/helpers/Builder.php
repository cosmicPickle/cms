<?php
/**
 *
 * @author Teodor
 */
namespace Helpers;

class Builder {
    
    private $_db;
    private $_from;
    private $_select;
    private $_join;
    private $_where;
    private $_order;
    private $_limit;
    private $_args;
    private $_args_parsed;
    private $_last_query;
    private $_result;
    
    public function __construct($db)
    {
        $this->_db = $db;
    }
    
    public function select($fields)
    {
        
        if(is_array($fields))
            $fields = implode(', ', $fields);
        
        $this->_select = "SELECT " . $fields;
        
        return $this;
    }
    
    public function from($table, $as = NULL)
    {
        $this->_from = "FROM " . $table;
        
        if($as)
            $this->_from .= " AS ". $as;
        
        return $this;
    }
    
    public function join($table, $on, $as = NULL, $args = array(), $type = "LEFT")
    {
        $this->_add_args($args, __FUNCTION__);
        
        $type = strtoupper($type);
        if(!in_array($type, array("LEFT","RIGHT","INNER")))
            $type = "LEFT";
        
            $this->_join .= (($this->_join) ? " " : NULL).$type . " JOIN " . $table;
        
        if($as)
            $this->_join .= " AS ". $as;
        
        $this->_join .= " ON " . $on;
        
        return $this;
    }
    
    public function where($where, $args = array())
    {

        if(!is_array($where))
        {
            $this->_add_args($args, __FUNCTION__);
            $this->_where = "WHERE " . $where;
        }
        else
        {
            $this->_where = $this->_parse_where($where);
            if($this->_where)
                $this->_where = "WHERE ".$this->_where;
        }
        
        return $this;
    }
    
    public function order($by, $dir = "ASC")
    {
        //Let's see if $by is a name of a field or an SQL injection
        if(!preg_match('#^([a-zA-Z0-9_\.]*)$#', $by))
            return $this;
        
        if(!in_array($dir, array("ASC", "DESC")))
            $type = "ASC";
        
        $this->_order = "ORDER BY ? ".$dir;
        
        $this->_add_args($by, __FUNCTION__);
        return $this;
    }
    
    public function limit($limit, $offset = 0)
    {
        $this->_limit = "LIMIT ";
        
        if($offset && is_numeric($offset) && $offset > 0)   
            $this->_limit .= $offset.", ";
        
        $this->_limit .= is_numeric($limit) && $limit > 0 ? $limit : 1;
        
        return $this;
    }
    
    public function run()
    {
        $this->_parse_args();
        
        $this->_last_query = $this->_select. " " .
                             $this->_from. " " .
                             $this->_join. " " .
                             $this->_where. " " .
                             $this->_order. " " .
                             $this->_limit;
        
        $this->_result = $this->_db->exec($this->_last_query, $this->_args_parsed);
        $this->_clear();
        
        return $this;
    }
    
    public function result()
    {
        return $this->_result;
    }
    
    public function default_select($table, $locale)
    {
        return $this->select("t2.*, t1.*")
                    ->from($table, 't1')
                    ->join($table . '_lang',
                           "t1.id = t2.id_ AND t2.locale = ?",
                           "t2",
                           $locale);
    }
    
    public function default_filters($data)
    {
        if(isset($data['filter']))
         {
             foreach($data['filter'] as $key => $value)
             {
                 $new_key = preg_replace('#id($|>|<|!|%)#','id_$1', $key);
                 unset($data['filter'][$key]);
                 
                 $data['filter'][$new_key] = $value;
             }
             if(isset($data['filter']['id']))
             {    
                 $data['filter']['id_'] = $data['filter']['id'];
                 unset($data['filter']['id']);
             }
             $this->where($data['filter']);
         }
         
         
         if(isset($data['order'][0]))
         {
             $dir = isset($data['order'][1]) ? $data['order'][1] : 'ASC';
             $this->order($data['order'][0],$dir);
         }
         
         if(isset($data['limit'][0]))
         {
             $offset = isset($data['limit'][1]) ? $data['limit'][1] : 0;
             $this->limit($data['limit'][0], $offset);
         }
         
         return $this->run()->result();
    }
    
    private function _add_args($args, $func)
    {
        if(!is_array($args))
             $this->_args[$func][] = $args;
        else
            foreach($args as $arg)
                $this->_args[$func][] = $arg;
    }
    
    private function _parse_args()
    {
        foreach($this->_args as $func)
            foreach($func as $arg)
                $this->_args_parsed[count($this->_args_parsed) + 1] = $arg;
    }
    
    private function _parse_where($data)
    {
        //This as the array that will contain all conditions
        $conds = array();
        
        //Cycling through the data
        foreach($data as $key => $val)
        {
            //The index of the current condition
            $index = count($conds);
            
            //If this is an array we have to process it recursively
            if(is_array($val))
            {
                //We evaluate to see if it is an "IN" request
                if(preg_match('#^([a-zA-Z0-9_\.]*)-in$#', $key, $matches))
                {
                    $conds[$index] = $matches[1] . ' IN (' . implode(',', $val) . ')';
                }
                else
                    //Recursion
                    $conds[$index] = "(" . $this->_parse_where ($val) . ')';
                
                //Are there previous conditions ?
                if($index > 0)
                    if(preg_match('#^!.*#', $key))
                        //If the key starts with a '!' then we need to add an OR
                        $conds[$index] = "OR " . $conds[$index];
                    else
                        //Otherwise - AND
                        $conds[$index] = "AND " . $conds[$index];     
            }
            else
            {
                //The values are automatically sanitized, but let's check the 
                //key. The regex matches: table.val OR (!)table.val(<|>|!|%)
                if(!preg_match('#^(([a-zA-Z0-9_\.]*)|((![a-zA-Z0-9_\.]*|[a-zA-Z0-9_\.]*)(>|<|!|%)))$#', $key))
                    continue;
                    
                $conds[$index] = '';

                if(preg_match('#^!.*#', $key))
                {     
                    //Are there previous conditions ?
                    if($index > 0)
                        //If the key starts with a '!' then we need to add an OR
                        $conds[$index] .= "OR ";
                    
                    $key = substr($key,1);
                }
                else
                    if($index > 0)
                        //Otherwise - AND
                        $conds[$index] .= "AND ";   
                 
                
                //Next we check for an expression
                if(preg_match('#^(![a-zA-Z0-9_\.]*|[a-zA-Z0-9_\.]*)(>|<|!|%)$#',$key,$matches))
                {      
                     $key = str_replace($matches[2], '', $key);
                     if($matches[2] == "%") 
                     {
                         $conds[$index] .= $key. " LIKE ?";
                         $val = "%".$val."%";
                     }
                     elseif($matches[2] == "!")
                         $conds[$index] .= $key. " != ?";
                     else
                         $conds[$index] .= $key . " ".$matches[2]." ?";
                }    
                else
                    $conds[$index] .= $key . " = ?";
                
                $this->_add_args($val, 'where');
            }
        }
        
        return implode(" ",$conds);
    }
    
    private function _clear()
    {
        $this->_select = NULL;
        $this->_from = NULL;
        $this->_join = NULL;
        $this->_where = NULL;
        $this->_order = NULL;
        $this->_limit = NULL;
        $this->_args = array();
        $this->_args_parsed = array();
    }
}
