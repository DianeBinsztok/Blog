<?php

include "./resources/views/header.tpl";

if(!empty($postData)){
        ?>

        <article>
            <h2><?= $postData["title"]?> </h2>
            <h3>Publié par <?= $postData["alias"] ?> le <?= $postData["end_date"] ?></h3>
            <p><?= $postData["content"] ?></p>
        </article>
    <div class="comments_zone">
        <?php if(!empty($postComments)){
            foreach($postComments as $comment){?>
        <h3>Commentaires:</h3>
        <p class="comment_date_author">Ecrit par <?= $comment["alias"] ?>, le <time datetime="date"> <?= $comment["date"] ?></time></p>
            <p><?= $comment["content"] ?></p>
       <?php }
        }else{ ?>
            <p> Cet article n'a pas de commentaire</time></p>
        <?php }?>

    </div>

        <?php

}else{
    print("<p>Un problème s'est produit</p>");
}

include "./resources/views/footer.tpl";
?>

