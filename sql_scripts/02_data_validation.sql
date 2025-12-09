/* ------------------------------------------------------
   STEP 2: DATA VALIDATION AFTER RAW DATA LOAD
   Purpose:
   - Verify that all monthly tables were imported correctly
   - Perform row count, null, duplicate, and data quality checks
   ------------------------------------------------------ */


/* ------------------------------------------------------
   2.1 ROW COUNT CHECKS
   ------------------------------------------------------ */
   
-- Returns the total number of records in each monthly table.
-- This helps verify that all 12 CSV files were imported successfully and no data is missing.


SELECT 'oct_2024' AS table_name, COUNT(*) AS row_count FROM oct_2024
UNION ALL
SELECT 'nov_2024', COUNT(*) FROM nov_2024
UNION ALL
SELECT 'dec_2024', COUNT(*) FROM dec_2024
UNION ALL
SELECT 'jan_2025', COUNT(*) FROM jan_2025
UNION ALL
SELECT 'feb_2025', COUNT(*) FROM feb_2025
UNION ALL
SELECT 'mar_2025', COUNT(*) FROM mar_2025
UNION ALL
SELECT 'apr_2025', COUNT(*) FROM apr_2025
UNION ALL
SELECT 'may_2025', COUNT(*) FROM may_2025
UNION ALL
SELECT 'jun_2025', COUNT(*) FROM jun_2025
UNION ALL
SELECT 'jul_2025', COUNT(*) FROM jul_2025
UNION ALL
SELECT 'aug_2025', COUNT(*) FROM aug_2025
UNION ALL
SELECT 'sep_2025', COUNT(*) FROM sep_2025;

-- Result Interpretation:
-- Row counts for all 12 monthly tables were retrieved successfully.
-- This confirms that each CSV file was imported into the database with no loading errors.


/* ------------------------------------------------------
   2.2 NULL VALUE CHECKS
   ------------------------------------------------------ */
/* 
   Checking for NULL values in critical columns:
   - ride_id (unique identifier)
   - started_at and ended_at (required for calculating ride duration)
   - member_casual (required for user type analysis)
   Any NULLs found here indicate corrupted or incomplete records.
*/

SELECT 'oct_2024' AS table_name,
       COUNT(*) FILTER (WHERE ride_id IS NULL) AS null_ride_id,
       COUNT(*) FILTER (WHERE started_at IS NULL) AS null_started_at,
       COUNT(*) FILTER (WHERE ended_at IS NULL) AS null_ended_at,
       COUNT(*) FILTER (WHERE member_casual IS NULL) AS null_member_type
FROM oct_2024

UNION ALL
SELECT 'nov_2024',
       COUNT(*) FILTER (WHERE ride_id IS NULL),
       COUNT(*) FILTER (WHERE started_at IS NULL),
       COUNT(*) FILTER (WHERE ended_at IS NULL),
       COUNT(*) FILTER (WHERE member_casual IS NULL)
FROM nov_2024

UNION ALL
SELECT 'dec_2024',
       COUNT(*) FILTER (WHERE ride_id IS NULL),
       COUNT(*) FILTER (WHERE started_at IS NULL),
       COUNT(*) FILTER (WHERE ended_at IS NULL),
       COUNT(*) FILTER (WHERE member_casual IS NULL)
FROM dec_2024

UNION ALL
SELECT 'jan_2025',
       COUNT(*) FILTER (WHERE ride_id IS NULL),
       COUNT(*) FILTER (WHERE started_at IS NULL),
       COUNT(*) FILTER (WHERE ended_at IS NULL),
       COUNT(*) FILTER (WHERE member_casual IS NULL)
FROM jan_2025

UNION ALL
SELECT 'feb_2025',
       COUNT(*) FILTER (WHERE ride_id IS NULL),
       COUNT(*) FILTER (WHERE started_at IS NULL),
       COUNT(*) FILTER (WHERE ended_at IS NULL),
       COUNT(*) FILTER (WHERE member_casual IS NULL)
FROM feb_2025

