--Question 1:How many unique patients are in the database?
SELECT COUNT(DISTINCT Id) AS unique_patient_count
FROM patients;

--Question 2: What are the most common diagnoses or health conditions
SELECT 
    CODE,
    DESCRIPTION,
    COUNT(*) AS condition_count
FROM conditions
GROUP BY 
    CODE, 
    DESCRIPTION
ORDER BY condition_count DESC;

-- Question 3: Which age groups had the most healthcare encounters?
SELECT 
  YEAR(p.BIRTHDATE) AS patient_birth_year,
     COUNT(e.Id) AS total_encounters
FROM patients p
JOIN encounters e 
   ON p.Id = e.PATIENT
GROUP BY 
    YEAR(p.BIRTHDATE)
ORDER BY 
    total_encounters DESC;

-- Question 4: What is the average number of visits per patient?
SELECT 
    COUNT(Id) * 1.0 / COUNT(DISTINCT PATIENT) AS avg_visits_per_patient
FROM encounters;


-- Question 5: Which conditions have the highest healthcare utilization (by total cost)?
SELECT 
    c.CODE,
    c.DESCRIPTION,
    SUM(e.TOTAL_CLAIM_COST) AS total_utilization_cost
FROM conditions c
JOIN encounters e 
    ON c.ENCOUNTER = e.Id
GROUP BY 
    c.CODE,
    c.DESCRIPTION
ORDER BY 
    total_utilization_cost DESC;
