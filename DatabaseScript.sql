--------------------------------------------------------
--  File created - Saturday-June-12-2021   
--------------------------------------------------------
  DROP TABLE "HR"."ACTORS" cascade constraints;
  DROP TABLE "HR"."ASSIGN_TRAINER_SPORT" cascade constraints;
  DROP TABLE "HR"."COUNTRIES" cascade constraints;
  DROP TABLE "HR"."DEPARTMENTS" cascade constraints;
  DROP TABLE "HR"."EMPLOYEE" cascade constraints;
  DROP TABLE "HR"."EMPLOYEES" cascade constraints;
  DROP TABLE "HR"."EMPLOYEE_MEMBER" cascade constraints;
  DROP TABLE "HR"."EMPLOYEE_SPORT" cascade constraints;
  DROP TABLE "HR"."EVENT" cascade constraints;
  DROP TABLE "HR"."FILMACTORS" cascade constraints;
  DROP TABLE "HR"."FILMCATEGORY" cascade constraints;
  DROP TABLE "HR"."FILMCOPIES" cascade constraints;
  DROP TABLE "HR"."FILMTITLES" cascade constraints;
  DROP TABLE "HR"."JOBS" cascade constraints;
  DROP TABLE "HR"."JOB_HISTORY" cascade constraints;
  DROP TABLE "HR"."LOCATIONS" cascade constraints;
  DROP TABLE "HR"."MEMBER" cascade constraints;
  DROP TABLE "HR"."MEMBERS" cascade constraints;
  DROP TABLE "HR"."MEMBER_EVENT" cascade constraints;
  DROP TABLE "HR"."MEMBER_SPORT" cascade constraints;
  DROP TABLE "HR"."MEMBER_TRIP" cascade constraints;
  DROP TABLE "HR"."REGIONS" cascade constraints;
  DROP TABLE "HR"."RENTALS" cascade constraints;
  DROP TABLE "HR"."SPORT" cascade constraints;
  DROP TABLE "HR"."SPORT_TIME" cascade constraints;
  DROP TABLE "HR"."TABLE1" cascade constraints;
  DROP TABLE "HR"."TRAINER" cascade constraints;
  DROP TABLE "HR"."TRAINER_SPORT" cascade constraints;
  DROP TABLE "HR"."TRIPS" cascade constraints;
  DROP SEQUENCE "HR"."ACTID";
  DROP SEQUENCE "HR"."DEPARTMENTS_SEQ";
  DROP SEQUENCE "HR"."EMPLOYEES_SEQ";
  DROP SEQUENCE "HR"."LOCATIONS_SEQ";
  DROP VIEW "HR"."EMP_DETAILS_VIEW";
  DROP PROCEDURE "HR"."ADD_JOB_HISTORY";
  DROP PROCEDURE "HR"."ALLSPORTS";
  DROP PROCEDURE "HR"."CHECKID";
  DROP PROCEDURE "HR"."CHECKID_EMPLOYEE";
  DROP PROCEDURE "HR"."SECURE_DML";
