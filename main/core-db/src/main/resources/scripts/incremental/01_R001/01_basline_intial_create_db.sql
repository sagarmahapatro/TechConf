
CREATE TABLE IF NOT EXISTS ADDRESS (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  STREETADDRESS VARCHAR(64), 
  APTNUMBER VARCHAR(32), 
  CITY VARCHAR(32), 
  STATE CHAR(2), 
  ZIPCODE VARCHAR(10)
);

--
-- Table Name:
-- Description: 
--
CREATE TABLE IF NOT EXISTS VENUE (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  NAME VARCHAR(32), 
  PHONE VARCHAR(12), 
  FAX VARCHAR(12),
  FK_ADDRESS_ID INTEGER NOT NULL,
  CONSTRAINT VENUE_ADDRESS_FK FOREIGN KEY(FK_ADDRESS_ID) REFERENCES ADDRESS(PK_ID),   
  CONSTRAINT UNIQUE_VENUE_NAME UNIQUE(NAME)
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS CONFERENCE (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  NAME VARCHAR(64) NOT NULL, 
  DESCRIPTION LONGTEXT NOT NULL,
  STARTDATE DATETIME NOT NULL,
  ENDDATE DATETIME NOT NULL,
  ABSTRACTSUBMISSIONSTARTDATE DATETIME NOT NULL,
  ABSTRACTSUBMISSIONENDDATE DATETIME NOT NULL,  
  FK_VENUE_ID INTEGER,
  CONSTRAINT CONFERENCE_VENUE_FK FOREIGN KEY(FK_VENUE_ID) REFERENCES VENUE(PK_ID),
  CONSTRAINT UNIQUE_CONFERENCE_NAME UNIQUE(NAME)   
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS TRACK (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,    
  TITLE VARCHAR(32) NOT NULL, 
  SUBTITLE VARCHAR(32), 
  DESCRIPTION LONGTEXT,
  FK_CONFERENCE_ID INTEGER NOT NULL,
  CONSTRAINT TRACK_CONFERENCE_FK FOREIGN KEY(FK_CONFERENCE_ID) REFERENCES CONFERENCE(PK_ID), 
  CONSTRAINT UNIQUE_TRACK_TITLE UNIQUE(TITLE)
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS ROOM (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,   
  NAME VARCHAR(32), 
  NOTES VARCHAR(64), 
  CAPACITY INTEGER,
  FK_VENUE_ID INTEGER,
  CONSTRAINT ROOM_VENUE_FK FOREIGN KEY(FK_VENUE_ID) REFERENCES VENUE(PK_ID),
  CONSTRAINT UNIQUE_ROOM_NAME UNIQUE(NAME)
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS BOOTH (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,   
  NOTES VARCHAR(64), 
  SIZE VARCHAR(32),
  FK_VENUE_ID INTEGER,
  CONSTRAINT BOOTH_VENUE_FK FOREIGN KEY(FK_VENUE_ID) REFERENCES VENUE(PK_ID)  
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS BLOGLINK (
    PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    BLOGURL VARCHAR(64), 
    FEEDURL VARCHAR(64)
);

CREATE TABLE IF NOT EXISTS ATTENDEEGROUP (
    PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	COMPANY VARCHAR(64), 	
	COMPANYURL VARCHAR(64), 
	FAX VARCHAR(12), 
	PHONE VARCHAR(12), 
	CONTACT VARCHAR(64), 
	EMAIL VARCHAR(64), 
	PRINCINGPERATTENDEE DOUBLE,	
    STREETADDRESS VARCHAR(64), 
    APTNUMBER VARCHAR(32), 
    CITY VARCHAR(32), 
    STATE CHAR(2), 
    ZIPCODE VARCHAR(10)	
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS USER (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  USERTYPE VARCHAR(3) NOT NULL, 
  PASSWORD VARCHAR(16) NOT NULL, 
  FIRSTNAME VARCHAR(32) NOT NULL, 
  LASTNAME VARCHAR(32) NOT NULL, 
  EMAIL VARCHAR(64) NOT NULL, 
  HOMEPHONE VARCHAR(12), 
  WORKPHONE VARCHAR(12), 
  FAX VARCHAR(12), 
  FK_ADDRESS_ID INTEGER NOT NULL,
  -- ATTENDEE
  FK_ATTENDEEGROUP_ID INTEGER,
  ALUMNUS BOOLEAN,  
  -- PRESENTER
  BIO VARCHAR(255),
  COMPANY VARCHAR(64),
  COMPANYURL VARCHAR(64),
  FK_BLOGLINK_ID VARCHAR(64),
  CONSTRAINT USER_ADDRESS_FK FOREIGN KEY(FK_ADDRESS_ID) REFERENCES ADDRESS(PK_ID),
  CONSTRAINT UNIQUE_USER_EMAIL UNIQUE(EMAIL)  
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS ATTENDEECONFERENCE (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,   
  FK_ATTENDEE_ID INTEGER NOT NULL, 
  FK_CONFERENCE_ID INTEGER NOT NULL,
  CONSTRAINT ATTENDEECONFERENCE_USER_FK FOREIGN KEY(FK_ATTENDEE_ID) REFERENCES USER(PK_ID),
  CONSTRAINT ATTENDEECONFERENCE_CONFERENCE_FK FOREIGN KEY(FK_CONFERENCE_ID) REFERENCES CONFERENCE(PK_ID),
  CONSTRAINT UNIQUE_ATTENDEECONFERENCE UNIQUE(FK_ATTENDEE_ID, FK_CONFERENCE_ID)
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS PRESENTATIONTYPE (  
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  NAME VARCHAR(16) NOT NULL,
  DESCRIPTION VARCHAR(64),
  CONSTRAINT UNIQUE_PRESENTATIONTYPE_NAME UNIQUE(NAME)
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS PRESENTATIONLEVEL (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  NAME VARCHAR(16) NOT NULL, 	
  DESCRIPTION VARCHAR(64),
  CONSTRAINT UNIQUE_PRESENTATIONLEVEL_NAME UNIQUE(NAME)  
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS PRESENTATIONTOPIC (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  NAME VARCHAR(16) NOT NULL, 	
  DESCRIPTION VARCHAR(64),
  CONSTRAINT UNIQUE_PRESENTATIONTOPIC_NAME UNIQUE(NAME)
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS ABSTRACTSTATUS (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  NAME VARCHAR(16) NOT NULL,
  CONSTRAINT UNIQUE_ABSTRACTSTATUS_NAME UNIQUE(NAME)
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS ABSTRACT (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  TITLE VARCHAR(64) NOT NULL,  
  BODY LONGTEXT NOT NULL,
  FK_PRESENTER_ID INTEGER NOT NULL,
  FK_PRESENTATIONTYPE_ID INTEGER NOT NULL, 
  FK_PRESENTATIONTOPIC_ID INTEGER NOT NULL, 
  FK_PRESENTATIONLEVEL_ID INTEGER NOT NULL,    
  FK_ABSTRACTSTATUS_ID INTEGER NOT NULL, 
  FK_TRACK_ID INTEGER NOT NULL,   
  CONSTRAINT ABSTRACT_PRESENTER_FK FOREIGN KEY(FK_PRESENTER_ID) REFERENCES USER(PK_ID),
  CONSTRAINT ABSTRACT_PRESENTATIONTYPE_FK FOREIGN KEY(FK_PRESENTATIONTYPE_ID) REFERENCES PRESENTATIONTYPE(PK_ID),
  CONSTRAINT ABSTRACT_PRESENTATIONTOPIC_FK FOREIGN KEY(FK_PRESENTATIONTOPIC_ID) REFERENCES PRESENTATIONTOPIC(PK_ID),
  CONSTRAINT ABSTRACT_PRESENTATIONLEVEL_FK FOREIGN KEY(FK_PRESENTATIONLEVEL_ID) REFERENCES PRESENTATIONLEVEL(PK_ID),
  CONSTRAINT ABSTRACT_ABSTRACTSTATUS_FK FOREIGN KEY(FK_ABSTRACTSTATUS_ID) REFERENCES ABSTRACTSTATUS(PK_ID),
  CONSTRAINT ABSTRACT_TRACK_FK FOREIGN KEY(FK_TRACK_ID) REFERENCES TRACK(PK_ID)
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS PRESENTATION (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  FK_ABSTRACT_ID INTEGER NOT NULL, 
  CONSTRAINT PRESENTATION_ABSTRACT_FK FOREIGN KEY(FK_ABSTRACT_ID) REFERENCES ABSTRACT(PK_ID)
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS SESSION (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  DATETIMEBEGIN DATETIME, 
  DATETIMEEND DATETIME,
  FK_PRESENTATION_ID INTEGER NOT NULL, 
  FK_CONFERENCE_ID INTEGER NOT NULL,
  FK_ROOM_ID INTEGER,   
  CONSTRAINT SESSION_CONFERENCE_FK FOREIGN KEY(FK_CONFERENCE_ID) REFERENCES CONFERENCE(PK_ID), 
  CONSTRAINT SESSION_PRESENTATION_FK FOREIGN KEY(FK_PRESENTATION_ID) REFERENCES PRESENTATION(PK_ID),
  CONSTRAINT SESSION_ROOM_FK FOREIGN KEY(FK_ROOM_ID) REFERENCES ROOM(PK_ID)
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS SCHEDULEENTRY (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  NAME VARCHAR(64) NOT NULL, 
  DESCRIPTION VARCHAR(32), 
  FK_SESSION_ID INTEGER, 
  FK_USER_ID INTEGER NOT NULL, 
  CONSTRAINT SCHEDULEENTRY_SESSION_FK FOREIGN KEY(FK_SESSION_ID) REFERENCES SESSION(PK_ID),
  CONSTRAINT SCHEDULEENTRY_USER_FK FOREIGN KEY(FK_USER_ID) REFERENCES USER(PK_ID)    
);
  
--
-- Table Name: 
-- Description: 
--  
CREATE TABLE IF NOT EXISTS ROLE (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,     
  NAME VARCHAR(16) NOT NULL,
  DESCRIPTION VARCHAR(64),
  CONSTRAINT UNIQUE_ROLE_NAME UNIQUE(NAME)
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS USERROLE (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,   
  FK_USER_ID INTEGER NOT NULL, 
  FK_ROLE_ID INTEGER NOT NULL,
  CONSTRAINT USERROLE_USER_FK FOREIGN KEY(FK_USER_ID) REFERENCES USER(PK_ID),
  CONSTRAINT USERROLE_ROLE_FK FOREIGN KEY(FK_ROLE_ID) REFERENCES ROLE(PK_ID)
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS REMINDER (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  MESSAGE VARCHAR(64), 
  DATEANDTIME DATETIME NOT NULL,
  FK_SCHEDULEENTRY_ID INTEGER NOT NULL, 
  FK_USER_ID INTEGER NOT NULL,  
  SENT BOOLEAN, 
  CONSTRAINT REMINDER_SCHEDULEENTRY_FK FOREIGN KEY(FK_SCHEDULEENTRY_ID) REFERENCES SCHEDULEENTRY(PK_ID),    
  CONSTRAINT REMINDER_USER_FK FOREIGN KEY(FK_USER_ID) REFERENCES USER(PK_ID)
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS PRICINGRULE (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  NAME VARCHAR(16) NOT NULL,
  PRIORITY INTEGER,
  ACTIVE BOOLEAN,
  FK_CONFERENCE_ID INTEGER NOT NULL,
  CONSTRAINT PRICINGRULE_CONFERENCE_FK FOREIGN KEY(FK_CONFERENCE_ID) REFERENCES CONFERENCE(PK_ID), 
  CONSTRAINT UNIQUE_PRICINGRULE_NAME UNIQUE(NAME)
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS GROUPPRICINGRULE (
  PK_ID INTEGER NOT NULL PRIMARY KEY,
  MINIMUMATTENDEES INTEGER,
  MAXIMUMATTENDEES INTEGER,
  DISCOUNTRATE DOUBLE,
  CONSTRAINT GROUPPRICINGRULE_PRINCINGRULE_FK FOREIGN KEY(PK_ID) REFERENCES PRICINGRULE(PK_ID)
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS REGISTRATIONDATEPRICINGRULE (
  PK_ID INTEGER NOT NULL PRIMARY KEY, 
  STARTDATE DATETIME NOT NULL,
  ENDDATE DATETIME NOT NULL,
  PRICE DOUBLE NOT NULL,
  CONSTRAINT REGISTRATIONDATEPRICINGRULE_PRINCINGRULE_FK FOREIGN KEY(PK_ID) REFERENCES PRICINGRULE(PK_ID) 
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS QUESTIONTYPE (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  NAME VARCHAR(16) NOT NULL,
  CONSTRAINT UNIQUE_QUESTIONTYPE_NAME UNIQUE(NAME)  
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS QUESTION (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  TEXT LONGTEXT NOT NULL,
  FK_QUESTIONTYPE_ID INTEGER NOT NULL,
  CONSTRAINT QUESTION_QUESTIONTYPE_FK FOREIGN KEY(FK_QUESTIONTYPE_ID) REFERENCES QUESTIONTYPE(PK_ID)  
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS QUESTIONCHOICE(
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  TEXT VARCHAR(64)
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS QUESTIONQUESTIONCHOICE(
   PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   FK_QUESTION_ID INTEGER NOT NULL,
   FK_QUESTIONCHOICE_ID INTEGER NOT NULL,
   CONSTRAINT QUESTIONQUESTIONCHOICE_QUESTION_FK FOREIGN KEY(FK_QUESTION_ID) REFERENCES QUESTION(PK_ID),   
   CONSTRAINT QUESTIONQUESTIONCHOICE_QUESTIONCHOICE_FK FOREIGN KEY(FK_QUESTIONCHOICE_ID) REFERENCES QUESTIONCHOICE(PK_ID),
   CONSTRAINT UNIQUE_QUESTIONQUESTIONCHOICE UNIQUE(FK_QUESTION_ID, FK_QUESTIONCHOICE_ID)
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS QUESTIONNAIRE (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  NAME VARCHAR(64) NOT NULL,
  CONSTRAINT UNIQUE_QUESTIONTYPE_NAME UNIQUE(NAME)
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS QUESTIONNAIREQUESTION(
   PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   FK_QUESTIONNAIRE_ID INTEGER NOT NULL,
   FK_QUESTION_ID INTEGER NOT NULL,
   CONSTRAINT QUESTIONNAIREQUESTION_QUESTIONNAIRE_FK FOREIGN KEY(FK_QUESTIONNAIRE_ID) REFERENCES QUESTIONNAIRE(PK_ID),   
   CONSTRAINT QUESTIONNAIREQUESTIONC_QUESTION_FK FOREIGN KEY(FK_QUESTION_ID) REFERENCES QUESTION(PK_ID),
   CONSTRAINT UNIQUE_QUESTIONNAIREQUESTION UNIQUE(FK_QUESTIONNAIRE_ID, FK_QUESTION_ID)
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS ANSWER (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  FK_USER_ID INTEGER NOT NULL,
  FK_QUESTIONNAIRE_ID INTEGER NOT NULL,
  FK_QUESTION_ID INTEGER NOT NULL,
  ANSWER LONGTEXT,
  CONSTRAINT ANSWER_USER_FK FOREIGN KEY(FK_USER_ID) REFERENCES USER(PK_ID),    
  CONSTRAINT ANSWER_QUESTIONNAIRE_FK FOREIGN KEY(FK_QUESTIONNAIRE_ID) REFERENCES QUESTIONNAIRE(PK_ID),
  CONSTRAINT ANSWER_QUESTION_FK FOREIGN KEY(FK_QUESTION_ID) REFERENCES QUESTION(PK_ID) 
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE  IF NOT EXISTS ANSWERQUESTIONCHOICE(
   PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   FK_ANSWER_ID INTEGER NOT NULL,
   FK_QUESTIONCHOICE_ID INTEGER NOT NULL,
   CONSTRAINT ANSWERQUESTIONCHOICE_ANSWER_FK FOREIGN KEY(FK_ANSWER_ID) REFERENCES ANSWER(PK_ID),   
   CONSTRAINT ANSWERQUESTIONCHOICE_QUESTIONCHOICE_FK FOREIGN KEY(FK_QUESTIONCHOICE_ID) REFERENCES QUESTIONCHOICE(PK_ID),
   CONSTRAINT UNIQUE_ANSWERQUESTIONCHOICE UNIQUE(FK_ANSWER_ID, FK_QUESTIONCHOICE_ID)
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE  IF NOT EXISTS NEWS (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  DATE DATETIME NOT NULL,
  REMOVEON DATETIME NOT NULL,
  CREATEDON DATETIME NOT NULL,
  PUBLISHED BOOLEAN NOT NULL,
  TITLE VARCHAR(32),
  BODY LONGTEXT,
  GLOBAL BOOLEAN,
  FK_USER_ID INTEGER NOT NULL,
  FK_CONFERENCE_ID INTEGER,
  CONSTRAINT NEWS_CONFERENCE_FK FOREIGN KEY(FK_CONFERENCE_ID) REFERENCES CONFERENCE(PK_ID),  
  CONSTRAINT NEWS_USER_FK FOREIGN KEY(FK_USER_ID) REFERENCES USER(PK_ID)	
);

--
-- Table Name: 
-- Description: 
--
CREATE TABLE IF NOT EXISTS BOOK (
  PK_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  TITLE VARCHAR(64) NOT NULL, 
  AUTHORS VARCHAR(128),
  DESCRIPTION VARCHAR(255) NOT NULL, 
  PURCHASEURL VARCHAR(64),
  INBOOKSTORE BOOLEAN NOT NULL,
  FK_USER_ID INTEGER NOT NULL, 
  CONSTRAINT BOOK_USER_FK FOREIGN KEY(FK_USER_ID) REFERENCES USER(PK_ID)    
);