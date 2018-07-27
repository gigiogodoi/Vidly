-- "Set define off" turns off substitution variables.
Set define off; 

--
-- VIDLY  (User) 
--
CREATE USER VIDLY
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE SYSTEM
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  -- 1 Role for VIDLY 
  GRANT DBA TO VIDLY;
  ALTER USER VIDLY DEFAULT ROLE ALL;
  -- 1 System Privilege for VIDLY 
  GRANT UNLIMITED TABLESPACE TO VIDLY;


--
-- SEQ_CUSTOMERS_ID  (Sequence) 
--
CREATE SEQUENCE VIDLY.SEQ_CUSTOMERS_ID
  START WITH 1
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;


--
-- SEQ_GENDER  (Sequence) 
--
CREATE SEQUENCE VIDLY.SEQ_GENDER
  START WITH 1
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;


--
-- SEQ_MEMBERSHIPTYPES  (Sequence) 
--
CREATE SEQUENCE VIDLY.SEQ_MEMBERSHIPTYPES
  START WITH 1
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;


--
-- SEQ_MOVIES_ID  (Sequence) 
--
CREATE SEQUENCE VIDLY.SEQ_MOVIES_ID
  START WITH 1
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;


--
-- SEQ_RENTALS  (Sequence) 
--
CREATE SEQUENCE VIDLY.SEQ_RENTALS
  START WITH 1
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;


