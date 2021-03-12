-- MySQL dump 10.13  Distrib 5.6.45, for Win64 (x86_64)
--
-- Host: localhost    Database: ggulb_performance_report_dataset
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
-- Table structure for table `tb_gb_cd_list_m`
--

DROP TABLE IF EXISTS `tb_gb_cd_list_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_gb_cd_list_m` (
  `CD_IDX` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '코드 IDX',
  `UPPER_CD_IDX` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상위코드 IDX',
  `CD_NM` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '코드 명칭',
  `CD_SEQ` int(15) NOT NULL AUTO_INCREMENT COMMENT '코드 시퀀스',
  PRIMARY KEY (`CD_IDX`),
  UNIQUE KEY `CD_SEQ` (`CD_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_gb_cd_list_m`
--

LOCK TABLES `tb_gb_cd_list_m` WRITE;
/*!40000 ALTER TABLE `tb_gb_cd_list_m` DISABLE KEYS */;
INSERT INTO `tb_gb_cd_list_m` VALUES ('CD_00000000000000001',NULL,'프로젝트 구분',1),('CD_00000000000000002',NULL,'참여 형태',2),('CD_00000000000000003',NULL,'업무 분야',3),('CD_00000000000000004',NULL,'부서',4),('CD_00000000000000005',NULL,'직급',5),('CD_00000000000000006',NULL,'성별',6),('CD_00000000000000007','CD_00000000000000001','내부사업',7),('CD_00000000000000008','CD_00000000000000001','용역사업',8),('CD_00000000000000009','CD_00000000000000001','컨설팅 및 교육',9),('CD_00000000000000010','CD_00000000000000001','지원사업',10),('CD_00000000000000011','CD_00000000000000001','논문/특허/인증',11),('CD_00000000000000012','CD_00000000000000002','메인',12),('CD_00000000000000013','CD_00000000000000002','보조',13),('CD_00000000000000014','CD_00000000000000002','지원',14),('CD_00000000000000015','CD_00000000000000003','디자인',15),('CD_00000000000000016','CD_00000000000000003','개발',16),('CD_00000000000000017','CD_00000000000000003','빅데이터',17),('CD_00000000000000018','CD_00000000000000003','R&D',18),('CD_00000000000000019','CD_00000000000000003','마케팅',19),('CD_00000000000000020','CD_00000000000000003','행정',20),('CD_00000000000000021','CD_00000000000000004','행정',21),('CD_00000000000000022','CD_00000000000000004','웹개발',22),('CD_00000000000000023','CD_00000000000000004','빅데이터',23),('CD_00000000000000024','CD_00000000000000004','디자인',24),('CD_00000000000000025','CD_00000000000000005','대표이사',25),('CD_00000000000000026','CD_00000000000000005','소장',26),('CD_00000000000000027','CD_00000000000000005','부장',27),('CD_00000000000000028','CD_00000000000000005','팀장',28),('CD_00000000000000029','CD_00000000000000005','책임',29),('CD_00000000000000030','CD_00000000000000005','선임',30),('CD_00000000000000031','CD_00000000000000005','주임',31),('CD_00000000000000032','CD_00000000000000005','인턴',32),('CD_00000000000000033','CD_00000000000000006','남성',33),('CD_00000000000000034','CD_00000000000000006','여성',34);
/*!40000 ALTER TABLE `tb_gb_cd_list_m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_gb_nofpr_list_m`
--

DROP TABLE IF EXISTS `tb_gb_nofpr_list_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_gb_nofpr_list_m` (
  `NOFPR_IDX` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '인원 IDX',
  `NOFPR_NM` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이름',
  `NOFPR_DPRTM` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '부서',
  `NOFPR_CLPST` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '직급',
  `NOFPR_SEXDSTN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '성별',
  `NOFPR_CTTPC` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '연락처',
  `NOFPR_ENCPN` datetime(6) DEFAULT NULL COMMENT '입사일',
  `NOFPR_RECPN` datetime(6) DEFAULT NULL COMMENT '퇴사일',
  `NOFPR_STTS` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상태',
  `NOFPR_SEQ` int(15) NOT NULL AUTO_INCREMENT COMMENT '인원 시퀀스',
  PRIMARY KEY (`NOFPR_IDX`),
  UNIQUE KEY `NOFPR_SEQ` (`NOFPR_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_gb_nofpr_list_m`
--

LOCK TABLES `tb_gb_nofpr_list_m` WRITE;
/*!40000 ALTER TABLE `tb_gb_nofpr_list_m` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_gb_nofpr_list_m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_gb_projc_info_m`
--

DROP TABLE IF EXISTS `tb_gb_projc_info_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_gb_projc_info_m` (
  `PROJC_IDX` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '프로젝트 정보 IDX',
  `PROJC_SE` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구분',
  `PROJC_BSNS_NM` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사업명',
  `PROJC_NM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로젝트명',
  `PROJC_ORDER_OFFIC` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '발주처',
  `PROJC_TOT_BDGT` int(15) DEFAULT NULL COMMENT '총예산',
  `PROJC_RL_BDGT` int(15) DEFAULT NULL COMMENT '실예산',
  `PROJC_BGDT` datetime(6) DEFAULT NULL COMMENT '시작일',
  `PROJC_EDDT` datetime(6) DEFAULT NULL COMMENT '종료일',
  `PROJC_CRRSP_YEAR` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '해당연도',
  `PROJC_SEQ` int(15) NOT NULL AUTO_INCREMENT COMMENT '프로젝트 시퀀스',
  PRIMARY KEY (`PROJC_IDX`),
  UNIQUE KEY `PROJC_SEQ` (`PROJC_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_gb_projc_info_m`
--

LOCK TABLES `tb_gb_projc_info_m` WRITE;
/*!40000 ALTER TABLE `tb_gb_projc_info_m` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_gb_projc_info_m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_gb_prtcpnt_excut_cn_m`
--

DROP TABLE IF EXISTS `tb_gb_prtcpnt_excut_cn_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_gb_prtcpnt_excut_cn_m` (
  `PRTCPNT_EXCUT_IDX` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '참여자 수행내용 IDX',
  `PROJC_IDX` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '프로젝트 정보 IDX',
  `NOFPR_IDX` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '인원 IDX',
  `PRTCN_FOM` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '참여형태',
  `PRTCN_BGDT` datetime(6) DEFAULT NULL COMMENT '참여시작일',
  `PRTCN_EDDT` datetime(6) DEFAULT NULL COMMENT '참여종료일',
  `PRTCN_RT` decimal(3,2) DEFAULT NULL COMMENT '참여율',
  `PRTCPNT_EXCUT_SEQ` int(15) NOT NULL AUTO_INCREMENT COMMENT '참여자 수행내용 시퀀스',
  PRIMARY KEY (`PRTCPNT_EXCUT_IDX`),
  UNIQUE KEY `PRTCPNT_EXCUT_SEQ` (`PRTCPNT_EXCUT_SEQ`),
  KEY `PROJC_IDX` (`PROJC_IDX`),
  KEY `NOFPR_IDX` (`NOFPR_IDX`),
  CONSTRAINT `NOFPR_IDX` FOREIGN KEY (`NOFPR_IDX`) REFERENCES `tb_gb_nofpr_list_m` (`NOFPR_IDX`) ON DELETE CASCADE,
  CONSTRAINT `PROJC_IDX` FOREIGN KEY (`PROJC_IDX`) REFERENCES `tb_gb_projc_info_m` (`PROJC_IDX`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_gb_prtcpnt_excut_cn_m`
--

LOCK TABLES `tb_gb_prtcpnt_excut_cn_m` WRITE;
/*!40000 ALTER TABLE `tb_gb_prtcpnt_excut_cn_m` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_gb_prtcpnt_excut_cn_m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_gb_prtcpnt_excut_detail_job_d`
--

DROP TABLE IF EXISTS `tb_gb_prtcpnt_excut_detail_job_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_gb_prtcpnt_excut_detail_job_d` (
  `PRTCPNT_EXCUT_DETAIL_IDX` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '참여자 수행내용 상세업무 IDX',
  `PRTCPNT_EXCUT_IDX` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '참여자 수행내용 IDX',
  `PRTCN_DUY_SE` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수행업무 구분',
  `PRTCN_DUY_CN` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수행업무 내용',
  `DETAIL_DUY_CN` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상세업무 내용',
  `PRTCPNT_EXCUT_DETAIL_SEQ` int(15) NOT NULL AUTO_INCREMENT COMMENT '참여자 수행내용 상세업무 시퀀스',
  PRIMARY KEY (`PRTCPNT_EXCUT_DETAIL_IDX`),
  UNIQUE KEY `PRTCPNT_EXCUT_DETAIL_SEQ` (`PRTCPNT_EXCUT_DETAIL_SEQ`),
  KEY `PRTCPNT_EXCUT_IDX` (`PRTCPNT_EXCUT_IDX`),
  CONSTRAINT `PRTCPNT_EXCUT_IDX` FOREIGN KEY (`PRTCPNT_EXCUT_IDX`) REFERENCES `tb_gb_prtcpnt_excut_cn_m` (`PRTCPNT_EXCUT_IDX`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_gb_prtcpnt_excut_detail_job_d`
--

LOCK TABLES `tb_gb_prtcpnt_excut_detail_job_d` WRITE;
/*!40000 ALTER TABLE `tb_gb_prtcpnt_excut_detail_job_d` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_gb_prtcpnt_excut_detail_job_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ggulb_performance_report_dataset'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-10 11:22:28
