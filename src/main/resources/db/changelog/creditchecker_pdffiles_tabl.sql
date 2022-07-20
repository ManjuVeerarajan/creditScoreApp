CREATE TABLE IF NOT EXISTS  `creditchecker_pdffiles` (
  `name` varchar(255) NOT NULL,
  `createdAt` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `value` longblob,
  PRIMARY KEY (`name`)
);