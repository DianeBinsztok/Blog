<?php
// call the db
include './config/database.php';




// routes and pages requests:
// les clés du tableau sont les input GET ( enregistrés ds la var $action )
$routes=[
    null=>["file"=>"./app/controllers/homeController.php","mTitle"=>"Blog - accueil", "mDesc" =>"Bienvenue sur notre blog"],
    "/"=> ["file"=> "./app/controllers/homeController.php","mTitle"=>"Blog - Accueil", "mDesc" =>"Bienvenue sur notre blog"],
    "accueil"=>["file"=>"./app/controllers/homeController.php","mTitle"=>"Blog - Accueil", "mDesc" =>"Bienvenue sur notre blog"],
    "postPage"=>["file"=>"./app/controllers/blogPostController.php" ,"postId"=>0, "mTitle"=>"Blog - Détail du post", "mDesc" =>"Détail du post"],
];

// routing and custom metadata for each page:


$action = filter_input(INPUT_GET, 'action', FILTER_SANITIZE_STRING);
if ($routes[$action]) {
    $metaTitle=$routes[$action]['mTitle'];
    $metaDescription=$routes[$action]['mDesc'];

    include  $routes[$action]["file"];
    // une fois que j'ai appelé app/controllers/homeController avec ma route, il va chercher blogPostData et sa fonction
    // lit: app/controllers/homeController > app/persistences/blogPostData.php > lastBlogPosts();

}else{
    include "./resources/views/errors/404.php";
}



?>