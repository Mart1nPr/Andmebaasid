-- create_procedure_transfer.sql

DELIMITER $$

CREATE  PROCEDURE transfer(in debaccount bigint, in creaccount bigint,
    in summa decimal(10,2), in refnumber bigint, in description varchar(256))
begin
declare exit handler for sqlexception
begin

   get diagnostics condition 1 @sqlstate = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;

   set @full_error = concat('ERROR: ', @errno, " (", @sqlstate, "): ", @text);
   rollback;
   insert into log (msg) values (concat(debaccount, ' ', creaccount, ' makse ebaõnnestus'));
   insert into log (msg) values (@full_error);
end;

start transaction;
	update account set balance = balance - summa where accountNr = debaccount;
    update account set balance = balance + summa where accountNr = creaccount;
    
    insert into transaction (debitaccount, creditaccount, description, referencenumber, amount)
    values (debaccount, creaccount, description, refnumber, summa);
commit;

end$$

DELIMITER ;

