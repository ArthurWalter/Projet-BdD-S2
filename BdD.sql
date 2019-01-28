-- phpMyAdmin SQL Dump
-- version 4.0.10deb1ubuntu0.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Sam 05 Janvier 2019 à 17:31
-- Version du serveur: 5.5.61-MariaDB-1ubuntu0.14.04.1
-- Version de PHP: 7.1.15-1+ubuntu14.04.1+deb.sury.org+2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `walter59u_projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `ARBITRE`
--

CREATE TABLE IF NOT EXISTS `ARBITRE` (
  `no_arbitre` int(11) NOT NULL,
  `nom_a` varchar(255) NOT NULL,
  `prenom_a` varchar(255) NOT NULL,
  `date_nais` date NOT NULL,
  `no_nation` int(11) NOT NULL,
  PRIMARY KEY (`no_arbitre`),
  KEY `no-nation` (`no_nation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ARBITRE`
--

INSERT INTO `ARBITRE` (`no_arbitre`, `nom_a`, `prenom_a`, `date_nais`, `no_nation`) VALUES
(1, 'Barnes', 'Wayne', '1979-04-20', 9),
(2, 'Clancy', 'George ', '1977-01-12', 8),
(3, 'Doyle', 'JP', '1979-08-03', 9),
(4, 'Garcès', 'Jérôme ', '1973-10-24', 3),
(5, 'Gaüzère', 'Pascal', '1977-04-27', 3),
(6, 'Lacey', 'John', '1973-10-12', 8),
(7, 'Owens', 'Nigel', '1971-06-18', 6),
(8, 'Poite', 'Romain', '1975-11-14', 3),
(9, 'Jackson', 'Glen ', '1975-09-23', 1),
(10, 'Pollock', 'Chris', '1972-11-09', 1),
(11, 'Joubert', 'Craig ', '1977-11-08', 5),
(12, 'Peyper', 'Jaco', '1980-05-13', 5);

-- --------------------------------------------------------

--
-- Structure de la table `CARTON`
--

CREATE TABLE IF NOT EXISTS `CARTON` (
  `no_match` int(11) NOT NULL,
  `no_joueur` int(11) NOT NULL,
  `type_c` varchar(255) NOT NULL,
  `min_c` int(11) NOT NULL,
  PRIMARY KEY (`no_match`,`no_joueur`),
  KEY `CARTON_ibfk_2` (`no_joueur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `CARTON`
--

INSERT INTO `CARTON` (`no_match`, `no_joueur`, `type_c`, `min_c`) VALUES
(1, 42, 'rouge', 12),
(5, 42, 'rouge', 12),
(8, 42, 'rouge', 12),
(9, 82, 'ROUGE', 120),
(9, 93, 'JAUNE', 10),
(9, 96, 'JAUNE', 10),
(9, 105, 'jaune', 15),
(10, 42, 'rouge', 42),
(11, 42, 'rouge', 15);

-- --------------------------------------------------------

--
-- Structure de la table `EQUIPE`
--

