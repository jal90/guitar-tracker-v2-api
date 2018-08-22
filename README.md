API for Guitar Tracker v2

Still under development.

The presence of a Setup model lets users save a 'history' of their guitar. Big
change over v1 where updating information would delete the old information.

Currently in the process of creating a join table b/t User and Guitar to avoid
data duplication. This also creates possibilities of calculating most common years
or average price of guitar models between users.

Including pg_search for users convenience and also for fuzzy matching existing
records to avoid data duplication. When users create a new guitar for themselves,
the goal is to check that entry against existing guitars in the db,
and pg_search will help smoothen out spelling mistakes and small differences.

Future iterations may see further etrapolating of data into different tables,
for instance string brand and string gauges, since many values will be the same
for many users, having an indexed table of those values would help performance.

This would also create possibilities to write logic that shows the most common setups
for a certain guitar, and cleanly add more information about strings, since even
in the same brand and same gauge, manufacturers have different ways of iterating
over that gauge. One number for gauge doesn't tell the whole story. Including
different makes of a brand's strings would give a more complete picture. 
