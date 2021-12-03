<?php 
    if (!empty($msg)) {
        $url = './index.php?controle=utilisateur&action=erreur&param1=utilisateur&param2=inscr&arg='.$msg;
        header('Location:' . $url);
    } 
?>


<section class="section login">
    <!-- TITLE -->
    <h2 class="section__title">Liste des demandes d'ajout/modification</h2>
    <section class="contenuePage">
    
    <div class="liste-demandes">
      <h2>liste des demandes utilisateur :</h2>
      
      <a href="./index.php?controle=utilisateur&action=pageSauveteur" method="post">Benjamin Morel</a>
      <a href="#">Benjamin Morel</a>
      <a href="#">Benjamin Morel</a>
      <a href="#">Benjamin Morel</a>
      <a href="#">Benjamin Morel</a>
      <a href="#">Benjamin Morel</a>
	  <br></br>
    </div>
  </section>
</section>
