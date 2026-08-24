-- Step 1: Initial look at the raw dataset
SELECT *
FROM analytics_survey;

-- Step 2: Build a randomly sampled, gender-balanced subset (75 male, 75 female)

(SELECT *
FROM analytics_survey
WHERE gender = 'Male' AND `role` NOT LIKE "Other%"
AND `role` != "Student/Looking/None"
AND industry NOT LIKE "Other%"
ORDER BY RAND (62)
LIMIT 75)

UNION ALL

(SELECT *
FROM analytics_survey
WHERE gender = 'Female' AND `role` NOT LIKE "Other%"
AND `role` != "Student/Looking/None"
AND industry NOT LIKE "Other%"
ORDER BY RAND (62)
LIMIT 75);

