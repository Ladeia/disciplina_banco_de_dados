create database analises;

use analises;

CREATE TABLE `regiao` (
  `CodRegiao` int NOT NULL,
  `NomeRegiao` varchar(20) NOT NULL,
  PRIMARY KEY (`CodRegiao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `estado` (
  `CodEstado` int NOT NULL,
  `NomeEstado` varchar(20) NOT NULL,
  `SiglaEstado` varchar(2) NOT NULL,
  `CodRegiao` int NOT NULL,
  PRIMARY KEY (`CodEstado`),
  KEY `estado_regiao_FK` (`CodRegiao`),
  CONSTRAINT `estado_regiao_FK` FOREIGN KEY (`CodRegiao`) REFERENCES `regiao` (`CodRegiao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `municipio` (
  `CodMunicipio` int NOT NULL,
  `NomeMunicipio` varchar(50) NOT NULL,
  `CodEstado` int DEFAULT NULL,
  PRIMARY KEY (`CodMunicipio`),
  KEY `municipio_estado_FK` (`CodEstado`),
  CONSTRAINT `municipio_estado_FK` FOREIGN KEY (`CodEstado`) REFERENCES `estado` (`CodEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `indice` (
  `CodMunicipio` int NOT NULL,
  `Ano` int NOT NULL,
  `IDH_Geral` double NOT NULL,
  `IDH_Renda` double NOT NULL,
  `IDH_Longevidade` double NOT NULL,
  `IDH_Educacao` double NOT NULL,
  PRIMARY KEY (`CodMunicipio`,`Ano`),
  CONSTRAINT `indice_municipio_FK` FOREIGN KEY (`CodMunicipio`) REFERENCES `municipio` (`CodMunicipio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;