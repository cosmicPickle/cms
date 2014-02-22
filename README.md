CMS
===

This is a Content Management System that consist of a server API build on [PHP Fat Free Framework](http://fatfreeframework.com) and a frontend application build with [AngularJS](http://angularjs.org). This means, ofcourse that you would probably like to get acquainted with those two first if you haven't already.

Application workflow
--------------------

If you are only interested in using the **CMS** you can probably skip this part. If you want to develop modules, however, I strongly recommend reading through in order to get a feeling of how the application works.


Ok let's start with the concept of the system. If you have ever used Linux you are sure to have heard the expression "Everything is a file", well here everything is a page. Angular is set to recognise all request of as `/:page`. The
`page` is an id or alphanumerical alias of the page being loaded. After resolving which page to load Angular sends a
`GET ../server/page/` request to get the page from the server API.


Every page can have modules inserted with the following syntax `{{module:view(param1=val1,param2....)}}` (more on this later). 


After the page is loaded by the `pageCtrl` controller, the `cmsPage` directive parses the page template for modules and substitutes the templated modules with `ngInclude` directives. After that the content of the page is appended to the DOM and hooked to the main scope of the application.

API
---

The server API is based on the RESTful architectural model and provides access to CMS resources. Before getting into each route I will explain a few constructions that are often used by the API.

1. In most occasions when you are sending a request to a node that is expected to return a list you would like to filter, limit and order the response. Here that happens through GET parameters. When I talk about **default filtering**, this is what I mean.
  1. `filter` array - This is a multidimensional array, with each key matching a field or a condition in the table and each. Below is a list of what the filter array can express.

    - `key => val`        equals to `(AND) key = val` 
    - `key>|<|! => val`   equals to `(AND) key >|<|!= val`
    - `key% => val`       equals tp `(AND) key LIKE %val%` 
    - `!key => val`       equals to `(OR)  key = val`
    - `key-in => array()` equals to       `key IN (array()) `
    - `key => array()`    equals to `(AND) (recusrsion on array())` 
    - `!key => array()`   equals to `(OR)  (recusrsion on array())` 
    
    **example:** 
    ```php
       array(
           key1>  => val1
           !key2% => val2
           !sub1  => array(
               key3!  => val3
               key4< => val4
           )<
       )
    ```
    **equals to:**
     
    ```mysql
       WHERE key1 > val1 OR key2 LIKE val2 OR (key3 != val3 AND key4 = val4)
    ```
  2. `order` array - This is an array of the kind `(order_column, order_by)` 
  3. `limit` array - This is an array of the kind `(limit, offset)`
2. In most examples below, unless stated otherwise if `:id` of a node contains alphadash characters it is considered an alias. It is considered an id otherwise. This is reffered to as **id resolution** from here down.

### /page

1.`GET /page/:id` - This is the node for retrieving pages. The route performs differently based on the value of `id`. If `id` is not set this node will return a list of pages with **default filtering**. **Id resolution** also applies.

### /module

1.`GET /module/:id` - This node retrieves the settings of a module or a list of modules if `id` is not set. **Id resolution** applies.

2. `GET /module/:id/:table/:d_id` - This node retrieves data from tables assosciated with the current module. `:table` reffers to the name of the table. The response depends on a couple of things.
  1. If there is a module class defined in the appropriate namespace (more on that later) and a `function get()` exists in it, the controll is passed to said function. 
  2. Otherwise, the default get function is used. If the default is used and `:d_id` is not set a list is retrieved using **default filtering**. Otherwise, **id resolution** is applied.


Module creation (by example)
----------------------------

Explaining how to create a module for this system will be best done by example. Our goal will be to create a frame for a news module. By a frame I mean, that I will not go into details on how to create the actual news module but rather integrate it into my cms.


### Creating a basic `HTML/JavaScript` module

The first thing we need to do is add a line in our modules table with the module's settings. This line will contain the name of the bundle and the alias of the module. We also need to add a line to the modules' language table with a name and description.

```mysql
INSERT INTO `modules` (`bundle`,`alias`) VALUES ('blog','news');
INSERT INTO `modules_lang` (`id_`,`locale`,`title`,`description`) VALUES (`news module insert_id`,`en`,`News module`, `This module will be used to display news.`)
```

Note that the `id_` should map to the insert id of the module.

Next we want to create a folder named `blog`(the name of the bundle) in `client\modules\` with the following structure.

    1.client
      - modules
        - blog (the name of the bundle)
          - js
          - views
            newsMain.html (alias_of_module + name_of_view + '.html')

That's it! You have your basic `HTML\JavaScript` module set up. Now in order to include your module to a page, you have to do two things. First you need to insert the module's id in the page's `modules` column. The field should be a json array. Second, you need to add the markup `{{news:main}}` to your page's content. (This process will be automated once the administration is added.)

A little bit on module markup. `{{alias_of_module:view}}` resolves the following way:

1. When AngularJS requests a page, it receives a response with the page + bundles and aliases of the modules included in this page.
2. AngularJS then creates an `ngInclude` directive which looks in `client\modules\bundle_of_module\views\(alias_of_module + view + '.html')`
