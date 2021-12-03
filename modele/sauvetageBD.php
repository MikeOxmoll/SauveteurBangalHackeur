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