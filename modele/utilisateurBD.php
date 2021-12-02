<?php 

    // vérifie si le client est présent dans la base de donnée.
    function verif_ident_client_BD($ident, $mdp, &$Profil) 
    {
        require('./modele/connectBD.php');
        try {
            $sql = "SELECT * FROM `client` WHERE pseudo=:ident AND mdp=:mdp OR email=:ident AND mdp=:mdp";
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':ident', $ident);
            $commande->bindParam(':mdp', $mdp);
            $bool = $commande->execute();
    
            if ($bool) {
                $Resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
                if (count($Resultat) != 0) $Resultat[0]['role'] = 'client';
                // var_dump($Resultat); die();
            }
        }
        catch (PDOException $e) {
            echo utf8_encode('Echec de select : ' . $e->getMessage() . '\n');
            die();
        }
        if (count($Resultat)==0) {
            $Profil = array(); // retourne un tableau vide
            return false;
        }
        else {
            $Profil = $Resultat[0];
            return true;
        }
    }

    // vérifie si le loueur est présent dans la base de donnée.
    function verif_ident_loueur_BD($ident, $mdp, &$Profil)  
    {
        require('./modele/connectBD.php');
        try {
            $sql = "SELECT * FROM `loueur` WHERE pseudo=:ident AND mdp=:mdp OR email=:ident AND mdp=:mdp";
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':ident', $ident);
            $commande->bindParam(':mdp', $mdp);
            $bool = $commande->execute();
    
            if ($bool) {
                $Resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
                if (count($Resultat) != 0)
                    $Resultat[0]['role'] = 'loueur';
                // var_dump($Resultat); die();
            }
        }
        catch (PDOException $e) {
            echo utf8_encode('Echec de select : ' . $e->getMessage() . '\n');
            die();
        }

        if (count($Resultat)==0) {
            $Profil = array(); // retourne un tableau vide
            return false;
        }
        else {
            $Profil = $Resultat[0];
            return true;
        }
    }

    // insère un nouveau client dans la base de donnée.
    function inscr_BD($nom, $pseudo, $email, $mdp)
    {
        require('./modele/connectBD.php');
        $sql = "INSERT INTO `client` (nom, pseudo, email, mdp)
                 VALUES (:nom, :pseudo, :email, :mdp)";
        try {
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':nom', $nom);
            $commande->bindParam(':pseudo', $pseudo);
            $commande->bindParam(':email', $email);
            $commande->bindParam(':mdp', $mdp);
            $bool = $commande->execute();

            if ($bool) return true;
            else return false;
        }

        catch (PDOException $e) {
            echo utf8_encode('Echec de insert into : ' . $e->getMessage() . '.\n');
            die();
        }
    }

    // vérifie si un email est présent dans la base de donnée.
    function verif_inscr_BD_valide_email($email) 
    {
        require('./modele/connectBD.php');
        try {
            $sql = "SELECT * FROM `client` WHERE email=:email";
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':email', $email);
            $bool = $commande->execute();
    
            if ($bool) {
                $Resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
                // var_dump($Resultat); die();
            }
        }
        catch (PDOException $e) {
            echo utf8_encode('Echec de select : ' . $e->getMessage() . '\n');
            die();
        }

        if (count($Resultat)==0) return true;
        else return false;
    }

    // vérifie si un pseudo est présent dans la base de donnée.
    function verif_inscr_BD_valide_pseudo($pseudo) 
    {
        require('./modele/connectBD.php');
        try {
            $sql = "SELECT * FROM `client` WHERE pseudo=:pseudo";
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':pseudo', $pseudo);
            $bool = $commande->execute();
    
            if ($bool) {
                $Resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
                // var_dump($Resultat); die();
            }
        }
        catch (PDOException $e) {
            echo utf8_encode('Echec de select : ' . $e->getMessage() . '\n');
            die();
        }

        if (count($Resultat)==0) return true;
        else return false;
    }
    

?>
