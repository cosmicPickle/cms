<?php
/**
 * Description of products
 *
 * @author Teodor
 */

namespace Api\Modules\Cart;

class Products {
    
    
    var $fk_relations = array(
      'products' => array(
          'category_id' => 'categories'
      ),
      'images' => array(
          'product_id' => 'products'
      )
    );
}
