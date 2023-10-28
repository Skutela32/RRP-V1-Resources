-- Default WX AntiCheat SQL import file
-- DO NOT EDIT ANY OF THESE VALUES

CREATE TABLE IF NOT EXISTS `wx_anticheat` (
  `banID` varchar(9) COLLATE utf8mb4_bin NOT NULL,
  `playerName` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `steamid` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `ip` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `license` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `discordid` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `HWID` varchar(130) COLLATE utf8mb4_bin DEFAULT NULL,
  `HWID2` varchar(130) COLLATE utf8mb4_bin NOT NULL,
  `HWID3` varchar(130) COLLATE utf8mb4_bin NOT NULL,
  `HWID4` varchar(130) COLLATE utf8mb4_bin NOT NULL,
  `HWID5` varchar(130) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`HWID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;