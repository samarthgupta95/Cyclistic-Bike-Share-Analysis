/* ======================================================
   STEP 3: TRANSFORM & CLEAN DATA
   Purpose:
   - Merge all monthly tables into one master dataset
   - Clean invalid and inconsistent records
   - Create new calculated columns for analysis
   ====================================================== */


/* ------------------------------------------------------
   3.1 CREATE MASTER TABLE (all_trips)
   ------------------------------------------------------ */

/*
   Combine all 12 monthly tables into one master table
   named 'all_trips' using UNION ALL.
   This table will be the base for all analysis.
*/

CREATE TABLE all_trips AS
SELECT * FROM oct_2024
UNION ALL
SELECT * FROM nov_2024
UNION ALL
SELECT * FROM dec_2024
UNION ALL
SELECT * FROM jan_2025
UNION ALL
SELECT * FROM feb_2025
UNION ALL
SELECT * FROM mar_2025
UNION ALL
SELECT * FROM apr_2025
UNION ALL
SELECT * FROM may_2025
UNION ALL
SELECT * FROM jun_2025
UNION ALL
SELECT * FROM jul_2025
UNION ALL
SELECT * FROM aug_2025
UNION ALL
SELECT * FROM sep_2025;

-- Verify record count after merging
SELECT COUNT(*) AS total_records FROM all_trips;

-- Result Interpretation:
-- Confirms total rows in master dataset after combining all monthly tables.



/* ------------------------------------------------------
   3.2 CLEANING THE DATA
   ------------------------------------------------------ */

/*
   Remove invalid or illogical records identified in Script 2:
   - ended_at < started_at
   - ride duration < 1 minute or > 1 day
   - duplicate ride_ids (if any slipped through)
*/

-- Delete rides that end before they start
DELETE FROM all_trips
WHERE ended_at < started_at; 

-- Removed 43 invalid records where ride ended before it started.

-- Delete rides shorter than 1 minute or longer than 1 day
DELETE FROM all_trips
WHERE (ended_at - started_at) < INTERVAL '1 minute'
   OR (ended_at - started_at) > INTERVAL '1 day';
   
-- Removed 145,410 outlier rides (<1 min or >1 day).

-- Delete any duplicates (if present)
DELETE FROM all_trips a
USING (
  SELECT ride_id, MIN(ctid) AS keep_row
  FROM all_trips
  GROUP BY ride_id
  HAVING COUNT(*) > 1
) dupes
WHERE a.ride_id = dupes.ride_id
  AND a.ctid <> dupes.keep_row;

-- Around 174k duplicate ride_id values were found after merging all months.
-- These were cross-month duplicates and have been safely removed to ensure global uniqueness.


/* ------------------------------------------------------
   3.3 FEATURE ENGINEERING
   ------------------------------------------------------ */

/*
   Add calculated columns to support deeper analysis:
   - ride_duration (interval)
   - ride_duration_seconds
   - day_of_week (1–7, Sunday to Saturday)
   - month (numeric)
   - month_name (full month name)
   - year
   - ride_category (short / medium / long)
*/

ALTER TABLE all_trips
ADD COLUMN ride_duration INTERVAL,
ADD COLUMN ride_duration_seconds NUMERIC(10,2),
ADD COLUMN day_of_week INT,
ADD COLUMN month INT,
ADD COLUMN month_name TEXT,
ADD COLUMN year INT,
ADD COLUMN ride_category TEXT;

UPDATE all_trips
SET 
    ride_duration = (ended_at - started_at),
    ride_duration_seconds = ROUND(EXTRACT(EPOCH FROM (ended_at - started_at)), 2),
    day_of_week = EXTRACT(DOW FROM started_at) + 1,
    month = EXTRACT(MONTH FROM started_at),
    month_name = TO_CHAR(started_at, 'Month'),
    year = EXTRACT(YEAR FROM started_at),
    ride_category = CASE
        WHEN EXTRACT(EPOCH FROM (ended_at - started_at)) < 300 THEN 'Short Ride'
        WHEN EXTRACT(EPOCH FROM (ended_at - started_at)) BETWEEN 300 AND 1200 THEN 'Medium Ride'
        ELSE 'Long Ride'
    END;

/* ------------------------------------------------------
   Result Interpretation:
   Added ride duration, time-based fields, and categorized
   rides by duration to enable trend and usage analysis.
   ------------------------------------------------------ */


/* ------------------------------------------------------
   3.4 VALIDATION AFTER TRANSFORMATION
   ------------------------------------------------------ */

/*
   Validate that transformations were successful:
   - Check new columns
   - Preview dataset
   - Ensure no NULLs in critical fields
*/

-- Preview first 10 records
SELECT * FROM all_trips LIMIT 10;

-- Count NULLs in critical fields post-cleaning
SELECT
    COUNT(*) FILTER (WHERE ride_id IS NULL) AS null_ride_id,
    COUNT(*) FILTER (WHERE started_at IS NULL) AS null_started_at,
    COUNT(*) FILTER (WHERE ended_at IS NULL) AS null_ended_at,
    COUNT(*) FILTER (WHERE member_casual IS NULL) AS null_member_type
FROM all_trips;

-- Result Interpretation:
-- Validation confirms that all transformations executed correctly and data is ready for analysis.

