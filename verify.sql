
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
select * from q2_solution
except 
select * from q2_correct;

-- Find everything in correct solution that is not in the db solution
-- Should return nothing
select * from q2_correct 
except 
select * from q2_solution;
