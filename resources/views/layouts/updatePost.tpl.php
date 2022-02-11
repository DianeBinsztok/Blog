<?php
include "./resources/views/header.tpl";
if($postData!==null){
?>
<h2>Modifier l' article:</h2>
<form action="index.php?action=updatePost" method="post">
    <div>
        <label for="alias">Pseudo</label>
        <select  name="author_id" id="name_select">
            <option value="">--Votre pseudo--</option>
            <option value="1">Asterix</option>
            <option value="2">Superman</option>
            <option value="3">Lucky Luke</option>
            <option value="4">Garfield</option>
            <option value="5">Snoopy</option>
            <option value="6">Tintin</option>
            <option value="7">Splinter</option>
            <option value="8">Matéo</option>
            <option value="9">Valentine</option>
        </select>
    </div>

    <div>
        <input type="hidden" name="id" value="<?= $postData["id"]?>">
    </div>

    <div>
        <label for="title" >Modifier le titre:</label>
        <input type="text" id="title" name="title" value="<?= $postData["title"]?>">
    </div>

    <div>
        <label for="start" >Début de publication:</label>
        <input type="datetime-local" id="meeting-time"
               name="start" value="2022-02-08T19:30">
    </div>

    <div>
        <label for="end" >Fin de publication:</label>
        <input type="datetime-local" id="meeting-time"
               name="end" value="2022-02-08T19:30"" >
    </div>

    <div>
        <label for="importance">Modifier le niveau d'importance</label>
        <select name="importance" id="importance_select">
            <option value="">--Niveau d'importance--</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
        </select>
    </div>

    <div>
        <label for="content">Modifier le contenu de votre article </label>
        <textarea id="msg" name="content"><?= $postData["content"]?></textarea>
    </div>
    <div class="button">
        <button type="submit" name="form_submit">Modifier l'article</button>
    </div>

</form>
<?php
}else{
    echo ("L'article que vous souhaitez modifier n'existe pas");
}
include "./resources/views/footer.tpl";
?>
