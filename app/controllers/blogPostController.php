<?php
include "config/database.php";
include "app/persistences/blogPostData.php";
$postData=blogPostById($dtb, 2); //c'est ce searchId que je vais définir dynamiquement
$postComments=commentsByBlogPost($dtb, 2 );
include "./resources/views/layouts/blogPost.tpl.php";
