-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT `students`.`id`, `students`.`name`, `students`.`surname`, `degrees`.`name`
FROM `degrees`
INNER JOIN `students`
ON `degrees`.`id` = `students`.`degree_id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia";

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

SELECT `departments`.`name` AS 'Nome_Dipartimento', `degrees`.`name` AS 'Nome_Corso'
FROM `departments`
JOIN `degrees`
ON  `departments`.`id` =  `degrees`.`department_id`
WHERE `departments`.`name` = "Dipartimento di Neuroscienze"
AND `degrees`.`name` LIKE 'Corso di Laurea Magistrale%';

-- Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT `courses`.`id` AS 'ID_Corso', `courses`.`name` AS 'Nome_Corso', `teachers`.`id` AS 'ID_Insegnante', `teachers`.`name` AS 'Nome_Insegnante', `teachers`.`surname` AS 'Cognome_Insegnante'
FROM `courses`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `teachers`.`name` = "Fulvio"
AND `teachers`.`surname` = "Amato";

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT `students`.`name` AS 'Nome_Studente', `students`.`surname` AS 'Cognome_Studente', `degrees`.`name` AS 'Nome_Corso', `degrees`.`level` AS 'Anno_Corso',  `departments`.`name` AS 'Nome_Dipartimento', `departments`.`address` AS 'Indirizzo_Dipartimento'
FROM `departments`
JOIN `degrees`
ON `departments`.`id` =  `degrees`.`department_id`
JOIN `students`
ON `degrees`.`id` = `students`.`degree_id`
ORDER BY `students`.`name` ASC;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT `degrees`.`id` AS 'ID_Corso', `degrees`.`name` AS 'Nome_Corso', `courses`.`name` AS 'Nome_Specializzazione', `teachers`.`name` AS 'Nome_Insegnante', `teachers`.`surname` AS 'Cognome_Insegnante'
FROM `degrees`
JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

SELECT DISTINCT `teachers`.`name` AS 'Nome_Insegnante', `teachers`.`surname` AS 'Cognome_Insegnante', `departments`.`id` AS 'ID_Dipartimento', `departments`.`name` AS 'Nome_Dipartimento'
FROM `departments`
JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`;

-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami

SELECT `students`.`name`, `students`.`surname`, COUNT(`exam_student`.`vote`) AS `Esami_Falliti`
FROM `students` 
JOIN `exam_student`
ON `students`.`id` = `exam_student`.`student_id`
JOIN `exams`
ON `exam_student`.`exam_id` = `exams`.`id`
WHERE `exam_student`.`vote` < 18
GROUP BY `students`.`name`, `students`.`surname`;