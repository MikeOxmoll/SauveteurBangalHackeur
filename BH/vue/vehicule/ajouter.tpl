<section class="section login">
    <!-- TITLE -->
    <h2 class="section__title">Stock</h2>
    <div class="login__container container">
        <div class="login__content">
            <!-- FORM -->
            <form action="./index.php?controle=vehicule&action=ajouter" method="post" class="login__create" id="login-in">
                <h3 class="login__title">Ajouter un véhicule</h3>
                <div class="login__box">
                    <i class="bx bxs-car login__icon"></i>
                    <input type="text" name="nom" value="<?php echo $nom; ?>" placeholder="Nom" class="login__input">
                </div>
                <div class="login__box">
                    <i class="bx bxs-gas-pump login__icon"></i>
                    <input type="text" name="type" value="<?php echo $type; ?>" placeholder="Type" class="login__input">
                </div>
                <div class="login__box">
                    <i class="bx bx-stats login__icon"></i>
                    <input type="text" name="caract" value="<?php echo $caract; ?>" placeholder="Caractéristiques" class="login__input">
                </div>
                <div class="login__box">
                    <i class="bx bx-stats login__icon"></i>
                    <input type="text" name="details" value="<?php echo $details; ?>" placeholder="Détails" class="login__input">
                </div>
                <div class="login__box">
                    <i class="bx bxs-coin-stack login__icon" ></i>
                    <input type="text" name="prixJ" value="<?php echo $prixJ; ?>" placeholder="Prix / jour" class="login__input">
                </div>
                <div class="login__box">
                    <i class="bx bxs-coin-stack login__icon" ></i>
                    <input type="text" name="prixM" value="<?php echo $prixM; ?>" placeholder="Prix / Mois" class="login__input">
                </div>
                <div class="login__box">
                    <i class="bx bx-link-alt login__icon"></i>
                    <input type="text" name="img" value="<?php echo $img; ?>" placeholder="Image URL" class="login__input">
                </div>
                
                
                <!-- ADD -->
                <input type="submit" value="Ajouter" class="button login__button"></input>
            </form>
        </div>
    </div>
</section>