
.echo on

-- We only need to do this to verify our answers

-- First, we ran reformat_solution.py to create the file query2.out.tuples.
-- The result file is just query.out reorganized 
-- as (cassette, property) pairs.  

drop table if exists q2_correct;

create table q2_correct(
  cassette int, 
  prop string
);

-- now import the results.  This is the "answer" table.
.separator ' '
.import "query2.out.tuples" q2_correct

-- Find everything in db solution that is not in the correct solution
-- Should return nothing
select cassetteId, property, count(*) from q2_solution group by cassetteId, property
except 
select cassette, prop, count(*) from q2_correct group by cassette, prop;

-- Find everything in correct solution that is not in the db solution
-- Should return nothing
select cassette, prop, count(*) from q2_correct group by cassette, prop
except 
select cassetteId, property, count(*) from q2_solution group by cassetteId, property;


-- Dump the results for direct comparison with the file.
.echo off
.mode csv
.separator ' '
.out query2.sql.out.tuples
select * from q2_solution;
