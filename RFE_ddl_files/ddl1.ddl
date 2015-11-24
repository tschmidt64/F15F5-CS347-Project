-- Generated by Oracle SQL Developer Data Modeler 4.1.1.888
--   at:        2015-11-21 22:17:18 CST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




CREATE TABLE F15F5_App
  (
    approver_id      INTEGER NOT NULL ,
    F15F5_RFE_rfe_id INTEGER NOT NULL ,
    F15F5_Emp_emp_id INTEGER NOT NULL
  ) ;
ALTER TABLE F15F5_App ADD CONSTRAINT F15F5_App_PK PRIMARY KEY ( approver_id ) ;


CREATE TABLE F15F5_Auth
  ( auth_id INTEGER NOT NULL , RIGHT VARCHAR2 (10)
  ) ;
ALTER TABLE F15F5_Auth ADD CONSTRAINT F15F5_Auth_PK PRIMARY KEY ( auth_id ) ;


CREATE TABLE F15F5_Comt
  (
    comment_entry_date DATE ,
    description        VARCHAR2 (4000) ,
    comt_id            INTEGER NOT NULL ,
    F15F5_Emp_emp_id   INTEGER NOT NULL ,
    F15F5_RFE_rfe_id   INTEGER NOT NULL
  ) ;
ALTER TABLE F15F5_Comt ADD CONSTRAINT F15F5_Comt_PK PRIMARY KEY ( comt_id ) ;


CREATE TABLE F15F5_Doc
  (
    doc_id           INTEGER NOT NULL ,
    F15F5_RFE_rfe_id INTEGER NOT NULL ,
    doc BLOB ,
    file_comment  VARCHAR2 (4000) ,
    tags          VARCHAR2 (4000) ,
    file_mimetype VARCHAR2 (512) ,
    file_charset  VARCHAR2 (512)
  ) ;
ALTER TABLE F15F5_Doc ADD CONSTRAINT F15F5_Doc_PK PRIMARY KEY ( doc_id ) ;


CREATE TABLE F15F5_Emp
  (
    emp_id             INTEGER NOT NULL ,
    emp_status         CHAR (1) ,
    emp_email          VARCHAR2 (255) ,
    emp_lab            VARCHAR2 (4) ,
    emp_name           VARCHAR2 (30) ,
    emp_office         VARCHAR2 (255) ,
    emp_phone          INTEGER ,
    status_eff_date    DATE ,
    F15F5_Lab_lab_id   INTEGER NOT NULL ,
    type               VARCHAR2 (30) ,
    F15F5_Auth_auth_id INTEGER NOT NULL
  ) ;
ALTER TABLE F15F5_Emp ADD CONSTRAINT F15F5_Emp_PK PRIMARY KEY ( emp_id ) ;


CREATE TABLE F15F5_Lab
  ( lab_id INTEGER NOT NULL , lab_name VARCHAR2 (30)
  ) ;
ALTER TABLE F15F5_Lab ADD CONSTRAINT F15F5_Lab_PK PRIMARY KEY ( lab_id ) ;


CREATE TABLE F15F5_RFE
  (
    rfe_id                 INTEGER NOT NULL ,
    explanation            VARCHAR2 (4000) ,
    alt_protections        VARCHAR2 (4000) ,
    approval_review_date   DATE ,
    F15F5_Status_status_id INTEGER NOT NULL ,
    F15F5_Emp_emp_id       INTEGER NOT NULL
  ) ;
ALTER TABLE F15F5_RFE ADD CONSTRAINT F15F5_RFE_PK PRIMARY KEY ( rfe_id ) ;


CREATE TABLE F15F5_RFE_Tasks
  (
    rfe_task_id         INTEGER NOT NULL ,
    effective_date      DATE ,
    F15F5_Tasks_task_id INTEGER NOT NULL ,
    F15F5_RFE_rfe_id    INTEGER NOT NULL
  ) ;
ALTER TABLE F15F5_RFE_Tasks ADD CONSTRAINT F15F5_RFE_Tasks_PK PRIMARY KEY ( rfe_task_id ) ;


CREATE TABLE F15F5_Requestors
  (
    requestor_id     INTEGER NOT NULL ,
    F15F5_Emp_emp_id INTEGER NOT NULL ,
    F15F5_RFE_rfe_id INTEGER NOT NULL
  ) ;
ALTER TABLE F15F5_Requestors ADD CONSTRAINT F15F5_Requestors_PK PRIMARY KEY ( requestor_id ) ;


