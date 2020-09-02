-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.8-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for mydbvir
CREATE DATABASE IF NOT EXISTS `mydbvir` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `mydbvir`;

-- Dumping structure for table mydbvir.guru
CREATE TABLE IF NOT EXISTS `guru` (
  `guru_id` char(4) NOT NULL DEFAULT '9999' COMMENT 'No. Identitas Guru',
  `guru_nama` char(20) NOT NULL DEFAULT '9999' COMMENT 'Nama Guru',
  PRIMARY KEY (`guru_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mydbvir.guru: ~0 rows (approximately)
/*!40000 ALTER TABLE `guru` DISABLE KEYS */;
/*!40000 ALTER TABLE `guru` ENABLE KEYS */;

-- Dumping structure for table mydbvir.kursus
CREATE TABLE IF NOT EXISTS `kursus` (
  `kursus_id` char(5) NOT NULL DEFAULT 'AA-99' COMMENT 'Kode Kursus',
  `kursus_nama` char(20) NOT NULL COMMENT 'Nama Kursus',
  `hari_kode` char(1) NOT NULL DEFAULT '9' COMMENT 'Kode Nama Hari',
  `guru_id` char(4) NOT NULL DEFAULT '9999' COMMENT 'No. Identitas Guru',
  PRIMARY KEY (`kursus_id`),
  KEY `kursus_namahari` (`hari_kode`),
  KEY `kursus_guru` (`guru_id`),
  CONSTRAINT `kursus_guru` FOREIGN KEY (`guru_id`) REFERENCES `guru` (`guru_id`),
  CONSTRAINT `kursus_namahari` FOREIGN KEY (`hari_kode`) REFERENCES `namahari` (`hari_kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mydbvir.kursus: ~0 rows (approximately)
/*!40000 ALTER TABLE `kursus` DISABLE KEYS */;
/*!40000 ALTER TABLE `kursus` ENABLE KEYS */;

-- Dumping structure for table mydbvir.namahari
CREATE TABLE IF NOT EXISTS `namahari` (
  `hari_kode` char(1) NOT NULL DEFAULT '9' COMMENT 'Kode Nama Hari',
  `hari_nama` char(20) NOT NULL COMMENT 'Nama Hari',
  PRIMARY KEY (`hari_kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mydbvir.namahari: ~0 rows (approximately)
/*!40000 ALTER TABLE `namahari` DISABLE KEYS */;
/*!40000 ALTER TABLE `namahari` ENABLE KEYS */;

-- Dumping structure for table mydbvir.nilai
CREATE TABLE IF NOT EXISTS `nilai` (
  `nilai` char(1) NOT NULL DEFAULT 'A' COMMENT 'Nilai Huruf',
  `nilai_n` tinyint(4) NOT NULL COMMENT 'Nilai Angka',
  `siswa_id` char(6) NOT NULL DEFAULT '99-999' COMMENT 'No. Identitas Siswa',
  `kursus_id` char(5) NOT NULL DEFAULT 'AA-99' COMMENT 'Kode Kursus',
  KEY `nilai_siswa` (`siswa_id`),
  KEY `nilai_kursus` (`kursus_id`),
  CONSTRAINT `nilai_kursus` FOREIGN KEY (`kursus_id`) REFERENCES `kursus` (`kursus_id`),
  CONSTRAINT `nilai_siswa` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`siswa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mydbvir.nilai: ~0 rows (approximately)
/*!40000 ALTER TABLE `nilai` DISABLE KEYS */;
/*!40000 ALTER TABLE `nilai` ENABLE KEYS */;

-- Dumping structure for table mydbvir.siswa
CREATE TABLE IF NOT EXISTS `siswa` (
  `siswa_id` char(6) NOT NULL DEFAULT '99-999' COMMENT 'No. Identitas',
  `siswa_nama` char(20) NOT NULL COMMENT 'Nama Siswa',
  `siswa_lahir` date NOT NULL COMMENT 'Tanggal Lahir Siswa',
  `siswa_gender` enum('P','W','-') NOT NULL COMMENT 'Gender Siswa',
  PRIMARY KEY (`siswa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mydbvir.siswa: ~0 rows (approximately)
/*!40000 ALTER TABLE `siswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `siswa` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
