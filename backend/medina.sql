
DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE `utilisateurs` (
  `utilisateur_id` int NOT NULL AUTO_INCREMENT,
  `genre` enum('Homme','Femme') NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `date_inscription` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `type` enum('visiteur','professionnel','admin') NOT NULL,
  `statut` enum('en attente','valide','rejete') DEFAULT 'en attente',
  `specialite` enum('architecte','historien','archeologue') DEFAULT NULL,
  `niveau_expertise` enum('specialiste','expert') NOT NULL DEFAULT 'specialiste',
  `numero_ordre` varchar(50) DEFAULT NULL,
  `etablissement_origine` varchar(255) DEFAULT NULL,
  `nom_agence` varchar(100) DEFAULT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  PRIMARY KEY (`utilisateur_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `utilisateurs` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `fiches`;
CREATE TABLE `fiches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `utilisateur_id` int NOT NULL,
  `fichier_pdf` varchar(255) NOT NULL,
  `date_soumission` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `utilisateur_id` (`utilisateur_id`),
  CONSTRAINT `fk_fiches_utilisateurs` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`utilisateur_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `fiches` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `utilisateur_id` int NOT NULL,
  `message` text NOT NULL,
  `type` enum('partage','modif') NOT NULL,
  `lu` tinyint(1) DEFAULT '0',
  `heure_de_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `utilisateur_id` (`utilisateur_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`utilisateur_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `notifications` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `oeuvre`;
CREATE TABLE `oeuvre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `description` text,
  `date_creation` date DEFAULT NULL,
  `id_createur` int DEFAULT NULL,
  `categorie` varchar(100) DEFAULT NULL,
  `wilaya` enum('Adrar','Chlef','Laghouat','Oum El Bouaghi','Batna','B├®ja├»a','Biskra','B├®char','Blida','Bouira','Tamanrasset','T├®bessa','Tlemcen','Tiaret','Tizi Ouzou','Alger','Djelfa','Jijel','S├®tif','Sa├»da','Skikda','Sidi Bel Abb├¿s','Annaba','Guelma','Constantine','M├®d├®a','Mostaganem','M?Sila','Mascara','Ouargla','Oran','El Bayadh','Illizi','Bordj Bou Arr├®ridj','Boumerd├¿s','El Tarf','Tindouf','Tissemsilt','El Oued','Khenchela','Souk Ahras','Tipaza','Mila','A├»n Defla','Na├óma','A├»n T├®mouchent','Gharda├»a','Relizane','Timimoun','Bordj Badji Mokhtar','Ouled Djellal','B├®ni Abb├¿s','In Salah','In Guezzam','Touggourt','Djanet','El M?Ghair','El Menia') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_createur` (`id_createur`),
  CONSTRAINT `oeuvre_ibfk_1` FOREIGN KEY (`id_createur`) REFERENCES `utilisateurs` (`utilisateur_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `oeuvre` WRITE;
UNLOCK TABLES;