UNION ALL
SELECT 'mar_2025',
       COUNT(*) FILTER (WHERE ride_id IS NULL),
       COUNT(*) FILTER (WHERE started_at IS NULL),
       COUNT(*) FILTER (WHERE ended_at IS NULL),
       COUNT(*) FILTER (WHERE member_casual IS NULL)
FROM mar_2025

UNION ALL
SELECT 'apr_2025',
       COUNT(*) FILTER (WHERE ride_id IS NULL),
       COUNT(*) FILTER (WHERE started_at IS NULL),
       COUNT(*) FILTER (WHERE ended_at IS NULL),
       COUNT(*) FILTER (WHERE member_casual IS NULL)
FROM apr_2025

UNION ALL
SELECT 'may_2025',
       COUNT(*) FILTER (WHERE ride_id IS NULL),
       COUNT(*) FILTER (WHERE started_at IS NULL),
       COUNT(*) FILTER (WHERE ended_at IS NULL),
       COUNT(*) FILTER (WHERE member_casual IS NULL)
FROM may_2025

UNION ALL
SELECT 'jun_2025',
       COUNT(*) FILTER (WHERE ride_id IS NULL),
       COUNT(*) FILTER (WHERE started_at IS NULL),
       COUNT(*) FILTER (WHERE ended_at IS NULL),
       COUNT(*) FILTER (WHERE member_casual IS NULL)
FROM jun_2025

UNION ALL
SELECT 'jul_2025',
       COUNT(*) FILTER (WHERE ride_id IS NULL),
       COUNT(*) FILTER (WHERE started_at IS NULL),
       COUNT(*) FILTER (WHERE ended_at IS NULL),
       COUNT(*) FILTER (WHERE member_casual IS NULL)
FROM jul_2025

UNION ALL
SELECT 'aug_2025',
       COUNT(*) FILTER (WHERE ride_id IS NULL),
       COUNT(*) FILTER (WHERE started_at IS NULL),
       COUNT(*) FILTER (WHERE ended_at IS NULL),
       COUNT(*) FILTER (WHERE member_casual IS NULL)
FROM aug_2025

UNION ALL
SELECT 'sep_2025',
       COUNT(*) FILTER (WHERE ride_id IS NULL),
       COUNT(*) FILTER (WHERE started_at IS NULL),
       COUNT(*) FILTER (WHERE ended_at IS NULL),
       COUNT(*) FILTER (WHERE member_casual IS NULL)
FROM sep_2025;

-- Result Interpretation:
-- All critical columns have 0 NULL values across all tables.
-- This confirms the data is complete and ready for transformation.

/* ------------------------------------------------------
   2.3 DUPLICATE CHECKS
   ------------------------------------------------------ */
/* 
   Checking for duplicate ride_id values in each monthly table.
   ride_id should be unique for each trip. Any duplicates found indicate corrupted or repeated records.
*/

SELECT 'oct_2024' AS table_name,
       COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_count
FROM oct_2024

UNION ALL
SELECT 'nov_2024',
       COUNT(ride_id) - COUNT(DISTINCT ride_id)
FROM nov_2024

UNION ALL
SELECT 'dec_2024',
       COUNT(ride_id) - COUNT(DISTINCT ride_id)
FROM dec_2024

UNION ALL
SELECT 'jan_2025',
       COUNT(ride_id) - COUNT(DISTINCT ride_id)
FROM jan_2025

UNION ALL
SELECT 'feb_2025',
       COUNT(ride_id) - COUNT(DISTINCT ride_id)
FROM feb_2025

UNION ALL
SELECT 'mar_2025',
       COUNT(ride_id) - COUNT(DISTINCT ride_id)
FROM mar_2025

UNION ALL
SELECT 'apr_2025',
       COUNT(ride_id) - COUNT(DISTINCT ride_id)
FROM apr_2025

UNION ALL
SELECT 'may_2025',
       COUNT(ride_id) - COUNT(DISTINCT ride_id)
FROM may_2025

UNION ALL
SELECT 'jun_2025',
       COUNT(ride_id) - COUNT(DISTINCT ride_id)
FROM jun_2025

UNION ALL
SELECT 'jul_2025',
       COUNT(ride_id) - COUNT(DISTINCT ride_id)
FROM jul_2025

UNION ALL
SELECT 'aug_2025',
       COUNT(ride_id) - COUNT(DISTINCT ride_id)
