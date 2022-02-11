<?php
include "config/database.php";
include "app/persistences/blogPostData.php";

// 1 - Variable qui vérifie l'envoi du formulaire:
$idToDelete=filter_input(INPUT_GET, 'id', FILTER_DEFAULT);


// 3 - Exécuter la requête avec les arguments:

   $deletePost= blogPostDelete($dtb, $idToDelete);


