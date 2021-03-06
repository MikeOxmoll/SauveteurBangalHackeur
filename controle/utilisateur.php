<?php 

   // gère l'authentification
	function ident() 
	{
		$ident = isset($_POST['ident']) ? test_input($_POST['ident']) : '';
		$mdp = isset($_POST['mdp']) ? test_input($_POST['mdp']) : '';
		$msg = '';

		if (count($_POST)==0){
			$controle = "utilisateur"; $action = "ident";
			require('./vue/layout.tpl');
		}
		
		else{
			require('./modele/utilisateurBD.php');
			if (!verif_ident_input($ident, $mdp, $mdp_c) ||
				!verif_ident_user_BD($ident, $mdp_c, $Profil) /*&&
				!verif_ident_admin_BD($ident, $mdp_c, $Profil)*/){
				$msg = 'Identifiant ou mot de passe incorrect';
				$controle = "utilisateur"; $action = "ident";
				require('./vue/layout.tpl');
			}

			else{
            // authentification réussit
				// die("Tous va bien!");
				$_SESSION['profil'] = $Profil;
				$url = './index.php?controle=utilisateur&action=accueil';
				header('Location:' . $url);
			}
		}
	}

   // gère l'inscription d'un nouveau client
	function inscr()
   {
	   
      // Définition des variables
      $nom = isset($_POST['nom']) ? test_input($_POST['nom']) : '';
      $pseudo = isset($_POST['pseudo']) ? test_input($_POST['pseudo']) : '';
      $email = isset($_POST['email']) ? test_input($_POST['email']) : '';
      $mdp = isset($_POST['mdp']) ? test_input($_POST['mdp']) : '';
      $msg = '';


      if (count($_POST)==0) {
         $controle = "utilisateur"; $action = "inscr";
         require('./vue/layout.tpl');
      }
      else {
         require('./modele/utilisateurBD.php');

         if (!verif_inscr_input($nom, $pseudo, $email, $mdp, $mdp_c) || 
             !verif_inscr_BD_valide_email($email) || 
             !verif_inscr_BD_valide_pseudo($pseudo)) {
            $msg = 'Erreur de saisie, Reéssayez !';
            $controle = "utilisateur"; $action = "inscr";
            require('./vue/layout.tpl');
         }
         else {
            
            // inscription réussit, authentification automatique.
            if (verif_ident_user_BD($email, $mdp_c, $Profil)) {
               // die("OK tous c'est bien passé.");
               $_SESSION['profil'] = $Profil;
               $url = './index.php?controle=utilisateur&action=accueil';
               header('Location:' . $url);
            }
            // inscription échoué : non implémenté
            die("Quelque chos n'a pas fonctionnée.");
         }
      }
   }

   // gère la déconnexion 
   function deconnexion() 
   {
      session_destroy();
      $url = './index.php?controle=utilisateur&action=accueil';
      header('Location:' . $url);
   }

   // gère l'accueil
	function accueil() 
	{
		
		$controle = 'accueil';
		$action = 'accueil';
		
		require ('./vue/layout.tpl');   
	}
	
	function ajoutSauveteur()
	{
		require('./modele/sauvetageBD.php');
		
			
		// Définition des variables
      $nom = isset($_POST['nom']) ? test_input($_POST['nom']) : '';
      $prenom = isset($_POST['prenom']) ? test_input($_POST['prenom']) : '';
      $etatcivil = isset($_POST['etatcivil']) ? test_input($_POST['etatcivil']) : '';
	  $donneesgenea = isset($_POST['donneesgenea']) ? test_input($_POST['donneesgenea']) : '';
	  $carriere = isset($_POST['carriere ']) ? test_input($_POST['carriere ']) : '';
	  $decorations = isset($_POST['decorations']) ? test_input($_POST['decorations']) : '';
      $sauvetage = isset($_POST['sauvetage']) ? test_input($_POST['sauvetage']) : '';

     /* $_SESSION['decorations'] = getDecorations();
      $_SESSION['sauvetages'] = getSauvetages();*/

      if (count($_POST)==0 || empty($nom) || empty($prenom)) {
         $controle = "utilisateur"; $action = "ajoutSauveteur";
         require('./vue/layout.tpl');
      }
      else {
        require('./modele/utilisateurBD.php');
            
        ajoutSauveteurBD($nom, $prenom, $etatcivil, $donneesgenea, $carriere, $decorations, $sauvetage);
		$url = './index.php?controle=utilisateur&action=sauveteurs';
        header('Location:' . $url);
            
           
      }
		
	}
	
	function modifierSauveteur()
	{
		
			
		// Définition des variables
      $nom = isset($_POST['nom']) ? test_input($_POST['nom']) : '';
      $prenom = isset($_POST['prenom']) ? test_input($_POST['prenom']) : '';
      $etatcivil = isset($_POST['etatcivil']) ? test_input($_POST['etatcivil']) : '';
	  $donneesgenea = isset($_POST['donneesgenea']) ? test_input($_POST['donneesgenea']) : '';
	  $carriere = isset($_POST['carriere ']) ? test_input($_POST['carriere ']) : '';
	  $decorations = isset($_POST['decorations']) ? test_input($_POST['decorations']) : '';
      $sauvetage = isset($_POST['sauvetage']) ? test_input($_POST['sauvetage']) : '';

      if (count($_POST)==0 || empty($nom) || empty($prenom)) {
         $controle = "utilisateur"; $action = "modifierSauveteur";
         require('./vue/layout.tpl');
      }
      else {
        require('./modele/utilisateurBD.php');
            
        modifierSauveteurBD($nom, $prenom, $etatcivil, $donneesgenea, $carriere, $decorations, $sauvetage);
		$url = './index.php?controle=utilisateur&action=sauveteurs';
        header('Location:' . $url);
            
           
      }
		
	}
	
	function sauveteurs()
	{
		 $controle = "utilisateur"; $action = "sauveteurs";
         require('./vue/layout.tpl');
	}
	
	function pageSauveteur()
	{
		$controle = "utilisateur"; $action = "pageSauveteur";
        require('./vue/layout.tpl');
	}
	
	function listeDemandes()
	{
		$controle = "utilisateur"; $action = "listeDemandes";
        require('./vue/layout.tpl');
	}

   // Vérifie si tous les champs du formulaire d'authentification sont
   // correctement renseignés
	function verif_ident_input($ident, $mdp, &$mdp_c='') 
   {
		if (empty($ident) || empty($mdp))
			return false;
		$mdp_c = $mdp;//crypt($mdp, '$6$rounds=5000$anexamplestringforsalt$');
		return true;
	}

   // Vérifie si tous les champs du formulaire d'inscription sont
   // correctement renseignés
	function verif_inscr_input($nom, $pseudo, $email , $mdp, &$mdp_c='') : bool
   {
      if (empty($nom) || empty($pseudo) || empty($email) || empty($mdp) )
         return false;
      if (!verif_alpha($nom))
         return false;
      if (!verif_input_size($pseudo, 3) || !verif_alpha($pseudo[0]) || !verif_alpha_num($pseudo))
         return false;
      if (!verif_email($email))
         return false;
      $mdp_c = $mdp; //= crypt($mdp, '$6$rounds=5000$anexamplestringforsalt$');
      
      return true;
   }


   // Vérifie si une chaîne est alphabétique
	function verif_alpha(string $str) : bool
   {
		return preg_match("/^[a-zA-Z]+$/", $str);
	}

   // Vérifie si une chaîne est alpha-numérique
	function verif_alpha_num(string $str) : bool
   {
		return preg_match("/^[a-zA-Z0-9 ]+$/", $str);
	}

   // Vérifie si l'adresse e-mail est bien formée.
	function verif_email(string $email) : bool
   {
		return filter_var($email, FILTER_VALIDATE_EMAIL);
	}

   // Vérifie si la longueur de la chaîne est supérieure à une taille fixée.
	function verif_input_size(string $str, int $size) : bool
   {
		return strlen($str) >= $size;
	}

   // Fonction test_input
	function test_input(string $data) : string
   {
		$data = trim($data);
		$data = stripslashes($data);
		$data = htmlspecialchars($data);
		return $data;
	}

   function erreur()
   {
      $controle = 'erreur'; $action = 'flashMessage';
      require ('./vue/layout.tpl');
   }

?>
