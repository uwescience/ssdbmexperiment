.separator ' '
--.stats on
.timer on
.echo on
.mode tabs

-- reset everything
drop table q2_solution;
drop view q2;
drop view two_or_more;
drop view less_than_two;
drop view all_matches;

-- Create a view that will find all cassettes 
-- that share at least one property with the given cassette id
-- This is not materializing the results; it's just a logical abstraction for clarity
create view all_matches as 
select g2.cassetteId, g2.property
  from gene_cassette g1, gene_cassette g2
   -- the given cassette id
 where g1.cassetteId = 64963308100052
   -- we don't want to find ourselves
   and g2.cassetteId != 64963308100052
   and g1.property = g2.property;

-- Now find only those cassettes
-- that match exactly one property
-- We will filter these out in the next step, because
-- we only want pairs of cassettes that share 2 or more properties
-- Again, this is not materializing anything; it's just a logical abstraction for clarity
create view less_than_two as
 select cassetteId
   from all_matches
group by cassetteId
 having count(distinct property) = 1;

create view two_or_more as
 select cassetteId
   from all_matches
group by cassetteId
 having count(distinct property) >= 2;

-- Now find everything in all_matches
-- that is not in less_than_two
-- That is, find all pairs that share at least two properties
-- No work has been done at this point; it's just a view
create view q2 as
select * 
  from all_matches
 where cassetteId not in less_than_two;
-- in two_or_more;

-- No work has been done yet.  
-- Now compute the result and put it in a new table.
create table q2_solution as select * from q2;

