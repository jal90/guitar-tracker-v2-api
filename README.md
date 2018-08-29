## API for Guitar Tracker v2

Still under development.

The presence of a Setup model lets users save a 'history' of their guitar. Big
change over v1 where setup information was stored on the guitar model, so updating information would delete the old information.

Including pg_search for users convenience and also for fuzzy matching existing
records to avoid data duplication (under development). When users create a new guitar for themselves,
the goal is to check that entry against existing guitars in the db,
and pg_search will help smoothen out spelling mistakes and small differences.

Future iterations may see further etrapolating of data into different tables,
for instance string brand and string gauges, since many values will be the same
for many users. Having an indexed table of those values could help performance and also create possibilities to write logic that shows the most common setups
for a certain guitar, and cleanly more information about strings, since even
in the same brand and same gauge, manufacturers have different ways of iterating
over that gauge. One number for gauge doesn't tell the whole story. Including
different makes of a brand's strings would give a more complete picture.

### ERD:
![ERD](https://i.imgur.com/cisLfpf.png)

Link to client: https://github.com/jal90/guitar-tracker-v2-client