--
-- ACTIONS  (Table) 
--
CREATE TABLE VIDLY.ACTIONS
(
  ID    NUMBER                                  NOT NULL,
  NAME  VARCHAR2(50 BYTE)                       NOT NULL
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOCOMPRESS ;


--
-- FORMS  (Table) 
--
CREATE TABLE VIDLY.FORMS
(
  ID    NUMBER                                  NOT NULL,
  NAME  VARCHAR2(50 BYTE)                       NOT NULL
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOCOMPRESS ;


--
-- GENDERS  (Table) 
--
CREATE TABLE VIDLY.GENDERS
(
  ID    NUMBER                                  NOT NULL,
  NAME  VARCHAR2(100 BYTE)                      NOT NULL
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOCOMPRESS ;


--
-- MEMBERSHIPTYPES  (Table) 
--
CREATE TABLE VIDLY.MEMBERSHIPTYPES
(
  ID                NUMBER                      NOT NULL,
  SIGNUPFEE         NUMBER                      NOT NULL,
  DURATIONINMONTHS  NUMBER                      NOT NULL,
  DISCOUNTRATE      NUMBER                      NOT NULL,
  NAME              VARCHAR2(100 BYTE)          DEFAULT 'NONE'                NOT NULL
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOCOMPRESS ;


--
-- MOVIES  (Table) 
--
CREATE TABLE VIDLY.MOVIES
(
  ID           NUMBER                           NOT NULL,
  NAME         VARCHAR2(100 BYTE)               NOT NULL,
  GENDERID     NUMBER                           DEFAULT 0                     NOT NULL,
  RELEASEDATE  DATE                             NOT NULL,
  ADDED        DATE                             NOT NULL,
  STOCK        NUMBER                           DEFAULT 0                     NOT NULL
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOCOMPRESS ;


--
-- ROLES  (Table) 
--
CREATE TABLE VIDLY.ROLES
(
  ID    NUMBER                                  NOT NULL,
  NAME  VARCHAR2(50 BYTE)                       NOT NULL
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOCOMPRESS ;


--
-- ACTIONS_PK  (Index) 
--
CREATE UNIQUE INDEX VIDLY.ACTIONS_PK ON VIDLY.ACTIONS
(ID)
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           );

--
-- FORMS_PK  (Index) 
--
CREATE UNIQUE INDEX VIDLY.FORMS_PK ON VIDLY.FORMS
(ID)
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           );

--
-- MEMBERSHIPTYPES_PK  (Index) 
--
CREATE UNIQUE INDEX VIDLY.MEMBERSHIPTYPES_PK ON VIDLY.MEMBERSHIPTYPES
(ID)
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           );

--
-- MOVIES_PK  (Index) 
--
CREATE UNIQUE INDEX VIDLY.MOVIES_PK ON VIDLY.MOVIES
(ID)
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           );

--
-- ROLES_PK  (Index) 
--
CREATE UNIQUE INDEX VIDLY.ROLES_PK ON VIDLY.ROLES
(ID)
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           );

--
-- TRG_GENDER  (Trigger) 
--
CREATE OR REPLACE TRIGGER VIDLY.TRG_GENDER
BEFORE INSERT
ON VIDLY.GENDERS
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column ID
  :new.ID := SEQ_GENDER.nextval;
END TRG_GENDER;
/


--
-- TRG_MEMBERSHIPTYPES  (Trigger) 
--
CREATE OR REPLACE TRIGGER VIDLY.TRG_MEMBERSHIPTYPES
BEFORE INSERT
ON VIDLY.MEMBERSHIPTYPES
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column ID
  :new.ID := SEQ_MEMBERSHIPTYPES.nextval;
END TRG_MEMBERSHIPTYPES;
/


--
-- TRG_MOVIES_ID  (Trigger) 
--
CREATE OR REPLACE TRIGGER VIDLY.TRG_MOVIES_ID
BEFORE INSERT
ON VIDLY.MOVIES
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column ID
  :new.ID := SEQ_MOVIES_ID.nextval;
END TRG_MOVIES_ID;
/


--
-- CUSTOMERS  (Table) 
--
CREATE TABLE VIDLY.CUSTOMERS
(
  ID                NUMBER                      NOT NULL,
  NAME              VARCHAR2(100 BYTE)          NOT NULL,
  SUBSCRIBED        NUMBER                      DEFAULT 0                     NOT NULL,
  MEMBERSHIPTYPEID  NUMBER                      DEFAULT 0                     NOT NULL,
  BIRTHDATE         DATE,
  LOGIN             VARCHAR2(100 BYTE),
  PASSWORD          VARCHAR2(100 BYTE),
  ROLEID            NUMBER
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOCOMPRESS ;


--
-- PERMISSIONS  (Table) 
--
CREATE TABLE VIDLY.PERMISSIONS
(
  ROLEID    NUMBER                              NOT NULL,
  FORMID    NUMBER                              NOT NULL,
  ACTIONID  NUMBER                              NOT NULL
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOCOMPRESS ;


--
-- RENTALS  (Table) 
--
CREATE TABLE VIDLY.RENTALS
(
  ID          NUMBER                            NOT NULL,
  CUSTOMERID  NUMBER                            NOT NULL,
  DATERENT    DATE                              DEFAULT SYSDATE,
  DATERETURN  DATE
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOCOMPRESS ;


--
-- RENTALSMOVIES  (Table) 
--
CREATE TABLE VIDLY.RENTALSMOVIES
(
  RENTALID  NUMBER                              NOT NULL,
  MOVIEID   NUMBER                              NOT NULL
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOCOMPRESS ;


--
-- CUSTOMER_PK  (Index) 
--
CREATE UNIQUE INDEX VIDLY.CUSTOMER_PK ON VIDLY.CUSTOMERS
(ID)
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           );

--
-- PERMISSIONS_PK  (Index) 
--
CREATE UNIQUE INDEX VIDLY.PERMISSIONS_PK ON VIDLY.PERMISSIONS
(ROLEID, FORMID, ACTIONID)
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           );

--
-- RENTALSMOVIES_PK  (Index) 
--
CREATE UNIQUE INDEX VIDLY.RENTALSMOVIES_PK ON VIDLY.RENTALSMOVIES
(RENTALID, MOVIEID)
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           );

--
-- RENTALS_PK  (Index) 
--
CREATE UNIQUE INDEX VIDLY.RENTALS_PK ON VIDLY.RENTALS
(ID)
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           );

--
-- VIEWPERMISSIONS  (View) 
--
CREATE OR REPLACE FORCE VIEW VIDLY.VIEWPERMISSIONS
(ROLE, FORM, ACTION)
AS 
SELECT B.NAME AS "ROLE"
         , C.NAME AS "FORM"
         , D.NAME AS "ACTION"
      FROM VIDLY.PERMISSIONS A 
INNER JOIN VIDLY.ROLES       B ON A.ROLEID = B.ID
INNER JOIN VIDLY.FORMS       C ON A.FORMID = C.ID
INNER JOIN VIDLY.ACTIONS     D ON A.ACTIONID = D.ID
WHERE 0=0;


--
-- TRG_CUSTOMERS_ID  (Trigger) 
--
CREATE OR REPLACE TRIGGER VIDLY.TRG_CUSTOMERS_ID
BEFORE INSERT
ON VIDLY.CUSTOMERS
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column ID
  :new.ID := SEQ_CUSTOMERS_ID.nextval;
END TRG_CUSTOMERS_ID;
/


--
-- TRG_RENTALS  (Trigger) 
--
CREATE OR REPLACE TRIGGER VIDLY.TRG_RENTALS
BEFORE INSERT
ON VIDLY.RENTALS
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column ID
  :new.ID := SEQ_RENTALS.nextval;
END TRG_RENTALS;
/


-- 
-- Non Foreign Key Constraints for Table ACTIONS 
-- 
ALTER TABLE VIDLY.ACTIONS ADD (
  CONSTRAINT ACTIONS_PK
  PRIMARY KEY
  (ID)
  USING INDEX VIDLY.ACTIONS_PK
  ENABLE VALIDATE);


-- 
-- Non Foreign Key Constraints for Table FORMS 
-- 
ALTER TABLE VIDLY.FORMS ADD (
  CONSTRAINT FORMS_PK
  PRIMARY KEY
  (ID)
  USING INDEX VIDLY.FORMS_PK
  ENABLE VALIDATE);


-- 
-- Non Foreign Key Constraints for Table GENDERS 
-- 
ALTER TABLE VIDLY.GENDERS ADD (
  PRIMARY KEY
  (ID)
  USING INDEX
    TABLESPACE SYSTEM
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MAXSIZE          UNLIMITED
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
                FREELISTS        1
                FREELIST GROUPS  1
                BUFFER_POOL      DEFAULT
               )
  ENABLE VALIDATE);


