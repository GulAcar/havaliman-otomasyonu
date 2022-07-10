-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 29 May 2021, 19:55:45
-- Sunucu sürümü: 10.4.19-MariaDB
-- PHP Sürümü: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `ucakotomasyonu`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ana_tablo`
--

CREATE TABLE `ana_tablo` (
  `ID` int(11) NOT NULL,
  `Biletler` int(11) NOT NULL,
  `Calisanlar` int(11) NOT NULL,
  `Firmalar` int(11) NOT NULL,
  `Havaalaniarackiralama` int(11) NOT NULL,
  `Havaalaniotopark` int(11) NOT NULL,
  `Havaalanitablosu` int(11) NOT NULL,
  `Ucuslar` int(11) NOT NULL,
  `Yolcular` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `biletler`
--

CREATE TABLE `biletler` (
  `ID` int(11) NOT NULL,
  `Sinif` int(11) NOT NULL,
  `Firma` int(11) NOT NULL,
  `Yolcu_ad_soyad` int(11) NOT NULL,
  `Fiyat` int(11) NOT NULL,
  `Ucus_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `calisanlar`
--

CREATE TABLE `calisanlar` (
  `ID` int(11) NOT NULL,
  `Ad_Soyad` text NOT NULL,
  `dgm_trh` date NOT NULL,
  `telefon_no` int(11) NOT NULL,
  `Firma` text NOT NULL,
  `Meslek` text NOT NULL,
  `Maas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `fatura`
--

CREATE TABLE `fatura` (
  `Ad` text NOT NULL,
  `Soyad` text NOT NULL,
  `Email` text NOT NULL,
  `kimlikNumara` int(11) NOT NULL,
  `HesKod` text NOT NULL,
  `KartNo` int(11) NOT NULL,
  `SonKullanma` text NOT NULL,
  `CVV` int(11) NOT NULL,
  `nereden` text NOT NULL,
  `nereye` text NOT NULL,
  `gidisTarihi` int(11) NOT NULL,
  `donusTarihi` int(11) NOT NULL,
  `yetiskinSayisi` int(11) NOT NULL,
  `ogrenciSayisi` int(11) NOT NULL,
  `cocukSayisi` int(11) NOT NULL,
  `bebekSayisi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `firmalar`
--

CREATE TABLE `firmalar` (
  `ID` int(11) NOT NULL,
  `Firma_adi` text NOT NULL,
  `Sehir` text NOT NULL,
  `Ulke` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `firmalar`
--

INSERT INTO `firmalar` (`ID`, `Firma_adi`, `Sehir`, `Ulke`) VALUES
(1, 'PEGASUS', '', 'TÜRKİYE'),
(2, 'THY(Türk Hava Yolları)', '', 'TÜRKİYE'),
(3, 'AnadoluJET', '', 'TÜRKİYE');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `havaalaniarackiralama`
--

CREATE TABLE `havaalaniarackiralama` (
  `ID` int(11) NOT NULL,
  `Kfirma_adi` text NOT NULL,
  `Teslimalinan_trh` date NOT NULL,
  `Teslimedilen_trh` date NOT NULL,
  `Fiyat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `havaalaniotopark`
--

CREATE TABLE `havaalaniotopark` (
  `ID` int(11) NOT NULL,
  `Arac_tipi` text NOT NULL,
  `Aracgiris_trh` date NOT NULL,
  `Araccikis_trh` date NOT NULL,
  `Fiyat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `havaalanitablosu`
--

CREATE TABLE `havaalanitablosu` (
  `ID` int(11) NOT NULL,
  `Sehir` text NOT NULL,
  `Havalimani_adi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `havaalanitablosu`
--

INSERT INTO `havaalanitablosu` (`ID`, `Sehir`, `Havalimani_adi`) VALUES
(1, 'İSTANBUL', 'SABİHA GÖKÇEN'),
(2, 'ANTALYA', 'ANTALYA HAVALİMANI'),
(3, 'ADANA', 'ŞAKİRPAŞA  HAVALİMANI'),
(4, 'HATAY', 'HATAY HAVALİMANI'),
(5, 'ANKARA', 'ESENBOĞA HAVALİMANI'),
(6, 'DENİZLİ', 'DENİZLİ ÇARDAK HAVALİMANI'),
(7, 'DİYARBAKIR', 'DİYARBAKIR HAVALİMANI'),
(8, 'KARS', 'KARS HARAKANİ HAVALİMANI'),
(9, 'KÜTAHYA', 'ZAFER HAVALİMANI'),
(10, 'SAMSUN', 'SAMSUN ÇARŞAMBA HAVALİMANI'),
(11, 'ALANYA', 'GAZİPAŞA HAVALİMANI'),
(12, 'BALIKESİR', 'BALIKESİR KOCA SEYİT HAVALİMANI'),
(13, 'ESKİŞEHİR', 'HASAN POLATKAN HAVALİMANI'),
(14, 'GAZİANTEP', 'GAZİANTEP KOCA SEYİT HAVALİMANI'),
(15, 'ISPARTA', 'ISPARTA SÜLEYMAN DEMİREL HAVALİMANI'),
(16, 'İZMİR', 'ADNAN MENDERES HAVALİMANI'),
(17, 'MUĞLA', 'MİLA-BODRUM HAVALİMANI'),
(18, 'NEVŞEHİR', 'NEVŞEHİR KAPADOKYA HAVALİMANI'),
(19, 'ORDU-GİRESUN', 'ORDU-GİRESUN HAVALİMANI'),
(20, 'SİNOP', 'SİNOP HAVALİMANI'),
(21, 'SİVAS', 'SİVAS NURİ DEMİRAĞ HAVALİMANI'),
(22, 'ŞANLIURFA', 'ŞANLIURFA GAP HAVALİMANI'),
(23, 'TRABZON', 'TRABZON HAVALİMANI'),
(24, 'VAN', 'VAN FERİT MELEN HAVALİMANI'),
(25, 'ZONGULDAK', 'ZONGULDAK HAVALİMANI');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ucuslar`
--

CREATE TABLE `ucuslar` (
  `ID` int(11) NOT NULL,
  `Havaalani_adi` text NOT NULL,
  `Ucak_kalkis_yer` text NOT NULL,
  `Ucak_kalkis_saati` time NOT NULL,
  `Ucak_varis_yer` text NOT NULL,
  `Ucak_varis_saat` time NOT NULL,
  `Fiyat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `ucuslar`
--

INSERT INTO `ucuslar` (`ID`, `Havaalani_adi`, `Ucak_kalkis_yer`, `Ucak_kalkis_saati`, `Ucak_varis_yer`, `Ucak_varis_saat`, `Fiyat`) VALUES
(1, 'ANTALYA HAVALİMANI', 'ANTALYA', '08:00:00', 'ADANA', '08:40:00', 185),
(2, 'ANTALYA HAVALİMANI', 'ANTALYA', '13:20:00', 'ADANA', '14:00:00', 160),
(3, 'ANTALYA HAVALİMANI', 'ANTALYA', '18:00:00', 'ADANA', '18:40:00', 160),
(4, 'ŞAKİRPAŞA HAVALİMANI', 'ADANA', '09:00:00', 'ANTALYA', '09:40:00', 185),
(5, 'ŞAKİRPAŞA HAVALİMANI', 'ADANA', '14:20:00', 'ANTALYA', '15:00:00', 165),
(6, 'ŞAKİRPAŞA HAVALİMANI', 'ADANA', '19:00:00', 'ANTALYA', '19:40:00', 145),
(7, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '07:00:00', 'ANTALYA', '08:10:00', 165),
(8, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '12:00:00', 'ANTALYA', '13:10:00', 145),
(9, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '17:00:00', 'ANTALYA', '18:10:00', 165),
(10, 'ANTALYA HAVALİMANI', 'ANTALYA', '07:10:00', 'İSTANBUL', '08:20:00', 165),
(11, 'ANTALYA HAVALİMANI', 'ANTALYA', '12:10:00', 'İSTANBUL', '12:20:00', 145),
(12, 'ANTALYA HAVALİMANI', 'ANTALYA', '17:10:00', 'İSTANBUL', '17:20:00', 165),
(13, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '06:00:00', 'ADANA', '07:25:00', 185),
(14, 'SABİHA GÖKÇEN HAVALİAMANI', 'İSTANBUL', '11:00:00', 'ADANA', '12:25:00', 200),
(15, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '16:25:00', 'ADANA', '17:50:00', 185),
(16, 'ŞAKİRPAŞA HAVALİMANI', 'ADANA', '08:30:00', 'İSTANBUL', '09:55:00', 200),
(17, 'ŞAKİRPAŞA HAVALİMANI', 'ADANA', '13:00:00', 'İSTANBUL', '14:25:00', 165),
(18, 'ŞAKİRPAŞA HAVALİMANI', 'ADANA', '20:10:00', 'İSTANBUL', '21:35:00', 185),
(19, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '06:10:00', 'ANKARA', '07:10:00', 200),
(20, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '12:00:00', 'ANKARA', '13:00:00', 165),
(21, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '20:40:00', 'ANKARA', '21:40:00', 200),
(22, 'ESENBOĞA HAVALİMANI', 'ANKARA', '06:20:00', 'İSTANBUL', '07:20:00', 185),
(23, 'ESENBOĞA HAVALİAMANI', 'ANKARA', '12:20:00', 'İSTANBUL', '13:20:00', 165),
(24, 'ESENBOĞA HAVALİAMANI', 'ANKARA', '19:15:00', 'İSTANBUL', '20:15:00', 185),
(25, 'DENİZLİ ÇARDAK HAVALİMANI', 'DENİZLİ', '09:00:00', 'İSTANBUL', '10:00:00', 165),
(26, 'DENİZLİ ÇARDAK HAVALİMANI', 'DENİZLİ', '18:40:00', 'İSTANBUL', '19:40:00', 200),
(27, 'DENİZLİ ÇARDAK HAVALİMANI', 'DENİZLİ', '20:30:00', 'İSTANBUL', '21:30:00', 185),
(28, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '09:10:00', 'DENİZLİ', '10:10:00', 200),
(29, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '12:20:00', 'DENİZLİ', '13:20:00', 185),
(30, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '21:40:00', 'DENİZLİ', '22:40:00', 200),
(31, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '09:00:00', 'DİYARBAKIR', '10:55:00', 200),
(32, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '15:05:00', 'DİYARBAKIR', '17:00:00', 200),
(33, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '20:05:00', 'DİYARBAKIR', '22:00:00', 200),
(34, 'DİYARBAKIR HAVALİMANI', 'DİYARBAKIR', '10:10:00', 'İSTANBUL', '12:05:00', 200),
(35, 'DİYARBAKIR HAVALİMANI', 'DİYARBAKIR', '14:15:00', 'İSTANBUL', '16:05:00', 200),
(37, 'ZAFER HAVALİMANI', 'KÜTAHYA', '09:00:00', 'İSTANBUL', '10:00:00', 200),
(38, 'ZAFER HAVALİMANI', 'KÜTAHYA', '12:20:00', 'İSTANBUL', '13:20:00', 165),
(39, 'ZAFER HAVALİMANI', 'KÜTAHYA', '22:30:00', 'İSTANBUL', '23:30:00', 165),
(40, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '11:20:00', 'KÜTAHYA', '12:20:00', 185),
(41, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '17:30:00', 'KÜTAHYA', '18:30:00', 165),
(42, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '20:00:00', 'KÜTAHYA', '21:00:00', 200),
(43, 'SAMSUN ÇARSAMBA HAVALİMANI', 'SAMSUN', '06:40:00', 'İSTANBUL', '07:55:00', 200),
(44, 'SAMSUN ÇARŞAMBA HAVALİMANI', 'SAMSUN', '09:25:00', 'İSTANBUL', '10:30:00', 200),
(45, 'SAMSUN ÇARŞAMBA HAVALİMANI', 'SAMSUN', '21:50:00', 'İSTANBUL', '23:15:00', 185),
(46, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '09:00:00', 'SAMSUN', '10:25:00', 185),
(47, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '15:20:00', 'SAMSUN', '16:45:00', 165),
(48, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '22:30:00', 'SAMSUN', '23:55:00', 165),
(49, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '08:50:00', 'BALIKESİR', '09:45:00', 200),
(50, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '13:55:00', 'BALIKESİR', '15:00:00', 200),
(51, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '19:30:00', 'BALIKESİR', '20:35:00', 200),
(52, 'BALIKESİR KOCASEYİT HAVALİMANI', 'BALIKESİR', '08:50:00', 'İSTANBUL', '09:45:00', 185),
(53, 'BALIKESİR KOCASEYİT HAVALİMANI', 'BALIKESİR', '13:55:00', 'İSTANBUL', '15:00:00', 200),
(54, 'BALIKESİR KOCASEYİT HAVALİMANI', 'BALIKESİR ', '19:30:00', 'İSTANBUL', '20:35:00', 165),
(55, 'GAZİANTEP KOCA SEYİT HAVALİMANI', 'GAZİANTEP ', '01:20:00', 'İSTANBUL', '02:50:00', 200),
(56, 'GAZİANTEP KOCA SEYİT HAVALİMANI', 'GAZİANTEP', '15:50:00', 'İSTANBUL', '17:30:00', 200),
(57, 'GAZİANTEP KOCA SEYİT HAVALİMANI', 'GAZİANTEP', '20:35:00', 'İSTANBUL', '22:15:00', 200),
(58, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '01:20:00', 'GAZİANTEP', '02:50:00', 200),
(59, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '15:50:00', 'GAZİANTEP', '17:30:00', 165),
(60, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '20:30:00', 'GAZİANTEP', '22:10:00', 165),
(61, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '02:10:00', 'ISPARTA', '03:20:00', 200),
(62, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '09:15:00', 'ISPARTA', '10:25:00', 200),
(63, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '18:40:00', 'ISPARTA', '19:50:00', 165),
(64, 'ISPARTA SÜLEYMAN DEMİREL HAVALİMANI', 'ISPARTA', '05:50:00', 'İSTANBUL', '07:00:00', 185),
(65, 'ISPARTA SÜLEYMAN DEMİREL HAVALİMANI', 'ISPARTA ', '14:20:00', 'İSTANBUL', '15:30:00', 200),
(66, 'ISPARTA SÜLEYMAN DEMİREL HAVALİMANI', 'ISPARTA', '23:00:00', 'İSTANBUL', '00:10:00', 200),
(67, 'ADNAN MENDERES HAVALİMANI', 'İZMİR', '07:30:00', 'İSTANBUL', '08:40:00', 145),
(68, 'ADNAN MENDERES HAVALİMANI', 'İZMİR', '13:00:00', 'İSTANBUL', '14:05:00', 200),
(69, 'ADNAN MENDERES HAVALİMANI', 'İZMİR', '16:40:00', 'İSTANBUL', '17:55:00', 200),
(70, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '07:30:00', 'İZMİR', '08:40:00', 185),
(71, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '13:00:00', 'İZMİR', '14:05:00', 200),
(72, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '16:40:00', 'İZMİR', '17:55:00', 200),
(73, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '10:00:00', 'VAN', '12:00:00', 145),
(74, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '17:50:00', 'VAN', '19:50:00', 200),
(75, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '14:15:00', 'VAN', '16:15:00', 200),
(76, 'VAN FERİT MELEN HAVALİMANI', 'VAN', '10:00:00', 'İSTANBUL', '12:00:00', 185),
(77, 'VAN FERİT MELEN HAVALİMANI', 'VAN', '14:15:00', 'İSTANBUL', '16:15:00', 200),
(78, 'VAN FERİT MELEN HAVALİMANI', 'VAN', '17:50:00', 'İSTANBUL', '19:50:00', 145),
(79, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '07:50:00', 'TRABZON', '09:30:00', 200),
(80, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '11:50:00', 'TRABZON', '13:30:00', 185),
(81, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '23:10:00', 'TRABZON', '00:50:00', 145),
(82, 'TRABZON HAVALİMANI', 'TRABZON ', '07:55:00', 'İSTANBUL', '09:35:00', 175),
(83, 'TRABZON HAVALİMANI', 'TRABZON ', '11:55:00', 'İSTANBUL', '13:55:00', 175),
(84, 'TRABZON HAVALİMANI', 'TRABZON', '23:15:00', 'İSTANBUL', '00:55:00', 145),
(85, 'ŞANLI URFA GAP HAVALİMANI', 'ŞANLI URFA', '06:05:00', 'İSTANBUL', '07:50:00', 145),
(86, 'ŞANLI URFA GAP HAVALİMANI', 'ŞANLI URFA ', '13:40:00', 'İSTANBUL', '15:20:00', 185),
(87, 'ŞANLI URFA GAP HAVALİMANI', 'ŞANLI URFA', '19:10:00', 'İSTANBUL', '20:55:00', 175),
(88, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '06:00:00', 'ŞANLI URFA', '07:45:00', 145),
(89, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '13:40:00', 'ŞANLI URFA', '15:20:00', 175),
(90, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '19:10:00', 'ŞANLI URFA', '20:55:00', 185),
(91, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '11:25:00', 'SİVAS', '12:45:00', 175),
(92, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '17:40:00', 'SİVAS', '19:00:00', 145),
(93, 'SABİHA GÖKÇEN HAVALİMANI', 'İSTANBUL', '20:05:00', 'SİVAS', '21:30:00', 175),
(94, 'SİVAS NURİ DEMİRAĞ HAVALİMANI', 'SİVAS', '11:20:00', 'İSTANBUL', '12:40:00', 185),
(95, 'SİVAS NURİ DEMİRAĞ HAVALİMANI', 'SİVAS ', '17:40:00', 'İSTANBUL', '19:00:00', 175),
(96, 'SİVAS NURİ DEMİRAĞ HAVALİMANI', 'SİVAS', '20:05:00', 'İSTANBUL', '21:30:00', 145),
(97, 'SAMSUN ÇARŞAMBA HAVALİMANI', 'SAMSUN', '11:35:00', 'ANTALYA', '13:05:00', 175),
(98, 'SAMSUN ÇARŞAMBA HAVALİMANI', 'SAMSUN', '15:45:00', 'ANTALYA', '13:05:00', 175),
(99, 'SAMSUN ÇARŞAMBA HAVALİMNAI', 'SAMSUN', '17:10:00', 'ANTALYA', '18:40:00', 175),
(100, 'ANTALYA HAVALİMANI', 'ANTALYA', '11:20:00', 'SAMSUN', '12:50:00', 175),
(101, 'ANATALYA HAVALİMANI', 'ANTALYA', '15:35:00', 'SAMSUN', '17:05:00', 185),
(102, 'ANTALYA HAVALİMANI', 'ANTALYA', '17:00:00', 'SAMSUN', '18:30:00', 185),
(103, 'ESENBOĞA HAVALİMNAI', 'ANKARA', '00:00:07', 'ADANA', '08:25:00', 175),
(104, 'ESENBOĞA HVALİMANI', 'ANKARA', '16:15:00', 'ADANA', '17:15:00', 175),
(105, 'ESENBOĞA HAVALİMANI', 'ANKARA', '16:35:00', 'ADANA', '17:35:00', 175),
(106, 'ŞAKİRPAŞA HAVALİMNAI', 'ADANA', '07:00:00', 'ANKARA', '08:05:00', 145),
(107, 'ŞAKİRPAŞA HAVALİMNAI', 'ADANA', '08:00:00', 'ANKARA', '09:00:00', 145),
(108, 'ŞAKİRPAŞA HAVALİMANI', 'ADANA', '16:15:00', 'ANKARA', '17:15:00', 175),
(109, 'ESENBOĞA HAVALİMANI', 'ANKARA', '07:20:00', 'İZMİR', '08:35:00', 160),
(110, 'ESENBOĞA HAVALİMANI', 'ANKARA', '13:00:00', 'İZMİR', '14:15:00', 145),
(111, 'ESENBOĞA HAVALİMANI', 'ANKARA', '23:55:00', 'İZMİR', '01:10:00', 160),
(112, 'ADNAN MENDERES HAVALİMANI', 'İZMİR', '07:30:00', 'ANKARA', '08:45:00', 145),
(113, 'ADNAN MENDERES HAVALİMANI', 'İZMİR', '13:20:00', 'ANKARA', '14:35:00', 160),
(114, 'ADNAN MENDERES HAVALİMANI', 'İZMİR', '23:35:00', 'ANKARA', '00:00:00', 145),
(115, 'ESENBOĞA HAVALİMANI', 'ANKARA', '07:20:00', 'HATAY', '08:25:00', 145),
(116, 'ESENNOĞA HAVALİMANI', 'ANKARA', '16:35:00', 'HATAY', '17:35:00', 145),
(117, 'ESENBOĞA HAVALİMANI', 'ANKARA', '23:55:00', 'HATAY', '01:05:00', 185),
(118, 'HATAY HAVALİMANI', 'HATAY', '00:07:20', 'ANKARA', '08:25:00', 160),
(119, 'HATAY HAVALİMANI', 'HATAY', '16:35:00', 'ANKARA', '17:35:00', 160),
(120, 'HATAY HAVALİMANI', 'HATAY', '23:55:00', 'ANKARA', '01:05:00', 160),
(121, 'HATAY HAVALİMANI', 'HATAY', '06:00:00', 'İZMİR', '07:30:00', 185),
(122, 'HATAY HAVALİMANI', 'HATAY', '15:25:00', 'İZMİR', '15:25:00', 185),
(123, 'HATAY HAVALİMANI', 'HATAY', '20:50:00', 'İZMİR', '22:50:00', 160),
(124, 'ADNAN MENDERES HAVALİMANI', 'İZMİR', '06:00:00', 'HATAY', '07:30:00', 160),
(125, 'ADNAN MENDERES HAVALİMANI', 'İZMİR', '15:25:00', 'HATAY', '16:50:00', 160),
(126, 'ADNAN MENDERES HAVALİMANI', 'İZMİR', '20:50:00', 'HATAY', '22:20:00', 185);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yolcular`
--

CREATE TABLE `yolcular` (
  `ID` int(11) NOT NULL,
  `Ad_Soyad` int(11) NOT NULL,
  `Telefon_no` int(11) NOT NULL,
  `Sehir` int(11) NOT NULL,
  `Yas` int(11) NOT NULL,
  `TC.kimlik_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `ana_tablo`
--
ALTER TABLE `ana_tablo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Biletler` (`Biletler`,`Calisanlar`,`Firmalar`,`Havaalaniarackiralama`,`Havaalaniotopark`,`Havaalanitablosu`,`Ucuslar`,`Yolcular`),
  ADD KEY `Firmalar` (`Firmalar`),
  ADD KEY `Havaalanitablosu` (`Havaalanitablosu`),
  ADD KEY `Ucuslar` (`Ucuslar`),
  ADD KEY `Calisanlar` (`Calisanlar`),
  ADD KEY `Havaalaniarackiralama` (`Havaalaniarackiralama`),
  ADD KEY `Yolcular` (`Yolcular`),
  ADD KEY `Havaalaniotopark` (`Havaalaniotopark`);

--
-- Tablo için indeksler `biletler`
--
ALTER TABLE `biletler`
  ADD PRIMARY KEY (`ID`);

--
-- Tablo için indeksler `calisanlar`
--
ALTER TABLE `calisanlar`
  ADD PRIMARY KEY (`ID`);

--
-- Tablo için indeksler `firmalar`
--
ALTER TABLE `firmalar`
  ADD PRIMARY KEY (`ID`);

--
-- Tablo için indeksler `havaalaniarackiralama`
--
ALTER TABLE `havaalaniarackiralama`
  ADD PRIMARY KEY (`ID`);

--
-- Tablo için indeksler `havaalaniotopark`
--
ALTER TABLE `havaalaniotopark`
  ADD PRIMARY KEY (`ID`);

--
-- Tablo için indeksler `havaalanitablosu`
--
ALTER TABLE `havaalanitablosu`
  ADD PRIMARY KEY (`ID`);

--
-- Tablo için indeksler `ucuslar`
--
ALTER TABLE `ucuslar`
  ADD PRIMARY KEY (`ID`);

--
-- Tablo için indeksler `yolcular`
--
ALTER TABLE `yolcular`
  ADD PRIMARY KEY (`ID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `ana_tablo`
--
ALTER TABLE `ana_tablo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `biletler`
--
ALTER TABLE `biletler`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `calisanlar`
--
ALTER TABLE `calisanlar`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `firmalar`
--
ALTER TABLE `firmalar`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `havaalaniarackiralama`
--
ALTER TABLE `havaalaniarackiralama`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `havaalaniotopark`
--
ALTER TABLE `havaalaniotopark`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `havaalanitablosu`
--
ALTER TABLE `havaalanitablosu`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Tablo için AUTO_INCREMENT değeri `ucuslar`
--
ALTER TABLE `ucuslar`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- Tablo için AUTO_INCREMENT değeri `yolcular`
--
ALTER TABLE `yolcular`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `ana_tablo`
--
ALTER TABLE `ana_tablo`
  ADD CONSTRAINT `ana_tablo_ibfk_1` FOREIGN KEY (`Firmalar`) REFERENCES `firmalar` (`ID`),
  ADD CONSTRAINT `ana_tablo_ibfk_2` FOREIGN KEY (`Biletler`) REFERENCES `biletler` (`ID`),
  ADD CONSTRAINT `ana_tablo_ibfk_3` FOREIGN KEY (`Havaalanitablosu`) REFERENCES `havaalanitablosu` (`ID`),
  ADD CONSTRAINT `ana_tablo_ibfk_4` FOREIGN KEY (`Ucuslar`) REFERENCES `ucuslar` (`ID`),
  ADD CONSTRAINT `ana_tablo_ibfk_5` FOREIGN KEY (`Calisanlar`) REFERENCES `calisanlar` (`ID`),
  ADD CONSTRAINT `ana_tablo_ibfk_6` FOREIGN KEY (`Havaalaniarackiralama`) REFERENCES `havaalaniarackiralama` (`ID`),
  ADD CONSTRAINT `ana_tablo_ibfk_7` FOREIGN KEY (`Yolcular`) REFERENCES `yolcular` (`ID`),
  ADD CONSTRAINT `ana_tablo_ibfk_8` FOREIGN KEY (`Havaalaniotopark`) REFERENCES `havaalaniotopark` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
