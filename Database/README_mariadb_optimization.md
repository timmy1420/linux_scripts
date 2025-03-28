https://chatgpt.com/c/66dfb8ed-71b4-8008-9e39-7cbf5d84b13d


# MariaDB Optimization Guide for AWS Lightsail (4vCPU, 16GB RAM)

## Configuration Settings Overview

This guide provides optimized settings for a MariaDB instance running on AWS Lightsail with 4vCPU and 16GB RAM.

### 1. innodb_buffer_pool_size
Adjust the InnoDB buffer pool to hold most active data in memory, set around 70-80% of your total RAM.
```ini
innodb_buffer_pool_size = 12G
innodb_buffer_pool_instances = 8
```

### 2. innodb_log_file_size & innodb_flush_log_at_trx_commit
Increase log file size to reduce write contention and adjust log flushing for better performance.
```ini
innodb_log_file_size = 1G
innodb_flush_log_at_trx_commit = 2
```

### 3. thread_pool_size
Enabling thread pooling for better CPU utilization in high-traffic environments.
```ini
thread_pool_size = 4
```

### 4. query_cache_size & query_cache_limit
If using the query cache, limit its size to reduce contention.
```ini
query_cache_size = 128M
query_cache_limit = 2M
```

### 5. tmp_table_size & max_heap_table_size
Increase the size for temporary tables to reduce disk I/O.
```ini
tmp_table_size = 256M
max_heap_table_size = 256M
```

### 6. max_connections & timeouts
Optimize connection handling.
```ini
max_connections = 500
wait_timeout = 600
interactive_timeout = 600
```

### 7. File System & I/O Settings
Use `O_DIRECT` to bypass the OS cache, and optimize I/O operations.
```ini
innodb_io_capacity = 1000
innodb_flush_method = O_DIRECT
```

### 8. Slow Query Logging
Enable slow query logs to identify poorly performing queries.
```ini
slow_query_log = 1
slow_query_log_file = /var/log/mysql/slow.log
long_query_time = 2
```

## Checking Current Settings

### 1. Use SHOW VARIABLES Command
To view all current settings:
```sql
SHOW VARIABLES;
```

To filter for specific variables, for example, to check buffer pool size:
```sql
SHOW VARIABLES LIKE 'innodb_buffer_pool_size';
```

### 2. Check Configuration File
Check the `my.cnf` or `my.ini` configuration file, commonly located at `/etc/my.cnf` or `/etc/mysql/my.cnf`.

### 3. Use SHOW STATUS for Runtime Statistics
To check runtime statistics for InnoDB, for example:
```sql
SHOW STATUS LIKE 'Innodb_buffer_pool_%';
```

### 4. Use mysqld --verbose --help
Run this command to see all default and current configuration values:
```bash
mysqld --verbose --help | less
```

## Explanation of Key Settings

### innodb_io_capacity = 1000
Controls the number of I/O operations per second that InnoDB uses for background tasks. Setting this to 1000 is suitable for systems with SSD storage or high IOPS capabilities.

### innodb_flush_method = O_DIRECT
Instructs InnoDB to bypass the OS filesystem cache and write data directly to disk, preventing double caching. Recommended for modern SSDs and large-memory servers.

## Regular Maintenance
Remember to run regular database maintenance tasks like `OPTIMIZE TABLE` and `ANALYZE TABLE` to keep your database performing efficiently.
