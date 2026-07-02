USE project_medical_data_history;

SHOW TABLES;

SHOW DATABASES;

SELECT *
FROM admissions a
JOIN doctors d
ON a.attending_doctor_id = d.doctor_id;


SELECT first_name, last_name, gender
FROM patients
WHERE gender = 'M';


SELECT first_name, last_name
FROM patients
WHERE allergies IS NULL;

SELECT first_name
FROM patients
WHERE first_name LIKE 'C%';


SELECT first_name, last_name
FROM patients
WHERE weight BETWEEN 100 AND 120;


SELECT first_name, last_name,
CASE
    WHEN allergies IS NULL THEN 'NKA'
    ELSE allergies
END AS allergies
FROM patients;    
    
    
    SELECT CONCAT(first_name, ' ' , last_name) AS full_name
    FROM patients;
    
    
    SELECT p.first_name,p.last_name,pr.province_name
    FROM patients p
    JOIN province_names pr 
    ON p.province_id = pr.province_id;
    
    SELECT COUNT(*) AS total_patients
    FROM patients 
    WHERE YEAR(birth_date)= '2010';
    
    
SELECT first_name, last_name,height
FROM patients
WHERE height = (SELECT MAX(height) FROM patients);


SELECT *
FROM patients
WHERE patient_id IN(1,45,534,879,1000);

SELECT COUNT(*) AS total_admissions
FROM admissions;
       

DESCRIBE admissions;


SELECT * 
FROM admissions a
WHERE admission_date = discharge_date;


SELECT COUNT(*) AS total_admissions
FROM admissions
WHERE patient_id = 579;


SELECT DISTINCT city
FROM patients
WHERE province_id = 'NS';


SELECT first_name, last_name,birth_date 
FROM patients
WHERE height > 160 AND weight > 70;


SELECT DISTINCT YEAR (birth_date) AS birth_year
FROM  patients
ORDER BY  birth_year ASC;


SELECT first_name
FROM patients
GROUP BY first_name
HAVING COUNT(*) = 1;


SELECT patient_id, first_name 
FROM  patients
WHERE first_name LIKE 'S%'
  AND first_name LIKE '%S'
  AND LENGTH(first_name) >=6;


SELECT p.patient_id, p.first_name,p.last_name
FROM patients p
JOIN admissions a ON p.patient_id = a.patient_id
WHERE a.diagnosis = 'Dementia';


SELECT first_name
FROM patients
ORDER  BY LENGTH(first_name),first_name;


SELECT 
    SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS total_males,
    SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS total_fmales
FROM patients;


    SELECT 
    COUNT(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS total_males,
    COUNT(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS total_fmales
FROM patients;


SELECT patient_id, diagnosis
FROM admissions
GROUP BY patient_id, diagnosis
HAVING COUNT(*) > 1;


SELECT city , COUNT(*) AS total_patients
FROM patients
GROUP BY city
ORDER BY total_patients DESC, city ASC;


SELECT first_name, last_name, 'patient' AS ROLE
FROM patients 

UNION ALL 

SELECT first_name, last_name,'Doctor' AS ROLE
FROM doctors;


SELECT allergies, COUNT(*) AS popularity
FROM patients
WHERE allergies IS NOT NULL
GROUP BY allergies 
ORDER BY popularity DESC;


SELECT first_name, last_name,birth_date
FROM patients 
WHERE birth_date BETWEEN '1970-01-01' AND '1979-12-31'
ORDER BY birth_date ASC;


SELECT CONCAT(UPPER(last_name),',', LOWER(first_name))AS full_name
FROM patients
ORDER BY first_name DESC;


SELECT province_id, SUM(height) AS total_height
FROM patients
GROUP BY province_id
HAVING SUM(height) >=7000;

SELECT MAX(weight) -MIN(weight) AS weight_difference
FROM  patients 
WHERE last_name = 'maroni';


SELECT DAY(admission_date) AS day_of_month, COUNT(*) AS total_admissions
FROM admissions
GROUP BY day_of_month
ORDER BY total_admissions DESC;


SELECT
    FLOOR(weight / 10) * 10 AS weight_group,
    COUNT(*) AS total_patients
FROM patients
GROUP BY weight_group
ORDER BY weight_group DESC;


SELECT 
      patient_id,
      weight,
      height,
      CASE
          WHEN weight /POWER(height/100,2) >= 30 THEN 1
          ELSE 0
      END AS isObese
FROM patients;


select
     p.patient_id,
     p.first_name,
     p.last_name,
     d.specialty
from patients p
join admissions a on p.patient_id = a.patient_id
join doctors d on a.attending_doctor_id = d.doctor_id
where a.diagnosis = 'epilepsy'
  and d.first_name = 'lisa';

  
SHOW TABLES;  
   
   
      


