<?php
include "config/database.php";
include "app/persistences/blogPostData.php";

// I - RECUPERATION ET CONTRÔLE DES INPUTS

// 1 - Inputs
$postAuthorId=filter_input(INPUT_POST, 'author_id', FILTER_DEFAULT);
$postTitle=filter_input(INPUT_POST, 'title', FILTER_DEFAULT);
$postStartDate=filter_input(INPUT_POST, 'start', FILTER_DEFAULT);
$postEndDate=filter_input(INPUT_POST, 'end', FILTER_DEFAULT);
$postImportance=filter_input(INPUT_POST, 'importance', FILTER_DEFAULT);
$postContent=filter_input(INPUT_POST, 'content', FILTER_DEFAULT);
// 2 - fonctions de contrôle des inputs

// 2.1 - Pour l'instant, je vérifie juste le type. À terme, je vérifierai que l'id est présent en BDD
function validateAuthorId($authorId):bool{
    if(gettype($authorId)!=="integer"){
        return false;
    }else{
        return true;
    }
}
// 2.2 - On vérifie que la string ne contient pas de caracères spéciaux
function validateString($string):bool{
    $invalid_string=(str_contains($string, "<"))||(str_contains($string, ">")||(str_contains($string, "%"))||(str_contains($string, ".")));
    if($invalid_string){
        return false;
    }else{
        return true;
    }
}
// 2.3 - On vérifie que la variable ne contient qu'une des 5 valeurs autorisées
function validateImportance($importance):bool{
    if(($importance==1)||($importance==2)||($importance==3)||($importance==4)||($importance==5)){
        return true;
    }else{
        return false;
    }
}

// 3 - Applications des fonctions aux inputs. Retournent des bool:
$validAuthorId=validateAuthorId($postAuthorId);
$validTitle=validateString($postTitle);
$validImportance=validateImportance($postImportance);
$validContent=validateString($postContent);



// II - GESTION DES MESSAGES D'ERREUR:

// 1 - Le tableau de messages:
    $errorMsg=[
        'missingKey'=>"Ce champs est nécessaire pour l'envoi du formulaire",
        'missingValue'=>"Ce champs ne peut pas être vide",
        'invalidValue'=>"Certains caractères ne sont pas autorisés: veuillez corriger cette saisie"
    ];

// 2 - Variable qui vérifie l'envoi du formulaire:
$submit=filter_input(INPUT_POST, 'form_submit', FILTER_DEFAULT);

// 3 - Vérification de chaque input et envoi du message correspondant si besoin

$authorIdMsg="";
$titleMsg="";
$starDateMsg="";
$endDateMsg="";
$importanceMsg="";
$contentMsg="";

if($submit!==null) {

    // vérification de l'id de l'auteur:
    if (!isset($postAuthorId)) {
        $authorIdMsg = $errorMsg['missingKey'];
    } elseif (empty($input)) {
        $authorIdMsg = $errorMsg['missingValue'];
    } elseif (!$validAuthorId) {
        $authorIdMsg = $errorMsg['invalidValue'];
    } else {
        $authorIdMsg = "";
    }

    // vérification du titre:
    if (!isset($postTitle)) {
        return $titleMsg = $errorMsg['missingKey'];
    } elseif (empty($input)) {
        return $titleMsg = $errorMsg['missingValue'];
    } elseif (!$validTitle) {
        return $titleMsg = $errorMsg['invalidValue'];
    } else {
        $importanceMsg = "";
    }

    // vérification du niveau d'importance:
    if (!isset($postImportance)) {
        $importanceMsg = $errorMsg['missingKey'];
    } elseif (empty($input)) {
        $importanceMsg = $errorMsg['missingValue'];
    } elseif (!$validImportance) {
        $importanceMsg = $errorMsg['invalidValue'];
    } else {
        $importanceMsg = "";
    }

    // vérification du contenu:
    if (!isset($postContent)) {
        $contentMsg = $errorMsg['missingKey'];
    } elseif (empty($input)) {
        $contentMsg = $errorMsg['missingValue'];
    } elseif (!$validContent) {
        $contentMsg = $errorMsg['invalidValue'];
    } else {
        $contentMsg = "";
    }

    if ($validAuthorId && $validTitle && $validImportance && $validContent) {
        $createPost = blogPostCreate($dtb, $postAuthorId, $postTitle, $postStartDate, $postEndDate, $postImportance, $postContent);
        echo("L'article a bien été ajouté dans la BDD");
    } else {
        var_dump($postAuthorId, $postTitle, $postStartDate, $postEndDate, $postImportance, $postContent);
        echo ("Une erreur s'est produite");
        include "./resources/views/layouts/createPost.tpl.php";
    }
}else {
    include "./resources/views/layouts/createPost.tpl.php";
}