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
select "DELL", a.* from dell_daily_data a
union all
select "IBM", b.* from ibm_daily_data b
union all
select "INTC", c.* from intc_daily_data c
union all
select "MSFT", d.* from msft_daily_data d
union all
select "SONY", e.* from sony_daily_data e
union all
select "VZ", f.* from vz_daily_data f;

select * from All_daily_data;




select * from all_daily_data;
