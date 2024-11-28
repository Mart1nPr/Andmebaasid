-- create_trigger_acd.sql

use banka;

delimiter $$
create trigger after_customer_delete
after delete
on customer for each row
begin 
	insert into audit(tablename, Intid, operation) values ("CUSTOMER", old.idkood, "DEL", user());
end$$

delimiter ;
