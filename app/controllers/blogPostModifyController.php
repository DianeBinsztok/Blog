<?php
include "config/database.php";

include "app/persistences/blogPostData.php";

// 1 - Variable qui vérifie l'envoi du formulaire:
$submit=filter_input(INPUT_POST, 'form_submit', FILTER_DEFAULT);


// 3 - Exécuter la requête avec les arguments:
if($submit!==null){
    // 2 - Inputs
    $updatedId=filter_input(INPUT_POST, 'id', FILTER_DEFAULT);
    $newAuthor=filter_input(INPUT_POST, 'author_id', FILTER_DEFAULT);
    $newTitle=filter_input(INPUT_POST, 'title', FILTER_DEFAULT);
    $newStart=filter_input(INPUT_POST, 'start', FILTER_DEFAULT);
    $newEnd=filter_input(INPUT_POST, 'end', FILTER_DEFAULT);
    $newImportance=filter_input(INPUT_POST, 'importance', FILTER_DEFAULT);
    $newContent=filter_input(INPUT_POST, 'content', FILTER_DEFAULT);
    xdebug_var_dump($dtb, $updatedId, $newAuthor, $newTitle, $newStart, $newEnd, $newImportance, $newContent);
   blogPostUpdate($dtb, $updatedId, $newAuthor, $newTitle, $newStart, $newEnd, $newImportance, $newContent );
   // echo ("L'article a bien été modifié");

   // header: redirection vers la page d'accueil
   header ("location: /index.php?action=/");

}else{
    // D'abord requêter l'article
$postId = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
$postData=blogPostById($dtb, $postId);
include "./resources/views/layouts/updatePost.tpl.php";
}




