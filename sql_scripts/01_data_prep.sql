/* ======================================================
   STEP 1: DATA PREPARATION
   Purpose:
   - Create individual monthly tables for OCT 2024 – SEP 2025
   - Import corresponding CSV files into PostgreSQL
   ====================================================== */


/* ------------------------------------------------------
   1.1 CREATE RAW MONTHLY TABLES
   ------------------------------------------------------ */

-- Each table stores trip data for one month of Cyclistic rides.
-- All tables share the same schema for later merging.


CREATE TABLE oct_2024 (
  ride_id VARCHAR(50),
  rideable_type TEXT,
  started_at TIMESTAMP,
  ended_at TIMESTAMP,
  start_station_name TEXT,
  start_station_id TEXT,
  end_station_name TEXT,
  end_station_id TEXT,
  start_lat DOUBLE PRECISION,
  start_lng DOUBLE PRECISION,
  end_lat DOUBLE PRECISION,
  end_lng DOUBLE PRECISION,
  member_casual TEXT
);

CREATE TABLE nov_2024 (
  ride_id VARCHAR(50),
  rideable_type TEXT,
  started_at TIMESTAMP,
  ended_at TIMESTAMP,
  start_station_name TEXT,
  start_station_id TEXT,
  end_station_name TEXT,
  end_station_id TEXT,
  start_lat DOUBLE PRECISION,
  start_lng DOUBLE PRECISION,
  end_lat DOUBLE PRECISION,
  end_lng DOUBLE PRECISION,
  member_casual TEXT
);

CREATE TABLE dec_2024 (
  ride_id VARCHAR(50),
  rideable_type TEXT,
  started_at TIMESTAMP,
  ended_at TIMESTAMP,
  start_station_name TEXT,
  start_station_id TEXT,
  end_station_name TEXT,
  end_station_id TEXT,
  start_lat DOUBLE PRECISION,
  start_lng DOUBLE PRECISION,
  end_lat DOUBLE PRECISION,
  end_lng DOUBLE PRECISION,
  member_casual TEXT
);

CREATE TABLE jan_2025 (
  ride_id VARCHAR(50),
  rideable_type TEXT,
  started_at TIMESTAMP,
  ended_at TIMESTAMP,
  start_station_name TEXT,
  start_station_id TEXT,
  end_station_name TEXT,
  end_station_id TEXT,
  start_lat DOUBLE PRECISION,
  start_lng DOUBLE PRECISION,
  end_lat DOUBLE PRECISION,
  end_lng DOUBLE PRECISION,
  member_casual TEXT
);

CREATE TABLE feb_2025 (
  ride_id VARCHAR(50),
  rideable_type TEXT,
  started_at TIMESTAMP,
  ended_at TIMESTAMP,
  start_station_name TEXT,
  start_station_id TEXT,
  end_station_name TEXT,
  end_station_id TEXT,
  start_lat DOUBLE PRECISION,
  start_lng DOUBLE PRECISION,
  end_lat DOUBLE PRECISION,
  end_lng DOUBLE PRECISION,
  member_casual TEXT
);

CREATE TABLE mar_2025 (
  ride_id VARCHAR(50),
  rideable_type TEXT,
  started_at TIMESTAMP,
  ended_at TIMESTAMP,
  start_station_name TEXT,
  start_station_id TEXT,
  end_station_name TEXT,
  end_station_id TEXT,
  start_lat DOUBLE PRECISION,
  start_lng DOUBLE PRECISION,
  end_lat DOUBLE PRECISION,
  end_lng DOUBLE PRECISION,
  member_casual TEXT
);

CREATE TABLE apr_2025 (
  ride_id VARCHAR(50),
  rideable_type TEXT,
  started_at TIMESTAMP,
  ended_at TIMESTAMP,
  start_station_name TEXT,
  start_station_id TEXT,
  end_station_name TEXT,
  end_station_id TEXT,
  start_lat DOUBLE PRECISION,
  start_lng DOUBLE PRECISION,
  end_lat DOUBLE PRECISION,
  end_lng DOUBLE PRECISION,
  member_casual TEXT
);

CREATE TABLE may_2025 (
  ride_id VARCHAR(50),
  rideable_type TEXT,
  started_at TIMESTAMP,
  ended_at TIMESTAMP,
  start_station_name TEXT,
  start_station_id TEXT,
  end_station_name TEXT,
  end_station_id TEXT,
  start_lat DOUBLE PRECISION,
  start_lng DOUBLE PRECISION,
  end_lat DOUBLE PRECISION,
  end_lng DOUBLE PRECISION,
  member_casual TEXT
);

