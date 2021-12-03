<?php 

    // vérifie si le client est présent dans la base de donnée.
    function verif_ident_user_BD($ident, $mdp, &$Profil) 
    {
        return true;
        require('./modele/connectBD.php');
        try {
            $sql = "SELECT * FROM `utilisateur` WHERE pseudo=:ident AND mdp=:mdp OR email=:ident AND mdp=:mdp";
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':ident', $ident);
            $commande->bindParam(':mdp', $mdp);
            $bool = $commande->execute();
    
            if ($bool) {
                $Resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
                if (count($Resultat) != 0) $Resultat[0]['role'] = 'user';
                 var_dump($Resultat); die();
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
    function verif_ident_admin_BD($ident, $mdp, &$Profil)  
    {
        require('./modele/connectBD.php');
        try {
            $sql = "SELECT * FROM `admin` WHERE pseudo=:ident AND mdp=:mdp OR email=:ident AND mdp=:mdp";
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':ident', $ident);
            $commande->bindParam(':mdp', $mdp);
            $bool = $commande->execute();
    
            if ($bool) {
                $Resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
                if (count($Resultat) != 0)
                    $Resultat[0]['role'] = 'admin';
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
        $sql = "INSERT INTO `utilisateur` (nom, pseudo, email, mdp)
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
            $sql = "SELECT * FROM `utilisateur` WHERE email=:email";
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
            $sql = "SELECT * FROM `utilisateur` WHERE pseudo=:pseudo";
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
