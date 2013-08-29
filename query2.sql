.separator ' '
--.stats on
.timer on
.echo on
.mode tabs

-- reset everything
drop table if exists q2_solution;
drop view if exists q2;
drop view if exists two_or_more;
drop view if exists less_than_two;
drop view if exists all_matches;

-- Create a view that will find all cassettes 
-- that share at least one property with the given cassette id
-- This is not materializing the results; it's just a 
-- logical abstraction for clarity
create view all_matches as 
select g2.cassetteId, g2.property
  from gene_cassette g1, gene_cassette g2
   -- the given cassette id
 where g1.cassetteId = 64963308100052
   -- we don't want to find ourselves
   and g2.cassetteId != 64963308100052
   and g1.property = g2.property;

-- Now find only those cassettes
-- that match two or more (distinct) properties.
-- This is just the cassettes, so it's not the final answer.
-- Again, this is not materializing anything; it's just a 
-- logical abstraction for clarity.

create view two_or_more as
 select cassetteId
   from all_matches
group by cassetteId
 having count(distinct property) >= 2;

-- Now find everything in all_matches
-- that is in two_or_more
-- That is, find all cassettes, with their properties, 
-- that share at least two properties with the query cassette
-- No work has been done at this point; it's just a view
create view q2 as
select * 
  from all_matches
 where cassetteId in two_or_more;
-- in two_or_more;

-- Now we actually compute the result and put it in a new table for verification.
create table q2_solution as select * from q2;

