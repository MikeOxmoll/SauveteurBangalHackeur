<!DOCTYPE html>
<html>
<head>
	<title>Formulaire sauveteur</title>
	<link href="styleForm.css" rel="stylesheet">
</head>
<body>
<form class="box" action="#" method="post">
	<h1>Ajouter un sauveteur</h1>
    <div>
        <label for="name">Prénom :</label>
        <input type="text" id="name" name="prenom_sauveteur">
    </div>
    <div>
        <label for="name">Nom :</label>
        <input type="text" id="name" name="nom_sauveteur">
    </div>
    <div>
        <label for="mail">Image :</label>
        <input type="file" id="img" name="user_mail">
    </div>
    <div>
        <label for="msg">Données généalogiques :</label>
        <textarea type="text" id="msg" name="description_sauveteur"></textarea>
    </div>
    <div>
        <label for="msg">Carrière :</label>
        <textarea type="text" id="msg" name="description_sauveteur"></textarea>
    </div>
    <div>
    <input type="submit" name="" value="Envoyer">
    </div>
</form>
</body>
</html>