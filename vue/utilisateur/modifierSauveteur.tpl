<?php 
    if (!empty($msg)) {
        $url = './index.php?controle=utilisateur&action=erreur&param1=utilisateur&param2=inscr&arg='.$msg;
        header('Location:' . $url);
    } 
?>


<section class="section login">
    <!-- TITLE -->
    <h2 class="section__title">Modification</h2>
    <div class="login__container container">
        <div class="login__content">
            <!-- FORM -->
            <div class="login__form">
                <form action="./index.php?controle=utilisateur&action=modifierSauveteur" method="post" class="login__create" id="login-in">
                    <h3 class="login__title">Modifier des informations</h3>
                    <div class="login__box">
                        <i class="bx bxs-user login__icon"></i>
                        <input type="text" name="nom" value="<?php echo $nom; ?>" placeholder="Nom" class="login__input">
                    </div>
                    <div class="login__box">
                        <i class="bx bxs-user login__icon"></i>
                        <input type="text" name="prenom" value="<?php echo $prenom; ?>" placeholder="Prenom" class="login__input">
                    </div>
                    <div class="login__box">
       
                        <input type="email" name="etatcivil" value="<?php echo $etatcivil; ?>" placeholder="Etat-civil" class="login__input">
                    </div>
                    <div class="login__box">
                       
                        <input type="password" name="donneegenea" value="<?php echo $donneesgenea; ?>" placeholder="Données généalogiques" class="login__input">
                       
                    </div>
                    <div class="login__box">
                        
                        <input type="text" name="carriere" value="<?php echo $carriere; ?>" placeholder="Carrière" class="login__input">
                    </div>
                    <div class="login__box">
                       
                        <input type="text" name="decorations" value="<?php echo $decorations; ?>" placeholder="Décorations" class="login__input">
                    </div>
					<div class="login__box">
                        
                        <input type="text" name="sauvetage" value="<?php echo $sauvetage; ?>" placeholder="Sauvetage" class="login__input">
                    </div>
                    <!-- SIGN IN -->
                    <input type="submit" value="Envoyer" class="button login__button"></input>
                    <!-- <p style="color: red;"><?php echo $msg; ?></p> -->
                    
                </form>
            </div>
        </div>
    </div>
</section>
