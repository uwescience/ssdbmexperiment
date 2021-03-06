
0) Background
-----------------

These scripts compute query 2 from the paper below on a test dataset provided by the authors.  The solution is implemented in SQL using the single-threaded relational database, sqlite.

The context is this paper:
"Accelerating Gene Context Analysis Using Bitmaps," Alex Romosan, Arie Shoshani, Kesheng Wu, Victor Markowitz, Kostas Mavrommatis, SSDBM 2013

The motivation is to measure the performance of a straightforward relational implementation.

These scripts depend on two files that are not provided -- contact the authors to obtain them.  These files are:
 1. "gene_cassette_dump.COG.PFAM.tbl.gz" (the input data)
 2. "query2.out" (the expected answer) 

1) Setup
-----------------

    $ gunzip gene_cassette_dump.COG.PFAM.tbl.gz
    $ tail +2 gene_cassette_dump.COG.PFAM.tbl > gene_cassette_dump.COG.PFAM.tbl.no_comments
    $ sqlite3 genome.db < setup.sql

See [setup.sql](setup.sql) for details.

2) Run Query 2
-----------------

    $ sqlite3 genome.db < query2.sql

See [query2.sql](query2.sql) for deails.

The timing will be reported automatically.

3) Verify results
-----------------

    $ python reformat_solution.py
    $ sqlite3 genome.db < verify.sql

See [verify.sql](verify.sql) for details.

The queries should return no results.
