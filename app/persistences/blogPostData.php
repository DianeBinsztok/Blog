<?php

// 1 - Page d'accueil: requêter les 10 derniers articles
function lastBlogPosts($data){
   $homeData= $data->query(file_get_contents("database/lastBlogPosts.sql"));
   return $homeData->fetchAll();
}

// 2.1 - page postPage : requêter un article en fonction de son id
function blogPostById($data, $searchedId){

    //file_get_contents retourne le contenu du fichier sous forme de string
    $postData= $data->query(file_get_contents("database/postDetails.sql")." WHERE articles.id=".$searchedId.";");
    return $postData->fetch();
}

// 2.2 - page postPage: requêter les commentaires associés à l'article, en fonction de son id
function commentsByBlogPost($data, $searchedId){

    $postComments= $data->query(file_get_contents("database/postComments.sql")." WHERE articles_id=".$searchedId.";");
    return $postComments->fetchAll();
}

// 3 - Créer un nouvel article depuis le formulaire:
function blogPostCreate($data, $postAuthorId, $postTitle, $postStartDate, $postEndDate, $postImportance, $postContent){
    // Préparation de la requête et des valeurs des champs à remplir
    $newPostQuery= $data->prepare(file_get_contents("database/createNewPost.sql"));
    $newPostQuery -> bindParam(':postAuthorId', $postAuthorId);
    $newPostQuery -> bindParam(':postTitle', $postTitle);
    $newPostQuery -> bindParam(':postStartDate', $postStartDate);
    $newPostQuery -> bindParam(':postEndDate', $postEndDate);
    $newPostQuery -> bindParam(':postImportance', $postImportance);
    $newPostQuery -> bindParam(':postContent', $postContent);
    return $newPostQuery->execute();
}

// 4 - Modifier un article:
function blogPostUpdate($data, $postId, $updatedAuthor, $updatedTitle, $updatedStart, $updatedEnd, $updatedImportance, $updatedContent){
    $updatedPost= $data->prepare(file_get_contents("database/updatePost.sql"));
    $updatedPost -> bindParam(':newAuthor', $updatedAuthor);
    $updatedPost -> bindParam(':newTitle', $updatedTitle);
    $updatedPost -> bindParam(':newStartDate', $updatedStart);
    $updatedPost -> bindParam(':newEndDate', $updatedEnd);
    $updatedPost -> bindParam(':newImportance', $updatedImportance);
    $updatedPost -> bindParam(':newContent', $updatedContent);
    $updatedPost -> bindParam(':postId', $postId);
    return $updatedPost->execute();
    xdebug_var_dump($data, $postId, $updatedAuthor, $updatedTitle, $updatedStart, $updatedEnd, $updatedImportance, $updatedContent);
    xdebug_var_dump($modifiedPost);
}

// 5 - Supprimer un article:
function blogPostDelete($data, $postId){
    $deletePostQuery=$data->prepare(file_get_contents("database/deletePost.sql"));
    $deletePostQuery -> bindParam(':postId', $postId);
    echo("L'article a bien été supprimé");
    return $deletePostQuery->execute();
}