-- 
-- Non Foreign Key Constraints for Table MEMBERSHIPTYPES 
-- 
ALTER TABLE VIDLY.MEMBERSHIPTYPES ADD (
  CONSTRAINT MEMBERSHIPTYPES_PK
  PRIMARY KEY
  (ID)
  USING INDEX VIDLY.MEMBERSHIPTYPES_PK
  ENABLE VALIDATE);


-- 
-- Non Foreign Key Constraints for Table MOVIES 
-- 
ALTER TABLE VIDLY.MOVIES ADD (
  CONSTRAINT MOVIES_PK
  PRIMARY KEY
  (ID)
  USING INDEX VIDLY.MOVIES_PK
  ENABLE VALIDATE);


-- 
-- Non Foreign Key Constraints for Table ROLES 
-- 
ALTER TABLE VIDLY.ROLES ADD (
  CONSTRAINT ROLES_PK
  PRIMARY KEY
  (ID)
  USING INDEX VIDLY.ROLES_PK
  ENABLE VALIDATE);


-- 
-- Non Foreign Key Constraints for Table CUSTOMERS 
-- 
ALTER TABLE VIDLY.CUSTOMERS ADD (
  CONSTRAINT CUSTOMER_PK
  PRIMARY KEY
  (ID)
  USING INDEX VIDLY.CUSTOMER_PK
  ENABLE VALIDATE);


-- 
-- Non Foreign Key Constraints for Table PERMISSIONS 
-- 
ALTER TABLE VIDLY.PERMISSIONS ADD (
  CONSTRAINT PERMISSIONS_PK
  PRIMARY KEY
  (ROLEID, FORMID, ACTIONID)
  USING INDEX VIDLY.PERMISSIONS_PK
  ENABLE VALIDATE);


-- 
-- Non Foreign Key Constraints for Table RENTALS 
-- 
ALTER TABLE VIDLY.RENTALS ADD (
  CONSTRAINT RENTALS_PK
  PRIMARY KEY
  (ID)
  USING INDEX VIDLY.RENTALS_PK
  ENABLE VALIDATE);


-- 
-- Non Foreign Key Constraints for Table RENTALSMOVIES 
-- 
ALTER TABLE VIDLY.RENTALSMOVIES ADD (
  CONSTRAINT RENTALSMOVIES_PK
  PRIMARY KEY
  (RENTALID, MOVIEID)
  USING INDEX VIDLY.RENTALSMOVIES_PK
  ENABLE VALIDATE);


-- 
-- Foreign Key Constraints for Table MOVIES 
-- 
ALTER TABLE VIDLY.MOVIES ADD (
  CONSTRAINT FK_MOVIES_GENDER_ID 
  FOREIGN KEY (GENDERID) 
  REFERENCES VIDLY.GENDERS (ID)
  ENABLE VALIDATE);


-- 
-- Foreign Key Constraints for Table CUSTOMERS 
-- 
ALTER TABLE VIDLY.CUSTOMERS ADD (
  CONSTRAINT FK_CUSTOMERS_MEMBERSHIP_ID 
  FOREIGN KEY (MEMBERSHIPTYPEID) 
  REFERENCES VIDLY.MEMBERSHIPTYPES (ID)
  ENABLE VALIDATE);


-- 
-- Foreign Key Constraints for Table PERMISSIONS 
-- 
ALTER TABLE VIDLY.PERMISSIONS ADD (
  CONSTRAINT FK_PERMISSIONS_ACTIONID 
  FOREIGN KEY (ACTIONID) 
  REFERENCES VIDLY.ACTIONS (ID)
  ENABLE VALIDATE);

ALTER TABLE VIDLY.PERMISSIONS ADD (
  CONSTRAINT FK_PERMISSIONS_FORMID 
  FOREIGN KEY (FORMID) 
  REFERENCES VIDLY.FORMS (ID)
  ENABLE VALIDATE);

ALTER TABLE VIDLY.PERMISSIONS ADD (
  CONSTRAINT FK_PERMISSIONS_ROLEID 
  FOREIGN KEY (ROLEID) 
  REFERENCES VIDLY.ROLES (ID)
  ENABLE VALIDATE);


-- 
-- Foreign Key Constraints for Table RENTALS 
-- 
ALTER TABLE VIDLY.RENTALS ADD (
  CONSTRAINT FK_RENTALS_CUSTOMERSID 
  FOREIGN KEY (CUSTOMERID) 
  REFERENCES VIDLY.CUSTOMERS (ID)
  ENABLE VALIDATE);


-- 
-- Foreign Key Constraints for Table RENTALSMOVIES 
-- 
ALTER TABLE VIDLY.RENTALSMOVIES ADD (
  CONSTRAINT FK_MOVIESID 
  FOREIGN KEY (MOVIEID) 
  REFERENCES VIDLY.MOVIES (ID)
  ENABLE VALIDATE);

ALTER TABLE VIDLY.RENTALSMOVIES ADD (
  CONSTRAINT FK_RENTALSID 
  FOREIGN KEY (RENTALID) 
  REFERENCES VIDLY.RENTALS (ID)
  ENABLE VALIDATE);
  