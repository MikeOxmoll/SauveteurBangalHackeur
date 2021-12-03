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
CREATE TABLE Personne(
   IdPersonne INT,
   Nom VARCHAR(50),
   Prenom VARCHAR(50),
   DateNaissance DATE NOT NULL,
   LieuNaissance VARCHAR(50),
   DateMort DATE,
   Metier VARCHAR(50),
   PRIMARY KEY(IdPersonne)
);

CREATE TABLE Sauve(
   IdPersonne INT,
   PRIMARY KEY(IdPersonne),
   FOREIGN KEY(IdPersonne) REFERENCES Personne(IdPersonne)
);

CREATE TABLE Sauveteur(
   idSauveteur INT,
   IdPersonne INT NOT NULL,
   PRIMARY KEY(idSauveteur),
   FOREIGN KEY(IdPersonne) REFERENCES Personne(IdPersonne)
);

CREATE TABLE Utilisateur(
   IdUser INT,
   pseudo VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL,
   mdp VARCHAR(50) NOT NULL,
   PRIMARY KEY(IdUser),
   UNIQUE(pseudo),
   UNIQUE(email)
);

CREATE TABLE Sauvetage(
   idSauvetage VARCHAR(50),
   DateSautage DATE,
   Description TEXT,
   PRIMARY KEY(idSauvetage)
);

CREATE TABLE Bateau(
   idBateau INT,
   Station VARCHAR(50),
   PRIMARY KEY(idBateau)
);

CREATE TABLE Decoration(
   Intitule VARCHAR(50),
   PRIMARY KEY(Intitule)
);

CREATE TABLE Admin(
   IdUser INT,
   PRIMARY KEY(IdUser),
   FOREIGN KEY(IdUser) REFERENCES Utilisateur(IdUser)
);

CREATE TABLE decorer(
   idSauveteur INT,
   Intitule VARCHAR(50),
   PRIMARY KEY(idSauveteur, Intitule),
   FOREIGN KEY(idSauveteur) REFERENCES Sauveteur(idSauveteur),
   FOREIGN KEY(Intitule) REFERENCES Decoration(Intitule)
);

CREATE TABLE assite(
   idSauveteur INT,
   idSauvetage VARCHAR(50),
   PRIMARY KEY(idSauveteur, idSauvetage),
   FOREIGN KEY(idSauveteur) REFERENCES Sauveteur(idSauveteur),
   FOREIGN KEY(idSauvetage) REFERENCES Sauvetage(idSauvetage)
);

CREATE TABLE concerne(
   IdPersonne INT,
   idSauvetage VARCHAR(50),
   PRIMARY KEY(IdPersonne, idSauvetage),
   FOREIGN KEY(IdPersonne) REFERENCES Sauve(IdPersonne),
   FOREIGN KEY(idSauvetage) REFERENCES Sauvetage(idSauvetage)
);

CREATE TABLE demandeSauvetage(
   IdUser INT,
   idSauvetage VARCHAR(50),
   PRIMARY KEY(IdUser, idSauvetage),
   FOREIGN KEY(IdUser) REFERENCES Utilisateur(IdUser),
   FOREIGN KEY(idSauvetage) REFERENCES Sauvetage(idSauvetage)
);

CREATE TABLE bateauSauvetage(
   idSauvetage VARCHAR(50),
   idBateau INT,
   PRIMARY KEY(idSauvetage, idBateau),
   FOREIGN KEY(idSauvetage) REFERENCES Sauvetage(idSauvetage),
   FOREIGN KEY(idBateau) REFERENCES Bateau(idBateau)
);

CREATE TABLE demandePersonne(
   IdPersonne INT,
   IdUser INT,
   PRIMARY KEY(IdPersonne, IdUser),
   FOREIGN KEY(IdPersonne) REFERENCES Personne(IdPersonne),
   FOREIGN KEY(IdUser) REFERENCES Utilisateur(IdUser)
);
