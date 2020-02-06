-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 16 jan. 2020 à 08:20
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `quiz`
--

-- --------------------------------------------------------

--
-- Structure de la table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `questions`
--

INSERT INTO `questions` (`id`, `libelle`) VALUES
(1, 'Quel était le premier nom du RER (Réseau Express Régional)?'),
(2, 'La Joconde n\'a pas de... ?'),
(3, 'Quelle était l\'infirmité de Graham Bell, l\'inventeur du téléphone ?'),
(4, 'Que veut dire \"Taekwondo\" en coréen ?'),
(5, 'Les premiers mots de Tarzan ont été :'),
(6, '\"La Bergère et le ramoneur\", c\'est :'),
(7, 'Le Middlesex, c\'est :'),
(8, 'De quel magazine François Mitterand a-t-il été rédacteur en chef ?'),
(9, 'Quand vous tirez la chasse d’eau, dans quel sens s’évacue l’eau ?'),
(10, 'Combien de cases y a-t-il sur un échiquier ?'),
(11, 'Un seul de ces super héros n’existe pas, lequel ?'),
(12, 'Parmi ces Schtroumpfs, un seul n’existe pas, lequel ?'),
(13, 'En plongée, que signifie le geste pouce et index joints faisant un cercle ?'),
(14, 'Lequel de ces films n\'existe pas ?'),
(15, 'Alf s\'appelle Alf parce que :');

-- --------------------------------------------------------

--
-- Structure de la table `reponses`
--

DROP TABLE IF EXISTS `reponses`;
CREATE TABLE IF NOT EXISTS `reponses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  `bonneReponse` int(1) NOT NULL,
  `questions_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reponses_questions1_idx` (`questions_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `reponses`
--

INSERT INTO `reponses` (`id`, `libelle`, `bonneReponse`, `questions_id`) VALUES
(1, 'Z.U.T', 0, 1),
(2, 'C.R.O.T.T.E', 0, 1),
(3, 'M.E.R.D.E', 1, 1),
(4, 'E.N.F.O.I.R.E', 0, 1),
(5, 'de culotte', 0, 2),
(6, 'de petit doigt', 0, 2),
(7, 'de charisme', 0, 2),
(8, 'de sourcils', 1, 2),
(9, 'il était de droite', 0, 3),
(10, 'il était de gauche', 0, 3),
(11, 'il était sourd', 1, 3),
(12, 'il boîtait', 0, 3),
(13, '\"2 sakés, l\'addition\"', 0, 4),
(14, 'la voie des tongs dans la gueule', 0, 4),
(15, 'la voie céleste du combat', 0, 4),
(16, 'la voie des poings et des pieds', 1, 4),
(17, 'Moi Tarzan, toi Jane', 1, 5),
(18, 'Moi Jane, toi Tarzan', 0, 5),
(19, 'Je me nomme Tarzan mais malheureusement je ne parle pas votre langue', 0, 5),
(20, 'Cheetah, je préfère qu\'on en reste là', 0, 5),
(21, 'un jeu de société très populaire en Suède', 0, 6),
(22, 'un conte d\'Andersen', 1, 6),
(23, 'une combinaison tactique de rugby', 0, 6),
(24, 'un film des années 1930', 0, 6),
(25, 'le sexe du milieu comme son nom l\'indique, le pénis donc', 0, 7),
(26, 'une danse suggestive anglaise des années 1960', 0, 7),
(27, 'l\'ancien comté d\'Angleterre, près de Londres', 1, 7),
(28, 'un retour de flamme vers la quarantaine pour les hommes', 0, 7),
(29, 'Vogue Homme', 0, 8),
(30, 'Votre beauté', 1, 8),
(31, 'Pif Gadget', 0, 8),
(32, 'François Mitterrand Magazine', 0, 8),
(33, 'Quoi il y a un sens ?', 0, 9),
(34, 'Dans le sens inverse des aiguilles d\'une montre', 1, 9),
(35, 'Dans le sens des aiguilles d\'une montre', 0, 9),
(36, 'Dans n\'importe quel sens, l\'eau fait ce qu\'elle veut', 0, 9),
(37, 'Cela dépend de la taille des cases', 0, 10),
(38, 'Cela dépend de la taille de l\'échiquier', 0, 10),
(39, 'Cela dépend de la taille des pièces', 0, 10),
(40, '64 cases', 1, 10),
(41, 'L\'homme araignée', 0, 11),
(42, 'L\'homme sable', 0, 11),
(43, 'L\'homme élastique', 0, 11),
(44, 'L\'homme purée', 1, 11),
(45, 'Le Schtroumpf à lunettes', 0, 12),
(46, 'Le grand Schtroumpf', 0, 12),
(47, 'Le Schtroumpf cosmonaute', 0, 12),
(48, 'Le Schtroumpf qui n’existe pas', 1, 12),
(49, 'Je lui ai mis la rondelle comme ça', 0, 13),
(50, 'Ta blague, elle vaut zéro', 0, 13),
(51, 'Je vais bien, tout va bien', 1, 13),
(52, 'Vas-y, vises là-dedans avec ton harpon', 0, 13),
(53, 'Nous y en a \"Riz le bol\"', 0, 14),
(54, 'J\'irai verser du Nuoc-mâm sur tes tripes', 0, 14),
(55, 'Les 5 panthères de Hong-Kong contre les noms de Shaolin', 1, 14),
(56, 'Karaté à mort pour une poignée de soja', 0, 14),
(57, 'C\'est le bruit qu\'il fait quand il mange un petit chat', 0, 15),
(58, 'C\'est le nom de son grand-père sur Melmack', 0, 15),
(59, 'Ca signifie Alien Life Form', 1, 15),
(60, 'Il est moitié tapir, moitié castor', 0, 15);

-- --------------------------------------------------------

--
-- Structure de la table `score`
--

DROP TABLE IF EXISTS `score`;
CREATE TABLE IF NOT EXISTS `score` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `score` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci KEY_BLOCK_SIZE=8;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `score_id` bigint(20) NOT NULL,
  `questions_id` int(11) NOT NULL,
  `reponses_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_utilisateurs_score1_idx` (`score_id`),
  KEY `fk_utilisateurs_questions1_idx` (`questions_id`),
  KEY `fk_utilisateurs_reponses1_idx` (`reponses_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `reponses`
--
ALTER TABLE `reponses`
  ADD CONSTRAINT `fk_reponses_questions1` FOREIGN KEY (`questions_id`) REFERENCES `questions` (`id`);

--
-- Contraintes pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `fk_utilisateurs_questions1` FOREIGN KEY (`questions_id`) REFERENCES `questions` (`id`),
  ADD CONSTRAINT `fk_utilisateurs_reponses1` FOREIGN KEY (`reponses_id`) REFERENCES `reponses` (`id`),
  ADD CONSTRAINT `fk_utilisateurs_score1` FOREIGN KEY (`score_id`) REFERENCES `score` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
