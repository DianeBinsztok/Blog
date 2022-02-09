<?php
include "config/database.php";
include "app/persistences/blogPostData.php";

// 1 - Inputs
$postAuthorId=filter_input(INPUT_POST, 'author_id', FILTER_DEFAULT);
$postTitle=filter_input(INPUT_POST, 'title', FILTER_DEFAULT);
$postStartDate=filter_input(INPUT_POST, 'start', FILTER_DEFAULT);
$postEndDate=filter_input(INPUT_POST, 'end', FILTER_DEFAULT);
$postImportance=filter_input(INPUT_POST, 'importance', FILTER_DEFAULT);
$postContent=filter_input(INPUT_POST, 'content', FILTER_DEFAULT);
// 2 - Variable qui vérifie l'envoi du formulaire:
$submit=filter_input(INPUT_POST, 'form_submit', FILTER_DEFAULT);

// Pour messages d'erreur ( pas de vérifications pour l'instant )
$authorIdMsg="";
$titleMsg="";
$starDateMsg="";
$endDateMsg="";
$importanceMsg="";
$contentMsg="";

if($submit!==null){
    $createPost = blogPostCreate($dtb, $postAuthorId, $postTitle, $postStartDate, $postEndDate, $postImportance, $postContent);
    include "./resources/views/layouts/createPost.tpl.php";
    echo("L'article a bien été ajouté dans la BDD");
}else{
    include "./resources/views/layouts/createPost.tpl.php";
}
