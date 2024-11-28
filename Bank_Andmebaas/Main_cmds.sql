-- Main_cmnds.sql

create database banka;
use banka;

-- Alter table
alter table audit add column user varchar(255);
alter table customer add address varchar(256);
alter table account modify balance decimal(12,2) not null;
alter table transaction add amount decimal(12,2) not null;

-- Show triggers
show triggers;

-- Select * from
select * from banka.account where balance <> 0;
select * from banka.customer;
select * from banka.transaction;
select * from banka.account;
select * from balance_history;
select* from banka.accounttype;
select * from banka.audit;
select * from banka.customertype;
select * from banka.ourcustomers;
select * from banka.log;
select * from banka.account where customerid = 3333;
SELECT DATE_SUB(NOW(), INTERVAL 2 YEAR);

-- Delete
delete from ourcustomers where is_married = '';
drop trigger after_account_update;

-- Grant access to yllar
create user yllar identified by 'yller123';
grant all on *.* to yllar;

-- Insert
insert into customer (idkood, name, birthdate, residency, customertype, address) select idkood, concat(first_name, ' ', last_name), DATE_SUB(now(), INTERVAL age YEAR), 
'EST',  type, concat(address1, ' ', address2, ' ', address3) from ourcustomers;
insert into accounttype (code, description, neginterestrate, posinterestrate) values ("OMAKAP", "Omakapital", 0, 0);
insert into accounttype (code, description, neginterestrate, posinterestrate) values ("SULARA", "sularaha konto", 0, 0);
insert into customertype (code, description, discount) values ("MEIE", "Meie pank", 0);
insert into customer(idkood, name, birthdate, residency, customertype, address) values ("12222", "Meie pank", "2024-11-28", "EST", "Meie", "Tallinn");
insert into account(accountNr, AccountcodeID, customerid, Balance) values ("1", "OMAKAP", "12222", 0);
insert into account(accountNr, AccountcodeID, customerid, Balance) values ("2", "OMAKAP", "12222", 0);
insert into banka.customer values ("3334","Martin Pruus", "2006-12-28", "EST", "TAVA", "Tallinn");

-- Calls
call transfer (1, 2, 2000000, 1234, "Panga esimene sissemakse");
call transfer (2, 10001, 3000, 1234, "Kliendi sissemakse");
call open_current_account();
call transfer (2, 3334, 1500, 1234, "Minu sissemakse");

-- Create table
create table log(
	id bigint unsigned not null auto_increment,
    msg varchar(252),
    create_at datetime default current_timestamp,
    primary key(id)
); 

create table balance_history (
	id bigint unsigned not null auto_increment,
    accountNr bigint unsigned not null,
    balance decimal(12,2) not null,
    create_at datetime default current_timestamp,
    
    primary key(id)
);
