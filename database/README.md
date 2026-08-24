# PostgreSQL Database

This directory contains the reproducible PostgreSQL database used for the FIFA World Cup Evolution Analytics project.

## Database file

[`fifa_world_cup_database(1994 - 2026).sql`](fifa_world_cup_database(1994%20-%202026).sql)

The SQL dump contains the project schema, relationships, analytical views and underlying project data used across the 1994–2026 analysis.

## Restore in PostgreSQL

### Using pgAdmin
1. Create an empty PostgreSQL database, for example `fifa_world_cup`.
2. Open **Query Tool** for the new database.
3. Open `fifa_world_cup_database(1994 - 2026).sql`.
4. Execute the script.
5. Refresh the database objects after completion.

### Using psql
```bash
createdb fifa_world_cup
psql -d fifa_world_cup -f "fifa_world_cup_database(1994 - 2026).sql"
```

If your local PostgreSQL role differs from the role recorded in the original pgAdmin dump, remove or replace `OWNER TO postgres` statements before restoring.

## Reproducibility

The database is provided so another analyst can inspect the relational model, reproduce the SQL analysis and connect the resulting tables/views to a BI tool.

## Attribution

Project and analysis: **Ibraheem Ibraheem (Bleezysmart)**.

Underlying third-party/FIFA tournament information remains attributable to its respective original sources. The project attribution applies to the database compilation, analytical structure, transformations, SQL work, documentation and original analysis.