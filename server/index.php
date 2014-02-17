<?php

//Getting an instance of the Fat Free Framework
$f3 = require('lib/base.php');

//Loading configuration file
$f3->config('config.ini');

//Setting up language
if($locale = $f3->get("SESSION.locale"))
    $f3->set("locale", $locale);

//Loading helpers
$f3->set('messages', new Helpers\Messages($f3));
$f3->set('utils', new Helpers\Utils($f3));

//Loading database driver
$f3->set('db', new DB\SQL(
            'mysql:host=localhost;dbname=cms',
            'root',
            ''
        ));

//Creating the builder
$f3->set('dbb', new Helpers\Builder($f3->get('db')));

$f3->run();
