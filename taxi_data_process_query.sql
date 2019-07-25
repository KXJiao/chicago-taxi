SELECT
  fare,
  EXTRACT(DAYOFWEEK FROM trip_start_timestamp) AS day_of_week_start,
  EXTRACT(DAYOFWEEK FROM trip_end_timestamp) AS day_of_week_end,
  (((EXTRACT(HOUR from trip_start_timestamp)*3600)+(EXTRACT(MINUTE from trip_start_timestamp)*60)+(EXTRACT(SECOND from trip_start_timestamp)))/86400) as start_time,
  (((EXTRACT(HOUR from trip_end_timestamp)*3600)+(EXTRACT(MINUTE from trip_end_timestamp)*60)+(EXTRACT(SECOND from trip_end_timestamp)))/86400) as end_time,
  #EXTRACT(TIME FROM trip_start_timestamp) as start_time,
  #EXTRACT(TIME FROM trip_end_timestamp) as end_time,
  EXTRACT(DAYOFYEAR FROM trip_start_timestamp) as start_day_of_year,
  EXTRACT(DAYOFYEAR FROM trip_end_timestamp) as end_day_of_year,
  EXTRACT(MONTH FROM trip_start_timestamp) as start_month,
  EXTRACT(MONTH FROM trip_end_timestamp) as end_month,
  EXTRACT(YEAR FROM trip_start_timestamp) as start_year,
  EXTRACT(YEAR FROM trip_end_timestamp) as end_year,
  trip_seconds,
  trip_miles,
  pickup_community_area,
  dropoff_community_area,
  pickup_latitude,
  pickup_longitude,
  dropoff_latitude,
  dropoff_longitude
FROM
  `ml-sandbox-1-191918.chicagotaxi.raw_taxidata`
WHERE
  trip_seconds > 0
  AND trip_miles > 0
  AND fare BETWEEN 0 AND 1000
  AND pickup_community_area IS NOT NULL
  AND dropoff_community_area IS NOT NULL;