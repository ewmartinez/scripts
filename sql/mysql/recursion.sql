with recursive cte as (
      select t.*
      from table_name t
      where t.unique_id = 55544
      union all
      select t.*
      from cte join
           table_name t
           on cte.id = t.reference_id
     )
select *
from cte;

select @ref:=id as id, unique_id, reference_id
from mytable
join (select @ref:=id from mytable WHERE unique_id = 55544)tmp
where reference_id=@ref


--------------------------------------------------------------------------
CREATE TABLE mytable (
    id INT,
    unique_id varchar(20),
    reference_id varchar(20)
);

INSERT INTO mytable(id,unique_id,reference_id) VALUES (43,55544,NULL);
INSERT INTO mytable(id,unique_id,reference_id) VALUES (45,45454,43);
INSERT INTO mytable(id,unique_id,reference_id) VALUES (66,55655,45);
INSERT INTO mytable(id,unique_id,reference_id) VALUES (78,88877,66);
INSERT INTO mytable(id,unique_id,reference_id) VALUES (99,454,33);

select @ref:=id as id, unique_id, reference_id
from mytable
join (select @ref:=id from mytable WHERE unique_id = 55544)tmp
where reference_id=@ref or unique_id = 55544
--------------------------------------------------------------------------
CREATE TABLE mytable (
    name varchar(20),
    id INT,
    id_parent INT
);

INSERT INTO mytable(name,id,id_parent) VALUES ('Food', 0,-1);
INSERT INTO mytable(name,id,id_parent) VALUES ('Pizza', 1,0);
INSERT INTO mytable(name,id,id_parent) VALUES ('Pasta', 2,0);
INSERT INTO mytable(name,id,id_parent) VALUES ('Pasta with Tomato', 3,2);
--------------------------------------------------------------------------


