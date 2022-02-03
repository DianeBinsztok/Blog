<?php
include './config/secret.php';

// error management
try {
    $dtb=new PDO('mysql:host=localhost;dbname=Blog', $username, $password);
    //Blog is the name of the dtb as defined on nginx-Adminer (so "Blog", and not "blog_dump.sql")
    foreach($dtb->query('SELECT * from articles') as $row) {
        // test : display my data on rows separated by a <br/>
        //echo implode("<br/>", $row);
    }
    $dbh = null;
} catch (PDOException $e) {
    print "Erreur !: " . $e->getMessage() . "<br/>";
    die();
}

?>