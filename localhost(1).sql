-- phpMyAdmin SQL Dump
-- version 6.0.0-dev+20251104.8b43d270dd
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 03, 2025 at 07:32 PM
-- Server version: 9.4.0
-- PHP Version: 8.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agora`
--
CREATE DATABASE IF NOT EXISTS `agora` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `agora`;

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `idGenre` int NOT NULL,
  `libGenre` varchar(24) NOT NULL,
  `idSpecialiste` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`idGenre`, `libGenre`, `idSpecialiste`) VALUES
(1, 'Action', 2),
(2, 'Aventureffff', 3),
(3, 'Combat', 1),
(4, 'Course', NULL),
(5, 'Gestion', NULL),
(6, 'Jeu de rôle', NULL),
(7, 'Ligue fantasy', NULL),
(8, 'Réflexion', NULL),
(9, 'Tactique', NULL),
(10, 'Sport', NULL),
(11, 'Simulation', NULL),
(13, 'Stratégie', NULL),
(14, 'Porte-monstre-trésor', NULL),
(24, 'Labyrinthe', 5),
(26, 'Objets cachés', 2),
(31, 'dddqdqs', 2),
(32, 'dddd', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jeu_video`
--

CREATE TABLE `jeu_video` (
  `refJeu` varchar(16) NOT NULL,
  `idPlateforme` int DEFAULT NULL,
  `idPegi` int DEFAULT NULL,
  `idGenre` int DEFAULT NULL,
  `idMarque` int DEFAULT NULL,
  `nom` varchar(100) NOT NULL,
  `prix` decimal(6,2) NOT NULL,
  `dateParution` date NOT NULL DEFAULT '2018-03-16'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `jeu_video`
--

INSERT INTO `jeu_video` (`refJeu`, `idPlateforme`, `idPegi`, `idGenre`, `idMarque`, `nom`, `prix`, `dateParution`) VALUES
('BF8763098765', 2, 3, 10, 2, 'FIFA 18 - Edition essentielles', 59.99, '2017-09-29'),
('CF47563837YG', 3, 1, 13, 8, 'Paddington : escapades à Londres', 18.30, '2015-06-19'),
('EG763547598RF', 3, 2, 6, 13, 'Pokémon X', 39.90, '2013-10-12'),
('ER493746Y78', 8, 5, 1, 3, 'Rise of the Tomb Raider', 19.90, '2015-11-13'),
('ER6753FG987', 3, 3, 2, 1, 'Minecraft Story Mode - L\'aventure Complète -', 39.89, '2016-12-16'),
('ES47562098754', 4, 2, 2, 13, 'The Legend of Zelda - The Wind Waker HD ', 29.80, '2016-04-15'),
('ET86987453T5', 7, 5, 1, 10, 'La terre de milieu : L\'Ombre de la Guerre', 59.90, '2017-10-10'),
('ezfezf', 9, 1, 4, 5, 'fsefef', 343.00, '2025-11-05'),
('fseffezfe', 9, 1, 1, 5, 'fergre', 34.00, '2025-10-28'),
('RT4958673II2', 4, 2, 2, 13, 'New Super Mario Bros.', 18.90, '2016-04-15'),
('TF98653JU8', 15, 3, 2, 1, 'Minecraft Story Mode - L\'aventure Complète -', 39.89, '2016-12-16'),
('U174645475GT', 2, 3, 10, 1, 'Gran Turismo', 21.50, '2013-06-12'),
('YT65487BJI', 3, 1, 2, 13, 'Mario Kart 7 ', 39.90, '2012-11-28');

-- --------------------------------------------------------

--
-- Table structure for table `marque`
--

CREATE TABLE `marque` (
  `idMarque` int NOT NULL,
  `nomMarque` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Les marques des produits';

--
-- Dumping data for table `marque`
--

INSERT INTO `marque` (`idMarque`, `nomMarque`) VALUES
(1, 'Sony'),
(2, 'Electronic arts'),
(3, 'Square Enix'),
(4, 'Konami'),
(5, 'Bandai Namco Entertainment'),
(6, 'Rockstar Games'),
(7, 'Séga'),
(8, 'Techland'),
(9, 'Ubisoft'),
(10, 'Warner Bros'),
(11, 'Bensimon'),
(12, 'Hori'),
(13, 'Nintendo'),
(15, 'Kid\'s Mania');

-- --------------------------------------------------------

--
-- Table structure for table `membre`
--

CREATE TABLE `membre` (
  `idMembre` int NOT NULL,
  `nomMembre` varchar(32) NOT NULL,
  `prenomMembre` varchar(20) NOT NULL,
  `mailMembre` varchar(50) NOT NULL,
  `telMembre` varchar(10) NOT NULL,
  `rueMembre` varchar(36) NOT NULL,
  `cpMembre` varchar(5) NOT NULL,
  `villeMembre` varchar(30) NOT NULL,
  `loginMembre` varchar(20) NOT NULL,
  `mdpMembre` char(128) NOT NULL,
  `selMembre` char(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `membre`
--

INSERT INTO `membre` (`idMembre`, `nomMembre`, `prenomMembre`, `mailMembre`, `telMembre`, `rueMembre`, `cpMembre`, `villeMembre`, `loginMembre`, `mdpMembre`, `selMembre`) VALUES
(1, 'Dubois', 'Didier', 'dubois.didier@gmail.com', '0685451236', '48 rue des acacias', '57000', 'Metz', 'dubois', '7e3c5f890206b7cad6a01f51ba98db1713f37219bdf7668d35c6f71e3bf8f0ee73d3cce3b380234fd39628d57c33ff5baf7e7a258fdfcf85efaf32a5be77a87a', '9943e30b1efe68df39ac3734fa014bdd51cfc2f8eb93df70a04cfa070f19a9c9f71fc588161227ed76ef0a79a1ea6003f2cefe511fde90a1eb210824bb7d4f4d'),
(2, 'Celon', 'Elodie', 'elodie35@gmail.com', '0689451235', '18 rue des Tilleuls', '57000', 'Metz', 'celon', 'f332c43c4aed2f69497df8f52ce3ed9483737eb689fd86614a267a034bc0c2fc4bc1677b96767f286499bba623b87a8993d2825af203df34573f9435222222d1', '8e78f28b94066853c4f13017fa561e233b3ff48dc28455c61acf3590f7897deb82514ba38a51fe57b89bd220ebbb9bcf72af287463ae9395aa7d2e52121b745c'),
(3, 'Garance', 'Kevin', 'garance@gmail.com', '0678451236', '5 avenue Victor hugo', '57000', 'Metz', 'garance', '2ac84572232ba491a89635b19afb37217dbd8c9e5d79080981d6fc283f13addfed0607a006090fcce0fa21dcf18f770e6138532732c0449e1b7a5d9fa478b6b7', 'f53d9e6fe21b24ee613f5cb5303b6b0dab1619906e42721be3c004bcbe7f08f95977a4da1753a4b439402693cb76d79e068459b24406939bbb6b24bf4d6bff88'),
(4, 'Wagner', 'Anis', 'aniswagner6@gmail.com', '0749285128', 'non', '54000', 'Nancy', 'anis', 'Anis@171206', ''),
(5, 'Nom', 'Prénom', 'mail@example.com', '0123456789', 'rue', '00000', 'Ville', 'nouveauLogin', '72905e7b32d847468edcdbf99f7d218e466cd828300306f1d9f8c3e0512e44fe4394644b581ed52656a2870c9a67c592bc40ca322099aa52bf528c54f9cabde0', ''),
(6, 'Martin', 'Paul', 'paul.martin@example.com', '0601020304', '10 rue Exemple', '75000', 'Paris', 'pmartin', 'd6f644b19812e97b5d871658d6d3400ecd4787faeb9b8990c1e7608288664be77257104a58d033bcf1a0e0945ff06468ebe53e2dff36e248424c7273117dac09', '2b027636213b3500c875feb4566907bc6f821b896ed0e90ee781bea4e694c2268e20a81a703318d78c05e17650f015f4c93ee168276dc630c700baadbf08016a');

-- --------------------------------------------------------

--
-- Table structure for table `pegi`
--

CREATE TABLE `pegi` (
  `idPegi` int NOT NULL,
  `ageLimite` int NOT NULL,
  `descPegi` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pegi`
--

INSERT INTO `pegi` (`idPegi`, `ageLimite`, `descPegi`) VALUES
(1, 3, '« adapté à toutes les classes d’âge ». En effet, il ne comporte pas de sons ou d’images susceptibles d’effrayer ou de faire peur à de jeunes enfants. Les formes de violence très modérées dans un contexte comique ou enfantin sont toutefois acceptées, mais le langage grossier n\'est pas autoris.'),
(2, 7, 'Déconseillé aux moins de 7 ans. Il contient des scènes ou sons potentiellement effrayants. La violence très modérée (c\'est-à-dire implicite, non détaillée ou non réaliste) est accepté.'),
(3, 12, 'Déconseillé aux moins de 12 ans. Il peut montrer « de la violence sous une forme plus graphique par rapport à des personnages imaginaires et/ou une violence non graphique envers des personnages à figure humaine ». Il peut également présenter des insinuations à caractère sexuel ou des postures de type sexuelles dans un cadre léger. Enfin, il peut aussi proposer des jeux de hasard.'),
(4, 16, 'Déconseillé aux moins de 16 ans. Contenus possibles : la violence et/ou la sexualité sont représentés de manière semblable à ce que l\'on pourrait retrouver dans la réalité. Le jeu peut ainsi contenir de la violence explicite, un mauvais langage, des références ou contenus à caractères sexuels, mais aussi des jeux de hasard ou l\'utilisation d\'alcool, tabac et drogue (forme d\'incitation).'),
(5, 18, '« destinée aux adultes ». Il peut contenir un degré de violence extrême avec une représentation de violence crue, de meurtre sans motivation, de violence contre des personnages sans défense ou de la discrimination. Il peut aussi glorifier la prise des drogues illégales et les contacts sexuels explicites ainsi que des jeux de hasard.');

-- --------------------------------------------------------

--
-- Table structure for table `plateforme`
--

CREATE TABLE `plateforme` (
  `idPlateforme` int NOT NULL,
  `libPlateforme` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `plateforme`
--

INSERT INTO `plateforme` (`idPlateforme`, `libPlateforme`) VALUES
(1, 'PlayStation 4'),
(2, 'PlayStation 3'),
(3, 'Nintendo 3DS'),
(4, 'Nintendo Wii'),
(5, 'PC ggg'),
(6, 'Sony PSP'),
(7, 'Xbox 360'),
(8, 'Xbox One'),
(9, 'Nintendo 2DS'),
(11, 'Nintendo DS'),
(13, 'Nintendo Switch'),
(15, 'Nintendo Wii U'),
(17, 'PlayStation Vita');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`idGenre`);

--
-- Indexes for table `jeu_video`
--
ALTER TABLE `jeu_video`
  ADD PRIMARY KEY (`refJeu`),
  ADD KEY `fk_jeu_video_genre` (`idGenre`) USING BTREE,
  ADD KEY `fk_jeu_video_pegi` (`idPegi`) USING BTREE,
  ADD KEY `fk_jeu_video_marque` (`idMarque`) USING BTREE,
  ADD KEY `fk_jeu_video_plateforme` (`idPlateforme`);

--
-- Indexes for table `marque`
--
ALTER TABLE `marque`
  ADD PRIMARY KEY (`idMarque`);

--
-- Indexes for table `membre`
--
ALTER TABLE `membre`
  ADD PRIMARY KEY (`idMembre`);

--
-- Indexes for table `pegi`
--
ALTER TABLE `pegi`
  ADD PRIMARY KEY (`idPegi`);

--
-- Indexes for table `plateforme`
--
ALTER TABLE `plateforme`
  ADD PRIMARY KEY (`idPlateforme`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `idGenre` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `marque`
--
ALTER TABLE `marque`
  MODIFY `idMarque` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `membre`
--
ALTER TABLE `membre`
  MODIFY `idMembre` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pegi`
--
ALTER TABLE `pegi`
  MODIFY `idPegi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `plateforme`
--
ALTER TABLE `plateforme`
  MODIFY `idPlateforme` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- Database: `agoraorm`
--
CREATE DATABASE IF NOT EXISTS `agoraorm` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `agoraorm`;

-- --------------------------------------------------------

--
-- Table structure for table `cat_tournois`
--

CREATE TABLE `cat_tournois` (
  `id` int NOT NULL,
  `libelle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cat_tournois`
--

INSERT INTO `cat_tournois` (`id`, `libelle`) VALUES
(1, 'FPS - First Person Shooter'),
(2, 'MOBA - Multiplayer Online Battle Arena'),
(3, 'Battle Royale'),
(4, 'Stratégie en temps réel'),
(5, 'Combat'),
(6, 'Course automobile'),
(7, 'Sport');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20251109121429', '2025-11-13 15:36:26', 2),
('DoctrineMigrations\\Version20251120135559', '2025-11-20 13:58:04', 133),
('DoctrineMigrations\\Version20251120152718', '2025-11-20 15:28:04', 109),
('DoctrineMigrations\\Version20251120210339', '2025-11-27 10:54:07', 418);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `id` int NOT NULL,
  `lib_genre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id`, `lib_genre`) VALUES
(1, 'Aventure'),
(2, 'Action'),
(3, 'RPG'),
(4, 'Stratégie'),
(5, 'Combat'),
(6, 'Course'),
(7, 'Sport'),
(8, 'Simulation'),
(9, 'Réflexion'),
(10, 'Horreur'),
(11, 'FPS'),
(12, 'MOBA');

-- --------------------------------------------------------

--
-- Table structure for table `jeu_video`
--

CREATE TABLE `jeu_video` (
  `id` int NOT NULL,
  `ref_jeu` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` double NOT NULL,
  `date_parution` datetime NOT NULL,
  `plateforme_id` int DEFAULT NULL,
  `pegi_id` int DEFAULT NULL,
  `genre_id` int DEFAULT NULL,
  `marque_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jeu_video`
--

INSERT INTO `jeu_video` (`ref_jeu`, `nom`, `prix`, `date_parution`, `plateforme_id`, `pegi_id`, `genre_id`, `marque_id`) VALUES
('FIFA24-PS5-001', 'FIFA 24', 69.99, '2023-09-29 00:00:00', 1, 3, 7, 1),
('GTA5-PS5-001', 'Grand Theft Auto V', 29.99, '2013-09-17 00:00:00', 1, 5, 2, 10),
('ZELDA-SW-001', 'The Legend of Zelda: Tears of Kingdom', 59.99, '2023-05-12 00:00:00', 2, 2, 1, 4),
('MARIO-SW-001', 'Super Mario Bros. Wonder', 59.99, '2023-10-20 00:00:00', 2, 1, 1, 4),
('CS2-PC-001', 'Counter-Strike 2', 0.00, '2023-09-27 00:00:00', 3, 5, 11, 14),
('LOL-PC-001', 'League of Legends', 0.00, '2009-10-27 00:00:00', 3, 3, 12, 12),
('FORTNITE-PS5-001', 'Fortnite', 0.00, '2017-07-25 00:00:00', 1, 3, 3, 11),
('AC-MIRAGE-PS5-001', 'Assassin\'s Creed Mirage', 49.99, '2023-10-05 00:00:00', 1, 4, 1, 2),
('SPIDER-PS5-001', 'Marvel\'s Spider-Man 2', 69.99, '2023-10-20 00:00:00', 1, 3, 2, 5),
('FORZA-XBOX-001', 'Forza Horizon 5', 59.99, '2021-11-09 00:00:00', 4, 3, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `marque`
--

CREATE TABLE `marque` (
  `id` int NOT NULL,
  `lib_marque` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marque`
--

INSERT INTO `marque` (`id`, `lib_marque`) VALUES
(1, 'Electronic Arts'),
(2, 'Ubisoft'),
(3, 'Activision'),
(4, 'Nintendo'),
(5, 'Sony Interactive Entertainment'),
(6, 'Microsoft Game Studios'),
(7, 'Square Enix'),
(8, 'Capcom'),
(9, 'Bandai Namco Entertainment'),
(10, 'Rockstar Games'),
(11, 'Epic Games'),
(12, 'Riot Games'),
(13, 'Blizzard Entertainment'),
(14, 'Valve Corporation');

-- --------------------------------------------------------

--
-- Table structure for table `membre`
--

CREATE TABLE `membre` (
  `id` int NOT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_membre` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom_membre` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel_membre` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_membre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rue_membre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp_membre` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville_membre` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `membre`
--

INSERT INTO `membre` (`id`, `username`, `roles`, `password`, `nom_membre`, `prenom_membre`, `tel_membre`, `mail_membre`, `rue_membre`, `cp_membre`, `ville_membre`) VALUES
(1, 'michelle76', '[]', '$2y$13$kDkS/BunrhOyBwZD06lmxuVNnBOwd17uKdw4Mapu3T0XuuAxUbtgO', 'Poulain', 'Luc', '3541250110', 'userdemo0@example.com', '16, chemin Vidal', '04032', 'Marty'),
(2, 'yves87', '[]', '$2y$13$tpVcdxVL0aEN3ynEQWvKmOHnyFvioy2PTQvJxc6YBb5DCAzGaVU0.', 'Courtois', 'Mathilde', '3503073482', 'userdemo1@example.com', '9, impasse Gerard', '06290', 'Delorme-sur-Masson'),
(3, 'hortense.dias', '[]', '$2y$13$slZMLJJPQg3nw2ezFp0JxuT6qLct1EZ869ym7lTQPER173bOjluE2', 'Torres', 'François', '3707182588', 'userdemo2@example.com', '628, rue Potier', '16725', 'Reynaud'),
(4, 'theophile68', '[]', '$2y$13$1smlK8kExvs/3BENQmrmNecz1WVEa8Ctk0hl46ADLSoB1Sv.BqQV.', 'Bernard', 'Christelle', '3023065291', 'userdemo3@example.com', '85, impasse de Labbe', '34917', 'Gerarddan'),
(5, 'xregnier', '[]', '$2y$13$MlEBxVBUz5Id2raIaAgKqecAJZnqilFrHRiS3dpFRZ5Fz.EuA3BPm', 'Guyot', 'Hortense', '3739328135', 'userdemo4@example.com', '88, rue Albert', '14072', 'Chauveauboeuf'),
(6, 'anastasie.martineau', '[]', '$2y$13$cZMUPx7Dz7WPW7VIJnt9rOLRwxRxLIjP88uFVzJeFSQ3LDqTJr0K.', 'Allard', 'Monique', '3207881745', 'userdemo5@example.com', '41, impasse Henriette Girard', '50798', 'Laine'),
(7, 'charles85', '[]', '$2y$13$V/LhFuffy3WEd1ocMqDbSuJODPYXQrb/Y4Yndonyl1fTbJF/KT5km', 'Torres', 'Célina', '3236709076', 'userdemo6@example.com', '494, place Allain', '26812', 'Reydan'),
(8, 'timothee95', '[]', '$2y$13$yvbIM5JveC1BDY6oCrM9CugWTBMWWU6GS3wLkz5qxhMLZ04UjD6Ti', 'Bonneau', 'William', '3721237028', 'userdemo7@example.com', '52, boulevard Stéphane Fleury', '40387', 'Begue'),
(9, 'benoit44', '[]', '$2y$13$O9bED6YNIJM6H6m282epoOzrLh5slyPTeh4jANCZMbdBjpQhxVHA6', 'Germain', 'Maggie', '3589177185', 'userdemo8@example.com', '79, chemin Geneviève Lucas', '27637', 'Roussel'),
(10, 'gerard97', '[]', '$2y$13$.XvNT8T3RjA2WgEWNjpMie7dZmeHLVuIbTNhzbiPVu406UL8i46SS', 'Samson', 'Roger', '3505632163', 'userdemo9@example.com', '16, impasse Lemaitre', '06147', 'Pichon-les-Bains'),
(11, 'margaux84', '[]', '$2y$13$ZWy..h4cXVJuEXW5/6cB4OLEkbO6ZmtiKnQNZjxcV8hnBre./AIsy', 'Bonnin', 'François', '3262653366', 'userdemo0@example.com', '56, rue de Fischer', '79452', 'Bazin'),
(12, 'benjamin.martins', '[]', '$2y$13$n/xx3/awnAG7sfdegO9J/O/wSDw7ac4uE6IANC5pruYt04I8qctvi', 'Traore', 'Michel', '3883696813', 'userdemo1@example.com', '89, rue Courtois', '76787', 'Moreau'),
(13, 'wpons', '[]', '$2y$13$JSzlu0fsFpU2wAAAMQCosetffYt/u2CrtfezGPoUsNre5Ph/rHozW', 'Marie', 'Gabriel', '3560701364', 'userdemo2@example.com', '604, impasse Adrien Millet', '95500', 'Techer-sur-Mer'),
(14, 'william56', '[]', '$2y$13$qJWO0BX9fmSd10cNeEmd.OvoBkgsAqsTOA3PBHFHjl/d0oKQnzk4i', 'Legros', 'Roger', '3800553089', 'userdemo3@example.com', '56, rue André Humbert', '58584', 'Fernandez'),
(15, 'voisin.margaux', '[]', '$2y$13$ciTMe5y7vlafx9yOBQsZT.9pLgZgLpMU.Fr.g93DNFNl2hfgEnb02', 'Da Costa', 'Tristan', '3026625513', 'userdemo4@example.com', '753, avenue de Carlier', '78973', 'Dumas'),
(16, 'iguibert', '[]', '$2y$13$pZlwiVMrQahM9V939r87gebkZKd5yCduaNTcTBFHRyDrSvHQl6Jfe', 'Diallo', 'Xavier', '3069584993', 'userdemo5@example.com', '21, avenue Gros', '76354', 'Lebreton-la-Forêt'),
(17, 'louise.petitjean', '[]', '$2y$13$CQ3XEGFltzhbhULv8i.S5O2/RFHGjxJFjkZQyv2.Y2kfPuDtKD5CK', 'Roche', 'Maurice', '3480482533', 'userdemo6@example.com', '48, rue Anastasie Laporte', '83790', 'Carpentierboeuf'),
(18, 'danielle.bertin', '[]', '$2y$13$QYu9gIJP5N1/nHbDQC0ylOML0eCXnw7iovlu0dGWFk5orZGTsiMES', 'Pages', 'Colette', '3033024405', 'userdemo7@example.com', '6, place de Buisson', '55281', 'Gregoire'),
(19, 'zroux', '[]', '$2y$13$xlkd171zp0elLyTEIOn/wOesDQTdhaHgC3W64Ri8kvSjHnsJ0TWCO', 'Bouvet', 'Richard', '3526646485', 'userdemo8@example.com', '68, place Peltier', '18731', 'Picard-sur-Deschamps'),
(20, 'leroy.vincent', '[]', '$2y$13$uyVYOzNlUSUZbwbHGr9kx.waLkbDrnesLgKxw6q3ka6rW.naLaRfi', 'Laine', 'Martin', '3817284119', 'userdemo9@example.com', '7, avenue Martin Gimenez', '83115', 'Duval'),
(21, 'anis', '[]', '$2y$13$Z3Mbtgf2n5acTIfC8p0ofeAo4pGDzGNWxv/8fNpXu52E/fFvG4Rpi', 'wagner', 'anis', NULL, 'aniswagner6@gmail.com', '1 Avenue Admin', '75000', 'Paris');

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

CREATE TABLE `participant` (
  `id` int NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `participant`
--

INSERT INTO `participant` (`id`, `prenom`, `nom`, `telephone`, `email`) VALUES
(1, 'anis', 'wagner', '0749285128', 'aniswagner6@gmail.com'),
(2, 'gabriel', 'bravo_domont', '0780326491', 'gabrielbravodomont@gmail.com'),
(3, 'Sophie', 'Martin', '0612345678', 'sophie.martin@email.com'),
(4, 'Thomas', 'Dubois', '0623456789', 'thomas.dubois@email.com'),
(5, 'Emma', 'Bernard', '0634567890', 'emma.bernard@email.com'),
(6, 'Lucas', 'Petit', '0645678901', 'lucas.petit@email.com');

-- --------------------------------------------------------

--
-- Table structure for table `pegi`
--

CREATE TABLE `pegi` (
  `id` int NOT NULL,
  `age_limite` int NOT NULL,
  `desc_pegi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pegi`
--

INSERT INTO `pegi` (`id`, `age_limite`, `desc_pegi`) VALUES
(1, 3, 'Jeux adaptés à toutes les classes d\'âge'),
(2, 7, 'Déconseillé aux moins de 7 ans'),
(3, 12, 'Déconseillé aux moins de 12 ans'),
(4, 16, 'Déconseillé aux moins de 16 ans'),
(5, 18, 'Réservé aux adultes');

-- --------------------------------------------------------

--
-- Table structure for table `plateforme`
--

CREATE TABLE `plateforme` (
  `id` int NOT NULL,
  `lib_platforme` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plateforme`
--

INSERT INTO `plateforme` (`id`, `lib_platforme`) VALUES
(1, 'PlayStation 5'),
(2, 'Nintendo Switch'),
(3, 'PC'),
(4, 'Xbox Series X/S'),
(5, 'PlayStation 4'),
(6, 'Xbox One'),
(7, 'Nintendo 3DS'),
(8, 'PlayStation 3'),
(9, 'Xbox 360');

-- --------------------------------------------------------

--
-- Table structure for table `tournoi`
--

CREATE TABLE `tournoi` (
  `id` int NOT NULL,
  `categorie_id` int DEFAULT NULL,
  `libelle` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `date_creation` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tournoi`
--

INSERT INTO `tournoi` (`id`, `categorie_id`, `libelle`, `date`, `date_creation`) VALUES
(1, 1, 'Championnat FPS 2025', '2025-12-15 18:00:00', '2025-11-20 19:05:00'),
(2, 2, 'Tournoi League of Legends', '2025-12-20 19:00:00', '2025-11-25 10:00:00'),
(3, 3, 'Fortnite Battle Royale', '2025-12-10 16:00:00', '2025-11-28 14:30:00'),
(4, 6, 'Championnat FIFA 24', '2025-12-18 15:00:00', '2025-11-30 09:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tournoi_participant`
--

CREATE TABLE `tournoi_participant` (
  `tournoi_id` int NOT NULL,
  `participant_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tournoi_participant`
--

INSERT INTO `tournoi_participant` (`tournoi_id`, `participant_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 2),
(2, 4),
(2, 5),
(3, 1),
(3, 3),
(3, 6),
(4, 4),
(4, 5),
(4, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cat_tournois`
--
ALTER TABLE `cat_tournois`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jeu_video`
--
ALTER TABLE `jeu_video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4E22D9D4391E226B` (`plateforme_id`),
  ADD KEY `IDX_4E22D9D4DD019E4A` (`pegi_id`),
  ADD KEY `IDX_4E22D9D44296D31F` (`genre_id`),
  ADD KEY `IDX_4E22D9D44827B9B2` (`marque_id`);

--
-- Indexes for table `marque`
--
ALTER TABLE `marque`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `membre`
--
ALTER TABLE `membre`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_USERNAME` (`username`);

--
-- Indexes for table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pegi`
--
ALTER TABLE `pegi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plateforme`
--
ALTER TABLE `plateforme`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tournoi`
--
ALTER TABLE `tournoi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_18AFD9DFBCF5E72D` (`categorie_id`);

--
-- Indexes for table `tournoi_participant`
--
ALTER TABLE `tournoi_participant`
  ADD PRIMARY KEY (`tournoi_id`,`participant_id`),
  ADD KEY `IDX_9C531479F607770A` (`tournoi_id`),
  ADD KEY `IDX_9C5314799D1C3019` (`participant_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cat_tournois`
--
ALTER TABLE `cat_tournois`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `jeu_video`
--
ALTER TABLE `jeu_video`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `marque`
--
ALTER TABLE `marque`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `membre`
--
ALTER TABLE `membre`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `participant`
--
ALTER TABLE `participant`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pegi`
--
ALTER TABLE `pegi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `plateforme`
--
ALTER TABLE `plateforme`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tournoi`
--
ALTER TABLE `tournoi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jeu_video`
--
ALTER TABLE `jeu_video`
  ADD CONSTRAINT `FK_4E22D9D4391E226B` FOREIGN KEY (`plateforme_id`) REFERENCES `plateforme` (`id`),
  ADD CONSTRAINT `FK_4E22D9D44296D31F` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`),
  ADD CONSTRAINT `FK_4E22D9D44827B9B2` FOREIGN KEY (`marque_id`) REFERENCES `marque` (`id`),
  ADD CONSTRAINT `FK_4E22D9D4DD019E4A` FOREIGN KEY (`pegi_id`) REFERENCES `pegi` (`id`);

--
-- Constraints for table `tournoi`
--
ALTER TABLE `tournoi`
  ADD CONSTRAINT `FK_18AFD9DFBCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `cat_tournois` (`id`);

--
-- Constraints for table `tournoi_participant`
--
ALTER TABLE `tournoi_participant`
  ADD CONSTRAINT `FK_9C5314799D1C3019` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_9C531479F607770A` FOREIGN KEY (`tournoi_id`) REFERENCES `tournoi` (`id`) ON DELETE CASCADE;
--
-- Database: `banque`
--
CREATE DATABASE IF NOT EXISTS `banque` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `banque`;

-- --------------------------------------------------------

--
-- Table structure for table `agence`
--

CREATE TABLE `agence` (
  `NoAgence` int NOT NULL,
  `Localisation` int NOT NULL,
  `NoCompte` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `NoClient` int NOT NULL,
  `Nom` int NOT NULL,
  `Adresse` int NOT NULL,
  `Civilité` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `compte`
--

CREATE TABLE `compte` (
  `NoCompte` int NOT NULL,
  `Solde` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
--
-- Database: `bricolo`
--
CREATE DATABASE IF NOT EXISTS `bricolo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `bricolo`;

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `idCategorie` int NOT NULL,
  `idCategSup` int DEFAULT NULL,
  `libCategorie` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `categorie`
--

INSERT INTO `categorie` (`idCategorie`, `idCategSup`, `libCategorie`) VALUES
(1, NULL, 'Outillage'),
(2, 1, 'Outillage à main'),
(3, NULL, 'Menuiserie'),
(4, 3, 'Lambris'),
(5, 3, 'Parquet'),
(6, 3, 'Panneau'),
(7, 2, 'Marteau'),
(8, 2, 'Tournevis'),
(9, NULL, 'Décoration'),
(10, 9, 'Papier peint'),
(11, 9, 'Store'),
(12, 1, 'Outillage électroportatif'),
(13, 9, 'Rideau'),
(14, 9, 'Voilage');

-- --------------------------------------------------------

--
-- Table structure for table `couleur`
--

CREATE TABLE `couleur` (
  `idCouleur` int NOT NULL,
  `libCouleur` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `couleur`
--

INSERT INTO `couleur` (`idCouleur`, `libCouleur`) VALUES
(1, 'blanc'),
(2, 'gris'),
(3, 'beige'),
(4, 'jaune / doré'),
(5, 'orange / cuivré'),
(6, 'rouge'),
(7, 'rose'),
(8, 'violet'),
(9, 'bleu'),
(10, 'vert'),
(11, 'marron'),
(12, 'noir'),
(13, 'multicolor'),
(20, 'mauve');

-- --------------------------------------------------------

--
-- Table structure for table `decoration`
--

CREATE TABLE `decoration` (
  `refProduit` varchar(16) NOT NULL,
  `idCategorie` int NOT NULL,
  `idCouleur` int DEFAULT NULL,
  `idStyle` int DEFAULT NULL,
  `idEffet` int DEFAULT NULL,
  `idMotif` int DEFAULT NULL,
  `idMarque` int DEFAULT NULL,
  `libProduit` varchar(100) NOT NULL,
  `prix` decimal(6,2) NOT NULL,
  `longueur` decimal(5,2) DEFAULT NULL,
  `largeur` decimal(5,2) DEFAULT NULL,
  `dateEntree` date NOT NULL DEFAULT '2018-03-16'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `decoration`
--

INSERT INTO `decoration` (`refProduit`, `idCategorie`, `idCouleur`, `idStyle`, `idEffet`, `idMotif`, `idMarque`, `libProduit`, `prix`, `longueur`, `largeur`, `dateEntree`) VALUES
('1648763098765', 10, 3, 3, 6, 6, 8, 'papier peint vinyle briques vieillies', 18.90, 10.05, 1.06, '2017-03-27'),
('17464547585', 10, 12, 1, NULL, NULL, 11, 'papier peint médaillon', 21.00, 10.40, 0.53, '2018-03-19'),
('174937464478', 10, 1, 4, NULL, 4, 9, 'papier peint intissé losange', 18.80, 10.05, 0.53, '2018-04-18'),
('17495867302', 10, 10, 8, NULL, 5, 9, 'papier peint intissé jungle', 18.90, 10.05, 0.43, '2018-03-12'),
('1758698745365', 10, 1, 3, 6, 6, 9, 'papier peint intissé Brique 3d', 29.90, 10.05, 0.53, '2016-03-28'),
('1847562098754', 13, 3, 4, NULL, 3, 8, 'rideau tamisant Lumia', 42.90, 2.50, 1.35, '2017-03-30'),
('184756383746', 10, 1, 3, 7, 6, 8, 'papier peint intissé planche de bois', 16.90, 10.05, 0.53, '2018-03-06'),
('1876354759876', 13, 10, 8, NULL, 1, 11, 'rideau tamisant Florence', 59.90, 2.45, 1.40, '2017-03-22');

-- --------------------------------------------------------

--
-- Table structure for table `decorationarchive`
--

CREATE TABLE `decorationarchive` (
  `refProduitArch` varchar(16) NOT NULL,
  `libProduitArch` varchar(100) NOT NULL,
  `idCategorieArch` int NOT NULL,
  `idCouleurArch` int DEFAULT NULL,
  `idStyleArch` int DEFAULT NULL,
  `idEffetArch` int DEFAULT NULL,
  `idMotifArch` int DEFAULT NULL,
  `idMarqueArch` int DEFAULT NULL,
  `prixArch` decimal(6,2) NOT NULL,
  `largeurArch` decimal(5,2) DEFAULT NULL,
  `longueurArch` decimal(5,2) DEFAULT NULL,
  `dateEntreeArch` date NOT NULL DEFAULT '2018-03-16'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Stand-in structure for view `deco_prix_bas`
-- (See below for the actual view)
--
CREATE TABLE `deco_prix_bas` (
`refProduit` varchar(16)
,`idCategorie` int
,`idCouleur` int
,`idStyle` int
,`idEffet` int
,`idMotif` int
,`idMarque` int
,`libProduit` varchar(100)
,`prix` decimal(6,2)
,`longueur` decimal(5,2)
,`largeur` decimal(5,2)
,`dateEntree` date
);

-- --------------------------------------------------------

--
-- Table structure for table `effet`
--

CREATE TABLE `effet` (
  `idEffet` int NOT NULL,
  `libEffet` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `effet`
--

INSERT INTO `effet` (`idEffet`, `libEffet`) VALUES
(1, 'Mat'),
(2, 'Nacré'),
(3, 'Pailleté'),
(4, 'Métallisé'),
(5, 'Flocké'),
(6, 'Brique'),
(7, 'Bois');

-- --------------------------------------------------------

--
-- Table structure for table `magasin`
--

CREATE TABLE `magasin` (
  `idMagasin` int NOT NULL,
  `nomMagasin` varchar(38) NOT NULL,
  `adrComp2Magasin` varchar(38) DEFAULT NULL,
  `numRueMagasin` varchar(10) DEFAULT NULL,
  `rueMagasin` varchar(38) NOT NULL,
  `adrComp4Magasin` varchar(38) DEFAULT NULL,
  `adrComp5Magasin` varchar(38) DEFAULT NULL,
  `codePostalMagasin` varchar(5) NOT NULL,
  `villeMagasin` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `magasin`
--

INSERT INTO `magasin` (`idMagasin`, `nomMagasin`, `adrComp2Magasin`, `numRueMagasin`, `rueMagasin`, `adrComp4Magasin`, `adrComp5Magasin`, `codePostalMagasin`, `villeMagasin`) VALUES
(1, 'Metz Hauconcourt', NULL, NULL, 'Zone industrielle d\'Hauconcourt', NULL, NULL, '57280', 'Hauconcourt'),
(2, 'Nancy Sud', NULL, NULL, 'ZAC de Frocourt', 'BP 50652', NULL, '54180', 'Houdemont'),
(3, 'Strasbourg Nord', NULL, '15', 'rue de la Meinau', NULL, NULL, '67200', 'Strasbourg'),
(4, 'Haguenau-Bischwiller', NULL, '18', 'rue Victor Hugo', NULL, NULL, '67500', 'Haguenau');

-- --------------------------------------------------------

--
-- Stand-in structure for view `magasins_alsace`
-- (See below for the actual view)
--
CREATE TABLE `magasins_alsace` (
`idMagasin` int
,`nomMagasin` varchar(38)
,`adrComp2Magasin` varchar(38)
,`numRueMagasin` varchar(10)
,`rueMagasin` varchar(38)
,`adrComp4Magasin` varchar(38)
,`adrComp5Magasin` varchar(38)
,`codePostalMagasin` varchar(5)
,`villeMagasin` varchar(32)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `magasin_alsace`
-- (See below for the actual view)
--
CREATE TABLE `magasin_alsace` (
`idMagasin` int
,`nomMagasin` varchar(38)
,`adrComp2Magasin` varchar(38)
,`numRueMagasin` varchar(10)
,`rueMagasin` varchar(38)
,`adrComp4Magasin` varchar(38)
,`adrComp5Magasin` varchar(38)
,`codePostalMagasin` varchar(5)
,`villeMagasin` varchar(32)
);

-- --------------------------------------------------------

--
-- Table structure for table `marque`
--

CREATE TABLE `marque` (
  `idMarque` int NOT NULL,
  `nomMarque` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Les marques des produits';

--
-- Dumping data for table `marque`
--

INSERT INTO `marque` (`idMarque`, `nomMarque`) VALUES
(1, 'Dexter'),
(2, 'Stanley'),
(3, 'Outifrance'),
(4, 'Facom'),
(5, 'Grosfillex'),
(6, 'Dumawall'),
(7, 'Alsafloor'),
(8, 'Casadeco'),
(9, 'Graham & Brown'),
(10, 'Bosch'),
(11, 'Bensimon'),
(12, 'Freegun');

-- --------------------------------------------------------

--
-- Table structure for table `motif`
--

CREATE TABLE `motif` (
  `idMotif` int NOT NULL,
  `libMotif` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `motif`
--

INSERT INTO `motif` (`idMotif`, `libMotif`) VALUES
(1, 'Uni'),
(2, 'Rayures'),
(3, 'Lignes et courbes'),
(4, 'Géométrique'),
(5, 'Fleur et feuillage'),
(6, 'Trompe-l\'oeil'),
(7, 'Enfant'),
(8, 'Urbain');

-- --------------------------------------------------------

--
-- Table structure for table `outillage_electro`
--

CREATE TABLE `outillage_electro` (
  `refProduit` varchar(16) NOT NULL,
  `idCategorie` int NOT NULL,
  `idMarque` int DEFAULT NULL,
  `libelle` varchar(100) NOT NULL,
  `prix` decimal(6,2) NOT NULL,
  `unite` char(3) DEFAULT NULL,
  `idCouleur` int DEFAULT NULL,
  `poids` decimal(5,2) DEFAULT NULL,
  `puissance_watt` int NOT NULL,
  `dateEntree` date NOT NULL DEFAULT '2018-03-16'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `outillage_electro`
--

INSERT INTO `outillage_electro` (`refProduit`, `idCategorie`, `idMarque`, `libelle`, `prix`, `unite`, `idCouleur`, `poids`, `puissance_watt`, `dateEntree`) VALUES
('658964325787', 12, 10, 'perforateur SDS Plus', 109.00, NULL, 10, 2.20, 600, '2018-03-21'),
('768798098763', 12, 1, 'ponceuse excentrique filaire', 32.85, NULL, 9, 1.30, 350, '2018-03-28'),
('REF-AREBOS-710', 12, NULL, 'Ponceuse vibrante Arebos', 99.95, NULL, 6, NULL, 710, '2025-11-28');

-- --------------------------------------------------------

--
-- Table structure for table `outillage_main`
--

CREATE TABLE `outillage_main` (
  `refProduit` varchar(16) NOT NULL,
  `idCategorie` int NOT NULL,
  `idMarque` int DEFAULT NULL,
  `libProduit` varchar(100) NOT NULL,
  `prix` decimal(6,2) NOT NULL,
  `poids` decimal(5,2) DEFAULT NULL,
  `longueur` decimal(5,2) DEFAULT NULL,
  `largeurTete` decimal(5,2) DEFAULT NULL,
  `dateEntree` date NOT NULL DEFAULT '2018-03-16'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `outillage_main`
--

INSERT INTO `outillage_main` (`refProduit`, `idCategorie`, `idMarque`, `libProduit`, `prix`, `poids`, `longueur`, `largeurTete`, `dateEntree`) VALUES
('654328798765', 8, 4, 'tournevis torx 25 X 100 mm', 3.75, 0.55, 22.00, NULL, '2018-03-16'),
('654398765432', 8, 1, 'tournevis boule plat 5.5', 3.95, 0.04, 2.50, NULL, '2018-03-20'),
('765439876543', 7, 1, 'massette', 11.50, 1.50, 28.00, 4.30, '2018-03-16'),
('876549876543', 7, 1, 'marteau de menuisier', 7.80, 0.31, 30.30, 2.50, '2018-06-11'),
('REF-AREBOS-710', 2, NULL, 'Ponceuse vibrante Arebos', 99.95, NULL, NULL, NULL, '2025-11-28');

-- --------------------------------------------------------

--
-- Table structure for table `style`
--

CREATE TABLE `style` (
  `idStyle` int NOT NULL,
  `libStyle` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `style`
--

INSERT INTO `style` (`idStyle`, `libStyle`) VALUES
(1, 'Baroque'),
(2, 'Bohème'),
(3, 'Campagne'),
(4, 'Classique'),
(5, 'Enfant'),
(6, 'Ethnique'),
(7, 'Industriel'),
(8, 'Nature');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idCategorie`),
  ADD KEY `fk_categorie_categorie` (`idCategSup`);

--
-- Indexes for table `couleur`
--
ALTER TABLE `couleur`
  ADD PRIMARY KEY (`idCouleur`);

--
-- Indexes for table `decoration`
--
ALTER TABLE `decoration`
  ADD PRIMARY KEY (`refProduit`),
  ADD KEY `fk_decoration_marque` (`idMarque`),
  ADD KEY `fk_decoration_style` (`idStyle`),
  ADD KEY `fk_decoration_effet` (`idEffet`),
  ADD KEY `fk_decoration_motif` (`idMotif`),
  ADD KEY `fk_decoration_couleur` (`idCouleur`),
  ADD KEY `fk_decoration_categorie` (`idCategorie`);

--
-- Indexes for table `decorationarchive`
--
ALTER TABLE `decorationarchive`
  ADD PRIMARY KEY (`refProduitArch`),
  ADD KEY `fk_decoration_arch_marque` (`idMarqueArch`),
  ADD KEY `fk_decoration_arch_style` (`idStyleArch`),
  ADD KEY `fk_decoration_arch_effet` (`idEffetArch`),
  ADD KEY `fk_decoration_arch_motif` (`idMotifArch`),
  ADD KEY `fk_decoration_arch_couleur` (`idCouleurArch`),
  ADD KEY `fk_decoration_arch_categorie` (`idCategorieArch`);

--
-- Indexes for table `effet`
--
ALTER TABLE `effet`
  ADD PRIMARY KEY (`idEffet`);

--
-- Indexes for table `magasin`
--
ALTER TABLE `magasin`
  ADD PRIMARY KEY (`idMagasin`);

--
-- Indexes for table `marque`
--
ALTER TABLE `marque`
  ADD PRIMARY KEY (`idMarque`);

--
-- Indexes for table `motif`
--
ALTER TABLE `motif`
  ADD PRIMARY KEY (`idMotif`);

--
-- Indexes for table `outillage_electro`
--
ALTER TABLE `outillage_electro`
  ADD PRIMARY KEY (`refProduit`),
  ADD KEY `fk_outillage_electro_marque` (`idMarque`),
  ADD KEY `fk_outillage_electro_couleur` (`idCouleur`),
  ADD KEY `fk_outillage_electro_categorie` (`idCategorie`);

--
-- Indexes for table `outillage_main`
--
ALTER TABLE `outillage_main`
  ADD PRIMARY KEY (`refProduit`),
  ADD KEY `fk_outillage_main-categorie` (`idCategorie`),
  ADD KEY `fk_outillage_main_marque` (`idMarque`);

--
-- Indexes for table `style`
--
ALTER TABLE `style`
  ADD PRIMARY KEY (`idStyle`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `idCategorie` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `couleur`
--
ALTER TABLE `couleur`
  MODIFY `idCouleur` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `effet`
--
ALTER TABLE `effet`
  MODIFY `idEffet` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `magasin`
--
ALTER TABLE `magasin`
  MODIFY `idMagasin` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `marque`
--
ALTER TABLE `marque`
  MODIFY `idMarque` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `motif`
--
ALTER TABLE `motif`
  MODIFY `idMotif` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `style`
--
ALTER TABLE `style`
  MODIFY `idStyle` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

-- --------------------------------------------------------

--
-- Structure for view `deco_prix_bas`
--
DROP TABLE IF EXISTS `deco_prix_bas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `deco_prix_bas`  AS SELECT `decoration`.`refProduit` AS `refProduit`, `decoration`.`idCategorie` AS `idCategorie`, `decoration`.`idCouleur` AS `idCouleur`, `decoration`.`idStyle` AS `idStyle`, `decoration`.`idEffet` AS `idEffet`, `decoration`.`idMotif` AS `idMotif`, `decoration`.`idMarque` AS `idMarque`, `decoration`.`libProduit` AS `libProduit`, `decoration`.`prix` AS `prix`, `decoration`.`longueur` AS `longueur`, `decoration`.`largeur` AS `largeur`, `decoration`.`dateEntree` AS `dateEntree` FROM `decoration` WHERE (`decoration`.`prix` <= 20) ;

-- --------------------------------------------------------

--
-- Structure for view `magasins_alsace`
--
DROP TABLE IF EXISTS `magasins_alsace`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ynarbey`@`%` SQL SECURITY DEFINER VIEW `magasins_alsace`  AS SELECT `magasin`.`idMagasin` AS `idMagasin`, `magasin`.`nomMagasin` AS `nomMagasin`, `magasin`.`adrComp2Magasin` AS `adrComp2Magasin`, `magasin`.`numRueMagasin` AS `numRueMagasin`, `magasin`.`rueMagasin` AS `rueMagasin`, `magasin`.`adrComp4Magasin` AS `adrComp4Magasin`, `magasin`.`adrComp5Magasin` AS `adrComp5Magasin`, `magasin`.`codePostalMagasin` AS `codePostalMagasin`, `magasin`.`villeMagasin` AS `villeMagasin` FROM `magasin` WHERE ((left(`magasin`.`codePostalMagasin`,2) = '67') OR (left(`magasin`.`codePostalMagasin`,2) = '68')) ;

-- --------------------------------------------------------

--
-- Structure for view `magasin_alsace`
--
DROP TABLE IF EXISTS `magasin_alsace`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `magasin_alsace`  AS SELECT `magasin`.`idMagasin` AS `idMagasin`, `magasin`.`nomMagasin` AS `nomMagasin`, `magasin`.`adrComp2Magasin` AS `adrComp2Magasin`, `magasin`.`numRueMagasin` AS `numRueMagasin`, `magasin`.`rueMagasin` AS `rueMagasin`, `magasin`.`adrComp4Magasin` AS `adrComp4Magasin`, `magasin`.`adrComp5Magasin` AS `adrComp5Magasin`, `magasin`.`codePostalMagasin` AS `codePostalMagasin`, `magasin`.`villeMagasin` AS `villeMagasin` FROM `magasin` WHERE ((`magasin`.`codePostalMagasin` like '67%') OR (`magasin`.`codePostalMagasin` like '68%')) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categorie`
--
ALTER TABLE `categorie`
  ADD CONSTRAINT `fk_categorie_categorie` FOREIGN KEY (`idCategSup`) REFERENCES `categorie` (`idCategorie`) ON DELETE CASCADE;

--
-- Constraints for table `decoration`
--
ALTER TABLE `decoration`
  ADD CONSTRAINT `fk_decoration_categorie` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`idCategorie`),
  ADD CONSTRAINT `fk_decoration_couleur` FOREIGN KEY (`idCouleur`) REFERENCES `couleur` (`idCouleur`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_decoration_effet` FOREIGN KEY (`idEffet`) REFERENCES `effet` (`idEffet`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_decoration_marque` FOREIGN KEY (`idMarque`) REFERENCES `marque` (`idMarque`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_decoration_motif` FOREIGN KEY (`idMotif`) REFERENCES `motif` (`idMotif`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_decoration_style` FOREIGN KEY (`idStyle`) REFERENCES `style` (`idStyle`) ON DELETE SET NULL;

--
-- Constraints for table `decorationarchive`
--
ALTER TABLE `decorationarchive`
  ADD CONSTRAINT `fk_decorationArch_categorie` FOREIGN KEY (`idCategorieArch`) REFERENCES `categorie` (`idCategorie`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_decorationArch_couleur` FOREIGN KEY (`idCouleurArch`) REFERENCES `couleur` (`idCouleur`) ON DELETE SET NULL ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_decorationArch_effet` FOREIGN KEY (`idCouleurArch`) REFERENCES `couleur` (`idCouleur`) ON DELETE SET NULL ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_decorationArch_marque` FOREIGN KEY (`idMarqueArch`) REFERENCES `marque` (`idMarque`) ON DELETE SET NULL ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_decorationArch_motif` FOREIGN KEY (`idMotifArch`) REFERENCES `motif` (`idMotif`) ON DELETE SET NULL ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_decorationArch_style` FOREIGN KEY (`idStyleArch`) REFERENCES `style` (`idStyle`) ON DELETE SET NULL ON UPDATE RESTRICT;

--
-- Constraints for table `outillage_electro`
--
ALTER TABLE `outillage_electro`
  ADD CONSTRAINT `fk_outillage_electro_categorie` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`idCategorie`),
  ADD CONSTRAINT `fk_outillage_electro_couleur` FOREIGN KEY (`idCouleur`) REFERENCES `couleur` (`idCouleur`),
  ADD CONSTRAINT `fk_outillage_electro_marque` FOREIGN KEY (`idMarque`) REFERENCES `marque` (`idMarque`);

--
-- Constraints for table `outillage_main`
--
ALTER TABLE `outillage_main`
  ADD CONSTRAINT `fk_outillage_main-categorie` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`idCategorie`),
  ADD CONSTRAINT `fk_outillage_main_marque` FOREIGN KEY (`idMarque`) REFERENCES `marque` (`idMarque`) ON DELETE SET NULL;
--
-- Database: `mabdd`
--
CREATE DATABASE IF NOT EXISTS `mabdd` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci;
USE `mabdd`;

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `num_cat` int NOT NULL,
  `lib_cat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `categorie`
--

INSERT INTO `categorie` (`num_cat`, `lib_cat`) VALUES
(1, 'grand compte'),
(2, 'particulier'),
(3, 'PME'),
(4, 'TPE');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `num_client` int NOT NULL,
  `nom_client` varchar(32) NOT NULL,
  `prenom_client` varchar(32) NOT NULL,
  `email_client` varchar(255) NOT NULL,
  `num_cat` int NOT NULL,
  `num_ent` int DEFAULT NULL,
  `chiffreaffaire_client` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`num_client`, `nom_client`, `prenom_client`, `email_client`, `num_cat`, `num_ent`, `chiffreaffaire_client`) VALUES
(3, 'MARTIN', 'Gérard', 'g.martin@wanadoo.fr', 2, NULL, NULL),
(4, 'AHMADI', 'Selim', 's.ahmadi@gdf.fr', 1, 2, NULL),
(5, 'FRAGONA', 'Raoul', 'fragona-plomberie@gmail.com', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE `commande` (
  `num_cde` int NOT NULL,
  `date_cde` date NOT NULL,
  `num_client` int NOT NULL,
  `montant_cde` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `commande`
--

INSERT INTO `commande` (`num_cde`, `date_cde`, `num_client`, `montant_cde`) VALUES
(1, '2023-09-11', 4, NULL),
(2, '2023-11-14', 3, NULL),
(4, '2025-11-14', 5, 123.45),
(5, '2025-11-14', 5, 123.45),
(6, '2025-11-14', 5, 123.45),
(7, '2025-11-14', 5, 123.45),
(8, '2025-11-14', 5, 123.45),
(9, '2025-11-14', 5, 123.45),
(10, '2025-11-14', 5, 123.45);

--
-- Triggers `commande`
--
DELIMITER $$
CREATE TRIGGER `ajouter_montant_au_chiffreaffaire` AFTER INSERT ON `commande` FOR EACH ROW BEGIN
    UPDATE client 
    SET chiffreaffaire_client = IFNULL(chiffreaffaire_client, 0) + NEW.montant_cde
    WHERE num_client = NEW.num_client;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `controle_miseajour` AFTER INSERT ON `commande` FOR EACH ROW BEGIN
    IF NEW.montant_cde < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Le montant doit être positif';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `modifier_montant_chiffreaffaire` AFTER UPDATE ON `commande` FOR EACH ROW BEGIN
	UPDATE client
	SET chiffreaffaire_client = IFNULL(chiffreaffaire_client, 0) - OLD.montant_cde + NEW.montant_cde
	WHERE num_client = NEW.num_client;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `supprimer_montant_chiffreaffaire` AFTER DELETE ON `commande` FOR EACH ROW BEGIN
    UPDATE client
    SET chiffreaffaire_client = chiffreaffaire_client - OLD.montant_cde
    WHERE num_client = OLD.num_client;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `entreprise`
--

CREATE TABLE `entreprise` (
  `num_ent` int NOT NULL,
  `nom_ent` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `entreprise`
--

INSERT INTO `entreprise` (`num_ent`, `nom_ent`) VALUES
(1, 'Mairie de Metz'),
(2, 'Gaz de France');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`num_cat`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`num_client`),
  ADD KEY `fk_clientCategorie` (`num_cat`),
  ADD KEY `fk_clientEntreprise` (`num_ent`);

--
-- Indexes for table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`num_cde`),
  ADD KEY `num_client` (`num_client`);

--
-- Indexes for table `entreprise`
--
ALTER TABLE `entreprise`
  ADD PRIMARY KEY (`num_ent`),
  ADD KEY `num_ent` (`num_ent`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `num_cat` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `num_client` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `commande`
--
ALTER TABLE `commande`
  MODIFY `num_cde` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `entreprise`
--
ALTER TABLE `entreprise`
  MODIFY `num_ent` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_clientCategorie` FOREIGN KEY (`num_cat`) REFERENCES `categorie` (`num_cat`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_clientEntreprise` FOREIGN KEY (`num_ent`) REFERENCES `entreprise` (`num_ent`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`num_client`) REFERENCES `client` (`num_client`) ON DELETE RESTRICT ON UPDATE RESTRICT;
--
-- Database: `vaccination`
--
CREATE DATABASE IF NOT EXISTS `vaccination` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `vaccination`;

-- --------------------------------------------------------

--
-- Table structure for table `centrevaccination`
--

CREATE TABLE `centrevaccination` (
  `ID_CentreVaccination` int NOT NULL,
  `Nom_Centre` varchar(100) NOT NULL,
  `Adresse` varchar(255) NOT NULL,
  `Ville` varchar(100) NOT NULL,
  `Code_Postal` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maladie`
--

CREATE TABLE `maladie` (
  `ID_Maladie` int NOT NULL,
  `Nom_Maladie` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medecin`
--

CREATE TABLE `medecin` (
  `ID_Medecin` int NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Specialite` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `ID_Patient` int NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Date_Naissance` date NOT NULL,
  `Sexe` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vaccin`
--

CREATE TABLE `vaccin` (
  `ID_Vaccin` int NOT NULL,
  `Nom_Vaccin` varchar(100) NOT NULL,
  `Description` text,
  `ID_Maladie` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vaccination`
--

CREATE TABLE `vaccination` (
  `ID_Vaccination` int NOT NULL,
  `ID_Vaccin` int NOT NULL,
  `ID_Patient` int NOT NULL,
  `Date_Vaccination` date NOT NULL,
  `Dose_Administree` int NOT NULL,
  `ID_CentreVaccination` int NOT NULL,
  `ID_Medecin` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `centrevaccination`
--
ALTER TABLE `centrevaccination`
  ADD PRIMARY KEY (`ID_CentreVaccination`);

--
-- Indexes for table `maladie`
--
ALTER TABLE `maladie`
  ADD PRIMARY KEY (`ID_Maladie`);

--
-- Indexes for table `medecin`
--
ALTER TABLE `medecin`
  ADD PRIMARY KEY (`ID_Medecin`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`ID_Patient`);

--
-- Indexes for table `vaccin`
--
ALTER TABLE `vaccin`
  ADD PRIMARY KEY (`ID_Vaccin`),
  ADD KEY `fk_vaccin_maladie` (`ID_Maladie`);

--
-- Indexes for table `vaccination`
--
ALTER TABLE `vaccination`
  ADD PRIMARY KEY (`ID_Vaccination`),
  ADD KEY `fk_vaccination_vaccin` (`ID_Vaccin`),
  ADD KEY `fk_vaccination_patient` (`ID_Patient`),
  ADD KEY `fk_vaccination_centre` (`ID_CentreVaccination`),
  ADD KEY `fk_vaccination_medecin` (`ID_Medecin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `centrevaccination`
--
ALTER TABLE `centrevaccination`
  MODIFY `ID_CentreVaccination` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maladie`
--
ALTER TABLE `maladie`
  MODIFY `ID_Maladie` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medecin`
--
ALTER TABLE `medecin`
  MODIFY `ID_Medecin` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `ID_Patient` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vaccin`
--
ALTER TABLE `vaccin`
  MODIFY `ID_Vaccin` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vaccination`
--
ALTER TABLE `vaccination`
  MODIFY `ID_Vaccination` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vaccin`
--
ALTER TABLE `vaccin`
  ADD CONSTRAINT `fk_vaccin_maladie` FOREIGN KEY (`ID_Maladie`) REFERENCES `maladie` (`ID_Maladie`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `vaccination`
--
ALTER TABLE `vaccination`
  ADD CONSTRAINT `fk_vaccination_centre` FOREIGN KEY (`ID_CentreVaccination`) REFERENCES `centrevaccination` (`ID_CentreVaccination`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vaccination_medecin` FOREIGN KEY (`ID_Medecin`) REFERENCES `medecin` (`ID_Medecin`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vaccination_patient` FOREIGN KEY (`ID_Patient`) REFERENCES `patient` (`ID_Patient`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vaccination_vaccin` FOREIGN KEY (`ID_Vaccin`) REFERENCES `vaccin` (`ID_Vaccin`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
