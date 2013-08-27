
.echo on

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
