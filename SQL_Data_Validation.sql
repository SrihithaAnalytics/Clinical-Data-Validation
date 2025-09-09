-- 1. Check for missing patient IDs
SELECT * 
FROM Clinical_Trial_Data
WHERE Patient_ID IS NULL;

-- 2. Find duplicate patient IDs
SELECT Patient_ID, COUNT(*) AS record_count
FROM Clinical_Trial_Data
GROUP BY Patient_ID
HAVING COUNT(*) > 1;

-- 3. Identify invalid visit dates (future dates)
SELECT * 
FROM Clinical_Trial_Data
WHERE Visit_Date > GETDATE();

-- 4. Count number of queries raised per site
SELECT Site_ID, COUNT(*) AS Query_Count
FROM Clinical_Trial_Data
GROUP BY Site_ID
ORDER BY Query_Count DESC;
