-- create_trigger_acu.sql

use banka;

delimiter $$
create trigger after_account_update
after update
on account for each row
begin 
	if old.balance = new.balance then
		insert into audit(tablename, Intid, user) values ("ACCOUNT", new.accountNr, "UPD", user());
    else 
		insert into audit(accountnr, balance) values (new.accountnr, old.balance);
	end if;
end$$

delimiter ;