CREATE TABLE F15F5_S_Hist
  (
    sh_id            INTEGER NOT NULL ,
    F15F5_RFE_rfe_id INTEGER NOT NULL ,
    status_code      VARCHAR2 (30) ,
    effective_date   DATE
  ) ;
ALTER TABLE F15F5_S_Hist ADD CONSTRAINT F15F5_S_Hist_PK PRIMARY KEY ( sh_id ) ;


CREATE TABLE F15F5_Status
  (
    status_id   INTEGER NOT NULL ,
    rfe_status  VARCHAR2 (30) ,
    description VARCHAR2 (500)
  ) ;
ALTER TABLE F15F5_Status ADD CONSTRAINT F15F5_Status_PK PRIMARY KEY ( status_id ) ;


CREATE TABLE F15F5_Tasks
  (
    task_abbreviation VARCHAR2 (15) ,
    task_description  VARCHAR2 (4000) ,
    task_id           INTEGER NOT NULL
  ) ;
ALTER TABLE F15F5_Tasks ADD CONSTRAINT F15F5_Tasks_PK PRIMARY KEY ( task_id ) ;


ALTER TABLE F15F5_App ADD CONSTRAINT F15F5_App_F15F5_Emp_FK FOREIGN KEY ( F15F5_Emp_emp_id ) REFERENCES F15F5_Emp ( emp_id ) ;

ALTER TABLE F15F5_App ADD CONSTRAINT F15F5_App_F15F5_RFE_FK FOREIGN KEY ( F15F5_RFE_rfe_id ) REFERENCES F15F5_RFE ( rfe_id ) ;

ALTER TABLE F15F5_Comt ADD CONSTRAINT F15F5_Comt_F15F5_Emp_FK FOREIGN KEY ( F15F5_Emp_emp_id ) REFERENCES F15F5_Emp ( emp_id ) ;

ALTER TABLE F15F5_Comt ADD CONSTRAINT F15F5_Comt_F15F5_RFE_FK FOREIGN KEY ( F15F5_RFE_rfe_id ) REFERENCES F15F5_RFE ( rfe_id ) ;

ALTER TABLE F15F5_Doc ADD CONSTRAINT F15F5_Doc_F15F5_RFE_FK FOREIGN KEY ( F15F5_RFE_rfe_id ) REFERENCES F15F5_RFE ( rfe_id ) ;

ALTER TABLE F15F5_Emp ADD CONSTRAINT F15F5_Emp_F15F5_Auth_FK FOREIGN KEY ( F15F5_Auth_auth_id ) REFERENCES F15F5_Auth ( auth_id ) ;

ALTER TABLE F15F5_Emp ADD CONSTRAINT F15F5_Emp_F15F5_Lab_FK FOREIGN KEY ( F15F5_Lab_lab_id ) REFERENCES F15F5_Lab ( lab_id ) ;

ALTER TABLE F15F5_RFE ADD CONSTRAINT F15F5_RFE_F15F5_Emp_FK FOREIGN KEY ( F15F5_Emp_emp_id ) REFERENCES F15F5_Emp ( emp_id ) ;

ALTER TABLE F15F5_RFE ADD CONSTRAINT F15F5_RFE_F15F5_Status_FK FOREIGN KEY ( F15F5_Status_status_id ) REFERENCES F15F5_Status ( status_id ) ;

ALTER TABLE F15F5_RFE_Tasks ADD CONSTRAINT F15F5_RFE_Tasks_F15F5_RFE_FK FOREIGN KEY ( F15F5_RFE_rfe_id ) REFERENCES F15F5_RFE ( rfe_id ) ;

ALTER TABLE F15F5_RFE_Tasks ADD CONSTRAINT F15F5_RFE_Tasks_F15F5_Tasks_FK FOREIGN KEY ( F15F5_Tasks_task_id ) REFERENCES F15F5_Tasks ( task_id ) ;

ALTER TABLE F15F5_Requestors ADD CONSTRAINT F15F5_Requestors_F15F5_Emp_FK FOREIGN KEY ( F15F5_Emp_emp_id ) REFERENCES F15F5_Emp ( emp_id ) ;

ALTER TABLE F15F5_Requestors ADD CONSTRAINT F15F5_Requestors_F15F5_RFE_FK FOREIGN KEY ( F15F5_RFE_rfe_id ) REFERENCES F15F5_RFE ( rfe_id ) ;

ALTER TABLE F15F5_S_Hist ADD CONSTRAINT F15F5_S_Hist_F15F5_RFE_FK FOREIGN KEY ( F15F5_RFE_rfe_id ) REFERENCES F15F5_RFE ( rfe_id ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             0
-- ALTER TABLE                             26
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0