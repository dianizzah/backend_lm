-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: loan_ai
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app_account`
--

DROP TABLE IF EXISTS `app_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_account` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `account_number` varchar(50) NOT NULL,
  `pass` varchar(255) NOT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `account_number` (`account_number`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_account`
--

LOCK TABLES `app_account` WRITE;
/*!40000 ALTER TABLE `app_account` DISABLE KEYS */;
INSERT INTO `app_account` VALUES (1,'123456789','pass1'),(2,'234567890','pass2'),(3,'11234567','pass3');
/*!40000 ALTER TABLE `app_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business` (
  `business_id` int NOT NULL AUTO_INCREMENT,
  `business_name` varchar(255) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `established_year` year DEFAULT NULL,
  `business_type` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `account_id` int DEFAULT NULL,
  PRIMARY KEY (`business_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `business_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `app_account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business`
--

LOCK TABLES `business` WRITE;
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
INSERT INTO `business` VALUES (1,'Livia\'s Kitchen & Bar','Livia',2019,'perseorangan','2025-03-06 15:22:05',1),(2,'Livia\'s Resto','Livia',2015,'perseorangan','2025-03-06 15:22:05',1),(3,'Andi Dimsum','Andi',2020,'perseorangan','2025-03-06 15:22:05',2),(4,'Budi Clothing','Budi',2016,'perseorangan','2025-03-06 15:22:05',3);
/*!40000 ALTER TABLE `business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_repayments`
--

DROP TABLE IF EXISTS `loan_repayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_repayments` (
  `repayment_id` int NOT NULL AUTO_INCREMENT,
  `loan_id` int DEFAULT NULL,
  `business_id` int DEFAULT NULL,
  `payment_amount` decimal(15,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `status` enum('on-time','late','missed') DEFAULT NULL,
  PRIMARY KEY (`repayment_id`),
  KEY `loan_id` (`loan_id`),
  KEY `business_id` (`business_id`),
  CONSTRAINT `loan_repayments_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`loan_id`),
  CONSTRAINT `loan_repayments_ibfk_2` FOREIGN KEY (`business_id`) REFERENCES `business` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_repayments`
--

LOCK TABLES `loan_repayments` WRITE;
/*!40000 ALTER TABLE `loan_repayments` DISABLE KEYS */;
INSERT INTO `loan_repayments` VALUES (1,1,1,2000000.00,'2024-02-10','on-time'),(2,1,1,2000000.00,'2024-03-10','on-time'),(3,1,1,2000000.00,'2024-04-10','on-time'),(4,2,2,1500000.00,'2024-02-28','late'),(5,2,2,1500000.00,'2024-03-28','on-time'),(6,3,3,3000000.00,'2024-03-25','missed'),(7,3,3,3000000.00,'2024-04-25','late'),(8,4,4,5000000.00,'2024-04-15','on-time'),(9,4,4,5000000.00,'2024-05-15','on-time');
/*!40000 ALTER TABLE `loan_repayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loans` (
  `loan_id` int NOT NULL AUTO_INCREMENT,
  `business_id` int DEFAULT NULL,
  `loan_amount` decimal(15,2) DEFAULT NULL,
  `loan_status` enum('pending','active','closed') DEFAULT NULL,
  `credit_score` int DEFAULT NULL,
  `risk_level` enum('low','medium','high','very high') DEFAULT NULL,
  `decision` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `improvement_recommendations` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `business_id` (`business_id`),
  CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`business_id`) REFERENCES `business` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
INSERT INTO `loans` VALUES (1,1,8000000.00,'active',65,'medium','approved','2024-01-19 17:00:00','Jaga arus kas tetap stabil dan hindari keterlambatan pembayaran.'),(2,2,5000000.00,'active',55,'high','approved','2024-02-14 17:00:00',NULL),(3,3,12000000.00,'pending',40,'high','rejected','2024-03-09 17:00:00','Tingkatkan omzet dan stabilkan arus kas'),(4,4,15000000.00,'closed',85,'low','approved','2024-04-04 17:00:00',NULL);
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `business_id` int DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `transaction_type` enum('income','expense') DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `business_id` (`business_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`business_id`) REFERENCES `business` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,200000.00,'income','2024-01-02'),(2,1,500000.00,'income','2024-01-03'),(3,1,1500000.00,'expense','2024-01-05'),(4,1,3500000.00,'income','2024-01-08'),(5,1,800000.00,'expense','2024-01-10'),(6,1,4200000.00,'income','2024-01-15'),(7,2,1000000.00,'income','2024-02-01'),(8,2,700000.00,'expense','2024-02-03'),(9,2,2000000.00,'income','2024-02-07'),(10,2,500000.00,'expense','2024-02-09'),(11,2,3200000.00,'income','2024-02-14'),(12,2,1200000.00,'expense','2024-02-18'),(13,3,3000000.00,'income','2024-03-01'),(14,3,1200000.00,'expense','2024-03-05'),(15,3,4500000.00,'income','2024-03-08'),(16,3,800000.00,'expense','2024-03-12'),(17,3,5000000.00,'income','2024-03-18'),(18,3,2500000.00,'expense','2024-03-22'),(19,4,6000000.00,'income','2024-04-02'),(20,4,1800000.00,'expense','2024-04-06'),(21,4,9000000.00,'income','2024-04-10'),(22,4,1500000.00,'expense','2024-04-15'),(23,4,7200000.00,'income','2024-04-20'),(24,4,3000000.00,'expense','2024-04-25'),(25,1,200000.00,'income','2025-01-02'),(26,1,500000.00,'income','2025-01-03'),(27,1,1500000.00,'expense','2025-01-05'),(28,1,3500000.00,'income','2025-01-08'),(29,1,800000.00,'expense','2025-01-10'),(30,1,4200000.00,'income','2025-01-15'),(31,2,1000000.00,'income','2025-02-01'),(32,2,700000.00,'expense','2025-02-03'),(33,2,2000000.00,'income','2025-02-07'),(34,2,500000.00,'expense','2025-02-09'),(35,2,3200000.00,'income','2025-02-14'),(36,2,1200000.00,'expense','2025-02-18'),(37,3,3000000.00,'income','2025-03-01'),(38,3,1200000.00,'expense','2025-03-02'),(39,3,4500000.00,'income','2025-03-04'),(40,3,800000.00,'expense','2025-03-04'),(41,3,5000000.00,'income','2025-03-05'),(42,3,2500000.00,'expense','2025-03-06'),(43,4,6000000.00,'income','2025-03-02'),(44,4,1800000.00,'expense','2025-03-02'),(45,4,9000000.00,'income','2025-03-03'),(46,4,1500000.00,'expense','2025-03-04'),(47,4,7200000.00,'income','2025-03-05'),(48,4,3000000.00,'expense','2025-03-06');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'loan_ai'
--
/*!50003 DROP FUNCTION IF EXISTS `calculate_credit_score` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_credit_score`(business_id_param INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE total_sales DECIMAL(15,2);
    DECLARE total_expense DECIMAL(15,2);
    DECLARE transaction_count INT;
    DECLARE late_payments INT;
    DECLARE missed_payments INT;
    DECLARE score INT;

    -- Hitung total pemasukan dan pengeluaran
    SELECT SUM(amount) INTO total_sales 
    FROM transactions 
    WHERE business_id = business_id_param AND transaction_type = 'income';

    SELECT SUM(amount) INTO total_expense 
    FROM transactions 
    WHERE business_id = business_id_param AND transaction_type = 'expense';

    SELECT COUNT(*) INTO transaction_count
    FROM transactions 
    WHERE business_id = business_id_param;

    -- Hitung jumlah keterlambatan pembayaran
    SELECT COUNT(*) INTO late_payments
    FROM loan_repayments 
    WHERE business_id = business_id_param AND status = 'late';

    -- Hitung jumlah pembayaran yang terlewat
    SELECT COUNT(*) INTO missed_payments
    FROM loan_repayments 
    WHERE business_id = business_id_param AND status = 'missed';

    -- Perhitungan skor kredit sederhana
    SET score = 50 + (total_sales / 1000000) - (total_expense / 2000000) - (late_payments * 5) - (missed_payments * 10);

    -- Batasan nilai credit score (0 - 100)
    IF score > 100 THEN
        SET score = 100;
    ELSEIF score < 0 THEN
        SET score = 0;
    END IF;

    RETURN score;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calculate_outstanding_loan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_outstanding_loan`(loan_id_param INT) RETURNS decimal(15,2)
    DETERMINISTIC
BEGIN
    DECLARE loan_amount DECIMAL(15,2);
    DECLARE total_paid DECIMAL(15,2);
    DECLARE outstanding DECIMAL(15,2);

    -- Ambil total pinjaman awal, jika tidak ada, set ke 0
    SELECT IFNULL(loan_amount, 0) INTO loan_amount
    FROM loans 
    WHERE loan_id = loan_id_param;

    -- Jika tidak ada pinjaman dengan ID tersebut, langsung return 0
    IF loan_amount = 0 THEN
        RETURN 0;
    END IF;

    -- Hitung total pembayaran yang sudah dilakukan
    SELECT COALESCE(SUM(payment_amount), 0) INTO total_paid 
    FROM loan_repayments 
    WHERE loan_id = loan_id_param;

    -- Hitung sisa hutang
    SET outstanding = loan_amount - total_paid;

    -- Pastikan tidak negatif
    IF outstanding < 0 THEN
        SET outstanding = 0;
    END IF;

    RETURN outstanding;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_loan_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_loan_status`(loan_id_param INT) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE late_count INT;
    DECLARE missed_count INT;
    DECLARE status VARCHAR(50);

    -- Hitung keterlambatan dan pembayaran yang terlewat
    SELECT COUNT(*) INTO late_count
    FROM loan_repayments 
    WHERE loan_id = loan_id_param AND status = 'late';

    SELECT COUNT(*) INTO missed_count
    FROM loan_repayments 
    WHERE loan_id = loan_id_param AND status = 'missed';

    -- Tentukan status pinjaman
    IF missed_count > 2 THEN
        SET status = 'Kredit Macet';
    ELSEIF late_count > 2 THEN
        SET status = 'Berisiko Tinggi';
    ELSEIF late_count > 0 THEN
        SET status = 'Perlu Diperhatikan';
    ELSE
        SET status = 'Lancar';
    END IF;

    RETURN status;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `debt_to_income_ratio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `debt_to_income_ratio`(business_id_param INT) RETURNS float
    DETERMINISTIC
BEGIN
    DECLARE total_debt FLOAT;
    DECLARE total_income FLOAT;
    DECLARE ratio FLOAT;

    -- Hitung total hutang (loan aktif)
    SELECT COALESCE(SUM(l.loan_amount), 0) INTO total_debt
    FROM loans l
    WHERE l.loan_status = 'active' AND l.business_id = business_id_param;

    -- Hitung total income dalam 6 bulan terakhir
    SELECT COALESCE(SUM(t.amount), 0) INTO total_income
    FROM transactions t
    WHERE t.business_id = business_id_param
      AND t.transaction_type = 'income'
      AND t.transaction_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

    -- Hindari pembagian nol
    IF total_income = 0 THEN
        SET ratio = NULL;
    ELSE
        SET ratio = total_debt / total_income;
    END IF;

    RETURN ratio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `monthly_revenue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `monthly_revenue`(business_id_param INT) RETURNS float
    DETERMINISTIC
BEGIN
    DECLARE total_revenue FLOAT;

    -- Hitung total revenue dalam 1 bulan terakhir untuk business_id tertentu
    SELECT COALESCE(SUM(amount), 0) INTO total_revenue
    FROM transactions
    WHERE business_id = business_id_param 
      AND transaction_type = 'income'
      AND transaction_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

    RETURN total_revenue;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_credit_recommendation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_credit_recommendation`(business_id_param INT)
BEGIN
    DECLARE score INT;
    DECLARE recommendation VARCHAR(255);

    -- Hitung credit score
    SET score = calculate_credit_score(business_id_param);

    -- Tentukan rekomendasi berdasarkan skor kredit
    IF score >= 80 THEN
        SET recommendation = NULL;
    ELSEIF score >= 60 THEN
        SET recommendation = 'Jaga arus kas tetap stabil dan hindari keterlambatan pembayaran.';
    ELSE
        SET recommendation = 'Tingkatkan omzet, kurangi pengeluaran, dan bayar kredit tepat waktu.';
    END IF;

    -- Update tabel loans dengan rekomendasi
    UPDATE loans 
    SET credit_score = score, improvement_recommendations = recommendation
    WHERE business_id = business_id_param;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_loan_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_loan_status`(loan_id_param INT)
BEGIN
    DECLARE outstanding DECIMAL(15,2);
    DECLARE loan_status VARCHAR(50);

    -- Hitung sisa hutang
    SET outstanding = calculate_outstanding_loan(loan_id_param);

    -- Tentukan status pinjaman berdasarkan sisa hutang
    IF outstanding = 0 THEN
        SET loan_status = 'closed';
    ELSE
        SET loan_status = 'active';
    END IF;

    -- Update status di tabel loans
    UPDATE loans 
    SET loan_status = loan_status
    WHERE loan_id = loan_id_param;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-06 23:37:28