FROM aug_2025

UNION ALL
SELECT 'sep_2025',
       COUNT(ride_id) - COUNT(DISTINCT ride_id)
FROM sep_2025;

-- Result Interpretation:
-- All tables returned a duplicate_count of 0, indicating there are no duplicate ride records.
-- This confirms ride_id values are unique and reliable for merging in the next step.

/* ------------------------------------------------------
   2.4 INVALID DATA CHECKS
   ------------------------------------------------------ */
/* 
   Checking for logically invalid trip records:
   Rules:
   - ended_at earlier than started_at (impossible ride)
   - ride duration < 1 minute or > 1 day (outliers)
   - invalid member_casual values (should only be 'member' or 'casual')
*/

-- 1. Rides that ended before they started (invalid time records)
SELECT 'oct_2024' AS table_name,
       COUNT(*) AS invalid_time_records
FROM oct_2024
WHERE ended_at < started_at

UNION ALL
SELECT 'nov_2024', COUNT(*) FROM nov_2024 WHERE ended_at < started_at
UNION ALL
SELECT 'dec_2024', COUNT(*) FROM dec_2024 WHERE ended_at < started_at
UNION ALL
SELECT 'jan_2025', COUNT(*) FROM jan_2025 WHERE ended_at < started_at
UNION ALL
SELECT 'feb_2025', COUNT(*) FROM feb_2025 WHERE ended_at < started_at
UNION ALL
SELECT 'mar_2025', COUNT(*) FROM mar_2025 WHERE ended_at < started_at
UNION ALL
SELECT 'apr_2025', COUNT(*) FROM apr_2025 WHERE ended_at < started_at
UNION ALL
SELECT 'may_2025', COUNT(*) FROM may_2025 WHERE ended_at < started_at
UNION ALL
SELECT 'jun_2025', COUNT(*) FROM jun_2025 WHERE ended_at < started_at
UNION ALL
SELECT 'jul_2025', COUNT(*) FROM jul_2025 WHERE ended_at < started_at
UNION ALL
SELECT 'aug_2025', COUNT(*) FROM aug_2025 WHERE ended_at < started_at
UNION ALL
SELECT 'sep_2025', COUNT(*) FROM sep_2025 WHERE ended_at < started_at;

-- Result Interpretation:
-- A few invalid time records were detected (e.g., november showing 43 cases where ended_at < started_at).
-- These entries will be removed during the data cleaning phase before merging the datasets.

-- 2. Rides with unusually short or long durations
-- Rules:
-- < 1 minute = likely system error or false start
-- > 1 day    = outlier or unreturned bike

SELECT 'oct_2024' AS table_name,
       COUNT(*) FILTER (WHERE (ended_at - started_at) < INTERVAL '1 minute') AS less_than_1_min,
       COUNT(*) FILTER (WHERE (ended_at - started_at) > INTERVAL '1 day') AS more_than_1_day
FROM oct_2024

UNION ALL
SELECT 'nov_2024',
       COUNT(*) FILTER (WHERE (ended_at - started_at) < INTERVAL '1 minute'),
       COUNT(*) FILTER (WHERE (ended_at - started_at) > INTERVAL '1 day')
FROM nov_2024

UNION ALL
SELECT 'dec_2024',
       COUNT(*) FILTER (WHERE (ended_at - started_at) < INTERVAL '1 minute'),
       COUNT(*) FILTER (WHERE (ended_at - started_at) > INTERVAL '1 day')
FROM dec_2024

UNION ALL
SELECT 'jan_2025',
       COUNT(*) FILTER (WHERE (ended_at - started_at) < INTERVAL '1 minute'),
       COUNT(*) FILTER (WHERE (ended_at - started_at) > INTERVAL '1 day')
FROM jan_2025

UNION ALL
SELECT 'feb_2025',
       COUNT(*) FILTER (WHERE (ended_at - started_at) < INTERVAL '1 minute'),
       COUNT(*) FILTER (WHERE (ended_at - started_at) > INTERVAL '1 day')
FROM feb_2025

