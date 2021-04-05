-- MySQL dump 10.13  Distrib 5.6.45, for Win64 (x86_64)
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
  `CODE_IDX` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '코드 IDX',
  `CODE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '코드 ID',
  `CODE_NM` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '코드 명',
  `UPPER_CODE_IDX` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '상위 코드 IDX',
  `CODE_CN` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '코드 설명',
  `SORT_ORDR` int(2) DEFAULT NULL COMMENT '정렬 순서',
  `CODE_VALUE1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '코드 값1',
  `CODE_VALUE2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '코드 값2',
  `INS_DTTM` datetime NOT NULL COMMENT '등록일시',
  `INS_IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '등록 IP',
  `INS_IDX` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '등록 IDX',
  `UPT_DTTM` datetime DEFAULT NULL COMMENT '수정일시',
  `UPT_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수정 IP',
  `UPT_IDX` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수정 IDX',
  `DEL_DTTM` datetime DEFAULT NULL COMMENT '삭제일시',
  `DEL_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '삭제 IP',
  `DEL_IDX` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '삭제 IDX',
  PRIMARY KEY (`CODE_IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='코드 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_code_c`
--

LOCK TABLES `tb_code_c` WRITE;
/*!40000 ALTER TABLE `tb_code_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_code_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_data_file_info_m`
--

DROP TABLE IF EXISTS `tb_data_file_info_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_data_file_info_m` (
  `DATA_FILE_IDX` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '데이터 파일 IDX',
  `DATA_FILE_NM` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '데이터 파일 이름',
  `DATA_FILE_DIR` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '데이터 파일 경로',
  `REFINE_STTS` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '정제 상태',
  `REFINE_ERROR_CN` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '정제 오류 내용',
  `INS_DTTM` datetime NOT NULL COMMENT '등록일시',
  `INS_IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '등록 IP',
  `INS_IDX` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '등록 IDX',
  `UPT_DTTM` datetime DEFAULT NULL COMMENT '수정일시',
  `UPT_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수정 IP',
  `UPT_IDX` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수정 IDX',
  `DEL_DTTM` datetime DEFAULT NULL COMMENT '삭제일시',
  `DEL_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '삭제 IP',
  `DEL_IDX` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '삭제 IDX',
  PRIMARY KEY (`DATA_FILE_IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='데이터 파일 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_data_file_info_m`
--

LOCK TABLES `tb_data_file_info_m` WRITE;
/*!40000 ALTER TABLE `tb_data_file_info_m` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_data_file_info_m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_dgnss_info_m`
--

DROP TABLE IF EXISTS `tb_dgnss_info_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_dgnss_info_m` (
  `DGNSS_IDX` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '진단 IDX',
  `DGNSS_STTS` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '진단 상태',
  `DGNSS_ERROR_CN` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '진단 오류내용',
  `SRL_NO` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '시리얼 번호',
  `ERCRT_DATA_FILE_IDX` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '전류데이터 파일 IDX',
  `MFLX_DATA_FILE_IDX` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '자속데이터 파일 IDX',
  `MOTOR_IDX` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '모터 IDX',
  `DGNSS_CMPLE_DTTM` datetime DEFAULT NULL COMMENT '진단 완료일시',
  `DNN_DGNSS_RSRT_IDX` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'DNN 진단 결과 IDX',
  `ENSEMBLE_DGNSS_RSRT_IDX` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ensemble 진단 결과 IDX',
  `RF_DGNSS_RSRT_IDX` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'RF 진단 결과 IDX',
  `SVM_DGNSS_RSRT_IDX` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'SVM 진단 결과 IDX',
  `INS_DTTM` datetime NOT NULL COMMENT '등록일시',
  `INS_IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '등록 IP',
  `INS_IDX` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '등록 IDX',
  `DEL_DTTM` datetime DEFAULT NULL COMMENT '삭제일시',
  `DEL_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '삭제 IP',
  `DEL_IDX` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '삭제 IDX',
  PRIMARY KEY (`DGNSS_IDX`),
  KEY `ERCRT_DATA_FILE_IDX` (`ERCRT_DATA_FILE_IDX`),
  KEY `MFLX_DATA_FILE_IDX` (`MFLX_DATA_FILE_IDX`),
  KEY `MOTOR_IDX` (`MOTOR_IDX`),
  KEY `DNN_DGNSS_RSRT_IDX` (`DNN_DGNSS_RSRT_IDX`),
  KEY `ENSEMBLE_DGNSS_RSRT_IDX` (`ENSEMBLE_DGNSS_RSRT_IDX`),
  KEY `RF_DGNSS_RSRT_IDX` (`RF_DGNSS_RSRT_IDX`),
  KEY `SVM_DGNSS_RSRT_IDX` (`SVM_DGNSS_RSRT_IDX`),
  CONSTRAINT `tb_dgnss_info_m_ibfk_1` FOREIGN KEY (`ERCRT_DATA_FILE_IDX`) REFERENCES `tb_data_file_info_m` (`DATA_FILE_IDX`) ON DELETE CASCADE,
  CONSTRAINT `tb_dgnss_info_m_ibfk_2` FOREIGN KEY (`MFLX_DATA_FILE_IDX`) REFERENCES `tb_data_file_info_m` (`DATA_FILE_IDX`) ON DELETE CASCADE,
  CONSTRAINT `tb_dgnss_info_m_ibfk_3` FOREIGN KEY (`MOTOR_IDX`) REFERENCES `tb_motor_info_m` (`MOTOR_IDX`) ON DELETE CASCADE,
  CONSTRAINT `tb_dgnss_info_m_ibfk_4` FOREIGN KEY (`DNN_DGNSS_RSRT_IDX`) REFERENCES `tb_dgnss_rsrt_info_m` (`DGNSS_RSRT_IDX`) ON DELETE CASCADE,
  CONSTRAINT `tb_dgnss_info_m_ibfk_5` FOREIGN KEY (`ENSEMBLE_DGNSS_RSRT_IDX`) REFERENCES `tb_dgnss_rsrt_info_m` (`DGNSS_RSRT_IDX`) ON DELETE CASCADE,
  CONSTRAINT `tb_dgnss_info_m_ibfk_6` FOREIGN KEY (`RF_DGNSS_RSRT_IDX`) REFERENCES `tb_dgnss_rsrt_info_m` (`DGNSS_RSRT_IDX`) ON DELETE CASCADE,
  CONSTRAINT `tb_dgnss_info_m_ibfk_7` FOREIGN KEY (`SVM_DGNSS_RSRT_IDX`) REFERENCES `tb_dgnss_rsrt_info_m` (`DGNSS_RSRT_IDX`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='진단 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_dgnss_info_m`
--

LOCK TABLES `tb_dgnss_info_m` WRITE;
/*!40000 ALTER TABLE `tb_dgnss_info_m` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_dgnss_info_m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_dgnss_rsrt_info_m`
--

DROP TABLE IF EXISTS `tb_dgnss_rsrt_info_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_dgnss_rsrt_info_m` (
  `DGNSS_RSRT_IDX` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '진단 결과 IDX',
  `DGNSS_KIND` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '진단 종류',
  `RTTN_FLW_VAL` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '회전자바 결함 값',
  `UNBALNC_FLW_VAL` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '부하불평형 결함 값',
  `ECTY_FLW_VAL` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '편심 결함 값',
  PRIMARY KEY (`DGNSS_RSRT_IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='진단 결과 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_dgnss_rsrt_info_m`
--

LOCK TABLES `tb_dgnss_rsrt_info_m` WRITE;
/*!40000 ALTER TABLE `tb_dgnss_rsrt_info_m` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_dgnss_rsrt_info_m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_entrp_info_m`
--

DROP TABLE IF EXISTS `tb_entrp_info_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_entrp_info_m` (
  `ENTRP_IDX` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '기업 IDX',
  `ENTRP_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '기업 ID',
  `ENTRP_PW` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '기업 PW',
  `ENTRP_NM` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '기업 명',
  `RPRST_NM` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '대표자 명',
  `ENTRP_TLNO` varchar(13) COLLATE utf8_unicode_ci NOT NULL COMMENT '전화번호',
  `ENTRP_STTS` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '대기' COMMENT '회원 상태',
  `ENTRP_ATHRY` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'USER' COMMENT '회원 권한',
  `INS_DTTM` datetime NOT NULL COMMENT '등록일시',
  `INS_IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '등록 IP',
  `INS_IDX` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '등록 IDX',
  `UPT_DTTM` datetime DEFAULT NULL COMMENT '수정일시',
  `UPT_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수정 IP',
  `UPT_IDX` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수정 IDX',
  `DEL_DTTM` datetime DEFAULT NULL COMMENT '삭제일시',
  `DEL_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '삭제 IP',
  `DEL_IDX` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '삭제 IDX',
  PRIMARY KEY (`ENTRP_IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='기업 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_entrp_info_m`
--

LOCK TABLES `tb_entrp_info_m` WRITE;
/*!40000 ALTER TABLE `tb_entrp_info_m` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_entrp_info_m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_motor_info_m`
--

DROP TABLE IF EXISTS `tb_motor_info_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_motor_info_m` (
  `MOTOR_IDX` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '모터 IDX',
  `MODEL_NM` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '모델 명',
  `VLTG_KIND` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '전압 종류',
  `VLTG_NMVL` int(10) DEFAULT NULL COMMENT '전압 수치',
  `MXMM_ERCRT_NMVL` int(10) DEFAULT NULL COMMENT '최대 전류 수치',
  `PWRER_NMVL` int(10) DEFAULT NULL COMMENT '전력 수치',
  `HZ_NMVL` int(10) DEFAULT NULL COMMENT 'Hz 수치',
  `MOTOR_KIND` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '모터 종류',
  `LERN_DATA_FILE_IDX` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '학습 데이터 파일 IDX',
  `INS_DTTM` datetime NOT NULL COMMENT '등록일시',
  `INS_IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '등록 IP',
  `INS_IDX` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '등록 IDX',
  `UPT_DTTM` datetime DEFAULT NULL COMMENT '수정일시',
  `UPT_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수정 IP',
  `UPT_IDX` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수정 IDX',
  `DEL_DTTM` datetime DEFAULT NULL COMMENT '삭제일시',
  `DEL_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '삭제 IP',
  `DEL_IDX` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '삭제 IDX',
  PRIMARY KEY (`MOTOR_IDX`),
  KEY `LERN_DATA_FILE_IDX` (`LERN_DATA_FILE_IDX`),
  CONSTRAINT `tb_motor_info_m_ibfk_1` FOREIGN KEY (`LERN_DATA_FILE_IDX`) REFERENCES `tb_data_file_info_m` (`DATA_FILE_IDX`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='모터 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_motor_info_m`
--

LOCK TABLES `tb_motor_info_m` WRITE;
/*!40000 ALTER TABLE `tb_motor_info_m` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_motor_info_m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pprcsg_info_m`
--

DROP TABLE IF EXISTS `tb_pprcsg_info_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pprcsg_info_m` (
  `PPRCSG_IDX` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '전처리 IDX',
  `PPRCSG_STTS` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '전처리 상태',
  `PPRCSG_ERROR_CN` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '전처리 오류내용',
  PRIMARY KEY (`PPRCSG_IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='전처리 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pprcsg_info_m`
--

LOCK TABLES `tb_pprcsg_info_m` WRITE;
/*!40000 ALTER TABLE `tb_pprcsg_info_m` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pprcsg_info_m` ENABLE KEYS */;
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

-- Dump completed on 2021-04-05 18:45:12
