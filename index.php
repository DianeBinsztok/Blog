<?php

// routes and pages requests:
$routes=[
    null=>["file"=>"accueil.php","mTitle"=>"Diane Binsztok - Mon CV", "mDesc" =>"Bienvenue sur la page d'accueil de mon CV"],
    "accueil"=>["file"=>"accueil.php","mTitle"=>"Blog - accueil", "mDesc" =>"Bienvenue sur la page d'accueil de mon CV"],
    "aPropos"=>["file"=>"aPropos.php","mTitle"=>"Blog - aPropos", "mDesc" =>"A propos de nous"],
    "contact"=>["file"=>"contact.php","mTitle"=>"Blog - contact", "mDesc" =>"Contactez-nous"]
];

// routing and custom metadata for each page:
$action = filter_input(INPUT_GET, 'action', FILTER_SANITIZE_STRING);
if ($routes[$action]) {
    $metaTitle=$routes[$action]['mTitle'];
    $metaDescription=$routes[$action]['mDesc'];
    require "header.php";
    include  $routes[$action]["file"];
    require "footer.php";
}else{
    include  "error.php";
}

?>