UNION ALL
SELECT 'mar_2025',
       COUNT(*) FILTER (WHERE (ended_at - started_at) < INTERVAL '1 minute'),
       COUNT(*) FILTER (WHERE (ended_at - started_at) > INTERVAL '1 day')
FROM mar_2025

UNION ALL
SELECT 'apr_2025',
       COUNT(*) FILTER (WHERE (ended_at - started_at) < INTERVAL '1 minute'),
       COUNT(*) FILTER (WHERE (ended_at - started_at) > INTERVAL '1 day')
FROM apr_2025

UNION ALL
SELECT 'may_2025',
       COUNT(*) FILTER (WHERE (ended_at - started_at) < INTERVAL '1 minute'),
       COUNT(*) FILTER (WHERE (ended_at - started_at) > INTERVAL '1 day')
FROM may_2025

UNION ALL
SELECT 'jun_2025',
       COUNT(*) FILTER (WHERE (ended_at - started_at) < INTERVAL '1 minute'),
       COUNT(*) FILTER (WHERE (ended_at - started_at) > INTERVAL '1 day')
FROM jun_2025

UNION ALL
SELECT 'jul_2025',
       COUNT(*) FILTER (WHERE (ended_at - started_at) < INTERVAL '1 minute'),
       COUNT(*) FILTER (WHERE (ended_at - started_at) > INTERVAL '1 day')
FROM jul_2025

UNION ALL
SELECT 'aug_2025',
       COUNT(*) FILTER (WHERE (ended_at - started_at) < INTERVAL '1 minute'),
       COUNT(*) FILTER (WHERE (ended_at - started_at) > INTERVAL '1 day')
FROM aug_2025

UNION ALL
SELECT 'sep_2025',
       COUNT(*) FILTER (WHERE (ended_at - started_at) < INTERVAL '1 minute'),
       COUNT(*) FILTER (WHERE (ended_at - started_at) > INTERVAL '1 day')
FROM sep_2025;

-- Result Interpretation:
-- Short and long ride outliers were detected.
-- These will be removed during the data cleaning stage to ensure accurate analysis.

-- 3. Checking for invalid member_casual values
-- Only 'member' and 'casual' are valid. Anything else indicates incorrect or corrupted entries.

SELECT 'oct_2024' AS table_name,
       COUNT(*) AS invalid_member_type_records
FROM oct_2024
WHERE member_casual NOT IN ('member', 'casual')

UNION ALL
SELECT 'nov_2024', COUNT(*) FROM nov_2024 WHERE member_casual NOT IN ('member', 'casual')
UNION ALL
SELECT 'dec_2024', COUNT(*) FROM dec_2024 WHERE member_casual NOT IN ('member', 'casual')
UNION ALL
SELECT 'jan_2025', COUNT(*) FROM jan_2025 WHERE member_casual NOT IN ('member', 'casual')
UNION ALL
SELECT 'feb_2025', COUNT(*) FROM feb_2025 WHERE member_casual NOT IN ('member', 'casual')
UNION ALL
SELECT 'mar_2025', COUNT(*) FROM mar_2025 WHERE member_casual NOT IN ('member', 'casual')
UNION ALL
SELECT 'apr_2025', COUNT(*) FROM apr_2025 WHERE member_casual NOT IN ('member', 'casual')
UNION ALL
SELECT 'may_2025', COUNT(*) FROM may_2025 WHERE member_casual NOT IN ('member', 'casual')
UNION ALL
SELECT 'jun_2025', COUNT(*) FROM jun_2025 WHERE member_casual NOT IN ('member', 'casual')
UNION ALL
SELECT 'jul_2025', COUNT(*) FROM jul_2025 WHERE member_casual NOT IN ('member', 'casual')
UNION ALL
SELECT 'aug_2025', COUNT(*) FROM aug_2025 WHERE member_casual NOT IN ('member', 'casual')
UNION ALL
SELECT 'sep_2025', COUNT(*) FROM sep_2025 WHERE member_casual NOT IN ('member', 'casual');

-- Result Interpretation:
-- No invalid member_casual values were found. User type data is consistent and reliable.

/* Summary:
   Data validation checks indicate that the dataset is clean overall,
   with minor outliers and invalid time records, which will be handled in Step 3.
*/

