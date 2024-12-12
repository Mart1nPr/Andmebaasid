use `rimi-database`;

-- Select käsud
select * from `rimi-database`.order;
select * from `rimi-database`.store;
select * from `rimi-database`.customer;
select * from `rimi-database`.address;


-- Creating views
-- Vaade order_paymentmethods – väljastab tellimuste arvu iga maksetüübi kohta (paymentmethod)
create or replace view order_paymentmethods as
select paymentmethod, count(*) as order_count
from `rimi-database`.order
group by paymentmethod;

-- Vaade order_status - väljastab tellimuste arvu iga tellimuse staatuse kohta
create or replace view order_status as
select status, count(*) as order_count
from `rimi-database`.order
group by status;

-- Vaade customer_firstnames – väljastab eesnime (firstname) ning eesnime kordumiste arvu
create or replace view customer_firstnames as
select firstname, count(*) as firstname_count
from `rimi-database`.customer
group by firstname;

-- Vaade customer_order_addresses – väljastab order tabelist orderi id, customer tabelist firstname ja lastname ning address tabelist street_line_1, city, state.
create or replace view customer_order_addresses as
select o.id as orderid,
       c.firstname,
       c.lastname,
       a.street_line_1 as street,
       a.city,
       a.state
from `rimi-database`.order o
join `rimi-database`.customer c on o.customerid = c.id
join `rimi-database`.store s on o.storeid = s.id
join `rimi-database`.address a on s.addressid = a.id;

-- Vaade customer_state_count. Päring väljastab, mitu korda mingi maakonna elanikud on tellimusi teinud. Kasutada tuleb vaadet customer_order_addresses.
create or replace view customer_state_count as
select state, count(*) as order_count
from customer_order_addresses
group by state;

-- Vaade store_order_addresses (lisatud enne store_customer_count vaate loomist)
create or replace view store_order_addresses as
select o.storeid, 
       a.state
from `rimi-database`.order o
join `rimi-database`.store s on o.storeid = s.id
join `rimi-database`.address a on s.addressid = a.id;

-- Vaade store_customer_count. See väljastab info, et millistes maakondades milliste maakondade ostjad on oste sooritanud – vaates olgu väljad: store_state, customer_state, count.
create or replace view store_customer_count as
select soa.state as store_state, 
       csa.state as customer_state,
       count(*) as order_count
from store_order_addresses soa
join customer_order_addresses csa on soa.state = csa.state
group by soa.state, csa.state;

-- Vaade customer_citys_count. Päring väljastab, mitu korda mingi linna elanikud on tellimusi teinud. Kasutada tuleb vaadet customer_order_addresses.
create or replace view customer_citys_count as
select city, count(*) as order_count
from customer_order_addresses
group by city;

-- Vaade customer_count. Leidke iga kliendi kohta, mitme tellimuse eest on ta maksnud. Väljastage kliendi ees- ja perekonnanimi ning tellimuste arv, mille status on ’paid’.
create or replace view customer_count as
select c.firstname, c.lastname, count(*) as paid_order_count
from `rimi-database`.customer c
join `rimi-database`.order o on c.id = o.customerid
where o.status = 'paid'
group by c.firstname, c.lastname;


