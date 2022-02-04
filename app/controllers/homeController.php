<?php
// Gets function that returns Homepage's data
// chemin absolu car la fonction lastBlogPosts() contenue dans blogPostData sera lue depuis index.php
include "config/database.php";
include "app/persistences/blogPostData.php";
$homeData=lastBlogPosts($dtb);
var_dump($homeData);





