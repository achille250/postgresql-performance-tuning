# PostgreSQL Performance Tuning

Query optimization, **EXPLAIN ANALYZE** workflows, index analysis, connection diagnostics, and monitoring view patterns for high-volume transactional databases.

**Author:** [Achille Cesar Ntwali](https://github.com/achille250) · Kigali, Rwanda

---

## Overview

Operational SQL and examples used to diagnose slow queries, unused indexes, connection pressure, and schema-level constraints on large ERP/CBS-style PostgreSQL schemas.

---

## Repository structure

```
postgresql-performance-tuning/
├── sql/
│   ├── explain_analyze_workflow.sql    # EXPLAIN, seq scans, unused indexes
│   ├── index_analysis_queries.sql      # pg_indexes, pg_stat_all_indexes, sizes
│   ├── connection_activity.sql         # Sessions, max_connections, idle terminate
│   ├── monitoring_views_examples.txt   # Module monitoring view patterns
│   └── views.txt                       # Additional view definitions
└── examples/
    └── ACCOUNTING_MODULE_CONSTRAINTS.sql  # FK/CHECK constraint patterns (ERP schema)
```

---

## Quick start

### Find connection pressure

```sql
\i sql/connection_activity.sql
```

### Index health

```sql
\i sql/index_analysis_queries.sql
```

### Optimize a slow query

```sql
\i sql/explain_analyze_workflow.sql
-- Replace placeholder query with your SQL
EXPLAIN (ANALYZE, BUFFERS, VERBOSE) SELECT ...;
```

### Review constraint impact on plans

See `examples/ACCOUNTING_MODULE_CONSTRAINTS.sql` for real-world constraint naming and module boundaries.

---

## Tuning workflow

1. Identify slow queries (`pg_stat_statements` or logs)
2. Run `EXPLAIN (ANALYZE, BUFFERS)`
3. Check sequential scans vs index scans (`explain_analyze_workflow.sql`)
4. Add or drop indexes after validation on UAT
5. Re-run `ANALYZE` on affected tables

---

## Related repositories

| Repo | Focus |
|------|--------|
| [postgresql-monitoring-stack](https://github.com/achille250/postgresql-monitoring-stack) | Prometheus, pgBadger |
| [postgresql-ha-replication](https://github.com/achille250/postgresql-ha-replication) | Replication lag SQL |
| [postgresql-data-migration](https://github.com/achille250/postgresql-data-migration) | Bulk data moves |