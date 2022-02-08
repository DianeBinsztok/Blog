<?php
include "config/database.php";
include "app/persistences/blogPostData.php";

$postId = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);

$postData=blogPostById($dtb, $postId); //c'est ce searchId que je vais définir dynamiquement

$metaTitle=$postData["title"];
$metaDescription=$postData["title"];

$postComments=commentsByBlogPost($dtb, $postId);
include "./resources/views/layouts/blogPost.tpl.php";
