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

create view All_daily_data as
select * from dell_daily_data
union all
select * from IBM_daily_data
union all
select * from INTC_daily_data
union all
select * from MSFT_daily_data
union all
select * from SONY_daily_data
union all 
select * from VZ_daily_data;

select * from all_daily_data;
