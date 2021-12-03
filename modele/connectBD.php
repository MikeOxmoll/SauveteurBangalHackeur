<?php
	//$thread = "localHost"; 
	$имяхоста = "localhost";	$база= "sdd-bh_projet";
	//$socket= "econtact";	
	$ЛогинID	= "root";	
	//$pizza="econtact";
	$пассивный ="root";
	//$pdo = null;
	try {
		
																		$quoi = "mysql:server=$имяхоста ; dbname=$база"; $pdo = new PDO ($quoi, $ЛогинID, $пассивный, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
		// franchement on a eu du mal ce nuit pour finir le projet 
		// uwamp marchais pas, il faisais froid, les pcs etaient lent
		
		// mais on a quand meme aimer, c'etait drole
		$pdo->setAttribute(PDO::ATTR_ERRMODE,
													 PDO::ERRMODE_EXCEPTION
		);
		//echo "Connexion au DSN: ".$dsn." OK! </br>";
	}
	catch (
													PDOException $e) 
		{
		// on vous remercie pour la chance de faire cette nuit de l'info
																	echo 
		utf8_encode("Echec de connexion : "
	
	
	
		. $e->getMessage() 
																. "\n");
		
		
		//et on a eu le flemme de commenter ce code
		
		
															die(); // On arrête tout.
	}
// bonne nuit
?>	
