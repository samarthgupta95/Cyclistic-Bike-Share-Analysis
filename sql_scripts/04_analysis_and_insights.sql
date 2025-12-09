/* ======================================================
   STEP 4: ANALYSIS & INSIGHTS
   Purpose:
   - Perform descriptive and comparative analysis
   - Identify behavioral patterns and trends
   - Generate insights for visualization and reporting
   ====================================================== */


/* ------------------------------------------------------
   4.1 DATASET SANITY CHECK
   ------------------------------------------------------ */

-- Confirm record count and sample preview
SELECT COUNT(*) AS total_records FROM all_trips;

SELECT * FROM all_trips LIMIT 5;

-- Result Interpretation:
-- Confirms dataset is loaded, valid, and ready for analysis.



/* ------------------------------------------------------
   4.2 DESCRIPTIVE STATISTICS
   ------------------------------------------------------ */

-- Basic statistics on ride durations
SELECT 
    ROUND(AVG(ride_duration_seconds), 2) AS avg_duration_sec,
    ROUND(AVG(ride_duration_seconds)/60, 2) AS avg_duration_min,
    ROUND(MIN(ride_duration_seconds), 2) AS min_duration_sec,
    ROUND(MAX(ride_duration_seconds), 2) AS max_duration_sec,
    ROUND(STDDEV_POP(ride_duration_seconds), 2) AS stddev_duration
FROM all_trips;

-- Median ride duration (seconds) and mode of day_of_week (1=Sun ... 7=Sat)
SELECT
  ROUND(
    CAST(
      PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ride_duration_seconds)
      AS NUMERIC
    ), 2
  ) AS median_duration_sec,
  MODE() WITHIN GROUP (ORDER BY day_of_week) AS mode_day_of_week
FROM all_trips;


-- Ride statistics by member type
SELECT 
    member_casual,
    COUNT(*) AS total_rides,
    ROUND(AVG(ride_duration_seconds), 2) AS avg_duration_sec,
    ROUND(MIN(ride_duration_seconds), 2) AS min_duration_sec,
    ROUND(MAX(ride_duration_seconds), 2) AS max_duration_sec,
    ROUND(STDDEV_POP(ride_duration_seconds), 2) AS stddev_duration
FROM all_trips
GROUP BY member_casual;

-- Ride count by rideable type
SELECT 
    rideable_type,
    COUNT(*) AS total_rides
FROM all_trips
GROUP BY rideable_type
ORDER BY total_rides DESC;

-- Result Interpretation:
-- Provides key summary metrics — averages, variability, and distribution insights.



/* ------------------------------------------------------
   4.3 TIME-BASED TRENDS
   ------------------------------------------------------ */

-- Ride count and average duration by day of week
SELECT 
    day_of_week,
    COUNT(*) AS total_rides,
    ROUND(AVG(ride_duration_seconds)/60, 2) AS avg_duration_min
FROM all_trips
GROUP BY day_of_week
ORDER BY day_of_week;

-- Ride count by month
SELECT 
    month,
    month_name,
    COUNT(*) AS total_rides
FROM all_trips
GROUP BY month, month_name
ORDER BY month;

-- Ride count by hour of day
SELECT 
    EXTRACT(HOUR FROM started_at) AS ride_hour,
    COUNT(*) AS total_rides
FROM all_trips
GROUP BY ride_hour
ORDER BY ride_hour;

-- Ride count by month and member type
SELECT 
    month,
    month_name,
    member_casual,
    COUNT(*) AS total_rides
FROM all_trips
GROUP BY month, month_name, member_casual
ORDER BY month;

-- Result Interpretation:
-- Highlights usage patterns over time — weekdays, months, and hourly peaks.



/* ------------------------------------------------------
   4.4 MEMBER VS CASUAL BEHAVIOR
   ------------------------------------------------------ */

-- Average ride duration comparison
SELECT 
    member_casual,
    ROUND(AVG(ride_duration_seconds))AS avg_duration_sec
FROM all_trips
GROUP BY member_casual;

-- Rideable type preference by user group
SELECT 
    member_casual,
    rideable_type,
    COUNT(*) AS total_rides
FROM all_trips
GROUP BY member_casual, rideable_type
ORDER BY member_casual, total_rides DESC;

-- Weekday vs weekend usage pattern
SELECT 
    member_casual,
    CASE 
        WHEN day_of_week BETWEEN 2 AND 6 THEN 'Weekday'
        ELSE 'Weekend'
    END AS ride_period,
    COUNT(*) AS total_rides
FROM all_trips
GROUP BY member_casual, ride_period
ORDER BY member_casual, ride_period;

-- Share of total rides by member type
SELECT 
    member_casual,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM all_trips), 2) AS percent_of_total
FROM all_trips
GROUP BY member_casual;

-- Result Interpretation:
-- Compares behavior between user groups — preferences, timing, and ride share.



/* ------------------------------------------------------
   4.5 ADVANCED INSIGHTS – TOP ROUTES
   ------------------------------------------------------ */

-- Top 10 most common station-to-station routes
SELECT 
    start_station_name,
    end_station_name,
    COUNT(*) AS total_rides
FROM all_trips
WHERE start_station_name IS NOT NULL AND end_station_name IS NOT NULL
GROUP BY start_station_name, end_station_name
ORDER BY total_rides DESC
LIMIT 10;

-- Result Interpretation:
-- Identifies most popular travel routes across the system.



/* ------------------------------------------------------
   4.6 WRAP-UP VALIDATION
   ------------------------------------------------------ */

-- Final data integrity check
SELECT 
    COUNT(*) AS total_rides,
    COUNT(DISTINCT ride_id) AS unique_ride_ids
FROM all_trips;

-- Result Interpretation:
-- Confirms dataset integrity post-analysis. Ready for visualization.