--------------------------------------------------------
--  DDL for Sequence ACTID
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."ACTID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence DEPARTMENTS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."DEPARTMENTS_SEQ"  MINVALUE 1 MAXVALUE 9990 INCREMENT BY 10 START WITH 280 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence EMPLOYEES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."EMPLOYEES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 207 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LOCATIONS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."LOCATIONS_SEQ"  MINVALUE 1 MAXVALUE 9900 INCREMENT BY 100 START WITH 3300 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ACTORS
--------------------------------------------------------

  CREATE TABLE "HR"."ACTORS" 
   (	"ACTORID" NUMBER(10,0), 
	"ACTORNAME" VARCHAR2(20 BYTE), 
	"GENDER" VARCHAR2(1 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ASSIGN_TRAINER_SPORT
--------------------------------------------------------

  CREATE TABLE "HR"."ASSIGN_TRAINER_SPORT" 
   (	"TRAINER_SSN" VARCHAR2(20 BYTE), 
	"SPORT_ID" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table COUNTRIES
--------------------------------------------------------

  CREATE TABLE "HR"."COUNTRIES" 
   (	"COUNTRY_ID" CHAR(2 BYTE), 
	"COUNTRY_NAME" VARCHAR2(40 BYTE), 
	"REGION_ID" NUMBER, 
	 CONSTRAINT "COUNTRY_C_ID_PK" PRIMARY KEY ("COUNTRY_ID") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" 
 PCTTHRESHOLD 50;
 

   COMMENT ON COLUMN "HR"."COUNTRIES"."COUNTRY_ID" IS 'Primary key of countries table.';
 
   COMMENT ON COLUMN "HR"."COUNTRIES"."COUNTRY_NAME" IS 'Country name';
 
   COMMENT ON COLUMN "HR"."COUNTRIES"."REGION_ID" IS 'Region ID for the country. Foreign key to region_id column in the departments table.';
 
   COMMENT ON TABLE "HR"."COUNTRIES"  IS 'country table. Contains 25 rows. References with locations table.';
  GRANT SELECT, REFERENCES ON "HR"."COUNTRIES" TO "OE";
 

--------------------------------------------------------
--  DDL for Table DEPARTMENTS
--------------------------------------------------------

  CREATE TABLE "HR"."DEPARTMENTS" 
   (	"DEPARTMENT_ID" NUMBER(4,0), 
	"DEPARTMENT_NAME" VARCHAR2(30 BYTE), 
	"MANAGER_ID" NUMBER(6,0), 
	"LOCATION_ID" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
 

   COMMENT ON COLUMN "HR"."DEPARTMENTS"."DEPARTMENT_ID" IS 'Primary key column of departments table.';
 
   COMMENT ON COLUMN "HR"."DEPARTMENTS"."DEPARTMENT_NAME" IS 'A not null column that shows name of a department. Administration,
Marketing, Purchasing, Human Resources, Shipping, IT, Executive, Public
Relations, Sales, Finance, and Accounting. ';
 
   COMMENT ON COLUMN "HR"."DEPARTMENTS"."MANAGER_ID" IS 'Manager_id of a department. Foreign key to employee_id column of employees table. The manager_id column of the employee table references this column.';
 
   COMMENT ON COLUMN "HR"."DEPARTMENTS"."LOCATION_ID" IS 'Location id where a department is located. Foreign key to location_id column of locations table.';
 
   COMMENT ON TABLE "HR"."DEPARTMENTS"  IS 'Departments table that shows details of departments where employees
work. Contains 27 rows; references with locations, employees, and job_history tables.';
  GRANT SELECT ON "HR"."DEPARTMENTS" TO "OE";
 

--------------------------------------------------------
--  DDL for Table EMPLOYEE
--------------------------------------------------------

  CREATE TABLE "HR"."EMPLOYEE" 
   (	"SSN" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"SALARY" VARCHAR2(5 BYTE), 
	"GENDER" VARCHAR2(1 BYTE), 
	"BIRTHDATE" DATE, 
	"PASSWORD" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table EMPLOYEES
--------------------------------------------------------

  CREATE TABLE "HR"."EMPLOYEES" 
   (	"EMPLOYEE_ID" NUMBER(6,0), 
	"FIRST_NAME" VARCHAR2(20 BYTE), 
	"LAST_NAME" VARCHAR2(25 BYTE), 
	"EMAIL" VARCHAR2(25 BYTE), 
	"PHONE_NUMBER" VARCHAR2(20 BYTE), 
	"HIRE_DATE" DATE, 
	"JOB_ID" VARCHAR2(10 BYTE), 
	"SALARY" NUMBER(8,2), 
	"COMMISSION_PCT" NUMBER(2,2), 
	"MANAGER_ID" NUMBER(6,0), 
	"DEPARTMENT_ID" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
 

   COMMENT ON COLUMN "HR"."EMPLOYEES"."EMPLOYEE_ID" IS 'Primary key of employees table.';
 
   COMMENT ON COLUMN "HR"."EMPLOYEES"."FIRST_NAME" IS 'First name of the employee. A not null column.';
 
   COMMENT ON COLUMN "HR"."EMPLOYEES"."LAST_NAME" IS 'Last name of the employee. A not null column.';
 
   COMMENT ON COLUMN "HR"."EMPLOYEES"."EMAIL" IS 'Email id of the employee';
 
   COMMENT ON COLUMN "HR"."EMPLOYEES"."PHONE_NUMBER" IS 'Phone number of the employee; includes country code and area code';
 
   COMMENT ON COLUMN "HR"."EMPLOYEES"."HIRE_DATE" IS 'Date when the employee started on this job. A not null column.';
 
   COMMENT ON COLUMN "HR"."EMPLOYEES"."JOB_ID" IS 'Current job of the employee; foreign key to job_id column of the
jobs table. A not null column.';
 
   COMMENT ON COLUMN "HR"."EMPLOYEES"."SALARY" IS 'Monthly salary of the employee. Must be greater
than zero (enforced by constraint emp_salary_min)';
 
   COMMENT ON COLUMN "HR"."EMPLOYEES"."COMMISSION_PCT" IS 'Commission percentage of the employee; Only employees in sales
department elgible for commission percentage';
 
   COMMENT ON COLUMN "HR"."EMPLOYEES"."MANAGER_ID" IS 'Manager id of the employee; has same domain as manager_id in
departments table. Foreign key to employee_id column of employees table.
(useful for reflexive joins and CONNECT BY query)';
 
   COMMENT ON COLUMN "HR"."EMPLOYEES"."DEPARTMENT_ID" IS 'Department id where employee works; foreign key to department_id
column of the departments table';
 
   COMMENT ON TABLE "HR"."EMPLOYEES"  IS 'employees table. Contains 107 rows. References with departments,
jobs, job_history tables. Contains a self reference.';
  GRANT SELECT, REFERENCES ON "HR"."EMPLOYEES" TO "OE";
 

--------------------------------------------------------
--  DDL for Table EMPLOYEE_MEMBER
--------------------------------------------------------

  CREATE TABLE "HR"."EMPLOYEE_MEMBER" 
   (	"EMP_SSN" VARCHAR2(20 BYTE), 
	"MBR_ID" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table EMPLOYEE_SPORT
--------------------------------------------------------

  CREATE TABLE "HR"."EMPLOYEE_SPORT" 
   (	"EMP_SSN" VARCHAR2(20 BYTE), 
	"SPR_ID" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table EVENT
--------------------------------------------------------

  CREATE TABLE "HR"."EVENT" 
   (	"EV_ID" VARCHAR2(20 BYTE), 
	"EV_NAME" VARCHAR2(20 BYTE), 
	"EV_DESCRIPTION" VARCHAR2(100 BYTE), 
	"EV_PLACE" VARCHAR2(20 BYTE), 
	"EV_DATE" DATE, 
	"EV_TIME" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FILMACTORS
--------------------------------------------------------

  CREATE TABLE "HR"."FILMACTORS" 
   (	"FILMID" NUMBER(10,0), 
	"ACTORID" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FILMCATEGORY
--------------------------------------------------------

  CREATE TABLE "HR"."FILMCATEGORY" 
   (	"CATEGORYID" NUMBER(3,0), 
	"CATEGORYNAME" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FILMCOPIES
--------------------------------------------------------

  CREATE TABLE "HR"."FILMCOPIES" 
   (	"COPYID" NUMBER(5,0), 
	"FILMID" NUMBER(10,0), 
	"CURRENTLYRENTED" CHAR(1 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FILMTITLES
--------------------------------------------------------

  CREATE TABLE "HR"."FILMTITLES" 
   (	"FILMID" NUMBER(10,0), 
	"FILMTITLE" VARCHAR2(50 BYTE), 
	"RELEASEDATE" DATE, 
	"FILMDURATION" NUMBER(3,0), 
	"FILMCATEGORYID" NUMBER(3,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table JOBS
--------------------------------------------------------

  CREATE TABLE "HR"."JOBS" 
   (	"JOB_ID" VARCHAR2(10 BYTE), 
	"JOB_TITLE" VARCHAR2(35 BYTE), 
	"MIN_SALARY" NUMBER(6,0), 
	"MAX_SALARY" NUMBER(6,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
 

   COMMENT ON COLUMN "HR"."JOBS"."JOB_ID" IS 'Primary key of jobs table.';
 
   COMMENT ON COLUMN "HR"."JOBS"."JOB_TITLE" IS 'A not null column that shows job title, e.g. AD_VP, FI_ACCOUNTANT';
 
   COMMENT ON COLUMN "HR"."JOBS"."MIN_SALARY" IS 'Minimum salary for a job title.';
 
   COMMENT ON COLUMN "HR"."JOBS"."MAX_SALARY" IS 'Maximum salary for a job title';
 
   COMMENT ON TABLE "HR"."JOBS"  IS 'jobs table with job titles and salary ranges. Contains 19 rows.
References with employees and job_history table.';
  GRANT SELECT ON "HR"."JOBS" TO "OE";
 

--------------------------------------------------------
--  DDL for Table JOB_HISTORY
--------------------------------------------------------

  CREATE TABLE "HR"."JOB_HISTORY" 
   (	"EMPLOYEE_ID" NUMBER(6,0), 
	"START_DATE" DATE, 
	"END_DATE" DATE, 
	"JOB_ID" VARCHAR2(10 BYTE), 
	"DEPARTMENT_ID" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
 

   COMMENT ON COLUMN "HR"."JOB_HISTORY"."EMPLOYEE_ID" IS 'A not null column in the complex primary key employee_id+start_date.
Foreign key to employee_id column of the employee table';
 
   COMMENT ON COLUMN "HR"."JOB_HISTORY"."START_DATE" IS 'A not null column in the complex primary key employee_id+start_date.
Must be less than the end_date of the job_history table. (enforced by
constraint jhist_date_interval)';
 
   COMMENT ON COLUMN "HR"."JOB_HISTORY"."END_DATE" IS 'Last day of the employee in this job role. A not null column. Must be
greater than the start_date of the job_history table.
(enforced by constraint jhist_date_interval)';
 
   COMMENT ON COLUMN "HR"."JOB_HISTORY"."JOB_ID" IS 'Job role in which the employee worked in the past; foreign key to
job_id column in the jobs table. A not null column.';
 
   COMMENT ON COLUMN "HR"."JOB_HISTORY"."DEPARTMENT_ID" IS 'Department id in which the employee worked in the past; foreign key to deparment_id column in the departments table';
 
   COMMENT ON TABLE "HR"."JOB_HISTORY"  IS 'Table that stores job history of the employees. If an employee
changes departments within the job or changes jobs within the department,
new rows get inserted into this table with old job information of the
employee. Contains a complex primary key: employee_id+start_date.
Contains 25 rows. References with jobs, employees, and departments tables.';
  GRANT SELECT ON "HR"."JOB_HISTORY" TO "OE";
 

--------------------------------------------------------
--  DDL for Table LOCATIONS
--------------------------------------------------------

  CREATE TABLE "HR"."LOCATIONS" 
   (	"LOCATION_ID" NUMBER(4,0), 
	"STREET_ADDRESS" VARCHAR2(40 BYTE), 
	"POSTAL_CODE" VARCHAR2(12 BYTE), 
	"CITY" VARCHAR2(30 BYTE), 
	"STATE_PROVINCE" VARCHAR2(25 BYTE), 
	"COUNTRY_ID" CHAR(2 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
 

   COMMENT ON COLUMN "HR"."LOCATIONS"."LOCATION_ID" IS 'Primary key of locations table';
 
   COMMENT ON COLUMN "HR"."LOCATIONS"."STREET_ADDRESS" IS 'Street address of an office, warehouse, or production site of a company.
Contains building number and street name';
 
   COMMENT ON COLUMN "HR"."LOCATIONS"."POSTAL_CODE" IS 'Postal code of the location of an office, warehouse, or production site
of a company. ';
 
   COMMENT ON COLUMN "HR"."LOCATIONS"."CITY" IS 'A not null column that shows city where an office, warehouse, or
production site of a company is located. ';
 
   COMMENT ON COLUMN "HR"."LOCATIONS"."STATE_PROVINCE" IS 'State or Province where an office, warehouse, or production site of a
company is located.';
 
   COMMENT ON COLUMN "HR"."LOCATIONS"."COUNTRY_ID" IS 'Country where an office, warehouse, or production site of a company is
located. Foreign key to country_id column of the countries table.';
 
   COMMENT ON TABLE "HR"."LOCATIONS"  IS 'Locations table that contains specific address of a specific office,
warehouse, and/or production site of a company. Does not store addresses /
locations of customers. Contains 23 rows; references with the
departments and countries tables. ';
  GRANT SELECT, REFERENCES ON "HR"."LOCATIONS" TO "OE";
 

--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "HR"."MEMBER" 
   (	"M_ID" VARCHAR2(20 BYTE), 
	"MEMBERNAME" VARCHAR2(20 BYTE), 
	"BIRTHDATE" DATE, 
	"M_GENDER" VARCHAR2(1 BYTE), 
	"REGDATE" DATE, 
	"EXPIRYDATE" DATE, 
	"M_PASSWORD" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MEMBERS
--------------------------------------------------------

  CREATE TABLE "HR"."MEMBERS" 
   (	"MEMBERID" NUMBER(10,0), 
	"MEMNAME" VARCHAR2(20 BYTE), 
	"JOINDATE" DATE, 
	"DOB" DATE, 
	"PHONE" NUMBER(12,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MEMBER_EVENT
--------------------------------------------------------

  CREATE TABLE "HR"."MEMBER_EVENT" 
   (	"MBR_ID" VARCHAR2(20 BYTE), 
	"EVNT_ID" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MEMBER_SPORT
--------------------------------------------------------

  CREATE TABLE "HR"."MEMBER_SPORT" 
   (	"MMB_ID" VARCHAR2(20 BYTE), 
	"SPR_ID" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MEMBER_TRIP
--------------------------------------------------------

  CREATE TABLE "HR"."MEMBER_TRIP" 
   (	"MEM_ID" VARCHAR2(20 BYTE), 
	"TRI_ID" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REGIONS
--------------------------------------------------------

  CREATE TABLE "HR"."REGIONS" 
   (	"REGION_ID" NUMBER, 
	"REGION_NAME" VARCHAR2(25 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
--------------------------------------------------------
--  DDL for Table RENTALS
--------------------------------------------------------

  CREATE TABLE "HR"."RENTALS" 
   (	"RENTID" NUMBER(10,0), 
	"MEMBERID" NUMBER(10,0), 
	"COPYID" NUMBER(5,0), 
	"DATERENTED" DATE, 
	"DATEDUEBACK" DATE, 
	"RENTALCOST" NUMBER(5,0), 
	"OVERDUECOST" NUMBER(5,0), 
	"RETURNEDDATE" DATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SPORT
--------------------------------------------------------

  CREATE TABLE "HR"."SPORT" 
   (	"ID" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"CAPACITY" VARCHAR2(20 BYTE), 
	"PLAYGROUND" VARCHAR2(20 BYTE), 
	"TRA_SSN" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SPORT_TIME
--------------------------------------------------------

  CREATE TABLE "HR"."SPORT_TIME" 
   (	"SPR_ID" VARCHAR2(20 BYTE), 
	"HOUR" VARCHAR2(2 BYTE), 
	"DAY" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TABLE1
--------------------------------------------------------

  CREATE TABLE "HR"."TABLE1" 
   (	"COLUMN1" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TRAINER
--------------------------------------------------------

  CREATE TABLE "HR"."TRAINER" 
   (	"TRAINER_SSN" VARCHAR2(20 BYTE), 
	"TRAINER_NAME" VARCHAR2(20 BYTE), 
	"TRAINER_BIRTHDATE" DATE, 
	"TRAINER_SALARY" VARCHAR2(5 BYTE), 
	"TRAINER_GENDER" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TRAINER_SPORT
--------------------------------------------------------

  CREATE TABLE "HR"."TRAINER_SPORT" 
   (	"TRAINER_SSN" VARCHAR2(20 BYTE), 
	"SPR_ID" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TRIPS
--------------------------------------------------------

  CREATE TABLE "HR"."TRIPS" 
   (	"TRIP_NAME" VARCHAR2(20 BYTE), 
	"DESTINATION" VARCHAR2(20 BYTE), 
	"GATHERING_POINT" VARCHAR2(20 BYTE), 
	"TRIP_DATE" DATE, 
	"TRIP_TIME" VARCHAR2(20 BYTE), 
	"TRIP_DESCRIPTION" VARCHAR2(20 BYTE), 
	"TRIP_ID" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

---------------------------------------------------
--   DATA FOR TABLE ACTORS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.ACTORS
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (1,'Kristen Stewart','F');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (2,'Robert Pattinson','M');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (3,'Taylor Lautner','M');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (4,'Rupert Grint','M');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (5,'Daniel Radcliffe','M');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (6,'Ralph Fiennes','M');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (7,'Hank Azaria','M');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (8,'Neil Patrick Harris','M');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (9,'Jayma Mays','F');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (10,'Sofia Vergara','F');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (11,'John Cleese','M');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (12,'Jim Cummings','M');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (13,'Bud Luckey','M');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (14,'Tom Hanks','M');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (15,'Tim Allen','M');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (16,'Joan Cusack','F');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (17,'Mike Myers','M');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (18,'Eddie Murphy','M');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (19,'Cameron Diaz','F');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (20,'Kevin James','M');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (21,'Salma Hayek','F');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (22,'Henry Winkler','M');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (23,'Matthew McConaughey','M');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (24,'Anne Hathaway','F');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (25,'Jessica Chastain','F');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (26,'Sandra Bullock','F');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (27,'George Clooney','M');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (28,'Will Smith','M');
Insert into HR.ACTORS (ACTORID,ACTORNAME,GENDER) values (29,'Tommy Lee Jones','M');

---------------------------------------------------
--   END DATA FOR TABLE ACTORS
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE ASSIGN_TRAINER_SPORT
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.ASSIGN_TRAINER_SPORT

---------------------------------------------------
--   END DATA FOR TABLE ASSIGN_TRAINER_SPORT
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE COUNTRIES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.COUNTRIES
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('AR','Argentina',2);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('AU','Australia',3);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('BE','Belgium',1);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('BR','Brazil',2);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('CA','Canada',2);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('CH','Switzerland',1);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('CN','China',3);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('DE','Germany',1);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('DK','Denmark',1);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('EG','Egypt',4);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('FR','France',1);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('IL','Israel',4);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('IN','India',3);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('IT','Italy',1);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('JP','Japan',3);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('KW','Kuwait',4);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('ML','Malaysia',3);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('MX','Mexico',2);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('NG','Nigeria',4);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('NL','Netherlands',1);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('SG','Singapore',3);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('UK','United Kingdom',1);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('US','United States of America',2);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('ZM','Zambia',4);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('ZW','Zimbabwe',4);

---------------------------------------------------
--   END DATA FOR TABLE COUNTRIES
---------------------------------------------------

  GRANT SELECT, REFERENCES ON "HR"."COUNTRIES" TO "OE";
 


---------------------------------------------------
--   DATA FOR TABLE DEPARTMENTS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.DEPARTMENTS
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (10,'Administration',200,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (20,'Marketing',201,1800);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (30,'Purchasing',114,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (40,'Human Resources',203,2400);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (50,'Shipping',121,1500);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (60,'IT',103,1400);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (70,'Public Relations',204,2700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (80,'Sales',145,2500);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (90,'Executive',100,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (100,'Finance',108,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (110,'Accounting',205,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (120,'Treasury',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (130,'Corporate Tax',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (140,'Control And Credit',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (150,'Shareholder Services',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (160,'Benefits',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (170,'Manufacturing',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (180,'Construction',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (190,'Contracting',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (200,'Operations',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (210,'IT Support',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (220,'NOC',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (230,'IT Helpdesk',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (240,'Government Sales',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (250,'Retail Sales',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (260,'Recruiting',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (270,'Payroll',null,1700);

---------------------------------------------------
--   END DATA FOR TABLE DEPARTMENTS
---------------------------------------------------

  GRANT SELECT ON "HR"."DEPARTMENTS" TO "OE";
 


---------------------------------------------------
--   DATA FOR TABLE EMPLOYEE
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.EMPLOYEE
Insert into HR.EMPLOYEE (SSN,NAME,SALARY,GENDER,BIRTHDATE,PASSWORD) values ('9999','sarah','5000','f',to_timestamp('03-DEC-00 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'0000');
Insert into HR.EMPLOYEE (SSN,NAME,SALARY,GENDER,BIRTHDATE,PASSWORD) values ('123456','Mihsen','10000','M',to_timestamp('01-JAN-01 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'Tarek');
Insert into HR.EMPLOYEE (SSN,NAME,SALARY,GENDER,BIRTHDATE,PASSWORD) values ('99','Raghd','7777','f',to_timestamp('02-FEB-02 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'RSDF');
Insert into HR.EMPLOYEE (SSN,NAME,SALARY,GENDER,BIRTHDATE,PASSWORD) values ('78','tAREK','677','M',to_timestamp('10-DEC-00 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'FGHFH');

---------------------------------------------------
--   END DATA FOR TABLE EMPLOYEE
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE EMPLOYEES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.EMPLOYEES
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (189,'Jennifer','Dilly','JDILLY','650.505.2876',to_timestamp('13-AUG-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',3600,null,122,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (190,'Timothy','Gates','TGATES','650.505.3876',to_timestamp('11-JUL-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',2900,null,122,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (191,'Randall','Perkins','RPERKINS','650.505.4876',to_timestamp('19-DEC-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',2500,null,122,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (192,'Sarah','Bell','SBELL','650.501.1876',to_timestamp('04-FEB-04 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',4000,null,123,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (193,'Britney','Everett','BEVERETT','650.501.2876',to_timestamp('03-MAR-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',3900,null,123,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (194,'Samuel','McCain','SMCCAIN','650.501.3876',to_timestamp('01-JUL-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',3200,null,123,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (195,'Vance','Jones','VJONES','650.501.4876',to_timestamp('17-MAR-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',2800,null,123,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (196,'Alana','Walsh','AWALSH','650.507.9811',to_timestamp('24-APR-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',3100,null,124,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (197,'Kevin','Feeney','KFEENEY','650.507.9822',to_timestamp('23-MAY-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',3000,null,124,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (198,'Donald','OConnell','DOCONNEL','650.507.9833',to_timestamp('21-JUN-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',2600,null,124,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (199,'Douglas','Grant','DGRANT','650.507.9844',to_timestamp('13-JAN-08 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',2600,null,124,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (200,'Jennifer','Whalen','JWHALEN','515.123.4444',to_timestamp('17-SEP-03 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'AD_ASST',4400,null,101,10);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (201,'Michael','Hartstein','MHARTSTE','515.123.5555',to_timestamp('17-FEB-04 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'MK_MAN',13000,null,100,20);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (202,'Pat','Fay','PFAY','603.123.6666',to_timestamp('17-AUG-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'MK_REP',6000,null,201,20);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (203,'Susan','Mavris','SMAVRIS','515.123.7777',to_timestamp('07-JUN-02 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'HR_REP',6500,null,101,40);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (204,'Hermann','Baer','HBAER','515.123.8888',to_timestamp('07-JUN-02 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'PR_REP',10000,null,101,70);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (205,'Shelley','Higgins','SHIGGINS','515.123.8080',to_timestamp('07-JUN-02 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'AC_MGR',12008,null,101,110);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (206,'William','Gietz','WGIETZ','515.123.8181',to_timestamp('07-JUN-02 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'AC_ACCOUNT',8300,null,205,110);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (100,'Steven','King','SKING','515.123.4567',to_timestamp('17-JUN-03 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'AD_PRES',24000,null,null,90);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (101,'Neena','Kochhar','NKOCHHAR','515.123.4568',to_timestamp('21-SEP-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'AD_VP',17000,null,100,90);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (102,'Lex','De Haan','LDEHAAN','515.123.4569',to_timestamp('13-JAN-01 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'AD_VP',17000,null,100,90);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (103,'Alexander','Hunold','AHUNOLD','590.423.4567',to_timestamp('03-JAN-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'IT_PROG',9000,null,102,60);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (104,'Bruce','Ernst','BERNST','590.423.4568',to_timestamp('21-MAY-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'IT_PROG',6000,null,103,60);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (105,'David','Austin','DAUSTIN','590.423.4569',to_timestamp('25-JUN-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'IT_PROG',4800,null,103,60);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (106,'Valli','Pataballa','VPATABAL','590.423.4560',to_timestamp('05-FEB-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'IT_PROG',4800,null,103,60);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (107,'Diana','Lorentz','DLORENTZ','590.423.5567',to_timestamp('07-FEB-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'IT_PROG',4200,null,103,60);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (108,'Nancy','Greenberg','NGREENBE','515.124.4569',to_timestamp('17-AUG-02 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'FI_MGR',12008,null,101,100);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (109,'Daniel','Faviet','DFAVIET','515.124.4169',to_timestamp('16-AUG-02 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'FI_ACCOUNT',9000,null,108,100);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (110,'John','Chen','JCHEN','515.124.4269',to_timestamp('28-SEP-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'FI_ACCOUNT',8200,null,108,100);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (111,'Ismael','Sciarra','ISCIARRA','515.124.4369',to_timestamp('30-SEP-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'FI_ACCOUNT',7700,null,108,100);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (112,'Jose Manuel','Urman','JMURMAN','515.124.4469',to_timestamp('07-MAR-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'FI_ACCOUNT',7800,null,108,100);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (113,'Luis','Popp','LPOPP','515.124.4567',to_timestamp('07-DEC-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'FI_ACCOUNT',6900,null,108,100);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (114,'Den','Raphaely','DRAPHEAL','515.127.4561',to_timestamp('07-DEC-02 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'PU_MAN',11000,null,100,30);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (115,'Alexander','Khoo','AKHOO','515.127.4562',to_timestamp('18-MAY-03 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'PU_CLERK',3100,null,114,30);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (116,'Shelli','Baida','SBAIDA','515.127.4563',to_timestamp('24-DEC-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'PU_CLERK',2900,null,114,30);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (117,'Sigal','Tobias','STOBIAS','515.127.4564',to_timestamp('24-JUL-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'PU_CLERK',2800,null,114,30);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (118,'Guy','Himuro','GHIMURO','515.127.4565',to_timestamp('15-NOV-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'PU_CLERK',2600,null,114,30);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (119,'Karen','Colmenares','KCOLMENA','515.127.4566',to_timestamp('10-AUG-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'PU_CLERK',2500,null,114,30);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (120,'Matthew','Weiss','MWEISS','650.123.1234',to_timestamp('18-JUL-04 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_MAN',8000,null,100,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (121,'Adam','Fripp','AFRIPP','650.123.2234',to_timestamp('10-APR-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_MAN',8200,null,100,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (122,'Payam','Kaufling','PKAUFLIN','650.123.3234',to_timestamp('01-MAY-03 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_MAN',7900,null,100,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (123,'Shanta','Vollman','SVOLLMAN','650.123.4234',to_timestamp('10-OCT-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_MAN',6500,null,100,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (124,'Kevin','Mourgos','KMOURGOS','650.123.5234',to_timestamp('16-NOV-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_MAN',5800,null,100,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (125,'Julia','Nayer','JNAYER','650.124.1214',to_timestamp('16-JUL-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',3200,null,120,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (126,'Irene','Mikkilineni','IMIKKILI','650.124.1224',to_timestamp('28-SEP-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2700,null,120,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (127,'James','Landry','JLANDRY','650.124.1334',to_timestamp('14-JAN-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2400,null,120,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (128,'Steven','Markle','SMARKLE','650.124.1434',to_timestamp('08-MAR-08 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2200,null,120,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (129,'Laura','Bissot','LBISSOT','650.124.5234',to_timestamp('20-AUG-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',3300,null,121,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (130,'Mozhe','Atkinson','MATKINSO','650.124.6234',to_timestamp('30-OCT-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2800,null,121,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (131,'James','Marlow','JAMRLOW','650.124.7234',to_timestamp('16-FEB-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2500,null,121,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (132,'TJ','Olson','TJOLSON','650.124.8234',to_timestamp('10-APR-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2100,null,121,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (133,'Jason','Mallin','JMALLIN','650.127.1934',to_timestamp('14-JUN-04 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',3300,null,122,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (134,'Michael','Rogers','MROGERS','650.127.1834',to_timestamp('26-AUG-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2900,null,122,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (135,'Ki','Gee','KGEE','650.127.1734',to_timestamp('12-DEC-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2400,null,122,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (136,'Hazel','Philtanker','HPHILTAN','650.127.1634',to_timestamp('06-FEB-08 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2200,null,122,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (137,'Renske','Ladwig','RLADWIG','650.121.1234',to_timestamp('14-JUL-03 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',3600,null,123,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (138,'Stephen','Stiles','SSTILES','650.121.2034',to_timestamp('26-OCT-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',3200,null,123,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (139,'John','Seo','JSEO','650.121.2019',to_timestamp('12-FEB-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2700,null,123,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (140,'Joshua','Patel','JPATEL','650.121.1834',to_timestamp('06-APR-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2500,null,123,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (141,'Trenna','Rajs','TRAJS','650.121.8009',to_timestamp('17-OCT-03 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',3500,null,124,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (142,'Curtis','Davies','CDAVIES','650.121.2994',to_timestamp('29-JAN-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',3100,null,124,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (143,'Randall','Matos','RMATOS','650.121.2874',to_timestamp('15-MAR-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2600,null,124,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (144,'Peter','Vargas','PVARGAS','650.121.2004',to_timestamp('09-JUL-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2500,null,124,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (145,'John','Russell','JRUSSEL','011.44.1344.429268',to_timestamp('01-OCT-04 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_MAN',14000,0.4,100,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (146,'Karen','Partners','KPARTNER','011.44.1344.467268',to_timestamp('05-JAN-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_MAN',13500,0.3,100,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (147,'Alberto','Errazuriz','AERRAZUR','011.44.1344.429278',to_timestamp('10-MAR-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_MAN',12000,0.3,100,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (148,'Gerald','Cambrault','GCAMBRAU','011.44.1344.619268',to_timestamp('15-OCT-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_MAN',11000,0.3,100,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018',to_timestamp('29-JAN-08 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_MAN',10500,0.2,100,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (150,'Peter','Tucker','PTUCKER','011.44.1344.129268',to_timestamp('30-JAN-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',10000,0.3,145,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (151,'David','Bernstein','DBERNSTE','011.44.1344.345268',to_timestamp('24-MAR-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',9500,0.25,145,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (152,'Peter','Hall','PHALL','011.44.1344.478968',to_timestamp('20-AUG-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',9000,0.25,145,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (153,'Christopher','Olsen','COLSEN','011.44.1344.498718',to_timestamp('30-MAR-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',8000,0.2,145,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (154,'Nanette','Cambrault','NCAMBRAU','011.44.1344.987668',to_timestamp('09-DEC-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',7500,0.2,145,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (155,'Oliver','Tuvault','OTUVAULT','011.44.1344.486508',to_timestamp('23-NOV-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',7000,0.15,145,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (156,'Janette','King','JKING','011.44.1345.429268',to_timestamp('30-JAN-04 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',10000,0.35,146,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (157,'Patrick','Sully','PSULLY','011.44.1345.929268',to_timestamp('04-MAR-04 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',9500,0.35,146,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (158,'Allan','McEwen','AMCEWEN','011.44.1345.829268',to_timestamp('01-AUG-04 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',9000,0.35,146,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (159,'Lindsey','Smith','LSMITH','011.44.1345.729268',to_timestamp('10-MAR-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',8000,0.3,146,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (160,'Louise','Doran','LDORAN','011.44.1345.629268',to_timestamp('15-DEC-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',7500,0.3,146,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (161,'Sarath','Sewall','SSEWALL','011.44.1345.529268',to_timestamp('03-NOV-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',7000,0.25,146,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (162,'Clara','Vishney','CVISHNEY','011.44.1346.129268',to_timestamp('11-NOV-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',10500,0.25,147,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (163,'Danielle','Greene','DGREENE','011.44.1346.229268',to_timestamp('19-MAR-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',9500,0.15,147,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (164,'Mattea','Marvins','MMARVINS','011.44.1346.329268',to_timestamp('24-JAN-08 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',7200,0.1,147,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (165,'David','Lee','DLEE','011.44.1346.529268',to_timestamp('23-FEB-08 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',6800,0.1,147,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (166,'Sundar','Ande','SANDE','011.44.1346.629268',to_timestamp('24-MAR-08 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',6400,0.1,147,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (167,'Amit','Banda','ABANDA','011.44.1346.729268',to_timestamp('21-APR-08 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',6200,0.1,147,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (168,'Lisa','Ozer','LOZER','011.44.1343.929268',to_timestamp('11-MAR-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',11500,0.25,148,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (169,'Harrison','Bloom','HBLOOM','011.44.1343.829268',to_timestamp('23-MAR-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',10000,0.2,148,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (170,'Tayler','Fox','TFOX','011.44.1343.729268',to_timestamp('24-JAN-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',9600,0.2,148,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (171,'William','Smith','WSMITH','011.44.1343.629268',to_timestamp('23-FEB-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',7400,0.15,148,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (172,'Elizabeth','Bates','EBATES','011.44.1343.529268',to_timestamp('24-MAR-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',7300,0.15,148,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (173,'Sundita','Kumar','SKUMAR','011.44.1343.329268',to_timestamp('21-APR-08 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',6100,0.1,148,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (174,'Ellen','Abel','EABEL','011.44.1644.429267',to_timestamp('11-MAY-04 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',11000,0.3,149,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (175,'Alyssa','Hutton','AHUTTON','011.44.1644.429266',to_timestamp('19-MAR-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',8800,0.25,149,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (176,'Jonathon','Taylor','JTAYLOR','011.44.1644.429265',to_timestamp('24-MAR-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',8600,0.2,149,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (177,'Jack','Livingston','JLIVINGS','011.44.1644.429264',to_timestamp('23-APR-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',8400,0.2,149,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (178,'Kimberely','Grant','KGRANT','011.44.1644.429263',to_timestamp('24-MAY-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',7000,0.15,149,null);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (179,'Charles','Johnson','CJOHNSON','011.44.1644.429262',to_timestamp('04-JAN-08 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',6200,0.1,149,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (180,'Winston','Taylor','WTAYLOR','650.507.9876',to_timestamp('24-JAN-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',3200,null,120,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (181,'Jean','Fleaur','JFLEAUR','650.507.9877',to_timestamp('23-FEB-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',3100,null,120,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (182,'Martha','Sullivan','MSULLIVA','650.507.9878',to_timestamp('21-JUN-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',2500,null,120,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (183,'Girard','Geoni','GGEONI','650.507.9879',to_timestamp('03-FEB-08 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',2800,null,120,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (184,'Nandita','Sarchand','NSARCHAN','650.509.1876',to_timestamp('27-JAN-04 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',4200,null,121,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (185,'Alexis','Bull','ABULL','650.509.2876',to_timestamp('20-FEB-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',4100,null,121,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (186,'Julia','Dellinger','JDELLING','650.509.3876',to_timestamp('24-JUN-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',3400,null,121,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (187,'Anthony','Cabrio','ACABRIO','650.509.4876',to_timestamp('07-FEB-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',3000,null,121,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (188,'Kelly','Chung','KCHUNG','650.505.1876',to_timestamp('14-JUN-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',3800,null,122,50);

---------------------------------------------------
--   END DATA FOR TABLE EMPLOYEES
---------------------------------------------------

  GRANT SELECT, REFERENCES ON "HR"."EMPLOYEES" TO "OE";
 


---------------------------------------------------
--   DATA FOR TABLE EMPLOYEE_MEMBER
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.EMPLOYEE_MEMBER

---------------------------------------------------
--   END DATA FOR TABLE EMPLOYEE_MEMBER
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE EMPLOYEE_SPORT
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.EMPLOYEE_SPORT

---------------------------------------------------
--   END DATA FOR TABLE EMPLOYEE_SPORT
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE EVENT
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.EVENT
Insert into HR.EVENT (EV_ID,EV_NAME,EV_DESCRIPTION,EV_PLACE,EV_DATE,EV_TIME) values ('15','Test2','asdasdasd','Test2',to_timestamp('01-JAN-12 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'12');
Insert into HR.EVENT (EV_ID,EV_NAME,EV_DESCRIPTION,EV_PLACE,EV_DATE,EV_TIME) values ('25','test3','test3','test3',to_timestamp('01-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'12');
Insert into HR.EVENT (EV_ID,EV_NAME,EV_DESCRIPTION,EV_PLACE,EV_DATE,EV_TIME) values ('619','TASLEM','Practical','LAB 6',to_timestamp('01-JAN-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'12');

---------------------------------------------------
--   END DATA FOR TABLE EVENT
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE FILMACTORS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.FILMACTORS
Insert into HR.FILMACTORS (FILMID,ACTORID) values (1,1);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (1,2);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (1,3);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (2,4);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (2,5);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (2,6);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (3,7);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (3,8);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (3,9);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (3,10);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (4,11);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (4,12);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (4,13);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (5,1);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (5,2);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (5,3);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (6,14);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (6,15);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (6,16);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (7,17);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (7,18);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (7,19);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (8,20);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (8,21);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (8,22);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (9,23);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (9,24);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (9,25);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (10,26);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (10,27);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (11,26);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (12,27);
Insert into HR.FILMACTORS (FILMID,ACTORID) values (12,28);

---------------------------------------------------
--   END DATA FOR TABLE FILMACTORS
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE FILMCATEGORY
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.FILMCATEGORY
Insert into HR.FILMCATEGORY (CATEGORYID,CATEGORYNAME) values (1,'Adventure');
Insert into HR.FILMCATEGORY (CATEGORYID,CATEGORYNAME) values (2,'Comedy');
Insert into HR.FILMCATEGORY (CATEGORYID,CATEGORYNAME) values (3,'Action');
Insert into HR.FILMCATEGORY (CATEGORYID,CATEGORYNAME) values (4,'Animation');
Insert into HR.FILMCATEGORY (CATEGORYID,CATEGORYNAME) values (5,'Fantasy');
Insert into HR.FILMCATEGORY (CATEGORYID,CATEGORYNAME) values (6,'Sci-Fi');

---------------------------------------------------
--   END DATA FOR TABLE FILMCATEGORY
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE FILMCOPIES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.FILMCOPIES

---------------------------------------------------
--   END DATA FOR TABLE FILMCOPIES
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE FILMTITLES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.FILMTITLES
Insert into HR.FILMTITLES (FILMID,FILMTITLE,RELEASEDATE,FILMDURATION,FILMCATEGORYID) values (1,'The Twilight Saga Breaking Dawn',to_timestamp('16-NOV-12 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),116,1);
Insert into HR.FILMTITLES (FILMID,FILMTITLE,RELEASEDATE,FILMDURATION,FILMCATEGORYID) values (2,'Harry Potter and the Deathly Hallows',to_timestamp('15-JUL-11 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),130,5);
Insert into HR.FILMTITLES (FILMID,FILMTITLE,RELEASEDATE,FILMDURATION,FILMCATEGORYID) values (3,'The Smurfs',to_timestamp('29-JUL-11 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),103,4);
Insert into HR.FILMTITLES (FILMID,FILMTITLE,RELEASEDATE,FILMDURATION,FILMCATEGORYID) values (4,'Winnie the Pooh',to_timestamp('15-JUL-11 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),63,4);
Insert into HR.FILMTITLES (FILMID,FILMTITLE,RELEASEDATE,FILMDURATION,FILMCATEGORYID) values (5,'The Twilight Saga: Eclipse',to_timestamp('30-JUN-10 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),124,1);
Insert into HR.FILMTITLES (FILMID,FILMTITLE,RELEASEDATE,FILMDURATION,FILMCATEGORYID) values (6,'Toy Story 3',to_timestamp('18-JUN-10 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),103,4);
Insert into HR.FILMTITLES (FILMID,FILMTITLE,RELEASEDATE,FILMDURATION,FILMCATEGORYID) values (7,'Shrek Forever After',to_timestamp('21-MAY-10 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),93,4);
Insert into HR.FILMTITLES (FILMID,FILMTITLE,RELEASEDATE,FILMDURATION,FILMCATEGORYID) values (8,'Here Comes the Boom',to_timestamp('12-OCT-12 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),105,2);
Insert into HR.FILMTITLES (FILMID,FILMTITLE,RELEASEDATE,FILMDURATION,FILMCATEGORYID) values (9,'Interstellar',to_timestamp('07-NOV-14 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),169,6);
Insert into HR.FILMTITLES (FILMID,FILMTITLE,RELEASEDATE,FILMDURATION,FILMCATEGORYID) values (10,'Gravity',to_timestamp('04-OCT-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),90,6);
Insert into HR.FILMTITLES (FILMID,FILMTITLE,RELEASEDATE,FILMDURATION,FILMCATEGORYID) values (11,'Miss Congeniality',to_timestamp('22-DEC-02 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),109,2);
Insert into HR.FILMTITLES (FILMID,FILMTITLE,RELEASEDATE,FILMDURATION,FILMCATEGORYID) values (12,'Men in Black 3',to_timestamp('25-MAY-12 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),107,3);

---------------------------------------------------
--   END DATA FOR TABLE FILMTITLES
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE JOBS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.JOBS
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AD_PRES','President',20080,40000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AD_VP','Administration Vice President',15000,30000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AD_ASST','Administration Assistant',3000,6000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('FI_MGR','Finance Manager',8200,16000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('FI_ACCOUNT','Accountant',4200,9000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AC_MGR','Accounting Manager',8200,16000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AC_ACCOUNT','Public Accountant',4200,9000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('SA_MAN','Sales Manager',10000,20080);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('SA_REP','Sales Representative',6000,12008);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('PU_MAN','Purchasing Manager',8000,15000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('PU_CLERK','Purchasing Clerk',2500,5500);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('ST_MAN','Stock Manager',5500,8500);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('ST_CLERK','Stock Clerk',2008,5000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('SH_CLERK','Shipping Clerk',2500,5500);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('IT_PROG','Programmer',4000,10000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('MK_MAN','Marketing Manager',9000,15000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('MK_REP','Marketing Representative',4000,9000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('HR_REP','Human Resources Representative',4000,9000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('PR_REP','Public Relations Representative',4500,10500);

---------------------------------------------------
--   END DATA FOR TABLE JOBS
---------------------------------------------------

  GRANT SELECT ON "HR"."JOBS" TO "OE";
 


---------------------------------------------------
--   DATA FOR TABLE JOB_HISTORY
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.JOB_HISTORY
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (102,to_timestamp('13-JAN-01 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('24-JUL-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'IT_PROG',60);
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (101,to_timestamp('21-SEP-97 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('27-OCT-01 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'AC_ACCOUNT',110);
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (101,to_timestamp('28-OCT-01 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('15-MAR-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'AC_MGR',110);
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (201,to_timestamp('17-FEB-04 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('19-DEC-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'MK_REP',20);
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (114,to_timestamp('24-MAR-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('31-DEC-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',50);
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (122,to_timestamp('01-JAN-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('31-DEC-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',50);
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (200,to_timestamp('17-SEP-95 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('17-JUN-01 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'AD_ASST',90);
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (176,to_timestamp('24-MAR-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('31-DEC-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',80);
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (176,to_timestamp('01-JAN-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('31-DEC-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_MAN',80);
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (200,to_timestamp('01-JUL-02 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('31-DEC-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'AC_ACCOUNT',90);

---------------------------------------------------
--   END DATA FOR TABLE JOB_HISTORY
---------------------------------------------------

  GRANT SELECT ON "HR"."JOB_HISTORY" TO "OE";
 


---------------------------------------------------
--   DATA FOR TABLE LOCATIONS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.LOCATIONS
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1000,'1297 Via Cola di Rie','00989','Roma',null,'IT');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1100,'93091 Calle della Testa','10934','Venice',null,'IT');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1200,'2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1300,'9450 Kamiya-cho','6823','Hiroshima',null,'JP');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1600,'2007 Zagora St','50090','South Brunswick','New Jersey','US');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1900,'6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','CA');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2000,'40-5-12 Laogianggen','190518','Beijing',null,'CN');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2100,'1298 Vileparle (E)','490231','Bombay','Maharashtra','IN');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2200,'12-98 Victoria Street','2901','Sydney','New South Wales','AU');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2300,'198 Clementi North','540198','Singapore',null,'SG');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2400,'8204 Arthur St',null,'London',null,'UK');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2600,'9702 Chester Road','09629850293','Stretford','Manchester','UK');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2800,'Rua Frei Caneca 1360 ','01307-002','Sao Paulo','Sao Paulo','BR');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2900,'20 Rue des Corps-Saints','1730','Geneva','Geneve','CH');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (3000,'Murtenstrasse 921','3095','Bern','BE','CH');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (3100,'Pieter Breughelstraat 837','3029SK','Utrecht','Utrecht','NL');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (3200,'Mariano Escobedo 9991','11932','Mexico City','Distrito Federal,','MX');

---------------------------------------------------
--   END DATA FOR TABLE LOCATIONS
---------------------------------------------------

  GRANT SELECT, REFERENCES ON "HR"."LOCATIONS" TO "OE";
 


---------------------------------------------------
--   DATA FOR TABLE MEMBER
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.MEMBER
Insert into HR.MEMBER (M_ID,MEMBERNAME,BIRTHDATE,M_GENDER,REGDATE,EXPIRYDATE,M_PASSWORD) values ('3','salah',to_timestamp('21-DEC-01 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'m',to_timestamp('12-JUN-21 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('06-DEC-22 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'salah12');
Insert into HR.MEMBER (M_ID,MEMBERNAME,BIRTHDATE,M_GENDER,REGDATE,EXPIRYDATE,M_PASSWORD) values ('1','tarek',to_timestamp('12-DEC-01 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'m',to_timestamp('12-DEC-19 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('12-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'1234');
Insert into HR.MEMBER (M_ID,MEMBERNAME,BIRTHDATE,M_GENDER,REGDATE,EXPIRYDATE,M_PASSWORD) values ('2','ahmed',to_timestamp('12-DEC-01 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'m',to_timestamp('12-DEC-18 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('12-DEC-21 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'mega');
Insert into HR.MEMBER (M_ID,MEMBERNAME,BIRTHDATE,M_GENDER,REGDATE,EXPIRYDATE,M_PASSWORD) values ('2000','Mai',to_timestamp('02-FEB-02 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'f',to_timestamp('12-JUN-21 12.16.41.000000000 PM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('12-JUN-22 12.16.41.000000000 PM','DD-MON-RR HH.MI.SS.FF AM'),'Mai12');
Insert into HR.MEMBER (M_ID,MEMBERNAME,BIRTHDATE,M_GENDER,REGDATE,EXPIRYDATE,M_PASSWORD) values ('1234','TEST',to_timestamp('01-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'M',to_timestamp('12-JUN-21 12.21.25.000000000 PM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('12-JUN-22 12.21.25.000000000 PM','DD-MON-RR HH.MI.SS.FF AM'),'Tarek');

---------------------------------------------------
--   END DATA FOR TABLE MEMBER
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE MEMBERS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.MEMBERS

---------------------------------------------------
--   END DATA FOR TABLE MEMBERS
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE MEMBER_EVENT
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.MEMBER_EVENT
Insert into HR.MEMBER_EVENT (MBR_ID,EVNT_ID) values ('1','15');
Insert into HR.MEMBER_EVENT (MBR_ID,EVNT_ID) values ('1','25');

---------------------------------------------------
--   END DATA FOR TABLE MEMBER_EVENT
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE MEMBER_SPORT
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.MEMBER_SPORT
Insert into HR.MEMBER_SPORT (MMB_ID,SPR_ID) values ('1','0');
Insert into HR.MEMBER_SPORT (MMB_ID,SPR_ID) values ('1','1');
Insert into HR.MEMBER_SPORT (MMB_ID,SPR_ID) values ('3','1');

---------------------------------------------------
--   END DATA FOR TABLE MEMBER_SPORT
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE MEMBER_TRIP
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.MEMBER_TRIP
Insert into HR.MEMBER_TRIP (MEM_ID,TRI_ID) values ('1','5');

---------------------------------------------------
--   END DATA FOR TABLE MEMBER_TRIP
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE REGIONS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.REGIONS
Insert into HR.REGIONS (REGION_ID,REGION_NAME) values (1,'Europe');
Insert into HR.REGIONS (REGION_ID,REGION_NAME) values (2,'Americas');
Insert into HR.REGIONS (REGION_ID,REGION_NAME) values (3,'Asia');
Insert into HR.REGIONS (REGION_ID,REGION_NAME) values (4,'Middle East and Africa');

---------------------------------------------------
--   END DATA FOR TABLE REGIONS
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE RENTALS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.RENTALS

---------------------------------------------------
--   END DATA FOR TABLE RENTALS
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE SPORT
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.SPORT
Insert into HR.SPORT (ID,NAME,CAPACITY,PLAYGROUND,TRA_SSN) values ('0','Football','32','Ground1','619');
Insert into HR.SPORT (ID,NAME,CAPACITY,PLAYGROUND,TRA_SSN) values ('1','Basketball','20','Ground2','150');
Insert into HR.SPORT (ID,NAME,CAPACITY,PLAYGROUND,TRA_SSN) values ('2','Tennis','10','Ground3','1');
Insert into HR.SPORT (ID,NAME,CAPACITY,PLAYGROUND,TRA_SSN) values ('22','squash','619','Ground4','12213');
Insert into HR.SPORT (ID,NAME,CAPACITY,PLAYGROUND,TRA_SSN) values ('3','Boxing','30','Ground5','7');
Insert into HR.SPORT (ID,NAME,CAPACITY,PLAYGROUND,TRA_SSN) values ('5','Football','20','Ground1','6');
Insert into HR.SPORT (ID,NAME,CAPACITY,PLAYGROUND,TRA_SSN) values ('6','squash','10','Ground4','7');
Insert into HR.SPORT (ID,NAME,CAPACITY,PLAYGROUND,TRA_SSN) values ('8','Boxing','5','Ground4','150');
Insert into HR.SPORT (ID,NAME,CAPACITY,PLAYGROUND,TRA_SSN) values ('10','BasketBall','4','Ground2','6');
Insert into HR.SPORT (ID,NAME,CAPACITY,PLAYGROUND,TRA_SSN) values ('4','Tennis','9','Ground1','7');
Insert into HR.SPORT (ID,NAME,CAPACITY,PLAYGROUND,TRA_SSN) values ('30','Tennis','5','Ground1','6');
Insert into HR.SPORT (ID,NAME,CAPACITY,PLAYGROUND,TRA_SSN) values ('11','BasketBall','11','Ground2','1');

---------------------------------------------------
--   END DATA FOR TABLE SPORT
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE SPORT_TIME
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.SPORT_TIME

---------------------------------------------------
--   END DATA FOR TABLE SPORT_TIME
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE TABLE1
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.TABLE1

---------------------------------------------------
--   END DATA FOR TABLE TABLE1
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE TRAINER
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.TRAINER
Insert into HR.TRAINER (TRAINER_SSN,TRAINER_NAME,TRAINER_BIRTHDATE,TRAINER_SALARY,TRAINER_GENDER) values ('1','Hoba',to_timestamp('01-JAN-00 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'1','M');
Insert into HR.TRAINER (TRAINER_SSN,TRAINER_NAME,TRAINER_BIRTHDATE,TRAINER_SALARY,TRAINER_GENDER) values ('150','Jett',to_timestamp('01-JAN-00 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'2500','F');
Insert into HR.TRAINER (TRAINER_SSN,TRAINER_NAME,TRAINER_BIRTHDATE,TRAINER_SALARY,TRAINER_GENDER) values ('12213','astrasrsa',to_timestamp('01-JAN-00 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'12312','f');
Insert into HR.TRAINER (TRAINER_SSN,TRAINER_NAME,TRAINER_BIRTHDATE,TRAINER_SALARY,TRAINER_GENDER) values ('12231231','TAaA',to_timestamp('10-DEC-12 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'2000','M');
Insert into HR.TRAINER (TRAINER_SSN,TRAINER_NAME,TRAINER_BIRTHDATE,TRAINER_SALARY,TRAINER_GENDER) values ('6','ahmed',to_timestamp('10-JUN-00 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'50000','M');
Insert into HR.TRAINER (TRAINER_SSN,TRAINER_NAME,TRAINER_BIRTHDATE,TRAINER_SALARY,TRAINER_GENDER) values ('7','Raghd',to_timestamp('09-FEB-02 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'6000','F');
Insert into HR.TRAINER (TRAINER_SSN,TRAINER_NAME,TRAINER_BIRTHDATE,TRAINER_SALARY,TRAINER_GENDER) values ('619','Sarah',to_timestamp('01-JAN-01 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'2500','F');

---------------------------------------------------
--   END DATA FOR TABLE TRAINER
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE TRAINER_SPORT
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.TRAINER_SPORT
Insert into HR.TRAINER_SPORT (TRAINER_SSN,SPR_ID) values ('1','0');
Insert into HR.TRAINER_SPORT (TRAINER_SSN,SPR_ID) values ('1','0');
Insert into HR.TRAINER_SPORT (TRAINER_SSN,SPR_ID) values ('7','22');
Insert into HR.TRAINER_SPORT (TRAINER_SSN,SPR_ID) values ('6','3');
Insert into HR.TRAINER_SPORT (TRAINER_SSN,SPR_ID) values ('12213','22');
Insert into HR.TRAINER_SPORT (TRAINER_SSN,SPR_ID) values ('619','0');
Insert into HR.TRAINER_SPORT (TRAINER_SSN,SPR_ID) values ('7','3');

---------------------------------------------------
--   END DATA FOR TABLE TRAINER_SPORT
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE TRIPS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.TRIPS
Insert into HR.TRIPS (TRIP_NAME,DESTINATION,GATHERING_POINT,TRIP_DATE,TRIP_TIME,TRIP_DESCRIPTION,TRIP_ID) values ('Test','Test','Test',to_timestamp('01-JAN-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'12','asdasda','5');
Insert into HR.TRIPS (TRIP_NAME,DESTINATION,GATHERING_POINT,TRIP_DATE,TRIP_TIME,TRIP_DESCRIPTION,TRIP_ID) values ('re7let summer course','el kolya','gnedy',to_timestamp('01-JAN-02 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'10','sa2t','22');

---------------------------------------------------
--   END DATA FOR TABLE TRIPS
---------------------------------------------------

--------------------------------------------------------
--  Constraints for Table MEMBERS
--------------------------------------------------------

  ALTER TABLE "HR"."MEMBERS" MODIFY ("MEMNAME" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."MEMBERS" ADD PRIMARY KEY ("MEMBERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FILMCATEGORY
--------------------------------------------------------

  ALTER TABLE "HR"."FILMCATEGORY" ADD PRIMARY KEY ("CATEGORYID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LOCATIONS
--------------------------------------------------------

  ALTER TABLE "HR"."LOCATIONS" MODIFY ("CITY" CONSTRAINT "LOC_CITY_NN" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."LOCATIONS" ADD CONSTRAINT "LOC_ID_PK" PRIMARY KEY ("LOCATION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE"  ENABLE;
  GRANT SELECT, REFERENCES ON "HR"."LOCATIONS" TO "OE";
 

--------------------------------------------------------
--  Constraints for Table RENTALS
--------------------------------------------------------

  ALTER TABLE "HR"."RENTALS" ADD PRIMARY KEY ("RENTID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FILMACTORS
--------------------------------------------------------

  ALTER TABLE "HR"."FILMACTORS" ADD CONSTRAINT "FLM_ACT_PK" PRIMARY KEY ("FILMID", "ACTORID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SPORT
--------------------------------------------------------

  ALTER TABLE "HR"."SPORT" ADD CONSTRAINT "SPORT_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."SPORT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EMPLOYEE
--------------------------------------------------------

  ALTER TABLE "HR"."EMPLOYEE" ADD CONSTRAINT "EMPLOYEE_PK" PRIMARY KEY ("SSN")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."EMPLOYEE" MODIFY ("SSN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table JOBS
--------------------------------------------------------

  ALTER TABLE "HR"."JOBS" ADD CONSTRAINT "JOB_ID_PK" PRIMARY KEY ("JOB_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE"  ENABLE;
 
  ALTER TABLE "HR"."JOBS" MODIFY ("JOB_TITLE" CONSTRAINT "JOB_TITLE_NN" NOT NULL ENABLE);
  GRANT SELECT ON "HR"."JOBS" TO "OE";
 

--------------------------------------------------------
--  Constraints for Table REGIONS
--------------------------------------------------------

  ALTER TABLE "HR"."REGIONS" MODIFY ("REGION_ID" CONSTRAINT "REGION_ID_NN" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."REGIONS" ADD CONSTRAINT "REG_ID_PK" PRIMARY KEY ("REGION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE"  ENABLE;

--------------------------------------------------------
--  Constraints for Table FILMTITLES
--------------------------------------------------------

  ALTER TABLE "HR"."FILMTITLES" ADD PRIMARY KEY ("FILMID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ACTORS
--------------------------------------------------------

  ALTER TABLE "HR"."ACTORS" MODIFY ("ACTORNAME" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."ACTORS" ADD PRIMARY KEY ("ACTORID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "HR"."MEMBER" ADD CONSTRAINT "MEMBER_PK" PRIMARY KEY ("M_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."MEMBER" MODIFY ("M_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EMPLOYEE_MEMBER
--------------------------------------------------------

  ALTER TABLE "HR"."EMPLOYEE_MEMBER" ADD CONSTRAINT "EMPLOYEE_MEMBER_PK" PRIMARY KEY ("EMP_SSN", "MBR_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."EMPLOYEE_MEMBER" MODIFY ("EMP_SSN" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."EMPLOYEE_MEMBER" MODIFY ("MBR_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COUNTRIES
--------------------------------------------------------

  ALTER TABLE "HR"."COUNTRIES" ADD CONSTRAINT "COUNTRY_C_ID_PK" PRIMARY KEY ("COUNTRY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE"  ENABLE;
 
  ALTER TABLE "HR"."COUNTRIES" MODIFY ("COUNTRY_ID" CONSTRAINT "COUNTRY_ID_NN" NOT NULL ENABLE);
  GRANT SELECT, REFERENCES ON "HR"."COUNTRIES" TO "OE";
 

--------------------------------------------------------
--  Constraints for Table TRAINER_SPORT
--------------------------------------------------------

  ALTER TABLE "HR"."TRAINER_SPORT" MODIFY ("TRAINER_SSN" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."TRAINER_SPORT" MODIFY ("SPR_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("EMAIL" CONSTRAINT "EMP_EMAIL_NN" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_EMAIL_UK" UNIQUE ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE"  ENABLE;
 
  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_EMP_ID_PK" PRIMARY KEY ("EMPLOYEE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE"  ENABLE;
 
  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("HIRE_DATE" CONSTRAINT "EMP_HIRE_DATE_NN" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("JOB_ID" CONSTRAINT "EMP_JOB_NN" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("LAST_NAME" CONSTRAINT "EMP_LAST_NAME_NN" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_SALARY_MIN" CHECK (salary > 0) ENABLE;
  GRANT SELECT, REFERENCES ON "HR"."EMPLOYEES" TO "OE";
 

--------------------------------------------------------
--  Constraints for Table EMPLOYEE_SPORT
--------------------------------------------------------

  ALTER TABLE "HR"."EMPLOYEE_SPORT" ADD CONSTRAINT "EMPLOYEE_SPORT_PK" PRIMARY KEY ("EMP_SSN", "SPR_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."EMPLOYEE_SPORT" MODIFY ("EMP_SSN" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."EMPLOYEE_SPORT" MODIFY ("SPR_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FILMCOPIES
--------------------------------------------------------

  ALTER TABLE "HR"."FILMCOPIES" ADD PRIMARY KEY ("COPYID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;

--------------------------------------------------------
--  Constraints for Table TRAINER
--------------------------------------------------------

  ALTER TABLE "HR"."TRAINER" MODIFY ("TRAINER_SSN" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."TRAINER" ADD CONSTRAINT "TRAINER_PK" PRIMARY KEY ("TRAINER_SSN")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EVENT
--------------------------------------------------------

  ALTER TABLE "HR"."EVENT" ADD CONSTRAINT "EVENT_PK" PRIMARY KEY ("EV_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."EVENT" MODIFY ("EV_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBER_SPORT
--------------------------------------------------------

  ALTER TABLE "HR"."MEMBER_SPORT" ADD CONSTRAINT "MEMBER_SPORT_PK" PRIMARY KEY ("MMB_ID", "SPR_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."MEMBER_SPORT" MODIFY ("MMB_ID" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."MEMBER_SPORT" MODIFY ("SPR_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEPARTMENTS
--------------------------------------------------------

  ALTER TABLE "HR"."DEPARTMENTS" ADD CONSTRAINT "DEPT_ID_PK" PRIMARY KEY ("DEPARTMENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE"  ENABLE;
 
  ALTER TABLE "HR"."DEPARTMENTS" MODIFY ("DEPARTMENT_NAME" CONSTRAINT "DEPT_NAME_NN" NOT NULL ENABLE);
  GRANT SELECT ON "HR"."DEPARTMENTS" TO "OE";
 

--------------------------------------------------------
--  Constraints for Table JOB_HISTORY
--------------------------------------------------------

  ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_DATE_INTERVAL" CHECK (end_date > start_date) ENABLE;
 
  ALTER TABLE "HR"."JOB_HISTORY" MODIFY ("EMPLOYEE_ID" CONSTRAINT "JHIST_EMPLOYEE_NN" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_EMP_ID_ST_DATE_PK" PRIMARY KEY ("EMPLOYEE_ID", "START_DATE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE"  ENABLE;
 
  ALTER TABLE "HR"."JOB_HISTORY" MODIFY ("END_DATE" CONSTRAINT "JHIST_END_DATE_NN" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."JOB_HISTORY" MODIFY ("JOB_ID" CONSTRAINT "JHIST_JOB_NN" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."JOB_HISTORY" MODIFY ("START_DATE" CONSTRAINT "JHIST_START_DATE_NN" NOT NULL ENABLE);
  GRANT SELECT ON "HR"."JOB_HISTORY" TO "OE";
 

--------------------------------------------------------
--  Constraints for Table SPORT_TIME
--------------------------------------------------------

  ALTER TABLE "HR"."SPORT_TIME" ADD CONSTRAINT "SPORT_TIME_PK" PRIMARY KEY ("SPR_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."SPORT_TIME" MODIFY ("SPR_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBER_TRIP
--------------------------------------------------------

  ALTER TABLE "HR"."MEMBER_TRIP" ADD CONSTRAINT "MEMBER_TRIP_PK" PRIMARY KEY ("MEM_ID", "TRI_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."MEMBER_TRIP" MODIFY ("MEM_ID" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."MEMBER_TRIP" MODIFY ("TRI_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRIPS
--------------------------------------------------------

  ALTER TABLE "HR"."TRIPS" MODIFY ("TRIP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."TRIPS" ADD CONSTRAINT "TRIPS_PK" PRIMARY KEY ("TRIP_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MEMBER_EVENT
--------------------------------------------------------

  ALTER TABLE "HR"."MEMBER_EVENT" ADD CONSTRAINT "MEMBER_EVENT_PK" PRIMARY KEY ("MBR_ID", "EVNT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."MEMBER_EVENT" MODIFY ("MBR_ID" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."MEMBER_EVENT" MODIFY ("EVNT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  DDL for Index SPORT_TIME_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SPORT_TIME_PK" ON "HR"."SPORT_TIME" ("SPR_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOC_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."LOC_ID_PK" ON "HR"."LOCATIONS" ("LOCATION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
--------------------------------------------------------
--  DDL for Index TRIPS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."TRIPS_PK" ON "HR"."TRIPS" ("TRIP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_MANAGER_IX
--------------------------------------------------------

  CREATE INDEX "HR"."EMP_MANAGER_IX" ON "HR"."EMPLOYEES" ("MANAGER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
--------------------------------------------------------
--  DDL for Index DEPT_LOCATION_IX
--------------------------------------------------------

  CREATE INDEX "HR"."DEPT_LOCATION_IX" ON "HR"."DEPARTMENTS" ("LOCATION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
--------------------------------------------------------
--  DDL for Index JHIST_EMP_ID_ST_DATE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."JHIST_EMP_ID_ST_DATE_PK" ON "HR"."JOB_HISTORY" ("EMPLOYEE_ID", "START_DATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
--------------------------------------------------------
--  DDL for Index SPORT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SPORT_PK" ON "HR"."SPORT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JHIST_DEPARTMENT_IX
--------------------------------------------------------

  CREATE INDEX "HR"."JHIST_DEPARTMENT_IX" ON "HR"."JOB_HISTORY" ("DEPARTMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
--------------------------------------------------------
--  DDL for Index COUNTRY_C_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."COUNTRY_C_ID_PK" ON "HR"."COUNTRIES" ("COUNTRY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
--------------------------------------------------------
--  DDL for Index JHIST_JOB_IX
--------------------------------------------------------

  CREATE INDEX "HR"."JHIST_JOB_IX" ON "HR"."JOB_HISTORY" ("JOB_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
--------------------------------------------------------
--  DDL for Index JHIST_EMPLOYEE_IX
--------------------------------------------------------

  CREATE INDEX "HR"."JHIST_EMPLOYEE_IX" ON "HR"."JOB_HISTORY" ("EMPLOYEE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
--------------------------------------------------------
--  DDL for Index EMP_JOB_IX
--------------------------------------------------------

  CREATE INDEX "HR"."EMP_JOB_IX" ON "HR"."EMPLOYEES" ("JOB_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
--------------------------------------------------------
--  DDL for Index LOC_CITY_IX
--------------------------------------------------------

  CREATE INDEX "HR"."LOC_CITY_IX" ON "HR"."LOCATIONS" ("CITY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
--------------------------------------------------------
--  DDL for Index JOB_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."JOB_ID_PK" ON "HR"."JOBS" ("JOB_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
--------------------------------------------------------
--  DDL for Index EMPLOYEE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."EMPLOYEE_PK" ON "HR"."EMPLOYEE" ("SSN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOC_STATE_PROVINCE_IX
--------------------------------------------------------

  CREATE INDEX "HR"."LOC_STATE_PROVINCE_IX" ON "HR"."LOCATIONS" ("STATE_PROVINCE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
--------------------------------------------------------
--  DDL for Index EMP_DEPARTMENT_IX
--------------------------------------------------------

  CREATE INDEX "HR"."EMP_DEPARTMENT_IX" ON "HR"."EMPLOYEES" ("DEPARTMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
--------------------------------------------------------
--  DDL for Index EMP_EMAIL_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."EMP_EMAIL_UK" ON "HR"."EMPLOYEES" ("EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
--------------------------------------------------------
--  DDL for Index EMP_NAME_IX
--------------------------------------------------------

  CREATE INDEX "HR"."EMP_NAME_IX" ON "HR"."EMPLOYEES" ("LAST_NAME", "FIRST_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
--------------------------------------------------------
--  DDL for Index EVENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."EVENT_PK" ON "HR"."EVENT" ("EV_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMPLOYEE_SPORT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."EMPLOYEE_SPORT_PK" ON "HR"."EMPLOYEE_SPORT" ("EMP_SSN", "SPR_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index REG_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."REG_ID_PK" ON "HR"."REGIONS" ("REGION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
--------------------------------------------------------
--  DDL for Index TRAINER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."TRAINER_PK" ON "HR"."TRAINER" ("TRAINER_SSN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMPLOYEE_MEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."EMPLOYEE_MEMBER_PK" ON "HR"."EMPLOYEE_MEMBER" ("EMP_SSN", "MBR_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MEMBER_PK" ON "HR"."MEMBER" ("M_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MEMBER_SPORT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MEMBER_SPORT_PK" ON "HR"."MEMBER_SPORT" ("MMB_ID", "SPR_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_EMP_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."EMP_EMP_ID_PK" ON "HR"."EMPLOYEES" ("EMPLOYEE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
--------------------------------------------------------
--  DDL for Index DEPT_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."DEPT_ID_PK" ON "HR"."DEPARTMENTS" ("DEPARTMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
--------------------------------------------------------
--  DDL for Index MEMBER_EVENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MEMBER_EVENT_PK" ON "HR"."MEMBER_EVENT" ("MBR_ID", "EVNT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index FLM_ACT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."FLM_ACT_PK" ON "HR"."FILMACTORS" ("FILMID", "ACTORID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MEMBER_TRIP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MEMBER_TRIP_PK" ON "HR"."MEMBER_TRIP" ("MEM_ID", "TRI_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOC_COUNTRY_IX
--------------------------------------------------------

  CREATE INDEX "HR"."LOC_COUNTRY_IX" ON "HR"."LOCATIONS" ("COUNTRY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;

--------------------------------------------------------
--  Ref Constraints for Table ASSIGN_TRAINER_SPORT
--------------------------------------------------------

  ALTER TABLE "HR"."ASSIGN_TRAINER_SPORT" ADD CONSTRAINT "ASSIGN_TRAINER_SPORT_SPOR_FK1" FOREIGN KEY ("SPORT_ID")
	  REFERENCES "HR"."SPORT" ("ID") ENABLE;
 
  ALTER TABLE "HR"."ASSIGN_TRAINER_SPORT" ADD CONSTRAINT "ASSIGN_TRAINER_SPORT_TRAI_FK1" FOREIGN KEY ("TRAINER_SSN")
	  REFERENCES "HR"."TRAINER" ("TRAINER_SSN") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COUNTRIES
--------------------------------------------------------

  ALTER TABLE "HR"."COUNTRIES" ADD CONSTRAINT "COUNTR_REG_FK" FOREIGN KEY ("REGION_ID")
	  REFERENCES "HR"."REGIONS" ("REGION_ID") ENABLE;
  GRANT SELECT, REFERENCES ON "HR"."COUNTRIES" TO "OE";
 

--------------------------------------------------------
--  Ref Constraints for Table DEPARTMENTS
--------------------------------------------------------

  ALTER TABLE "HR"."DEPARTMENTS" ADD CONSTRAINT "DEPT_LOC_FK" FOREIGN KEY ("LOCATION_ID")
	  REFERENCES "HR"."LOCATIONS" ("LOCATION_ID") ENABLE;
 
  ALTER TABLE "HR"."DEPARTMENTS" ADD CONSTRAINT "DEPT_MGR_FK" FOREIGN KEY ("MANAGER_ID")
	  REFERENCES "HR"."EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
  GRANT SELECT ON "HR"."DEPARTMENTS" TO "OE";
 


--------------------------------------------------------
--  Ref Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_DEPT_FK" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "HR"."DEPARTMENTS" ("DEPARTMENT_ID") ENABLE;
 
  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_JOB_FK" FOREIGN KEY ("JOB_ID")
	  REFERENCES "HR"."JOBS" ("JOB_ID") ENABLE;
 
  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_MANAGER_FK" FOREIGN KEY ("MANAGER_ID")
	  REFERENCES "HR"."EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
  GRANT SELECT, REFERENCES ON "HR"."EMPLOYEES" TO "OE";
 

--------------------------------------------------------
--  Ref Constraints for Table EMPLOYEE_MEMBER
--------------------------------------------------------

  ALTER TABLE "HR"."EMPLOYEE_MEMBER" ADD CONSTRAINT "EMPLOYEE_MEMBER_EMPLOYEE_FK1" FOREIGN KEY ("EMP_SSN")
	  REFERENCES "HR"."EMPLOYEE" ("SSN") ENABLE;
 
  ALTER TABLE "HR"."EMPLOYEE_MEMBER" ADD CONSTRAINT "EMPLOYEE_MEMBER_MEMBER_FK1" FOREIGN KEY ("MBR_ID")
	  REFERENCES "HR"."MEMBER" ("M_ID") ENABLE;


--------------------------------------------------------
--  Ref Constraints for Table FILMACTORS
--------------------------------------------------------

  ALTER TABLE "HR"."FILMACTORS" ADD FOREIGN KEY ("FILMID")
	  REFERENCES "HR"."FILMTITLES" ("FILMID") ENABLE;
 
  ALTER TABLE "HR"."FILMACTORS" ADD FOREIGN KEY ("ACTORID")
	  REFERENCES "HR"."ACTORS" ("ACTORID") ENABLE;

--------------------------------------------------------
--  Ref Constraints for Table FILMCOPIES
--------------------------------------------------------

  ALTER TABLE "HR"."FILMCOPIES" ADD FOREIGN KEY ("FILMID")
	  REFERENCES "HR"."FILMTITLES" ("FILMID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FILMTITLES
--------------------------------------------------------

  ALTER TABLE "HR"."FILMTITLES" ADD FOREIGN KEY ("FILMCATEGORYID")
	  REFERENCES "HR"."FILMCATEGORY" ("CATEGORYID") ON DELETE CASCADE ENABLE;

  GRANT SELECT ON "HR"."JOBS" TO "OE";
 

--------------------------------------------------------
--  Ref Constraints for Table JOB_HISTORY
--------------------------------------------------------

  ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_DEPT_FK" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "HR"."DEPARTMENTS" ("DEPARTMENT_ID") ENABLE;
 
  ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_EMP_FK" FOREIGN KEY ("EMPLOYEE_ID")
	  REFERENCES "HR"."EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
 
  ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_JOB_FK" FOREIGN KEY ("JOB_ID")
	  REFERENCES "HR"."JOBS" ("JOB_ID") ENABLE;
  GRANT SELECT ON "HR"."JOB_HISTORY" TO "OE";
 

--------------------------------------------------------
--  Ref Constraints for Table LOCATIONS
--------------------------------------------------------

  ALTER TABLE "HR"."LOCATIONS" ADD CONSTRAINT "LOC_C_ID_FK" FOREIGN KEY ("COUNTRY_ID")
	  REFERENCES "HR"."COUNTRIES" ("COUNTRY_ID") ENABLE;
  GRANT SELECT, REFERENCES ON "HR"."LOCATIONS" TO "OE";
 



--------------------------------------------------------
--  Ref Constraints for Table MEMBER_EVENT
--------------------------------------------------------

  ALTER TABLE "HR"."MEMBER_EVENT" ADD CONSTRAINT "MEMBER_EVENT_EVENT_FK1" FOREIGN KEY ("EVNT_ID")
	  REFERENCES "HR"."EVENT" ("EV_ID") ENABLE;
 
  ALTER TABLE "HR"."MEMBER_EVENT" ADD CONSTRAINT "MEMBER_EVENT_MEMBER_FK1" FOREIGN KEY ("MBR_ID")
	  REFERENCES "HR"."MEMBER" ("M_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MEMBER_SPORT
--------------------------------------------------------

  ALTER TABLE "HR"."MEMBER_SPORT" ADD CONSTRAINT "MEMBER_SPORT_MEMBER_FK1" FOREIGN KEY ("MMB_ID")
	  REFERENCES "HR"."MEMBER" ("M_ID") ENABLE;
 
  ALTER TABLE "HR"."MEMBER_SPORT" ADD CONSTRAINT "MEMBER_SPORT_SPORT_FK1" FOREIGN KEY ("SPR_ID")
	  REFERENCES "HR"."SPORT" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MEMBER_TRIP
--------------------------------------------------------

  ALTER TABLE "HR"."MEMBER_TRIP" ADD CONSTRAINT "MEMBER_TRIP_MEMBER_FK1" FOREIGN KEY ("MEM_ID")
	  REFERENCES "HR"."MEMBER" ("M_ID") ENABLE;
 
  ALTER TABLE "HR"."MEMBER_TRIP" ADD CONSTRAINT "MEMBER_TRIP_TRIPS_FK1" FOREIGN KEY ("TRI_ID")
	  REFERENCES "HR"."TRIPS" ("TRIP_ID") ENABLE;


--------------------------------------------------------
--  Ref Constraints for Table SPORT
--------------------------------------------------------

  ALTER TABLE "HR"."SPORT" ADD CONSTRAINT "SPORT_TRAINER" FOREIGN KEY ("TRA_SSN")
	  REFERENCES "HR"."TRAINER" ("TRAINER_SSN") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SPORT_TIME
--------------------------------------------------------

  ALTER TABLE "HR"."SPORT_TIME" ADD CONSTRAINT "SPORT_TIME_SPORT_FK1" FOREIGN KEY ("SPR_ID")
	  REFERENCES "HR"."SPORT" ("ID") ENABLE;


--------------------------------------------------------
--  Ref Constraints for Table TRAINER_SPORT
--------------------------------------------------------

  ALTER TABLE "HR"."TRAINER_SPORT" ADD CONSTRAINT "EMPLOYEE_SPORT_EMPLOYEE_FK1" FOREIGN KEY ("TRAINER_SSN")
	  REFERENCES "HR"."TRAINER" ("TRAINER_SSN") ENABLE;
 
  ALTER TABLE "HR"."TRAINER_SPORT" ADD CONSTRAINT "EMPLOYEE_SPORT_SPORT_FK1" FOREIGN KEY ("SPR_ID")
	  REFERENCES "HR"."SPORT" ("ID") ENABLE;

--------------------------------------------------------
--  DDL for Trigger SECURE_EMPLOYEES
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HR"."SECURE_EMPLOYEES" 
  BEFORE INSERT OR UPDATE OR DELETE ON employees
BEGIN
  secure_dml;
END secure_employees;
/
ALTER TRIGGER "HR"."SECURE_EMPLOYEES" DISABLE;
--------------------------------------------------------
--  DDL for Trigger UPDATE_JOB_HISTORY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HR"."UPDATE_JOB_HISTORY" 
  AFTER UPDATE OF job_id, department_id ON employees
  FOR EACH ROW
BEGIN
  add_job_history(:old.employee_id, :old.hire_date, sysdate,
                  :old.job_id, :old.department_id);
END;
/
ALTER TRIGGER "HR"."UPDATE_JOB_HISTORY" ENABLE;
--------------------------------------------------------
--  DDL for View EMP_DETAILS_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "HR"."EMP_DETAILS_VIEW" ("EMPLOYEE_ID", "JOB_ID", "MANAGER_ID", "DEPARTMENT_ID", "LOCATION_ID", "COUNTRY_ID", "FIRST_NAME", "LAST_NAME", "SALARY", "COMMISSION_PCT", "DEPARTMENT_NAME", "JOB_TITLE", "CITY", "STATE_PROVINCE", "COUNTRY_NAME", "REGION_NAME") AS 
  SELECT
  e.employee_id,
  e.job_id,
  e.manager_id,
  e.department_id,
  d.location_id,
  l.country_id,
  e.first_name,
  e.last_name,
  e.salary,
  e.commission_pct,
  d.department_name,
  j.job_title,
  l.city,
  l.state_province,
  c.country_name,
  r.region_name
FROM
  employees e,
  departments d,
  jobs j,
  locations l,
  countries c,
  regions r
WHERE e.department_id = d.department_id
  AND d.location_id = l.location_id
  AND l.country_id = c.country_id
  AND c.region_id = r.region_id
  AND j.job_id = e.job_id
WITH READ ONLY;
--------------------------------------------------------
--  DDL for Procedure ADD_JOB_HISTORY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."ADD_JOB_HISTORY" 
  (  p_emp_id          job_history.employee_id%type
   , p_start_date      job_history.start_date%type
   , p_end_date        job_history.end_date%type
   , p_job_id          job_history.job_id%type
   , p_department_id   job_history.department_id%type
   )
IS
BEGIN
  INSERT INTO job_history (employee_id, start_date, end_date,
                           job_id, department_id)
    VALUES(p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id);
END add_job_history;

/

--------------------------------------------------------
--  DDL for Procedure ALLSPORTS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."ALLSPORTS" (cid out sys_refcursor)
as
begin
open cid for
select s.name from sport s
where s.id>=0;
end;

/

--------------------------------------------------------
--  DDL for Procedure CHECKID
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."CHECKID" (idd in varchar2 , pass in varchar2 , n out number)
AS
n_count NUMBER;
BEGIN
select count( *) into n_count
from member
where m_id = idd and m_password = pass;
 if n_count>0 then
 n := 1;
 else n:=0;
 end if;
END ;

/

--------------------------------------------------------
--  DDL for Procedure CHECKID_EMPLOYEE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."CHECKID_EMPLOYEE" (idd in varchar2 , pass in varchar2 , n out number)
AS
n_count NUMBER;
BEGIN
select count(*) into n_count
from employee
where employee.ssn = idd and employee.password = pass;
 if n_count>0 then
 n := 1;
 else n:=0;
 end if;
  
END ;

/

--------------------------------------------------------
--  DDL for Procedure SECURE_DML
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."SECURE_DML" 
IS
BEGIN
  IF TO_CHAR (SYSDATE, 'HH24:MI') NOT BETWEEN '08:00' AND '18:00'
        OR TO_CHAR (SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
	RAISE_APPLICATION_ERROR (-20205,
		'You may only make changes during normal office hours');
  END IF;
END secure_dml;

/

