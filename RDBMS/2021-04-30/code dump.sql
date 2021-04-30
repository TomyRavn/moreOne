-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: asoft
-- ------------------------------------------------------
-- Server version	5.6.45-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_code_c`
--

DROP TABLE IF EXISTS `tb_code_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_code_c` (
  `CD_IDX` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '코드 인덱스',
  `CD_ID` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '코드 ID',
  `CD_NM` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '코드 명',
  `UPPER_CD_IDX` bigint(20) DEFAULT NULL COMMENT '상위 코드 IDX',
  `CD_DSCRT` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '코드 설명',
  `SRTNG_NO` int(2) NOT NULL DEFAULT '0' COMMENT '정렬 순서',
  `CD_VAL1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '코드 값1',
  `CD_VAL2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '코드 값2',
  `RGT_IDX` bigint(20) NOT NULL COMMENT '등록자 IDX',
  `RGT_IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '등록자 IP',
  `RGT_DTTM` datetime NOT NULL COMMENT '등록일시',
  `UDT_IDX` bigint(20) DEFAULT NULL COMMENT '수정 IDX',
  `UDT_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수정 IP',
  `UDT_DTTM` datetime DEFAULT NULL COMMENT '수정일시',
  `DLT_IDX` bigint(20) DEFAULT NULL COMMENT '삭제 IDX',
  `DLT_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '삭제 IP',
  `DLT_DTTM` datetime DEFAULT NULL COMMENT '삭제일시',
  PRIMARY KEY (`CD_IDX`),
  KEY `RGT_IDX` (`RGT_IDX`),
  CONSTRAINT `tb_code_c_ibfk_1` FOREIGN KEY (`RGT_IDX`) REFERENCES `tb_enterprise_m` (`ENTRP_IDX`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='코드 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_code_c`
--

LOCK TABLES `tb_code_c` WRITE;
/*!40000 ALTER TABLE `tb_code_c` DISABLE KEYS */;
INSERT INTO `tb_code_c` VALUES (1,'DGNSSCRS','진단 과정',NULL,'진단 과정',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:24:07',NULL,NULL,NULL,NULL,NULL,NULL),(2,'DGNSSCRS00','정제',1,'정제',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:28:06',NULL,NULL,NULL,NULL,NULL,NULL),(3,'DGNSSCRS01','전처리',1,'전처리',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:02',NULL,NULL,NULL,NULL,NULL,NULL),(4,'DGNSSCRS02','진단',1,'진단',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:03',NULL,NULL,NULL,NULL,NULL,NULL),(5,'PRGRSSTTS','모듈 진행 상태',NULL,'모듈 진행 상태',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:03',NULL,NULL,NULL,NULL,NULL,NULL),(6,'PRGRSSTTS00','대기',5,'대기',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:04',NULL,NULL,NULL,NULL,NULL,NULL),(7,'PRGRSSTTS01','진행',5,'진행',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:04',NULL,NULL,NULL,NULL,NULL,NULL),(8,'PRGRSSTTS02','성공',5,'성공',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:05',NULL,NULL,NULL,NULL,NULL,NULL),(9,'PRGRSSTTS03','실패',5,'실패',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:05',NULL,NULL,NULL,NULL,NULL,NULL),(10,'DPLERN','딥 러닝 진단',NULL,'딥 러닝 진단',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:05',NULL,NULL,NULL,NULL,NULL,NULL),(11,'DPLERN00','DNN',10,'DNN',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:06',NULL,NULL,NULL,NULL,NULL,NULL),(12,'DPLERN01','Ensemble',10,'Ensemble',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:06',NULL,NULL,NULL,NULL,NULL,NULL),(13,'MCHNLERN','머신 러닝 진단',NULL,'머신 러닝 진단',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:07',NULL,NULL,NULL,NULL,NULL,NULL),(14,'MCHNLERN00','RF',13,'RF',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:07',NULL,NULL,NULL,NULL,NULL,NULL),(15,'MCHNLERN01','SVM',13,'SVM',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:07',NULL,NULL,NULL,NULL,NULL,NULL),(16,'FLWTYPE','결함 유형',NULL,'결함 유형',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:08',NULL,NULL,NULL,NULL,NULL,NULL),(17,'FLWTYPE00','회전자바',16,'회전자바',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:08',NULL,NULL,NULL,NULL,NULL,NULL),(18,'FLWTYPE01','부하불평형',16,'부하불평형',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:09',NULL,NULL,NULL,NULL,NULL,NULL),(19,'FLWTYPE02','편심',16,'편심',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:09',NULL,NULL,NULL,NULL,NULL,NULL),(20,'RSLTTYPE','진단 결과 유형',NULL,'진단 결과 유형',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:10',NULL,NULL,NULL,NULL,NULL,NULL),(21,'RSLTTYPE00','정상',20,'정상',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:11',NULL,NULL,NULL,NULL,NULL,NULL),(22,'RSLTTYPE01','비정상',20,'비정상',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:11',NULL,NULL,NULL,NULL,NULL,NULL),(23,'RSLTTYPE02','대기',20,'대기',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:11',NULL,NULL,NULL,NULL,NULL,NULL),(24,'CNSNTYN','계정 승인 여부',NULL,'계정 승인 여부',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:12',NULL,NULL,NULL,NULL,NULL,NULL),(25,'CNSNTYN00','승인',24,'승인',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:12',NULL,NULL,NULL,NULL,NULL,NULL),(26,'CNSNTYN01','대기',24,'대기',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:13',NULL,NULL,NULL,NULL,NULL,NULL),(27,'CNSNTYN02','취소',24,'취소',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:13',NULL,NULL,NULL,NULL,NULL,NULL),(28,'ATHRY','기업 권한',NULL,'기업 권한',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:13',NULL,NULL,NULL,NULL,NULL,NULL),(29,'ATHRY00','관리자',28,'관리자',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:14',NULL,NULL,NULL,NULL,NULL,NULL),(30,'ATHRY01','기업',28,'기업',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:14',NULL,NULL,NULL,NULL,NULL,NULL),(31,'MOTORTYPE','모터 종류',NULL,'모터 종류',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:15',NULL,NULL,NULL,NULL,NULL,NULL),(32,'MOTORTYPE00','DC',31,'DC',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:15',NULL,NULL,NULL,NULL,NULL,NULL),(33,'MOTORTYPE01','BLCD',31,'BLCD',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:16',NULL,NULL,NULL,NULL,NULL,NULL),(34,'MOTORTYPE02','STEP',31,'STEP',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:16',NULL,NULL,NULL,NULL,NULL,NULL),(35,'VLTGTYPE','전압 종류',NULL,'전압 종류',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:16',NULL,NULL,NULL,NULL,NULL,NULL),(36,'VLTGTYPE00','AC',35,'AC',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:17',NULL,NULL,NULL,NULL,NULL,NULL),(37,'VLTGTYPE01','DC',35,'DC',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:17',NULL,NULL,NULL,NULL,NULL,NULL),(38,'DGNSSSRTNG','진단 정렬 기준',NULL,'진단 정렬 기준',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:18',NULL,NULL,NULL,NULL,NULL,NULL),(39,'DGNSSSRTNG00','등록일시',38,'등록일시',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:18',NULL,NULL,NULL,NULL,NULL,NULL),(40,'DGNSSSRTNG01','진단일시',38,'진단일시',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:18',NULL,NULL,NULL,NULL,NULL,NULL),(41,'DGNSSSRTNG02','진단상태',38,'진단상태',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:20',NULL,NULL,NULL,NULL,NULL,NULL),(42,'ENTRPSRTNG','기업 정렬 기준',NULL,'기업 정렬 기준',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:20',NULL,NULL,NULL,NULL,NULL,NULL),(43,'ENTRPSRTNG00','아이디',42,'아이디',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:20',NULL,NULL,NULL,NULL,NULL,NULL),(44,'ENTRPSRTNG01','기업명',42,'기업명',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:21',NULL,NULL,NULL,NULL,NULL,NULL),(45,'ENTRPSRTNG02','대표자명',42,'대표자명',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:21',NULL,NULL,NULL,NULL,NULL,NULL),(46,'ENTRPSRTNG03','기업상태',42,'기업상태',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:21',NULL,NULL,NULL,NULL,NULL,NULL),(47,'MODELSRTNG','모델 정렬 기준',NULL,'모델 정렬 기준',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:22',NULL,NULL,NULL,NULL,NULL,NULL),(48,'MODELSRTNG00','모델명',47,'모델명',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:22',NULL,NULL,NULL,NULL,NULL,NULL),(49,'MODELSRTNG01','전압',47,'전압',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:23',NULL,NULL,NULL,NULL,NULL,NULL),(50,'MODELSRTNG02','전류',47,'전류',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:23',NULL,NULL,NULL,NULL,NULL,NULL),(51,'MODELSRTNG03','전력',47,'전력',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:32',NULL,NULL,NULL,NULL,NULL,NULL),(52,'MODELSRTNG04','주파수',47,'주파수',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:32',NULL,NULL,NULL,NULL,NULL,NULL),(53,'MODELSRTNG05','종류',47,'종류',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:33',NULL,NULL,NULL,NULL,NULL,NULL),(54,'CDSRTNG','코드 정렬 기준',NULL,'코드 정렬 기준',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:33',NULL,NULL,NULL,NULL,NULL,NULL),(55,'CDSRTNG00','코드ID',54,'코드ID',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:33',NULL,NULL,NULL,NULL,NULL,NULL),(56,'CDSRTNG01','코드명',54,'코드명',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:34',NULL,NULL,NULL,NULL,NULL,NULL),(57,'CDSRTNG02','하위 코드 개수',54,'하위 코드 개수',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:34',NULL,NULL,NULL,NULL,NULL,NULL),(58,'CDSRTNG03','등록일',54,'등록일',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:34',NULL,NULL,NULL,NULL,NULL,NULL),(59,'CDSRTNG04','수정일',54,'수정일',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:35',NULL,NULL,NULL,NULL,NULL,NULL),(60,'SRTNGMTHOD','정렬 방법',NULL,'정렬 방법',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:35',NULL,NULL,NULL,NULL,NULL,NULL),(61,'SRTNGMTHOD00','내림차순',60,'내림차순',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:36',NULL,NULL,NULL,NULL,NULL,NULL),(62,'SRTNGMTHOD01','오름차순',60,'오름차순',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:37',NULL,NULL,NULL,NULL,NULL,NULL),(63,'PRDTYPE','기간 유형',NULL,'기간 유형',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:37',NULL,NULL,NULL,NULL,NULL,NULL),(64,'PRDTYPE00','등록 기간',63,'등록 기간',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:38',NULL,NULL,NULL,NULL,NULL,NULL),(65,'PRDTYPE01','진단 기간',63,'진단 기간',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:38',NULL,NULL,NULL,NULL,NULL,NULL),(66,'ENTRPSRCHTYPE','기업 검색 유형',NULL,'기업 검색 유형',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:38',NULL,NULL,NULL,NULL,NULL,NULL),(67,'ENTRPSRCHTYPE00','전체',66,'전체',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:39',NULL,NULL,NULL,NULL,NULL,NULL),(68,'ENTRPSRCHTYPE01','아이디',66,'아이디',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:39',NULL,NULL,NULL,NULL,NULL,NULL),(69,'ENTRPSRCHTYPE02','성명',66,'성명',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:39',NULL,NULL,NULL,NULL,NULL,NULL),(70,'ENTRPSRCHTYPE03','전화번호',66,'전화번호',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:40',NULL,NULL,NULL,NULL,NULL,NULL),(71,'CDSRCHTYPE','코드 검색 유형',NULL,'코드 검색 유형',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:48',NULL,NULL,NULL,NULL,NULL,NULL),(72,'CDSRCHTYPE00','전체',71,'전체',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:48',NULL,NULL,NULL,NULL,NULL,NULL),(73,'CDSRCHTYPE01','코드ID',71,'코드ID',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:48',NULL,NULL,NULL,NULL,NULL,NULL),(74,'CDSRCHTYPE02','코드명',71,'코드명',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:49',NULL,NULL,NULL,NULL,NULL,NULL),(75,'CNTPPAGE','페이지당 표시 개수',NULL,'페이지당 표시 개수',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:49',NULL,NULL,NULL,NULL,NULL,NULL),(76,'CNTPPAGE00','전체',75,'전체',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:50',NULL,NULL,NULL,NULL,NULL,NULL),(77,'CNTPPAGE01','10개',75,'10개',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:50',NULL,NULL,NULL,NULL,NULL,NULL),(78,'CNTPPAGE02','50개',75,'50개',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:50',NULL,NULL,NULL,NULL,NULL,NULL),(79,'CNTPPAGE03','100개',75,'100개',0,NULL,NULL,1,'127.0.0.1','2021-04-30 18:31:51',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tb_code_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_diagnosis_m`
--

DROP TABLE IF EXISTS `tb_diagnosis_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_diagnosis_m` (
  `DGNSS_IDX` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '진단 인덱스',
  `MTR_MODEL_IDX` bigint(20) NOT NULL COMMENT '모터 모델 인덱스',
  `MTR_SERIAL_NO` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '모터 시리얼 번호',
  `MDL_STTS_CD` bigint(20) NOT NULL COMMENT '모듈 진행 상태',
  `MTR_ERCRT_FILE_IDX` bigint(20) NOT NULL COMMENT '모터 전류 파일 인덱스',
  `MTR_VLTG_FILE_IDX` bigint(20) NOT NULL COMMENT '모터 자속 파일 인덱스',
  `RGT_IDX` bigint(20) NOT NULL COMMENT '등록자 IDX',
  `RGT_IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '등록자 IP',
  `RGT_DTTM` datetime NOT NULL COMMENT '등록일시',
  `UDT_IDX` bigint(20) DEFAULT NULL COMMENT '수정 IDX',
  `UDT_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수정 IP',
  `UDT_DTTM` datetime DEFAULT NULL COMMENT '수정일시',
  `DLT_IDX` bigint(20) DEFAULT NULL COMMENT '삭제 IDX',
  `DLT_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '삭제 IP',
  `DLT_DTTM` datetime DEFAULT NULL COMMENT '삭제일시',
  PRIMARY KEY (`DGNSS_IDX`),
  KEY `MTR_ERCRT_FILE_IDX` (`MTR_ERCRT_FILE_IDX`),
  KEY `MTR_VLTG_FILE_IDX` (`MTR_VLTG_FILE_IDX`),
  KEY `MTR_MODEL_IDX` (`MTR_MODEL_IDX`),
  KEY `MDL_STTS_CD` (`MDL_STTS_CD`),
  KEY `RGT_IDX` (`RGT_IDX`),
  CONSTRAINT `tb_diagnosis_m_ibfk_3` FOREIGN KEY (`MTR_ERCRT_FILE_IDX`) REFERENCES `tb_file_m` (`FILE_IDX`) ON UPDATE CASCADE,
  CONSTRAINT `tb_diagnosis_m_ibfk_4` FOREIGN KEY (`MTR_VLTG_FILE_IDX`) REFERENCES `tb_file_m` (`FILE_IDX`) ON UPDATE CASCADE,
  CONSTRAINT `tb_diagnosis_m_ibfk_5` FOREIGN KEY (`MTR_MODEL_IDX`) REFERENCES `tb_motor_model_i` (`MTR_MODEL_IDX`) ON UPDATE CASCADE,
  CONSTRAINT `tb_diagnosis_m_ibfk_6` FOREIGN KEY (`MDL_STTS_CD`) REFERENCES `tb_code_c` (`CD_IDX`) ON UPDATE CASCADE,
  CONSTRAINT `tb_diagnosis_m_ibfk_7` FOREIGN KEY (`RGT_IDX`) REFERENCES `tb_enterprise_m` (`ENTRP_IDX`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='진단 기본 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_diagnosis_m`
--

LOCK TABLES `tb_diagnosis_m` WRITE;
/*!40000 ALTER TABLE `tb_diagnosis_m` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_diagnosis_m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_diagnosis_result_d`
--

DROP TABLE IF EXISTS `tb_diagnosis_result_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_diagnosis_result_d` (
  `DGNSS_RSLT_IDX` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '진단 결과 인덱스',
  `DGNSS_IDX` bigint(20) NOT NULL COMMENT '진단 인덱스',
  `DGNSS_KIND_CD` bigint(20) NOT NULL COMMENT '진단 종류 코드',
  `DGNSS_FLAW_CD` bigint(20) NOT NULL COMMENT '진단 결함 코드',
  `DGNSS_RSLT_VAL` decimal(5,4) DEFAULT NULL COMMENT '진단 결과 값',
  `RGT_DTTM` datetime DEFAULT NULL COMMENT '등록일시',
  PRIMARY KEY (`DGNSS_RSLT_IDX`),
  KEY `DGNSS_IDX` (`DGNSS_IDX`),
  KEY `DGNSS_FLAW_CD` (`DGNSS_FLAW_CD`),
  KEY `DGNSS_KIND_CD` (`DGNSS_KIND_CD`),
  CONSTRAINT `tb_diagnosis_result_d_ibfk_1` FOREIGN KEY (`DGNSS_FLAW_CD`) REFERENCES `tb_code_c` (`CD_IDX`) ON UPDATE CASCADE,
  CONSTRAINT `tb_diagnosis_result_d_ibfk_2` FOREIGN KEY (`DGNSS_KIND_CD`) REFERENCES `tb_code_c` (`CD_IDX`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='진단 결과 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_diagnosis_result_d`
--

LOCK TABLES `tb_diagnosis_result_d` WRITE;
/*!40000 ALTER TABLE `tb_diagnosis_result_d` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_diagnosis_result_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_diagnosis_status_l`
--

DROP TABLE IF EXISTS `tb_diagnosis_status_l`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_diagnosis_status_l` (
  `DGNSS_STTS_IDX` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '진단 상태 인덱스',
  `DGNSS_IDX` bigint(20) NOT NULL COMMENT '진단 인덱스',
  `DGNSS_STTS_CD` bigint(20) NOT NULL COMMENT '진단 상태 코드',
  `DGNSS_STTS_PRCNG` int(3) NOT NULL DEFAULT '0' COMMENT '진단 진행률',
  `DGNSS_STTS_FAILR_RSON` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '진단 실패 이유',
  `RGT_DTTM` datetime DEFAULT NULL COMMENT '등록일시',
  PRIMARY KEY (`DGNSS_STTS_IDX`),
  KEY `DGNSS_IDX` (`DGNSS_IDX`),
  KEY `DGNSS_STTS_CD` (`DGNSS_STTS_CD`),
  CONSTRAINT `tb_diagnosis_status_l_ibfk_1` FOREIGN KEY (`DGNSS_IDX`) REFERENCES `tb_diagnosis_m` (`DGNSS_IDX`) ON UPDATE CASCADE,
  CONSTRAINT `tb_diagnosis_status_l_ibfk_2` FOREIGN KEY (`DGNSS_STTS_CD`) REFERENCES `tb_code_c` (`CD_IDX`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='진단 상태 내역 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_diagnosis_status_l`
--

LOCK TABLES `tb_diagnosis_status_l` WRITE;
/*!40000 ALTER TABLE `tb_diagnosis_status_l` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_diagnosis_status_l` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_enterprise_consent_h`
--

DROP TABLE IF EXISTS `tb_enterprise_consent_h`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_enterprise_consent_h` (
  `CNSNT_IDX` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '승인 인덱스',
  `ENTRP_IDX` bigint(20) NOT NULL COMMENT '기업 인덱스',
  `CNSNT_STTS_CD` bigint(20) NOT NULL COMMENT '승인 상태 코드',
  `RGT_IDX` bigint(20) NOT NULL COMMENT '등록자 IDX',
  `RGT_IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '등록자 IP',
  `RGT_DTTM` datetime NOT NULL COMMENT '등록일시',
  PRIMARY KEY (`CNSNT_IDX`),
  KEY `CNSNT_STTS_CD` (`CNSNT_STTS_CD`),
  KEY `ENTRP_IDX` (`ENTRP_IDX`),
  CONSTRAINT `tb_enterprise_consent_h_ibfk_2` FOREIGN KEY (`CNSNT_STTS_CD`) REFERENCES `tb_code_c` (`CD_IDX`) ON UPDATE CASCADE,
  CONSTRAINT `tb_enterprise_consent_h_ibfk_3` FOREIGN KEY (`ENTRP_IDX`) REFERENCES `tb_enterprise_m` (`ENTRP_IDX`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='기업 승인 이력 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_enterprise_consent_h`
--

LOCK TABLES `tb_enterprise_consent_h` WRITE;
/*!40000 ALTER TABLE `tb_enterprise_consent_h` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_enterprise_consent_h` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_enterprise_login_h`
--

DROP TABLE IF EXISTS `tb_enterprise_login_h`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_enterprise_login_h` (
  `LOGIN_IDX` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '로그인 인덱스',
  `ENTRP_IDX` bigint(20) NOT NULL COMMENT '기업 인덱스',
  `LOGIN_SCCSS_YN` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y' COMMENT '로그인 성공 여부',
  `LOGIN_FAILR_RSON` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '로그인 실패 이유',
  `RGT_IDX` bigint(20) NOT NULL COMMENT '등록자 IDX',
  `RGT_IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '등록자 IP',
  `RGT_DTTM` datetime NOT NULL COMMENT '등록일시',
  PRIMARY KEY (`LOGIN_IDX`,`ENTRP_IDX`),
  KEY `ENTRP_IDX` (`ENTRP_IDX`),
  KEY `RGT_IDX` (`RGT_IDX`),
  CONSTRAINT `tb_enterprise_login_h_ibfk_1` FOREIGN KEY (`ENTRP_IDX`) REFERENCES `tb_enterprise_m` (`ENTRP_IDX`) ON UPDATE CASCADE,
  CONSTRAINT `tb_enterprise_login_h_ibfk_2` FOREIGN KEY (`RGT_IDX`) REFERENCES `tb_enterprise_m` (`ENTRP_IDX`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='기업 로그인 이력 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_enterprise_login_h`
--

LOCK TABLES `tb_enterprise_login_h` WRITE;
/*!40000 ALTER TABLE `tb_enterprise_login_h` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_enterprise_login_h` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_enterprise_m`
--

DROP TABLE IF EXISTS `tb_enterprise_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_enterprise_m` (
  `ENTRP_IDX` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '기업 인덱스',
  `ENTRP_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '기업 계정 ID',
  `ENTRP_PW` varchar(224) COLLATE utf8_unicode_ci NOT NULL COMMENT '기업 비밀번호',
  `ENTRP_NM` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '기업 명칭',
  `ENTRP_CEO` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '기업 대표자',
  `ENTRP_TEL` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '기업 연락처',
  `ACCNT_CNSNT_YN` bigint(20) NOT NULL COMMENT '계정 승인 여부',
  `ENTRP_ATHRY_CD` bigint(20) NOT NULL COMMENT '기업 권한 코드',
  `RGT_IDX` bigint(20) NOT NULL COMMENT '등록자 IDX',
  `RGT_IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '등록자 IP',
  `RGT_DTTM` datetime NOT NULL COMMENT '등록일시',
  `UDT_IDX` bigint(20) DEFAULT NULL COMMENT '수정 IDX',
  `UDT_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수정 IP',
  `UDT_DTTM` datetime DEFAULT NULL COMMENT '수정일시',
  `DLT_IDX` bigint(20) DEFAULT NULL COMMENT '삭제 IDX',
  `DLT_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '삭제 IP',
  `DLT_DTTM` datetime DEFAULT NULL COMMENT '삭제일시',
  PRIMARY KEY (`ENTRP_IDX`),
  KEY `RGT_IDX` (`RGT_IDX`),
  KEY `UDT_IDX` (`UDT_IDX`),
  KEY `DLT_IDX` (`DLT_IDX`),
  KEY `ENTRP_ATHRY_CD` (`ENTRP_ATHRY_CD`),
  KEY `ENTRP_STTS_CD` (`ACCNT_CNSNT_YN`),
  CONSTRAINT `tb_enterprise_m_ibfk_1` FOREIGN KEY (`RGT_IDX`) REFERENCES `tb_enterprise_m` (`ENTRP_IDX`) ON UPDATE CASCADE,
  CONSTRAINT `tb_enterprise_m_ibfk_2` FOREIGN KEY (`RGT_IDX`) REFERENCES `tb_enterprise_m` (`ENTRP_IDX`) ON UPDATE CASCADE,
  CONSTRAINT `tb_enterprise_m_ibfk_3` FOREIGN KEY (`UDT_IDX`) REFERENCES `tb_enterprise_m` (`ENTRP_IDX`) ON UPDATE CASCADE,
  CONSTRAINT `tb_enterprise_m_ibfk_4` FOREIGN KEY (`DLT_IDX`) REFERENCES `tb_enterprise_m` (`ENTRP_IDX`) ON UPDATE CASCADE,
  CONSTRAINT `tb_enterprise_m_ibfk_5` FOREIGN KEY (`ENTRP_ATHRY_CD`) REFERENCES `tb_code_c` (`CD_IDX`) ON UPDATE CASCADE,
  CONSTRAINT `tb_enterprise_m_ibfk_6` FOREIGN KEY (`ACCNT_CNSNT_YN`) REFERENCES `tb_code_c` (`CD_IDX`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='기업 기본 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_enterprise_m`
--

LOCK TABLES `tb_enterprise_m` WRITE;
/*!40000 ALTER TABLE `tb_enterprise_m` DISABLE KEYS */;
INSERT INTO `tb_enterprise_m` VALUES (1,'test','test','시스템 관리자','시스템 관리자','010-1234-1234',25,29,1,'127.0.0.1','2021-04-30 18:17:30',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tb_enterprise_m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_file_m`
--

DROP TABLE IF EXISTS `tb_file_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_file_m` (
  `FILE_IDX` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '파일 인덱스',
  `FILE_ORGIL_NM` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '파일 원본 명',
  `FILE_EXT` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '파일 확장자',
  `FILE_SIZE` bigint(20) DEFAULT NULL COMMENT '파일 크기',
  `FILE_DIR` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '파일 저장 경로',
  `FILE_SAVE_NM` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '파일 저장 명',
  `RGT_IDX` bigint(20) NOT NULL COMMENT '등록자 IDX',
  `RGT_IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '등록자 IP',
  `RGT_DTTM` datetime NOT NULL COMMENT '등록일시',
  `UDT_IDX` bigint(20) DEFAULT NULL COMMENT '수정 IDX',
  `UDT_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수정 IP',
  `UDT_DTTM` datetime DEFAULT NULL COMMENT '수정일시',
  `DLT_IDX` bigint(20) DEFAULT NULL COMMENT '삭제 IDX',
  `DLT_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '삭제 IP',
  `DLT_DTTM` datetime DEFAULT NULL COMMENT '삭제일시',
  PRIMARY KEY (`FILE_IDX`),
  KEY `RGT_IDX` (`RGT_IDX`),
  CONSTRAINT `tb_file_m_ibfk_1` FOREIGN KEY (`RGT_IDX`) REFERENCES `tb_enterprise_m` (`ENTRP_IDX`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='파일 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_file_m`
--

LOCK TABLES `tb_file_m` WRITE;
/*!40000 ALTER TABLE `tb_file_m` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_file_m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_motor_model_i`
--

DROP TABLE IF EXISTS `tb_motor_model_i`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_motor_model_i` (
  `MTR_MODEL_IDX` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '모터 모델 인덱스',
  `ENTRP_IDX` bigint(20) NOT NULL COMMENT '기업 인덱스',
  `MTR_MODEL_NM` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '모터 모델 명칭',
  `MTR_MODEL_VLTG` int(3) DEFAULT NULL COMMENT '모터 모델 전압',
  `MTR_MODEL_VLTG_KIND` bigint(20) NOT NULL COMMENT '모터 모델 전압 종류',
  `MTR_MODEL_ERCRT` int(3) DEFAULT NULL COMMENT '모터 모델 전류',
  `MTR_MODEL_PWRER` int(5) DEFAULT NULL COMMENT '모터 모델 전력',
  `MTR_MODEL_FQNC` int(5) DEFAULT NULL COMMENT '모터 모델 주파수',
  `MTR_MODEL_KIND` bigint(20) NOT NULL COMMENT '모터 모델 종류',
  `MDL_STTS_CD` bigint(20) NOT NULL COMMENT '모듈 진행 상태',
  `FILE_IDX` bigint(20) NOT NULL COMMENT '모터 모델 학습 데이터 파일 인덱스',
  `RGT_IDX` bigint(20) NOT NULL COMMENT '등록자 IDX',
  `RGT_IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '등록자 IP',
  `RGT_DTTM` datetime NOT NULL COMMENT '등록일시',
  `UDT_IDX` bigint(20) DEFAULT NULL COMMENT '수정 IDX',
  `UDT_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수정 IP',
  `UDT_DTTM` datetime DEFAULT NULL COMMENT '수정일시',
  `DLT_IDX` bigint(20) DEFAULT NULL COMMENT '삭제 IDX',
  `DLT_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '삭제 IP',
  `DLT_DTTM` datetime DEFAULT NULL COMMENT '삭제일시',
  PRIMARY KEY (`MTR_MODEL_IDX`),
  KEY `FILE_IDX` (`FILE_IDX`),
  KEY `MDL_STTS_CD` (`MDL_STTS_CD`),
  KEY `MTR_MODEL_KIND` (`MTR_MODEL_KIND`),
  KEY `MTR_MODEL_VLTG_KIND` (`MTR_MODEL_VLTG_KIND`),
  KEY `ENTRP_IDX` (`ENTRP_IDX`),
  KEY `RGT_IDX` (`RGT_IDX`),
  CONSTRAINT `tb_motor_model_i_ibfk_3` FOREIGN KEY (`FILE_IDX`) REFERENCES `tb_file_m` (`FILE_IDX`) ON UPDATE CASCADE,
  CONSTRAINT `tb_motor_model_i_ibfk_4` FOREIGN KEY (`MDL_STTS_CD`) REFERENCES `tb_code_c` (`CD_IDX`) ON UPDATE CASCADE,
  CONSTRAINT `tb_motor_model_i_ibfk_5` FOREIGN KEY (`MTR_MODEL_KIND`) REFERENCES `tb_code_c` (`CD_IDX`) ON UPDATE CASCADE,
  CONSTRAINT `tb_motor_model_i_ibfk_6` FOREIGN KEY (`MTR_MODEL_VLTG_KIND`) REFERENCES `tb_code_c` (`CD_IDX`) ON UPDATE CASCADE,
  CONSTRAINT `tb_motor_model_i_ibfk_7` FOREIGN KEY (`ENTRP_IDX`) REFERENCES `tb_enterprise_m` (`ENTRP_IDX`) ON UPDATE CASCADE,
  CONSTRAINT `tb_motor_model_i_ibfk_8` FOREIGN KEY (`RGT_IDX`) REFERENCES `tb_enterprise_m` (`ENTRP_IDX`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='모터 모델 정보 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_motor_model_i`
--

LOCK TABLES `tb_motor_model_i` WRITE;
/*!40000 ALTER TABLE `tb_motor_model_i` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_motor_model_i` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_motor_model_learning_l`
--

DROP TABLE IF EXISTS `tb_motor_model_learning_l`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_motor_model_learning_l` (
  `LERN_STTS_IDX` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '학습 상태 인덱스',
  `MTR_MODEL_IDX` bigint(20) NOT NULL COMMENT '모터 모델 인덱스',
  `LERN_STEP_CD` bigint(20) NOT NULL COMMENT '학습 상태 코드',
  `LERN_STTS_PRCNG` int(3) NOT NULL DEFAULT '0' COMMENT '학습 진행률',
  `LERN_STTS_FAILR_RSON` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '학습 실패 이유',
  `RGT_DTTM` datetime DEFAULT NULL COMMENT '등록일시',
  PRIMARY KEY (`LERN_STTS_IDX`),
  KEY `MTR_MODEL_IDX` (`MTR_MODEL_IDX`),
  KEY `LERN_STEP_CD` (`LERN_STEP_CD`),
  CONSTRAINT `tb_motor_model_learning_l_ibfk_1` FOREIGN KEY (`MTR_MODEL_IDX`) REFERENCES `tb_motor_model_i` (`MTR_MODEL_IDX`) ON UPDATE CASCADE,
  CONSTRAINT `tb_motor_model_learning_l_ibfk_2` FOREIGN KEY (`LERN_STEP_CD`) REFERENCES `tb_code_c` (`CD_IDX`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='모델 학습 내역 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_motor_model_learning_l`
--

LOCK TABLES `tb_motor_model_learning_l` WRITE;
/*!40000 ALTER TABLE `tb_motor_model_learning_l` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_motor_model_learning_l` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'asoft'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-30 18:57:50
