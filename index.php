<?php
// call the db
include './config/database.php';




// routes and pages requests:
$routes=[
    null=>["file"=>"./app/controllers/homeController.php","mTitle"=>"Blog - accueil", "mDesc" =>"Bienvenue sur notre blog"],
    "/"=> ["file"=> "./app/controllers/homeController.php","mTitle"=>"Blog - Accueil", "mDesc" =>"Bienvenue sur notre blog"],
    "accueil"=>["file"=>"./app/controllers/homeController.php","mTitle"=>"Blog - Accueil", "mDesc" =>"Bienvenue sur notre blog"],
    "aPropos"=>["file"=>"aPropos.php","mTitle"=>"Blog - A Propos", "mDesc" =>"A propos de nous"],
    "contact"=>["file"=>"contact.php","mTitle"=>"Blog - Contact", "mDesc" =>"Contactez-nous"]
];

// routing and custom metadata for each page:
$action = filter_input(INPUT_GET, 'action', FILTER_SANITIZE_STRING);
if ($routes[$action]) {
    $metaTitle=$routes[$action]['mTitle'];
    $metaDescription=$routes[$action]['mDesc'];
    require "./ressources/views/layouts/header.php";
    include  $routes[$action]["file"];
    // une fois que j'ai appelé app/controllers/homeController avec ma route, il va chercher blogPostData et sa fonction
    // lit: app/controllers/homeController > app/persistences/blogPostData.php > lastBlogPosts();

    require "./ressources/views/layouts/footer.php";
}else{
    include  "./ressources/views/errors/404.php";
}




?>