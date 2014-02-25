<?php

namespace Api\Modules\Ui;

class Menu {
    
    var $fk_relations = array(
        'menu_items' => array(
            'mid' => 'menus'
        )
    );
}
