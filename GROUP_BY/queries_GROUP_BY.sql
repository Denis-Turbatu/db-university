-- 1. Contare quanti iscritti ci sono stati ogni anno

SELECT COUNT(`students`.`enrolment_date`) AS "N_Iscritti", YEAR(`students`.`enrolment_date`) AS "Anno"
FROM `departments`
JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
JOIN `students`
ON `degrees`.`id` = `students`.`degree_id`
GROUP BY YEAR(`students`.`enrolment_date`);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT COUNT(*), `teachers`.`office_address`
FROM `teachers`
GROUP BY `teachers`.`office_address`
ORDER BY `teachers`.`office_address`

-- 3. Calcolare la media dei voti di ogni appello d'esame

SELECT `exams`.`date` AS "Data_Appello", AVG(`exam_student`.`vote`) AS "Media_Voti"
FROM `students`
JOIN `exam_student`
ON `students`.`id` = `exam_student`.`student_id`
JOIN `exams`
ON `exam_student`.`exam_id` = `exams`.`id`
GROUP BY `exams`.`date`

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT DISTINCT `departments`.`name`, COUNT(`degrees`.`name`)
FROM `departments`
JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
GROUP BY `departments`.`name`