---------list indexes in a particular schema in postgres

select * from pg_indexes 
where schemaname ='public';
----- you can put tablename insttead of schemaname when you need indexes associated to a table only

eg: select * from pg_indexes 
where tablename ='sec_role';

______________________________________________________________________________________________________________

-----select the size of index on a particular table

select pg_size_pretty(pg_indexes_size('acc_transaction_detail'));

--------------------------------------------------------------------

--- you can check all about indexes statistics from pg_stat_all_indexes


select * from pg_stat_all_indexes ;

--- for a particular schema

select * from pg_stat_all_indexes 

where schemaname ='public';


---------------- for a particular table

select * from pg_stat_all_indexes 
where relname ='op_operation';


