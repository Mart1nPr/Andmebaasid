create database stock;
use stock;

drop table daily_data;

create table DELL_daily_data (
Date date,
Open float,
High float,
Close float,
Low float,
Adj_Close float,
Volume int
);

select * from DELL_daily_data;

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

select * from IBM_daily_data;

create table MSFT_daily_data (
Date date,
Open float,
High float,
Close float,
Low float,
Adj_Close float,
Volume float
);

select * from MSFT_daily_data;

create table SONY_daily_data (
Date date,
Open float,
High float,
Close float,
Low float,
Adj_Close float,
Volume float
);

select * from SONY_daily_data;

create table VZ_daily_data (
Date date,
Open float,
High float,
Close float,
Low float,
Adj_Close float,
Volume float
);

select * from VZ_daily_data;

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

select * from stock.all_daily_data;
