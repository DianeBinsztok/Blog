<?php
include "./resources/views/header.tpl";
    ?>
<h2>Ajouter un article:</h2>
<form action="index.php?action=createPost" method="post">
    <div>
        <label for="alias">Votre pseudo :</label>
        <select name="author_id" id="name_select">
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
        <?= $authorIdMsg?>
    </div>
    <div>
        <label for="title">Titre:</label>
        <input type="text" id="title" name="title">
        <?= $titleMsg?>
    </div>

    <div>
    <label for="start">Début de publication:</label>
        <input type="datetime-local" id="meeting-time"
               name="start" value="2022-02-08T19:30">
        <?= $starDateMsg?>
    </div>

    <div>
        <label for="end">Fin de publication:</label>
        <input type="datetime-local" id="meeting-time"
               name="end" value="2022-02-08T19:30"" >
        <?= $endDateMsg?>
    </div>


    <div>
        <select name="importance" id="importance_select">
            <option value="">--Niveau d'importance--</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
        </select>
        <?= $importanceMsg?>
    </div>

    <div>
        <label for="content">Contenu de votre article </label>
        <textarea id="msg" name="content"></textarea>
    </div>
    <?= $contentMsg?>
    <div class="button">
        <button type="submit" name="form_submit">Envoyer le message</button>
    </div>

</form>
<?php
include "./resources/views/footer.tpl";?>