create database stock;
use stock;

create table DELL_daily_data (
Date date,
Open float,
High float,
Close float,
Low float,
Adj_Close float,
Volume int
);

create table IBM_daily_data (
Date date,
Open float,
High float,
Close float,
Low float,
Adj_Close float,
Volume float
);

select * from IBM_daily_data;

create table INTC_daily_data (
Date date,
Open float,
High float,
Close float,
Low float,
Adj_Close float,
Volume float
);

create table MSFT_daily_data (
Date date,
Open float,
High float,
Close float,
Low float,
Adj_Close float,
Volume float
);

create table SONY_daily_data (
Date date,
Open float,
High float,
Close float,
Low float,
Adj_Close float,
Volume float
);

create table VZ_daily_data (
Date date,
Open float,
High float,
Close float,
Low float,
Adj_Close float,
Volume float
);

CREATE TABLE daily_data (
Date DATE,
Open FLOAT,
High FLOAT,
Close FLOAT,
Low FLOAT,
Adj_Close FLOAT,
Volume FLOAT,
Company VARCHAR(50)
);

drop table daily_data;

select * from daily_data;

CREATE VIEW All_daily_data AS
SELECT 'DELL' AS Company, a.* FROM DELL_daily_data a
UNION ALL
SELECT 'IBM' AS Company, b.* FROM IBM_daily_data b
UNION ALL
SELECT 'INTC' AS Company, c.* FROM INTC_daily_data c
UNION ALL
SELECT 'MSFT' AS Company, d.* FROM MSFT_daily_data d
UNION ALL
SELECT 'SONY' AS Company, e.* FROM SONY_daily_data e
UNION ALL
SELECT 'VZ' AS Company, f.* FROM VZ_daily_data f;

select * from All_daily_data;

INSERT INTO daily_data (Date, Open, High, Low, Close, Adj_Close, Volume, Company)
SELECT Date, Open, High, Low, Close, Adj_Close, Volume, Company FROM All_daily_data;

select company, count(*) from daily_data group by company;
