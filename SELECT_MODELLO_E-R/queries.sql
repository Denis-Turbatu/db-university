-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT * 
FROM `students`
WHERE `date_of_birth`BETWEEN '1990-01-01' AND '1990-12-31';

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT * 
FROM `courses` 
WHERE `cfu` > 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT * 
FROM `students`
WHERE YEAR(CURDATE()) - YEAR(`date_of_birth`) > 30;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)

SELECT * 
FROM `courses` 
WHERE `period` = 'I semestre'
AND `year` = 1;

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)

SELECT * 
FROM `exams` 
WHERE `date` = '2020/06/20'
AND `hour` > '14:00';

-- 6. Selezionare tutti i corsi di laurea magistrale (38)

SELECT * 
FROM `degrees` 
WHERE `name` LIKE '%Laurea Magistrale%';

-- 7. Da quanti dipartimenti è composta l'università? (12)

SELECT COUNT(*) 
FROM `departments`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)

SELECT COUNT(*) 
FROM `teachers` 
WHERE `phone` <> 'NULL';

-- 9. Inserire nella tabella degli studenti un nuovo record con i propri dati (per il campo degree_id, inserire un valore casuale)

INSERT INTO `students` (`degree_id`, `name`, `surname`, `date_of_birth`, `fiscal_code`, `enrolment_date`, `registration_number`, `email`)
VALUES (54, "Denis", "Turbatu", "2003/02/19", "TRBDNS19C03B765G", "2024/02/14", "129830", "denis@boolean.com");

-- 10. Cambiare il numero dell’ufficio del professor Pietro Rizzo in 126

UPDATE `teachers` 
SET `office_number` = 126 
WHERE `name` = "Pietro"
AND `surname` = "Rizzo";

-- Eliminare dalla tabella studenti il record creato precedentemente al punto 9

DELETE FROM `students`
WHERE `name` = "Denis"
AND `surname` = "Turbatu";