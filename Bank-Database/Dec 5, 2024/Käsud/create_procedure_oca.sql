-- create_procedure_oca.sql

delimiter $$$

create procedure open_current_account()
begin
    declare ac_count int;
    declare id_code bigint;
    declare ac_code bigint;
    declare done boolean default false;
    declare cur CURSOR for select idkood from customer;
    declare continue handler 
        for not found set done = True;
        
	open cur;
    
    read_loop: loop 
    
       fetch cur into id_code;
       if done THEN
           leave read_loop;
       end if;
    
       select count(*) into ac_count from account where customerid = id_code and accountcodeId = 'ARVELD';
       select max(accountNr) + 1 into ac_code from account;
       if ac_count = 0 then
	     insert into account (accountNr, customerid, accountcodeId, balance) values (ac_code, id_code, 'ARVELD', 0);
       end if;
    end loop;
    
	close cur;
    
end$$$

delimiter ;
