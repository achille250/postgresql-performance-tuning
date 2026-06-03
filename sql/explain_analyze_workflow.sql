-- Query optimization workflow with EXPLAIN ANALYZE

-- 1. Enable timing (session)
SET track_io_timing = on;

-- 2. Analyze a slow query (replace with your SQL)
EXPLAIN (ANALYZE, BUFFERS, VERBOSE, FORMAT TEXT)
SELECT /* your query here */;

-- 3. Find missing index candidates (high sequential scans)
SELECT schemaname, relname, seq_scan, seq_tup_read, idx_scan,
       seq_tup_read / NULLIF(seq_scan, 0) AS avg_seq_read
FROM pg_stat_user_tables
WHERE seq_scan > 100
ORDER BY seq_tup_read DESC
LIMIT 20;

-- 4. Unused indexes (candidates to drop after review)
SELECT schemaname, indexrelname, idx_scan, pg_size_pretty(pg_relation_size(indexrelid))
FROM pg_stat_user_indexes
WHERE idx_scan = 0 AND schemaname NOT IN ('pg_catalog', 'information_schema')
ORDER BY pg_relation_size(indexrelid) DESC;
