-- RUN THIS SQL IF YOU'RE COMING FROM OLDER VERSION OF WX ANTICHEAT (2.0 and older)
-- IF NOT, RUN ONLY THE INSERT-THIS.sql!
-- This is only so you don't have to delete your existing database with banned players!

ALTER TABLE wx_anticheat CHANGE `name` `playerName` VARCHAR(130);
ALTER TABLE wx_anticheat CHANGE token `HWID` VARCHAR(130);
ALTER TABLE wx_anticheat CHANGE token2 `HWID2` VARCHAR(130);
ALTER TABLE wx_anticheat CHANGE token3 `HWID3` VARCHAR(130);
ALTER TABLE wx_anticheat CHANGE token4 `HWID4` VARCHAR(130);
ALTER TABLE wx_anticheat CHANGE token5 `HWID5` VARCHAR(130);
ALTER TABLE wx_anticheat CHANGE steam `steamid` VARCHAR(60);
ALTER TABLE wx_anticheat CHANGE discord `discordid` VARCHAR(60);