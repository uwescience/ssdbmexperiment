--.stats on
.timer on
.echo on
.mode tabs

-- =================
-- 1) Load Data
-- =================

drop table if exists gene_cassette;

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


