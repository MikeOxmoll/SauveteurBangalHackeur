<?php 
    if (!empty($msg)) {
        $url = './index.php?controle=utilisateur&action=erreur&param1=utilisateur&param2=inscr&arg='.$msg;
        header('Location:' . $url);
    } 
?>


<section class="section login">
    <!-- TITLE -->
    <h2 class="section__title">Sauveteurs en mer Dunkerquois</h2>
    <section class="contenuePage">
    <div class="description">
      <div class="titre-desc">
        <h2>Quel dunkerquois n’a jamais lu les plaques commémoratives  apposées sur notre Leughenaer?</h2>
        <p>Sur cette page on trouvera les sauveteurs décorés de  la Légion  d’Honneur et ou du Mérite Maritime pour services rendus.

La deuxième plaque apposée par les soins de la Société Humaine de Dunkerque rend hommage aux trois pilotes décédés dans le naufrage des TROIS SOEURS. La deuxième partie est un hommage à Jean-François Tixier sauveteur émérite des premières années de la société et qui perdra la vie en voulant sauver son prochain.

La station de Gravelines a aussi des sauveteurs qui ont été remerciés par l’attribution de la Légion d’Honneur.

Les légionnaires et titulaires du Mérite Maritime ont souvent été patron ou sous-patron des canots de sauvetage, patron de remorqueur, etc.

Ces fonctions et les défraiements qui leur sont liés ont été définis dès la création de la SCSN. Extrait du réglement ici .</p>
      </div>
      
    </div>
    <div class="liste-sauveteur">
      <h2>Membres fondateurs de la Société Humaine de Dunkerque :</h2>
      <a href="./index.php?controle=utilisateur&action=pageSauveteur" method="post">Benjamin Morel</a>
      <a href="#">Benjamin Morel</a>
      <a href="#">Benjamin Morel</a>
      <a href="#">Benjamin Morel</a>
      <a href="#">Benjamin Morel</a>
      <a href="#">Benjamin Morel</a>
	  <br></br>
    </div>
	<form action="./index.php?controle=utilisateur&action=ajoutSauveteur" method="post" class="login__create" id="login-in">
	<input type="submit" value="Ajouter un sauveteur" class="button login__button"></input>
	
  </section>
</section>
