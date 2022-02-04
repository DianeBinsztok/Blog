<?php
include "./resources/views/header.tpl";

if(!empty($homeData)){
    //function count() == array.length for PHP
    for($i=0; $i<count($homeData); $i++){
        ?>

        <article>
            <h2><?=$homeData[$i]["title"]?></h2>
            <h3>Publié le <?= $homeData[$i]["end_date"]?> par <?= $homeData[$i]["alias"]?></h3>
            <p><?= $homeData[$i]["content"]?></p>
        </article>

        <?php
    }
}else{
    print("<p> Un problème s'est produit</p>");
}

include "./resources/views/footer.tpl";
?>