CREATE TABLE jun_2025 (
  ride_id VARCHAR(50),
  rideable_type TEXT,
  started_at TIMESTAMP,
  ended_at TIMESTAMP,
  start_station_name TEXT,
  start_station_id TEXT,
  end_station_name TEXT,
  end_station_id TEXT,
  start_lat DOUBLE PRECISION,
  start_lng DOUBLE PRECISION,
  end_lat DOUBLE PRECISION,
  end_lng DOUBLE PRECISION,
  member_casual TEXT
);

CREATE TABLE jul_2025 (
  ride_id VARCHAR(50),
  rideable_type TEXT,
  started_at TIMESTAMP,
  ended_at TIMESTAMP,
  start_station_name TEXT,
  start_station_id TEXT,
  end_station_name TEXT,
  end_station_id TEXT,
  start_lat DOUBLE PRECISION,
  start_lng DOUBLE PRECISION,
  end_lat DOUBLE PRECISION,
  end_lng DOUBLE PRECISION,
  member_casual TEXT
);

CREATE TABLE aug_2025 (
  ride_id VARCHAR(50),
  rideable_type TEXT,
  started_at TIMESTAMP,
  ended_at TIMESTAMP,
  start_station_name TEXT,
  start_station_id TEXT,
  end_station_name TEXT,
  end_station_id TEXT,
  start_lat DOUBLE PRECISION,
  start_lng DOUBLE PRECISION,
  end_lat DOUBLE PRECISION,
  end_lng DOUBLE PRECISION,
  member_casual TEXT
);

CREATE TABLE sep_2025 (
  ride_id VARCHAR(50),
  rideable_type TEXT,
  started_at TIMESTAMP,
  ended_at TIMESTAMP,
  start_station_name TEXT,
  start_station_id TEXT,
  end_station_name TEXT,
  end_station_id TEXT,
  start_lat DOUBLE PRECISION,
  start_lng DOUBLE PRECISION,
  end_lat DOUBLE PRECISION,
  end_lng DOUBLE PRECISION,
  member_casual TEXT
);

-- Result Interpretation:
-- 12 monthly tables created successfully with identical structure.



/* ------------------------------------------------------
   1.2 IMPORT RAW CSV FILES
   ------------------------------------------------------ */

-- Load monthly trip data into each respective table.
-- Ensure file paths are correct and accessible to PostgreSQL.


COPY oct_2024
FROM 'C:/DA_PROJECT_1/Raw_CSVs/202410-divvy-tripdata.csv'
DELIMITER ','
CSV HEADER;

COPY nov_2024
FROM 'C:/DA_PROJECT_1/Raw_CSVs/202411-divvy-tripdata.csv'
DELIMITER ','
CSV HEADER;

COPY dec_2024
FROM 'C:/DA_PROJECT_1/Raw_CSVs/202412-divvy-tripdata.csv'
DELIMITER ','
CSV HEADER;

COPY jan_2025
FROM 'C:/DA_PROJECT_1/Raw_CSVs/202501-divvy-tripdata.csv'
DELIMITER ','
CSV HEADER;

COPY feb_2025
FROM 'C:/DA_PROJECT_1/Raw_CSVs/202502-divvy-tripdata.csv'
DELIMITER ','
CSV HEADER;

COPY mar_2025
FROM 'C:/DA_PROJECT_1/Raw_CSVs/202503-divvy-tripdata.csv'
DELIMITER ','
CSV HEADER;

COPY apr_2025
FROM 'C:/DA_PROJECT_1/Raw_CSVs/202504-divvy-tripdata.csv'
DELIMITER ','
CSV HEADER;

COPY may_2025
FROM 'C:/DA_PROJECT_1/Raw_CSVs/202505-divvy-tripdata.csv'
DELIMITER ','
CSV HEADER;

COPY jun_2025
FROM 'C:/DA_PROJECT_1/Raw_CSVs/202506-divvy-tripdata.csv'
DELIMITER ','
CSV HEADER;

COPY jul_2025
FROM 'C:/DA_PROJECT_1/Raw_CSVs/202507-divvy-tripdata.csv'
DELIMITER ','
CSV HEADER;

COPY aug_2025
FROM 'C:/DA_PROJECT_1/Raw_CSVs/202508-divvy-tripdata.csv'
DELIMITER ','
CSV HEADER;

COPY sep_2025
FROM 'C:/DA_PROJECT_1/Raw_CSVs/202509-divvy-tripdata.csv'
DELIMITER ','
CSV HEADER;

-- Result Interpretation:
-- All monthly CSV files imported into their respective tables.
-- Dataset is ready for validation and transformation.