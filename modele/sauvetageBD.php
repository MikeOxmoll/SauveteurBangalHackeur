<?php 

function inscr_demandePersonne_bd($idPersonne, $idUser){
    require('./modele/connectBD.php');
     $sql = "INSERT INTO `demandePersonne` (IdPersonne, IdUser)
                 VALUES (:IdPersonne, :IdUser)";
        try {
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':IdPersonne', $idPersonne);
            $commande->bindParam(':IdUser', $idUser);
            $bool = $commande->execute();
            if ($bool) return true;
            else return false;
        }

        catch (PDOException $e) {
            echo utf8_encode('Echec de insert into : ' . $e->getMessage() . '.\n');
            die();
        }
}

function inscr_demandeSauvetage_bd($idSauvetage, $idUser){
    require('./modele/connectBD.php');
     $sql = "INSERT INTO `demandeSauvetage` (idSauvetage, IdUser)
                 VALUES (:idSauvetage, :IdUser)";
        try {
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':idSauvetage', $idSauvetage);
            $commande->bindParam(':IdUser', $idUser);
            $bool = $commande->execute();
            if ($bool) return true;
            else return false;
        }

        catch (PDOException $e) {
            echo utf8_encode('Echec de insert into : ' . $e->getMessage() . '.\n');
            die();
        }

}

function get_demandeSautage(){
    require('./modele/connectBD.php');
    try {
        $sql = "SELECT * FROM `demandeSauvetage`";
        $commande = $pdo->prepare($sql);
        $bool = $commande->execute();
        if ($bool) {
            $Resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
            // var_dump($Resultat); die();
        }
        return $Resultat;

    }
    catch (PDOException $e) {
        echo utf8_encode('Echec de select : ' . $e->getMessage() . '\n');
        die();
    }

}

function get_demandePersonne(){
    require('./modele/connectBD.php');
    try {
        $sql = "SELECT * FROM `demandePersonne`";
        $commande = $pdo->prepare($sql);
        $bool = $commande->execute();
        if ($bool) {
            $Resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
            // var_dump($Resultat); die();
        }
        return $Resultat;

    }
    catch (PDOException $e) {
        echo utf8_encode('Echec de select : ' . $e->getMessage() . '\n');
        die();
    }

}

---

    
    function getSauvetages(){
         require('./modele/connectBD.php');
        try {
            $sql = "SELECT * FROM `sauvetage`";
            $commande = $pdo->prepare($sql);
            $bool = $commande->execute();
            if ($bool) {
                $Resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
                // var_dump($Resultat); die();
            }
            return $Resultat;
    
        }
        catch (PDOException $e) {
            echo utf8_encode('Echec de select : ' . $e->getMessage() . '\n');
            die();
        }
    }
    
    function getDecorations(){
        require('./modele/connectBD.php');
        $Resultat = array();
       try {
           $sql = "SELECT * FROM `decoration`";
           $commande = $pdo->prepare($sql);
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
       return $Resultat;
    }