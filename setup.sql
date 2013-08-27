
-- =================
-- 1) Load Data
-- =================
-- Create the table to hold the original data
create table gene_cassette (
 property string,
 geneId int,
 cassetteId int,
 ScaffoldId int,
 TaxonId int
);

.separator "\t"

-- Load the data.  
-- This file is just the original data with the initial comment removed
.import "gene_cassette_dump.COG.PFAM.tbl.no_comments" gene_cassette

-- =================
-- 2) Create Indexes
-- =================
-- These two steps take a while, but they only need to be done once, ever
-- These indexes will be automatically maintained
-- as new data is entered.

-- Create an index on the property column
create index cassette_idx_prop on gene_cassette(property);

-- Create an index on the cassetteId column
create index cassette_idx_cassette on gene_cassette(cassetteId);


-- =================
-- 3) Load the results
-- =================
-- We only need this to verify our answers

-- First, we ran reformat_solution.py to create the file query2.out.tuples.
-- The result file is just query.out reorganized 
-- as (cassette, property) pairs.  

create table q2_correct(
  cassette int, 
  prop string
);

-- now import the results.  This is the "answer" table.
.import "query2.out.tuples" q2_correct
