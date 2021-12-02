-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Lun 08 Novembre 2021 à 01:39
-- Version du serveur :  5.7.11
-- Version de PHP :  7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `cliennt` (
  `id` int(11) UNSIGNED NOT NULL,
  `nom` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pseudo` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mdp` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `idE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `pseudo`, `mdp`, `email`, `idE`) VALUES
(2, 'Voyer', 'Avoyer75', '$6$rounds=5000$anexamplestringf$cganXrEeVcQ.SuZ6zs.ptb5ulJ9chgHT69ENOJ7A9RPikHEFDgs2Yeq1PdeWciEvhGev2fbnL9bxv7H.546rS/', 'voyer@email.com', 2),
(3, 'Burban', 'Cburban92', '$6$rounds=5000$anexamplestringf$cganXrEeVcQ.SuZ6zs.ptb5ulJ9chgHT69ENOJ7A9RPikHEFDgs2Yeq1PdeWciEvhGev2fbnL9bxv7H.546rS/', 'burban@email.com', 3),
(4, 'Agez', 'fAgez03', '$6$rounds=5000$anexamplestringf$cganXrEeVcQ.SuZ6zs.ptb5ulJ9chgHT69ENOJ7A9RPikHEFDgs2Yeq1PdeWciEvhGev2fbnL9bxv7H.546rS/', 'agez@email.com', 1),
(5, 'Dupont ', 'dupont', '$6$rounds=5000$anexamplestringf$cganXrEeVcQ.SuZ6zs.ptb5ulJ9chgHT69ENOJ7A9RPikHEFDgs2Yeq1PdeWciEvhGev2fbnL9bxv7H.546rS/', 'dupont@gmail.com', 1),
(6, 'Perrier ', 'perrier13', '$6$rounds=5000$anexamplestringf$cganXrEeVcQ.SuZ6zs.ptb5ulJ9chgHT69ENOJ7A9RPikHEFDgs2Yeq1PdeWciEvhGev2fbnL9bxv7H.546rS/', 'perrier@email.com', 4),
(13, 'Durant', 'durant', '$6$rounds=5000$anexamplestringf$cganXrEeVcQ.SuZ6zs.ptb5ulJ9chgHT69ENOJ7A9RPikHEFDgs2Yeq1PdeWciEvhGev2fbnL9bxv7H.546rS/', 'durant@gmail.com', 1);

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE `entreprise` (
  `id` int(11) NOT NULL,
  `nom` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `adresse` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `entreprise`
--

INSERT INTO `entreprise` (`id`, `nom`, `adresse`) VALUES
(1, 'Etransport', '1 adresse Etransport'),
(2, 'VIPtravel', '2 adresse VIPtravel'),
(3, 'RedDrive', '3 adresse RedDrive'),
(4, 'SunMusic', '4 adresse SunMusic'),
(5, 'Toyota', '5 adresse Toyota');

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `id` int(10) UNSIGNED NOT NULL,
  `ide` int(11) NOT NULL,
  `idv` int(11) NOT NULL,
  `dateD` date NOT NULL,
  `dateF` date NOT NULL,
  `valeur` int(11) NOT NULL,
  `etatR` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `facture`
--

INSERT INTO `facture` (`id`, `ide`, `idv`, `dateD`, `dateF`, `valeur`, `etatR`) VALUES
(1, 1, 1, '2021-10-15', '2021-10-15', 1000, 0),
(2, 2, 1, '2021-10-14', '2021-10-14', 1000, 0);

-- --------------------------------------------------------

--
-- Structure de la table `loueur`
--

CREATE TABLE `loueur` (
  `id` int(11) NOT NULL,
  `nom` text NOT NULL,
  `pseudo` text NOT NULL,
  `email` text NOT NULL,
  `mdp` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `loueur`
--

INSERT INTO `loueur` (`id`, `nom`, `pseudo`, `email`, `mdp`) VALUES
(1, 'Loueur', 'loueur', 'loueur@gmail.com', '$6$rounds=5000$anexamplestringf$cganXrEeVcQ.SuZ6zs.ptb5ulJ9chgHT69ENOJ7A9RPikHEFDgs2Yeq1PdeWciEvhGev2fbnL9bxv7H.546rS/');

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

CREATE TABLE `vehicule` (
  `ref` int(11) NOT NULL,
  `nom` text NOT NULL,
  `type` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `caract` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `details` text,
  `state` tinyint(1) DEFAULT '0',
  `img` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `prixJ` double NOT NULL,
  `prixM` double NOT NULL,
  `debutL` date DEFAULT NULL,
  `finL` date DEFAULT NULL,
  `idL` int(11) NOT NULL DEFAULT '1',
  `idC` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vehicule`
--

INSERT INTO `vehicule` (`ref`, `nom`, `type`, `caract`, `details`, `state`, `img`, `prixJ`, `prixM`, `debutL`, `finL`, `idL`, `idC`) VALUES
(1, 'BMW X5', 'Diesel', 'Nombre de places : 5, \nBoîte de vitesse : automatique, \nMoteur : 3.0d381', 'La BMW W5 faisant partie de notre catégorie moyenne est une voiture familiale avec un confort et une fiabilité excellente.', 1, 'BMW X5 (moyen).png', 19.99, 449.99, NULL, NULL, 1, 5),
(2, 'Ferrari 488', 'Diesel', 'Nombre de places : 2, \nBoîte de vitesse : manuelle, \nMoteur : V8', 'La Ferrari 488 faisant partie de notre catégorie luxe est une voiture de sport très rapide avec une excellente tenue de route.', 0, 'Ferrari-488 (luxe).png', 83.99, 2499.99, NULL, NULL, 1, 2),
(3, 'Dacia Duster', 'Diesel', 'Nombre de places : 5\nBoîte de vitesse : automatique\nMoteur : 3.0d381', 'La Dacia Duster faisant partie de notre catégorie moyenne est une voiture familiale avec un confort et une fiabilité excellente.', 1, 'dacia duster (low coast).png', 14.99, 399.99, NULL, NULL, 1, 13),
(4, 'Fiat Multipla', 'DIesel', 'Nombre de places : 6\nBoîte de vitesse : manuelle\nMoteur : 1.6 16v', 'La Fiat Multipla faisant partie de notre catégorie low coast est une voiture adaptée aux petits budgets permettant de faire des trajets quotidiens.', 0, 'Fiat Multipla (low coast).png', 9.99, 249.99, NULL, NULL, 1, 3),
(5, 'Lamborghini Gallardo', 'Diesel', 'Nombre de place : 2\nBoîte de vitesse : manuelle\nMoteur : V10', 'La Lamborghini Gallardo faisant partie de notre catégorie luxe est une voiture de sport très rapide avec une excellente tenue de route.', 1, 'lamborghini gallardo (luxe).png', 99.99, 2699.99, NULL, NULL, 1, 4);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `entreprise`
--
ALTER TABLE `entreprise`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `loueur`
--
ALTER TABLE `loueur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD PRIMARY KEY (`ref`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `entreprise`
--
ALTER TABLE `entreprise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `facture`
--
ALTER TABLE `facture`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `loueur`
--
ALTER TABLE `loueur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `vehicule`
--
ALTER TABLE `vehicule`
  MODIFY `ref` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