CREATE TABLE IF NOT EXISTS `EQUIPE` (
  `no_equipe` int(11) NOT NULL,
  `nom_equipe` varchar(255) NOT NULL,
  `no_nation` int(11) NOT NULL,
  PRIMARY KEY (`no_equipe`),
  KEY `no-nation` (`no_nation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `EQUIPE`
--

INSERT INTO `EQUIPE` (`no_equipe`, `nom_equipe`, `no_nation`) VALUES
(1, 'All-Blacks', 1),
(2, 'Wallabies', 2),
(3, 'Bleus', 3),
(4, 'Argentine', 4),
(5, 'les Springboks', 5),
(6, 'les Dragons rouges', 6),
(7, 'le XV du Trèfle', 7),
(8, 'XV du chardon', 8),
(9, 'Les Lelos', 10),
(10, 'Les Aigles de mer', 11),
(11, 'Les Welwitschias', 12);

-- --------------------------------------------------------

--
-- Structure de la table `EST-CAPITAINE`
--

CREATE TABLE IF NOT EXISTS `EST-CAPITAINE` (
  `no_equipe` int(11) NOT NULL,
  `no_joueur` int(11) NOT NULL,
  PRIMARY KEY (`no_equipe`,`no_joueur`),
  KEY `no_joueur_cap` (`no_joueur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `EST-CAPITAINE`
--

INSERT INTO `EST-CAPITAINE` (`no_equipe`, `no_joueur`) VALUES
(1, 1),
(2, 11),
(3, 21),
(4, 31),
(5, 41),
(6, 51),
(7, 61),
(8, 71),
(9, 81),
(10, 91),
(11, 101);

-- --------------------------------------------------------

--
-- Structure de la table `JOUE`
--

CREATE TABLE IF NOT EXISTS `JOUE` (
  `no_match` int(11) NOT NULL,
  `no_joueur` int(11) NOT NULL,
  `titulaire` varchar(255) NOT NULL,
  `poste` varchar(255) NOT NULL,
  `nb_essais` int(11) NOT NULL,
  `nb_tr` int(11) NOT NULL,
  `nb_pen` int(11) NOT NULL,
  `nb_dr` int(11) NOT NULL,
  PRIMARY KEY (`no_match`,`no_joueur`),
  KEY `no_joueur_joue` (`no_joueur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `JOUE`
--

INSERT INTO `JOUE` (`no_match`, `no_joueur`, `titulaire`, `poste`, `nb_essais`, `nb_tr`, `nb_pen`, `nb_dr`) VALUES
(1, 42, 'titulaire', 'l', 1, 1, 1, 1),
(1, 51, 'titulaire', 'demi de mêlée', 1, 2, 3, 4),
(1, 52, 'titulaire', '2ème ligne', 5, 6, 7, 8),
(1, 53, 'titulaire', 'talonneur', 5, 8, 9, 12),
(1, 54, 'remplaçant', 'talonneur', 5, 9, 4, 10),
(1, 55, 'remplaçant', '1ère ligne', 5, 9, 7, 6),
(1, 56, 'titulaire', 'demi d''ouverture', 6, 4, 10, 8),
(1, 57, 'titulaire', '2ème ligne', 6, 8, 9, 0),
(1, 58, 'titulaire', 'demi de mêlée', 6, 9, 5, 0),
(1, 60, 'titulaire', '3/4 centre', 10, 5, 6, 15),
(2, 1, 'titulaire', 'talonneur', 1, 23, 4, 6),
(2, 2, 'titulaire', 'demi de mêlée', 5, 4, 9, 0),
(2, 3, 'remplaçant', 'demi d''ouverture', 20, 5, 9, 17),
(2, 6, 'titulaire', 'demi de mêlée', 7, 2, 3, 1),
(2, 20, 'titulaire', 'demi de mêlée', 2, 0, 0, 0),
(2, 21, 'titulaire', 'demi d''ouverture', 5, 5, 5, 5),
(2, 22, 'titulaire', 'talonneur', 5, 6, 8, 9),
(2, 23, 'titulaire', 'talonneur', 0, 0, 0, 0),
(2, 25, 'titulaire', 'l', 1, 1, 1, 1),
(3, 20, 'titulaire', 'talonneur', 3, 0, 0, 0),
(4, 20, 'titulaire', 'talonneur', 4, 0, 0, 0),
(5, 1, 'titulaire', 'demi d''ouverture', 4, 0, 0, 0),
(5, 2, 'titulaire', 'talonneur', 5, 6, 8, 9),
(5, 3, 'remplaçant', 'demi de mêlée', 9, 7, 1, 0),
(5, 42, 'titulaire', 'l', 1, 1, 1, 1),
(6, 53, 'titulaire', 'l', 1, 1, 1, 1),
(7, 2, 'titulaire', 'talonneur', 5, 6, 7, 8),
(7, 7, 'titulaire', 'demi de mêlée', 5, 6, 7, 9),
(8, 42, 'titulaire', 'l', 1, 1, 11, 1),
(9, 81, 'remplaçant', 'troisième ligne', 5, 6, 7, 9),
(9, 82, 'remplaçant', 'talonneur', 5, 6, 7, 9),
(9, 83, 'titulaire', 'talonneur', 1, 8, 7, 6),
(9, 84, 'remplaçant', 'centre', 9, 6, 4, 6),
(9, 92, 'remplaçant', 'demi de mêlée', 6, 9, 7, 20),
(9, 93, 'remplaçant', 'demi d''ouverture', 8, 12, 34, 8),
(9, 94, 'titulaire', 'centre', 1, 5, 6, 8),
(9, 96, 'titulaire', 'centre', 6, 8, 94, 5),
(9, 105, 'titulaire', 'l', 1, 1, 1, 11),
(10, 42, 'titulaire', 'l', 1, 2, 1, 12),
(10, 97, 'remplaçant', 'centre', 9, 9, 8, 9),
(10, 105, 'remplaçant', 'talonneur', 8, 9, 10, 2),
(10, 106, 'titulaire', 'talonneur', 8, 9, 64, 10),
(11, 42, 'titulaire', 'l', 1, 1, 1, 1),
(13, 21, 'prévu', '', 0, 0, 0, 0),
(13, 22, 'prévu', '', 0, 0, 0, 0),
(13, 23, 'prévu', '', 0, 0, 0, 0),
(13, 24, 'prévu', '', 0, 0, 0, 0),
(13, 25, 'prévu', '', 1, 1, 1, 1),
(13, 26, 'titulaire', 'demi de mêlée', 1, 1, 1, 1),
(13, 27, 'titulaire', 'demi de mêlée', 6, 8, 9, 7),
(13, 28, 'remplaçant', 'centre', 1, 5, 6, 8),
(13, 29, 'remplaçant', 'centre', 8, 9, 7, 10),
(13, 30, 'remplaçant', 'centre', 5, 9, 7, 6),
(15, 25, 'titulaire', 'demi de mêlée', 1, 3, 46, 5),
(17, 3, 'titulaire', 'demi de mêlée', 8, 40, 40, 40),
(17, 22, 'titulaire', 'l', 0, 0, 0, 0),
(17, 25, 'remplaçant', 'talonneur', 9, 40, 7, 0);

-- --------------------------------------------------------

--
-- Structure de la table `JOUEUR`
--

CREATE TABLE IF NOT EXISTS `JOUEUR` (
  `no_joueur` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `poids` int(11) NOT NULL,
  `taille` int(11) NOT NULL,
  `date_nais` date NOT NULL,
  `poste_habit` varchar(255) NOT NULL,
  `nb_selections` int(11) NOT NULL,
  `no_equipe` int(11) NOT NULL,
  PRIMARY KEY (`no_joueur`),
  KEY `no-equipe` (`no_equipe`),
  KEY `taille` (`taille`),
  KEY `taille_2` (`taille`),
  KEY `taille_3` (`taille`),
  KEY `taille_4` (`taille`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `JOUEUR`
--

INSERT INTO `JOUEUR` (`no_joueur`, `nom`, `prenom`, `poids`, `taille`, `date_nais`, `poste_habit`, `nb_selections`, `no_equipe`) VALUES
(1, 'Read', 'Kieran', 105, 193, '1985-10-26', 'troisième ligne centre', 84, 1),
(2, 'Coles', 'Dane ', 95, 186, '1986-12-10', 'talonneur', 36, 1),
(3, 'Taylor', 'Codie', 96, 183, '1991-03-31', 'talonneur', 4, 1),
(4, 'Retallick', 'Brodie ', 104, 204, '1991-05-31', 'deuixème ligne', 47, 1),
(5, 'Tuipulotu', 'Patrick', 97, 200, '1993-01-23', 'deuxième ligne', 7, 1),
(6, 'Cane', 'Sam', 103, 189, '1992-01-13', 'troisième ligne', 31, 1),
(7, 'Barrett', 'Beauden ', 89, 187, '1991-05-27', 'demi d''ouverture', 36, 1),
(8, 'McKenzie', 'Damian ', 108, 175, '1995-04-20', 'arrière', 0, 1),
(9, 'Franks', 'Owen ', 105, 186, '1987-12-23', 'pilier', 78, 1),
(10, 'Romano', 'Luke', 108, 199, '1986-06-16', 'deuxième ligne', 22, 1),
(11, 'Moore', 'Stephen', 95, 186, '1983-01-20', 'talonneur', 102, 2),
(12, 'Hanson', 'James', 104, 183, '1988-09-15', 'talonneur', 10, 2),
(13, 'Kepu', 'Sekope', 94, 188, '1986-02-05', 'pilier', 63, 2),
(14, 'Horwill', 'James ', 117, 200, '1985-05-29', 'deuxième ligne', 61, 2),
(15, 'Mumm', 'Dean', 102, 196, '1984-03-05', 'deuxième ligne', 44, 2),
(16, 'Phipps', 'Nick', 104, 180, '1989-01-09', 'demi de mêlée', 39, 2),
(17, 'Foley', 'Bernard', 94, 182, '1989-09-08', 'demi d''ouverture', 27, 2),
(18, 'Kuridrani', 'Tevita', 107, 196, '1991-03-31', 'centre', 31, 2),
(19, 'Naiyaravoro', 'Taqele ', 123, 195, '1991-12-07', 'ailier', 1, 2),
(20, 'Harris', 'Mike ', 96, 186, '1988-07-08', 'arrière', 10, 2),
(21, 'Dusautoir', 'Thierry', 92, 188, '1981-11-18', 'troisième ligne aile', 75, 3),
(22, 'Saint-André', 'Philippe', 80, 180, '1967-04-19', 'entraîneur', 69, 3),
(23, 'Parra', 'Morgan', 90, 180, '1988-11-15', 'demi de mêlée ', 59, 3),
(24, 'Picamoles', 'Louis', 102, 192, '1986-02-05', 'Troisième ligne centre', 44, 3),
(25, 'Trinh-Duc', 'François', 98, 184, '1986-11-11', 'demi_d''ouverture', 49, 3),
(26, 'Fickou', 'Gaël', 86, 190, '1994-03-26', 'centre', 11, 3),
(27, 'Guirado', 'Guilhem', 106, 183, '1986-06-07', 'talonneur', 31, 3),
(28, 'Kayser\r\n', 'Benjamin', 105, 182, '1984-07-26', 'talonneur', 32, 3),
(29, 'Chiocci', 'Xavier', 115, 181, '1990-02-05', 'talonneur', 3, 3),
(30, 'Dulin', 'Brice', 97, 176, '1990-04-13', 'ailier arrière', 19, 3),
(31, 'Creevy', 'Agustín ', 102, 195, '1985-03-15', 'talonneur', 45, 4),
(32, ' Nahuel Tetaz Chaparro', 'François', 102, 198, '1989-06-11', 'pilier', 20, 4),
(33, 'Ayerza', 'Marcos ', 98, 104, '1983-06-12', 'pilier', 60, 4),
(34, 'Orlandi', 'Juan Pablo ', 96, 188, '1983-06-20', 'pilier', 16, 4),
(35, 'Figallo', 'Juan ', 112, 196, '1988-03-25', 'pilier', 22, 4),
(36, 'Lavanini', 'Tomás', 98, 179, '1983-01-22', '2ème ligne', 21, 4),
(37, 'Galarza', 'Mariano', 101, 197, '1986-11-12', '2ème ligne', 12, 4),
(38, 'Senatore', 'Leonardo ', 106, 198, '1984-03-05', '3ème ligne centre', 31, 4),
(39, 'Isa', 'Facundo', 104, 197, '1983-09-21', '3ème ligne centre', 12, 4),
(40, 'Sánchez', 'Nicolás', 106, 201, '1988-10-26', 'demi d''ouverture', 33, 4),
(41, 'Marx', 'Malcolm', 102, 198, '1994-07-13', 'talonneur', 2, 5),
(42, 'Mbonambi', 'Bongi ', 113, 121, '1991-01-07', 'talonneur', 5, 5),
(43, 'Kitshoff', 'Steven ', 105, 197, '1992-02-10', 'pilier', 10, 5),
(44, 'Mtawarira', 'Tendai', 104, 198, '1985-08-01', 'pilier', 87, 5),
(45, 'Mostert', 'Franco ', 115, 212, '1990-11-27', '2ème ligne', 7, 5),
(46, 'Kolisi', 'Siya', 106, 197, '1985-06-15', '3ème ligne aile', 16, 5),
(47, 'Mohojé', 'Oupa ', 112, 201, '1990-08-03', '3ème ligne aile', 15, 5),
(48, 'Paige', 'Rudy ', 105, 195, '1989-05-02', 'demi de mêlée', 7, 5),
(49, 'Mapoe', 'Lionel ', 104, 198, '1988-08-12', '3/4 de centre', 11, 5),
(50, 'Kriel', 'Jesse ', 104, 198, '1994-02-15', 'arrière', 16, 5),
(51, 'Baldwin', 'Scott ', 105, 194, '1988-07-12', 'talonneur', 28, 6),
(52, 'Dacey', 'Kristian', 108, 196, '1988-07-25', 'talonneur', 3, 6),
(53, 'Francis', 'Tomas ', 98, 185, '1992-04-27', 'pilier', 17, 6),
(54, 'Lee', 'Samson ', 104, 198, '1992-11-30', 'pilier', 29, 6),
(55, 'Charteris', 'Luke ', 108, 197, '1983-03-03', '2ème ligne', 71, 6),
(56, 'Moriarty', 'Ross ', 106, 197, '1994-04-18', '3ème ligne aile', 12, 6),
(57, 'Warburton', 'Sam ', 107, 196, '1988-10-07', '3ème ligne aile', 69, 6),
(58, 'Davies', 'Aled', 107, 197, '1992-07-12', 'demi de mêlée', 3, 6),
(59, 'Webb', 'Rhys', 96, 196, '1998-12-09', 'demi de mêlée', 23, 6),
(60, 'Roberts', 'Jamie ', 94, 201, '1982-12-08', '3/4 de centre', 90, 6),
(61, 'Best', 'Rory ', 106, 197, '1982-05-15', 'talonneur', 101, 7),
(62, 'Furlong', 'Tadhg', 108, 215, '1992-12-14', 'pilier', 12, 7),
(63, 'Kilcoyne', 'David', 107, 198, '1992-02-11', 'pilier', 17, 7),
(64, 'Dillane', 'Ultan', 96, 187, '1993-11-03', '2ème ligne', 9, 7),
(65, 'Henderson', 'Iain ', 107, 195, '1992-02-21', '2ème ligne', 29, 7),
(66, 'Ryan', 'Donnacha ', 107, 196, '1983-11-12', '2ème ligne', 43, 7),
(67, 'Toner', 'Devin ', 107, 196, '1986-06-26', '2ème ligne', 43, 7),
(68, 'Marmion', 'Kieran ', 106, 197, '1992-11-12', 'demi de mêlée', 9, 7),
(69, 'Murray', 'Conor ', 107, 211, '1989-04-20', 'demi de mêlée', 54, 7),
(70, 'Sexton', 'Jonathan ', 107, 213, '1985-07-11', 'demi d''ouverture', 63, 7),
(71, 'Barclay', 'John', 108, 201, '1986-09-21', '3ème ligne aile', 62, 8),
(72, 'Cochrane', 'Neil ', 105, 205, '1984-04-01', 'talonneur', 0, 8),
(73, 'Turner', 'George', 103, 196, '1992-10-08', 'talonneur', 0, 8),
(74, 'Fagerson', 'Zander', 110, 205, '1996-01-19', 'pilier', 12, 8),
(75, 'WP ', 'Nel', 106, 205, '1986-04-30', 'pilier', 18, 8),
(76, 'Gilchrist', 'Grant ', 94, 196, '1990-08-09', '2ème ligne', 16, 8),
(77, 'Swinson', 'Tim', 104, 205, '1987-02-17', '2ème ligne', 32, 8),
(78, 'Fowles', 'Nathan ', 107, 203, '1993-08-04', 'demi de mêlée', 0, 8),
(79, 'Horne', 'Peter', 102, 198, '1989-05-10', 'demi d''ouverture', 56, 8),
(80, 'Jones', 'Lee ', 97, 203, '1988-06-28', 'ailier', 5, 8),
(81, 'Bekoshvili', 'Soso ', 105, 192, '1993-11-03', 'pilier', 2, 9),
(82, 'Mataradze', 'Tornike ', 106, 194, '1996-09-18', 'pilier', 2, 9),
(83, 'Tabidze', 'Lasha ', 178, 94, '1997-07-07', 'pilier', 1, 9),
(84, 'Alkhazashvili\r\n', 'Badri', 196, 96, '1995-07-31', 'talonneur', 4, 9),
(85, 'Mtchedlishvili', 'Giorgi ', 187, 92, '1993-01-12', 'deuxième ligne', 1, 9),
(86, 'Aprasidze', 'Gela', 193, 102, '1998-01-14', 'demi de mêlée', 1, 9),
(87, 'Jinchvelashvili', 'Revaz ', 184, 97, '1995-08-07', 'demi d''ouverture', 2, 9),
(88, 'Malaguradze\r\n', 'Lasha ', 179, 86, '1986-01-12', 'demi d''ouverture', 50, 9),
(89, 'Liparteliani', 'Badri ', 187, 93, '1995-03-17', 'centre', 0, 9),
(90, 'Sitchinava', 'Anzor ', 185, 91, '1994-08-12', 'ailier', 61, 9),
(91, 'Sitchinava', 'Anzor', 94, 196, '1986-09-06', 'pilier', 1, 10),
(92, 'Puafisi', 'Sila ', 96, 194, '1998-04-15', 'pilier', 24, 10),
(93, 'Lea', 'Sione ', 78, 173, '1983-01-12', 'talonneur', 2, 10),
(94, 'Taione', 'Elvis ', 83, 179, '1993-05-13', 'talonneur', 24, 10),
(95, 'Manu', 'Vainanuma', 84, 179, '1992-08-01', 'deuxième ligne', 0, 10),
(96, 'Faleafa', 'Daniel', 96, 201, '1989-02-12', 'troisième ligne', 7, 10),
(97, 'Palu', 'Tomasi ', 92, 194, '1986-11-23', 'demi de mêlée', 11, 10),
(98, 'Fosita', 'Latiume ', 94, 197, '1992-07-21', 'demi d''ouverture', 18, 10),
(99, 'Piutau', 'Siale ', 93, 194, '1985-10-09', 'centre', 24, 10),
(100, 'Vainikolo', 'Fetu''u ', 89, 178, '1985-01-30', 'ailier', 25, 10),
(101, 'Burger', 'Jacques ', 100, 200, '1983-07-29', 'troisième ligne aile', 36, 11),
(102, 'Coetzee', 'Aranos ', 97, 192, '1988-03-14', 'pilier', 6, 11),
(103, 'van Jaarsveld', 'Torsten', 87, 176, '1987-06-30', 'talonneur', 8, 11),
(104, 'Uanivi', 'Tjiuee', 86, 178, '1990-12-31', 'deuxième ligne', 12, 11),
(105, 'Damens', 'Leneve', 86, 179, '1993-05-30', 'troisième ligne centre', 5, 11),
(106, 'Buitendag', 'Eneill ', 84, 173, '1986-06-21', 'demi de mêlée', 15, 11),
(107, 'Jantjies\r\n', 'Eugene\r\n', 89, 173, '1986-10-08', 'demi de mêlée', 45, 11),
(108, 'Deysel', 'Johan', 91, 203, '1991-09-21', 'centre', 10, 11),
(109, 'Marais', 'Conrad ', 84, 186, '1989-04-26', 'ailier', 9, 11),
(110, 'Tromp', 'Johan', 86, 192, '1990-12-26', 'arrière', 20, 11);

-- --------------------------------------------------------

--
-- Structure de la table `MATCH`
--

CREATE TABLE IF NOT EXISTS `MATCH` (
  `no_match` int(11) NOT NULL,
  `date_match` date NOT NULL,
  `type_match` varchar(255) NOT NULL,
  `no_stade` int(11) NOT NULL,
  PRIMARY KEY (`no_match`),
  KEY `no-stade` (`no_stade`),
  KEY `no-stade_2` (`no_stade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `MATCH`
--

INSERT INTO `MATCH` (`no_match`, `date_match`, `type_match`, `no_stade`) VALUES
(1, '2015-10-17', 'Quarts de finale', 1),
(2, '2015-10-17', 'Quarts de finale', 2),
(3, '2015-10-18', 'Quarts de finale', 4),
(4, '2015-10-18', 'Quarts de finale', 1),
(5, '2015-10-24', 'Demi-finales', 1),
(6, '2015-10-25', 'Demi-finales', 1),
(7, '2015-10-31', 'Finale', 1),
(8, '2015-10-30', 'Troisième Place', 3),
(9, '2015-11-19', 'poule', 1),
(10, '2015-09-20', 'poule', 3),
(11, '2015-09-23', 'poule', 6),
(12, '2015-09-26', 'poule', 4),
(13, '2015-10-02', 'poule', 7),
(14, '2015-09-04', 'poule', 9),
(15, '2015-10-07', 'poule', 11),
(16, '2015-10-09', 'poule', 1),
(17, '2015-10-11', 'poule', 7),
(18, '2015-10-16', 'poule', 5);

-- --------------------------------------------------------

--
-- Structure de la table `NATION`
--

CREATE TABLE IF NOT EXISTS `NATION` (
  `no_nation` int(11) NOT NULL,
  `nom_nation` varchar(255) NOT NULL,
  PRIMARY KEY (`no_nation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `NATION`
--

INSERT INTO `NATION` (`no_nation`, `nom_nation`) VALUES
(1, 'Nouvelle-Zélande'),
(2, 'Australie'),
(3, 'France'),
(4, 'Argentine'),
(5, 'Afrique du Sud'),
(6, 'Galles'),
(7, 'Irlande'),
(8, 'Écosse'),
(9, 'Angleterre'),
(10, 'Géorgie'),
(11, 'Tonga'),
(12, 'Namibie');

-- --------------------------------------------------------

--
-- Structure de la table `OPPOSE`
--

CREATE TABLE IF NOT EXISTS `OPPOSE` (
  `no_match` int(11) NOT NULL,
  `nb_spectateurs` int(11) NOT NULL,
  `no_equipe1` int(11) NOT NULL,
  `no_equipe2` int(11) NOT NULL,
  `no_arbitre_c` int(11) NOT NULL,
  `no_arbitre_t1` int(11) NOT NULL,
  `no_arbitre_t2` int(11) NOT NULL,
  PRIMARY KEY (`no_match`),
  KEY `no-equipe1` (`no_equipe1`),
  KEY `no-equipe2` (`no_equipe2`),
  KEY `no-arbitre_c` (`no_arbitre_c`),
  KEY `no-arbitre_t1` (`no_arbitre_t1`),
  KEY `no-arbitre_t2` (`no_arbitre_t2`),
  KEY `no-arbitre_t2_2` (`no_arbitre_t2`),
  KEY `no-arbitre_t2_3` (`no_arbitre_t2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `OPPOSE`
--

INSERT INTO `OPPOSE` (`no_match`, `nb_spectateurs`, `no_equipe1`, `no_equipe2`, `no_arbitre_c`, `no_arbitre_t1`, `no_arbitre_t2`) VALUES
(1, 79752, 5, 6, 1, 3, 6),
(2, 90000, 1, 3, 7, 4, 10),
(3, 72316, 4, 7, 8, 6, 11),
(4, 77110, 2, 8, 4, 9, 2),
(5, 80090, 1, 5, 6, 12, 1),
(6, 80025, 2, 4, 6, 7, 9),
(7, 80125, 1, 2, 5, 9, 12),
(8, 55925, 5, 4, 6, 8, 11),
(9, 50000, 9, 10, 5, 6, 7),
(10, 54000, 1, 5, 6, 8, 9),
(11, 52000, 5, 6, 9, 9, 10),
(12, 74150, 9, 8, 9, 5, 6),
(13, 40000, 3, 7, 5, 6, 8),
(14, 40000, 2, 4, 1, 2, 3),
(15, 20000, 8, 3, 2, 2, 2),
(16, 81605, 1, 1, 1, 1, 1),
(17, 21000, 2, 3, 5, 5, 5);

-- --------------------------------------------------------

--
-- Structure de la table `REMPLACE`
--

CREATE TABLE IF NOT EXISTS `REMPLACE` (
  `no_joueur_sortant` int(11) NOT NULL,
  `no_match` int(11) NOT NULL,
  `min_remp` int(11) NOT NULL,
  `no_joueur_entrant` int(11) NOT NULL,
  PRIMARY KEY (`no_joueur_sortant`,`no_match`),
  KEY `no-joueur_entrant` (`no_joueur_entrant`),
  KEY `no_match_remplace` (`no_match`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `REMPLACE`
--

INSERT INTO `REMPLACE` (`no_joueur_sortant`, `no_match`, `min_remp`, `no_joueur_entrant`) VALUES
(54, 6, 12, 53),
(83, 9, 15, 82),
(94, 9, 10, 93),
(94, 10, 20, 93);

-- --------------------------------------------------------

--
-- Structure de la table `STADE`
--

CREATE TABLE IF NOT EXISTS `STADE` (
  `no_stade` int(11) NOT NULL,
  `nom_stade` varchar(255) NOT NULL,
  `ville_stade` varchar(255) NOT NULL,
  `capacite` int(11) NOT NULL,
  PRIMARY KEY (`no_stade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `STADE`
--

INSERT INTO `STADE` (`no_stade`, `nom_stade`, `ville_stade`, `capacite`) VALUES
(1, 'Twickenham', 'Londres', 81605),
(2, 'Wembley Stadium', 'londres', 90000),
(3, 'Stade Olympique', 'Londres', 54000),
(4, 'Millennium Stadium', 'Cardiff', 74154),
(5, 'Manchester City Stadium', 'Manchester', 47800),
(6, 'St James'' Park', 'Newcastle upon Tyne', 52000),
(7, 'Elland Road', 'Leeds', 37914),
(8, 'Leicester City Stadium', 'Leicester', 32312),
(9, 'Villa Park', 'Birmingham', 42875),
(10, 'Kingsholm Stadium', 'Gloucester', 16500),
(11, 'Stadium mk', 'Milton Keynes', 30717),
(12, 'Brighton Community Stadium', 'Brighton', 30750),
(13, 'Sandy Park\r\n', 'Exeter', 12000);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `ARBITRE`
--
ALTER TABLE `ARBITRE`
  ADD CONSTRAINT `ARBITRE_ibfk_1` FOREIGN KEY (`no_nation`) REFERENCES `NATION` (`no_nation`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `CARTON`
--
ALTER TABLE `CARTON`
  ADD CONSTRAINT `CARTON_ibfk_1` FOREIGN KEY (`no_match`) REFERENCES `MATCH` (`no_match`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CARTON_ibfk_2` FOREIGN KEY (`no_joueur`) REFERENCES `JOUEUR` (`no_joueur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `EQUIPE`
--
ALTER TABLE `EQUIPE`
  ADD CONSTRAINT `EQUIPE_ibfk_1` FOREIGN KEY (`no_nation`) REFERENCES `NATION` (`no_nation`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `EST-CAPITAINE`
--
ALTER TABLE `EST-CAPITAINE`
  ADD CONSTRAINT `no_equipe_cap` FOREIGN KEY (`no_equipe`) REFERENCES `EQUIPE` (`no_equipe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `no_joueur_cap` FOREIGN KEY (`no_joueur`) REFERENCES `JOUEUR` (`no_joueur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `JOUE`
--
ALTER TABLE `JOUE`
  ADD CONSTRAINT `no_joueur_joue` FOREIGN KEY (`no_joueur`) REFERENCES `JOUEUR` (`no_joueur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `no_match_joue` FOREIGN KEY (`no_match`) REFERENCES `MATCH` (`no_match`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `JOUEUR`
--
ALTER TABLE `JOUEUR`
  ADD CONSTRAINT `JOUEUR_ibfk_1` FOREIGN KEY (`no_equipe`) REFERENCES `EQUIPE` (`no_equipe`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `MATCH`
--
ALTER TABLE `MATCH`
  ADD CONSTRAINT `MATCH_ibfk_1` FOREIGN KEY (`no_stade`) REFERENCES `STADE` (`no_stade`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `OPPOSE`
--
ALTER TABLE `OPPOSE`
  ADD CONSTRAINT `no_arbitrec_oppose` FOREIGN KEY (`no_arbitre_c`) REFERENCES `ARBITRE` (`no_arbitre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `no_arbitret1_oppose` FOREIGN KEY (`no_arbitre_t1`) REFERENCES `ARBITRE` (`no_arbitre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `no_arbitret2_oppose` FOREIGN KEY (`no_arbitre_t2`) REFERENCES `ARBITRE` (`no_arbitre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `no_equipe1_oppose` FOREIGN KEY (`no_equipe1`) REFERENCES `EQUIPE` (`no_equipe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `no_equipe2_oppose` FOREIGN KEY (`no_equipe2`) REFERENCES `EQUIPE` (`no_equipe`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `REMPLACE`
--
ALTER TABLE `REMPLACE`
  ADD CONSTRAINT `no_joueur_entrant` FOREIGN KEY (`no_joueur_entrant`) REFERENCES `JOUEUR` (`no_joueur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `no_joueur_sortant` FOREIGN KEY (`no_joueur_sortant`) REFERENCES `JOUEUR` (`no_joueur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `no_match_remplace` FOREIGN KEY (`no_match`) REFERENCES `MATCH` (`no_match`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
