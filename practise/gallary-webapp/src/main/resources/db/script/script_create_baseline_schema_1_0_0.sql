DROP DATABASE IF EXISTS GALLERY;
CREATE DATABASE IF NOT EXISTS GALLERY;
USE GALLERY;

-- ROLELEVEL TABLE START --
DROP TABLE IF EXISTS ROLELEVEL;
CREATE TABLE IF NOT EXISTS ROLELEVEL (
    ID INT(10) NOT NULL AUTO_INCREMENT,
    ROLL VARCHAR(20) NOT NULL,
    PRIMARY KEY (ID)
);
-- ROLELEVEL TABLE END --

-- PERSON TABLE START --
DROP TABLE IF EXISTS PERSON;
CREATE TABLE IF NOT EXISTS PERSON (
    ID INT(10) NOT NULL AUTO_INCREMENT,
    FIRST_NAME VARCHAR(20) NOT NULL,
    LAST_NAME VARCHAR(20) NOT NULL,
    PASSWORD VARCHAR(20) NOT NULL,
    EMAIL_ID VARCHAR(40) NOT NULL,
    ROLE_LEVEL_ID INT(10) NOT NULL,
    PRIMARY KEY (ID),
    KEY PERSON_ROLE_LEVEL_FK (ROLE_LEVEL_ID),
    CONSTRAINT PERSON_ROLE_LEVEL_FK FOREIGN KEY  (ROLE_LEVEL_ID) REFERENCES ROLELEVEL(ID)
);
-- PERSON TABLE END --

-- ARTENTITY TABLE START --
DROP TABLE IF EXISTS ARTENTITY;
CREATE TABLE IF NOT EXISTS ARTENTITY (
    ID INT(10) NOT NULL AUTO_INCREMENT,
    TITLE VARCHAR(20) DEFAULT NULL,
    SUBTITLE VARCHAR(20) DEFAULT NULL,
	DESCRIPTION VARCHAR(20) DEFAULT NULL,
    CAPTION VARCHAR(10) DEFAULT NULL,
    IMAGE_PATH VARCHAR(10) DEFAULT NULL,
    UPLOADDED_DATE DATE DEFAULT NULL,
    DISPLAY_DATE DATE DEFAULT NULL,
    WIDTH INT(10) NOT NULL,
    HEIGHT INT(10) NOT NULL,
    PRIMARY KEY (ID)
);
-- ARTENTITY TABLE END --
