
CREATE TABLE HR.Certifications
(
  empid           INT          NOT NULL,
  certificationname        NVARCHAR(40) NOT NULL,
  dateofcertification       DATE         NOT NULL,
  annualrenewaldate        DATE         NOT NULL,
  traininghours           INT          NULL,
  CONSTRAINT FK_Certifications FOREIGN KEY(empid)
  REFERENCES HR.Employees(empid),
  CONSTRAINT CHK_dateofcertification CHECK(dateofcertification <= CAST(SYSDATETIME() AS DATE))
);


-- Populate table HR.Certifications


INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(1,'The Walking dead','2021-08-21','2023-08-20',24);
INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(1,'All of us are dead','2021-09-02','2023-09-01',24);
INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(1,'Black Summer','2021-07-01','2023-06-30',24);
INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(1,'iZombie','2021-06-11','2023-06-10',24);
INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(1,'Fear The Walking dead','2021-05-31','2023-05-30',24);
INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(2,'The Walking dead','2021-08-21','2023-08-20',24);
INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(2,'All of us are dead','2021-09-02','2023-09-01',24);
INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(2,'Black Summer','2021-07-01','2023-06-30',24);
INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(2,'iZombie','2021-06-11','2023-06-10',24);
INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(2,'Fear The Walking dead','2021-05-31','2023-05-30',24);
INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(3,'The Walking dead','2021-08-21','2023-08-20',24);
INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(3,'All of us are dead','2021-09-02','2023-09-01',24);
INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(3,'Black Summer','2021-07-01','2023-06-30',24);
INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(3,'iZombie','2021-06-11','2023-06-10',24);
INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(3,'Fear The Walking dead','2021-05-31','2023-05-30',24);
INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(7,'The Walking dead','2021-08-21','2023-08-20',24);
INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(7,'All of us are dead','2021-09-02','2023-09-01',24);
INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(7,'Black Summer','2021-07-01','2023-06-30',24);
INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(7,'iZombie','2021-06-11','2023-06-10',24);
INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(7,'Fear The Walking dead','2021-05-31','2023-05-30',24);
INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(9,'The Walking dead','2021-08-21','2023-08-20',24);
INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(9,'All of us are dead','2021-09-02','2023-09-01',24);
INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(9,'Black Summer','2021-07-01','2023-06-30',24);
INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(9,'iZombie','2021-06-11','2023-06-10',24);
INSERT INTO HR.Certifications(empid,certificationname,dateofcertification,annualrenewaldate,traininghours)
VALUES(9,'Fear The Walking dead','2021-05-31','2023-05-30',24);
select * from HR.Certifications;
