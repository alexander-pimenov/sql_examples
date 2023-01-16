--https://www.youtube.com/watch?v=tueHQdRxHFA&list=PLKl9v2TQvIkq4i_hZwZ1PmobxJSkIGwBf&index=3
--В Оракл есть разные типы данных:
--символьные(строковые), числовые, даты, timestamp
--varchar2(n), number(19,1), timestamp, 

--DUAL - это специальная таблица присутствующая во всех установках БД ОРАКЛ
--по сути это пустая таблица, но позволяющая реализовать некоторые расчеты
--Также с помощью этой таблицы мы можем генерироват псевдо поля ,что тоже бывает удобно

-- Символьные типы данных
--char(n)
--varchar(n) - используем их
--текст нужно указывать в одинарных кавычках
SELECT 'любое текстовое значение' AS TEST FROM dual;
SELECT 'пример указания "апострофов" в тексте' AS TEST FROM dual;
SELECT 'пример соединения ' || '     двух текстов' AS TEST FROM dual; --конкатенация

--ПЕРЕВЕЛ ТЕСТ В НИЖНИЙ РЕГИСТР
SELECT LOWER('ЭТО КОГДА СТРОКИ ИЗ ОБОИХ ТАБЛИЦ ПОПАДАЮТ В РЕЗУЛЬТАТ ЗАПРОСА') AS TEST FROM DUAL;  


-- Числовые типы данных
--Точность и масштаб. Точность может быть в диапазоне от 1 до 38.
--Точность - общее количество десятичных цифр в представленном числе.
--Точность и масштаб. Масштаб может быть в диапазоне от -84 до 127
--Масштаб - число цифр справа от десятичной точки.
--Если значения точности не указно, то оно полагается =38, а масштаб =0.
--Представление числа 123456.789 :
--1) number -> 123456
--2) number(7,1) -> 123456.7
--3) number(5,2) -> Ошибка в данных
--4) number(9,3) -> 123456.789
--5) number(7,-2) -> 1234500 - округляется в большую сторону 
select 100 as TEST from dual; -- =100
select '111' + 10 as TEST from dual; --111 переводится в число и к нему прибавляется число 10 = 121 
select 100 - 10 as TEST from dual; -- =90
select 100 / 2 as TEST from dual; -- =50
select 1 + 3 * 5 as TEST from dual; -- =16
select (1 + 3) * 5 as TEST from dual; -- =20

-- Типы данных даты и времени
--Основной тип данных это date - используется для хранения даты и времени
--может принимать значения от 1 января 4712 года до н.э. до 31 декабря 9999 н.э.
--дату и время нужно указывать в одинарных кавычках
--Главный ньюанс - это формат хранения даты в БД Оракл
--переменная окружения NLS_LANG = RUSSIAN_RUSSIA.CL8MSWIN1251 - ТАК УКАЗЫВАЕТСЯ НУЖНАЯ НАМ КОДИРОВКА ПО УМОЛЧАНИЮ
--если хотим, чтобы не было не однозначности и Оракл корректно принимал дату, то лучше указывать ее в функции to_date с двумя параметрами
--1-й - наша дата, 2-й - формат даты
--to_date дает понять Оракл, что мы передаем дату
select '01.01.2019' as TEST from dual; --01.01.2019 
select '01.01.19' as TEST from dual; --01.01.19
select to_date('01.01.2019', 'dd.mm.yyyy') as TEST from dual; -- = 2019-01-01 00:00:00.000
select to_date('2019.02.10', 'yyyy.mm.dd') as TEST from dual; -- = 2019-02-01 00:00:00.000
select to_date('01.01.2019', 'dd.mm.yyyy') + 10 as TEST from dual; -- = 2019-01-11 00:00:00.000
select to_date('2019.02.10', 'yyyy.mm.dd') + 15 as TEST from dual; -- = 2019-02-25 00:00:00.000
select to_date('01.01.2019', 'dd.mm.yyyy') - 1 as TEST from dual; -- = 2018-12-31 00:00:00.000


--Чтобы вывести несколько строк, используем технический элемент rownum
--так возвращаюся первые 10 строк из таблицы
SELECT * FROM S$FPSID_USER WHERE ETS IS NOT NULL AND rownum <= 10;

--Выборка с использованием текста
SELECT * FROM employees WHERE last_name IN ('King', 'Lorentz');

--King <> king - следим за регистром

-- перевод всех значений с помощью функции UPPER в верхний регистр
SELECT * FROM employees WHERE UPPER(last_name) IN ('KING', 'LORENTZ');

--Аналогично врхнему регистру есть функция для перевода в нижний регистр: LOWER
SELECT * FROM employees WHERE LOWER(last_name) IN ('king', 'lorentz');

--Можно также выводить данные с учетом регистра:
SELECT last_name, UPPER(LAST_name) AS last_name2, LOWER(last_name) AS last_name3  FROM employees;

--Запрос с IN
SELECT * FROM employees WHERE department_id IN (30, 90, 100);
--Выборка с подзапросом
--сначала выполняются вложенные подзапросы, а затем полученные данные подставляются во
--внешний запрос
SELECT * FROM employees WHERE department_id IN (
	SELECT department_id FROM departments 
	WHERE deparment_name IN (
	'Purchasing', 'Executive', 'Finance')
);

--оператор фильтрации BETWEEN - указываем диапазон. Границы включены.
SELECT * FROM empoyees WHERE hire_date BETWEEN '01.06.2005' AND '31.08.2008';

--Поиск по маске - LIKE - РЕГИСТРОЗАВИСИМЫЙ !!!
SELECT * FROM empoyees WHERE job_id LIKE '%ACCOUNT%';
SELECT * FROM empoyees WHERE job_id LIKE '%R%REP';

--Обойти регистрозависимость поможет нам функция UPPER или LOWER
SELECT * FROM empoyees WHERE UPPER(job_id) LIKE '%ACCOUNT%';
SELECT * FROM empoyees WHERE LOWER(job_id) LIKE '%account%';

--Обратный результат от LIKE - это NOT LIKE
SELECT * FROM empoyees WHERE job_id NOT LIKE '%ACCOUNT%';


--!!! Технические запросы по полям таблицы !!!
SELECT table_name, column_name, data_type FROM USER_TAB_COLUMNS WHERE COLUMN_NAME LIKE '%DEPART%';
SELECT table_name, column_name, data_type FROM USER_TAB_COLUMNS WHERE UPPER(COLUMN_NAME) LIKE '%DEPART%';


--Значения NULL - это неопределенное значение
--это не протсто не заполненая ячейка
SELECT * FROM employees WHERE department_id = 90 AND manger_id IS NULL;

--или 
SELECT * FROM employees WHERE department_id = 90 AND manger_id IS NOT NULL;


--Так же можны преобразовать NULL, например, в число 0, это бывает удобно.
--Делается это с помощью функции NVL, у которого первый параметр это названия поля, а второй это значение
--на которое нужно заменить есть встретится NULL
SELECT employee_id, first_name, last_name, NVL(manager_id, 0) FROM employees WHERE department_id = 90;


--Агрегация данных
--count - сперва будет выборка по условию, а затем просуммируются строки
SELECT COUNT(*) FROM employees WHERE manager_id = 100; 

--Можно группировать таблицу по полю, в данном примере по полю job_id,
--т.е. нужно вывести поле job_id и колонку со значением сколько раз это поле встречается 
--и GROUP BY должно быть обязательно если мы используем агрегациднную функцию с полями !!!
--и если есть в SELECT несколько полей, то их нужно указать в GROUP BY  
--GROUP BY используется для группировки строк
SELECT job_id, COUNT(*) FROM employees GROUP BY job_id;
SELECT job_id, department_id, COUNT(*) FROM employees GROUP BY job_id, department_id;

--Подсчет количества строк в строго определенном поле
--и будут посчитаны только те записи, которые не равны NULL
SELECT job_id, COUNT(department_id) FROM employees GROUP BY job_id;

--выводимые значения могут быть разными, т.к. в department_id могут быть NULL 
SELECT COUNT(*), COUNT(department_id) FROM employees;

--
SELECT job_id, COUNT(*) FROM employees GROUP BY job_id;

--SUM, MIN, MAX, AVG
--просуммируем колонку ЗП
SELECT SUM(salary) FROM employees;

--просуммируем ЗП для каждого job_id 
SELECT job_id, SUM(salary) FROM employees 
GROUP BY job_id;

--также посмотрим на минимальную ЗП
SELECT job_id, SUM(salary), MIN(salary)  FROM employees 
GROUP BY job_id;

--также посмотрим на максимальную ЗП
SELECT job_id, SUM(salary), MAX(salary)  FROM employees 
GROUP BY job_id;

--также посмотрим на максимальную ЗП + среднее значение
SELECT job_id, SUM(salary), MAX(salary), AVG(salary)  FROM employees 
GROUP BY job_id;

--тожу самое но с алиасами
SELECT 
	job_id AS ДОЛЖНОСТЬ_СОТРУДНИКА,
	SUM(salary) AS ОБЩАЯ_ЗП,
	MAX(salary) AS МАКСИМАЛЬНАЯ_ЗП,
	MIN(salary) AS МИНИМАЛЬНАЯ_ЗП,
	AVG(salary) AS СРЕДНЯЯ_ЗП 
FROM employees 
GROUP BY job_id;


--Добавим еще условие и еще группировку
--ORDER BY применяется для сортировки строк
SELECT 
	job_id AS ДОЛЖНОСТЬ_СОТРУДНИКА,
	department_id AS ДЕПАРТАМЕНТ_СОТРУДНИКА,
	SUM(salary) AS ОБЩАЯ_ЗП,
	MAX(salary) AS МАКСИМАЛЬНАЯ_ЗП,
	MIN(salary) AS МИНИМАЛЬНАЯ_ЗП,
	AVG(salary) AS СРЕДНЯЯ_ЗП 
FROM employees 
WHERE department_id IN (90, 100)
GROUP BY job_id, department_id 
ORDER BY job_id, department_id;

--Оператор для удаления дубликатов из результирующего запроса SELECT - DISTINCT 
--т.е. уникальные элементы
SELECT
	COUNT(job_id),
	COUNT(DISTINCT job_id)
FROM
	employees;

SELECT
	DISTINCT job_id
FROM
	employees;

SELECT DISTINCT job_id, manager_id, department_id 
FROM employees
WHERE department_id = 50
ORDER BY job_id, manager_id;

--можно объединить поля через конкатенацию
SELECT DISTINCT job_id || manager_id || department_id 
FROM employees
WHERE department_id = 50;

--Фильтрация с помощью HAVING
--для фильтрации используются значения агрегационных функций
--в примере оставим тольк те строки количесвто которых >=20
--HAVING пименяется для фильтрации строк после агрегации
SELECT
	job_id,
	department_id,
	COUNT(*) AS COUNT_JOB_ID
FROM
	employees
WHERE
	deparment_id IS NOT NULL
GROUP BY
	job_id,
	department_id
HAVING
	COUNT(*) >= 20; 

--Сортировка с выводом NULL значений в начало списка (в конец)
SELECT
	department_name,
	manager_id
FROM
	departments
ORDER BY
	manager_id ASC NULLS FIRST;
--ORDER BY manager_id ASC NULLS LAST;

--Создание таблиц
--здесь KMV - это просто уникальный идентификатор (первые буквы ФИО например) 
CREATE TABLE KMV_CUTOMERS
(
	customer_id NUMBER NOT NULL,
	customer_name varchar2(20) NOT NULL,
	city varchar2(20)
);


--Вставка данных в таблицу
INSERT	INTO TABLE_NAME (customer_id, customer_name, city) VALUES(991, 'Иванов Иван', 'Москва');
INSERT	INTO TABLE_NAME (customer_id, customer_name, city) VALUES(992, 'Сидоров Иван', 'Москва');
INSERT	INTO TABLE_NAME (customer_id, customer_name, city) VALUES(993, 'Петров Иван', 'Москва');
COMMIT;

--или одной коммандой:
INSERT ALL 
	INTO TABLE_NAME (customer_id, customer_name, city) VALUES(991, 'Иванов Иван', 'Москва')
	INTO TABLE_NAME (customer_id, customer_name, city) VALUES(992, 'Сидоров Иван', 'Москва')
	INTO TABLE_NAME (customer_id, customer_name, city) VALUES(993, 'Петров Иван', 'Москва')
SELECT * FROM dual;
COMMIT;

--если не настроен авто коммит, то после INSERT нужно коммитить вставку самому:
COMMIT;


--или без указания полей таблицы, но тогда нужно знать и соблюдать очередность:
INSERT	INTO TABLE_NAME VALUES(998, 'Васечкин Иван', 'Москва');
COMMIT;

--Вставка нескольких строк данных в таблицу
INSERT ALL
   INTO t (col1, col2, col3) VALUES ('val1_1', 'val1_2', 'val1_3')
   INTO t (col1, col2, col3) VALUES ('val2_1', 'val2_2', 'val2_3')
   INTO t (col1, col2, col3) VALUES ('val3_1', 'val3_2', 'val3_3')
   .
   .
   .
SELECT 1 FROM DUAL;

--добавить даные из другой существующей таблицы: - этот способ не рекомендуемый
INSERT	INTO TABLE_NAME (customer_id, customer_name, city)
SELECT 
	employee_id, first_name || last_name AS customer_name, 'n/a' AS city
FROM ANOTHER_SCHEMA.TABLE_NAME2
WHERE employee_id IN (10. 50, 90, 120)
ORDER BY employee_id;
COMMIT;

--можно также наполнять таблицу в момент ее создания данными из другой таблицы:
CREATE TABLE TABLE_NAME_NEW AS 
SELECT 
	employee_id, first_name || last_name AS customer_name, 'n/a' AS city
FROM ANOTHER_SCHEMA.TABLE_NAME2
WHERE employee_id IN (10. 50, 90, 120)
ORDER BY employee_id;
COMMIT;


--Обновление существующих данных
UPDATE TABLE_NAME SET hire_date = '01.01.1999' WHERE employee_id = 105;
COMMIT;

--обновление нескольких полей
UPDATE TABLE_NAME 
SET first_name = 'Иван',
	last_name = 'Петров'
	WHERE employee_id = 105;
COMMIT;

--Удаление данных из таблицы
DELETE FROM TABLE_NAME WHERE employee_id = 105;
COMMIT;

--Переименоване таблицы
ALTER TABLE OLD_TABLE RENAME NEW_TABLE;

--Удаление таблицы:
DROP TABLE TABLE_NAME;

--удаляя так таблицу мы перемещаем ее в корзину. Срок хранения данных в корзине разный. И если нужно то можно ее установить.
--Для удаления таблицы минуя корзину:
DROP TABLE TABLE_NAME purge; 


--Внутреннее соединение INNER JOIN
--можно делать подзапрос в подзапросе
--связываем таблицу employees и DEPARTMENTS по полю departament_id 
SELECT * FROM employees 
WHERE departament_id
IN (
	SELECT deparament_id
	FROM DEPARTMENTS 
	WHERE department_name IN ('IT', 'Finance') 
);

--лучше делать INNER JOIN т.к. он быстрее. Здесь также таблицы связываются через поля department_id 
--находим те строки где точно выполняется условие, т.е. выводятся только те строки которые есть и в первой и во второй таблицах.
--меняя местами таблицы, мы всё равно будем получать один и тот же результат
SELECT
	a.*
FROM
	EMPLOYEES a
INNER JOIN DEPARTMENTS b 
ON
	a.department_id = b.department_id
WHERE
	b.department_name IN ('IT', 'Finance');



--Внешнее Соединение LEFT JOIN и RIGHT JOIN (LEFT OUTER JOIN и RIGHT OUTER JOIN)
--ОСНОВНАЯ ТАБЛИЦА показывается полностью и к ней подтягиваются данные, а из ДОПОЛНИТЕЛЬНОЙ ТАБЛИЦЫ мы
--хотим получить часть данных, чтобы обогатить нашу основную таблицу. 
--а там где нет соответсвия по заданным id проставляется NULL
SELECT
	a.*, b.department_name
FROM
	EMPLOYEES a
LEFT OUTER JOIN DEPARTMENTS b 
ON
	a.department_id = b.department_id
WHERE
	b.department_name IN ('IT', 'Finance');


--FULL JOIN
--это когда ВСЕ строки из обоих таблиц попадают в результат запроса даже если им не нашлось соответсвия по id
--порядок в секции FROM не важен
SELECT
	a.*, b.department_name
FROM
	EMPLOYEES a
FULL OUTER JOIN DEPARTMENTS b 
ON
	a.department_id = b.department_id;


--ОПЕРАТОРЫ МНОЖЕСТВ
--UNION ALL - с его помощью можно объединять запросы SELECT
--!!! количество полей в таблицах должно совпадать!!!
--!!!типы данных полей также должны совпадать!!!
--дубликаты строк не будут удаляться 
SELECT * FROM department_new
UNION ALL
SELECT * FROM department_old;

--если хотим избавиться от дубликатов строк, то нужно использовать UNION 
--!!! количество полей в таблицах должно совпадать!!!
--!!!типы данных полей также должны совпадать!!!
SELECT * FROM department_new
UNION
SELECT * FROM department_old;

--MINUS - из строк первого запроса вычитает строки второго запроса
--очень удобный оператор для выбора и сравнения данных
--!!! количество полей в таблицах должно совпадать!!!
--!!!типы данных полей также должны совпадать!!!
SELECT * FROM department_new
MINUS 
SELECT * FROM department_old;

--ОПЕРАТОР INTERSECT
--суть работы противоположна оператору MINUS
--получаем строки которые совпадают в первом и втором запросе
--!!! количество полей в таблицах должно совпадать!!!
--!!!типы данных полей также должны совпадать!!!
SELECT * FROM department_new
INTERSECT  
SELECT * FROM department_old;
 

--Функции для числовых типов данных
--ROUND, ABS, TRUNC
--ROUND - ОКРУГЛЕНИЕ ДО ОПРЕДЕЛЕННОГО ЗНАКА ПОСЛЕ ЗАПЯТОЙ
SELECT ROUND(123.567, 0) FROM DUAL; --= 124
SELECT ROUND(123.567, 1) FROM DUAL; --= 123.6

--ABS - АБСОЛЮТНОЕ ЗНАЧЕНИЕ ЧИСЛА: т.е. положительное остается без изменений, а отрицательное превращается в положительное
SELECT ABS(-123.5) FROM DUAL; --= 123.5

--TRUNC - возвращает число усеченное до определенного числа знаков после запятой без округления
SELECT TRUNC(123.567, 0) FROM DUAL; --= 123
SELECT TRUNC(123.567, 1) FROM DUAL; --= 123.5
SELECT TRUNC(123.567, 2) FROM DUAL; --= 123.56

--Функции для СИМВОЛЬНЫХ ДАННЫХ
--LENGTH, TRIM, REPLACE, INSTR, SUBSTR, TO_CHAR
SELECT UPPER('каКИе тО даННые') FROM DUAL; -- КАКИЕ ТО ДАННЫЕ
SELECT LOWER('каКИе тО даННые') FROM DUAL; -- какие то данные

--каждую первую букву в верхний регистр, а остальные в нижний
SELECT INITCAP('каКИе тО даННые') FROM DUAL;  --Какие То Данные

--длина строки
SELECT LENGTH('каКИе тО даННые') FROM DUAL; --15

--CHR - символ основанный на числовом коде, удобно когда символа нет на клавиатуре
SELECT CHR(34) FROM DUAL; --"
SELECT CHR(12) FROM DUAL; -- символ стрелки

--CONCAT - соединяет только две строки
SELECT CONCAT('каКИе', ' даННые') FROM DUAL; --каКИе даННые

--или вложеная 
SELECT concat(CONCAT('каКИе', ' даННые'), ' и еще что то') FROM DUAL;  --каКИе даННые и еще что то

--или использовать оператор конкатенации
SELECT 'каКИе' || ' даННые' || ' и еще что то' FROM DUAL; --каКИе даННые и еще что то

--TRIM - удаляет в начале и в конце пустые пробелы либо указанные символы с начала или конца!!!
SELECT TRIM('m' from 'mSQL') FROM dual; --SQL
SELECT TRIM('t' from 'tSQLt') FROM dual; --SQL
SELECT TRIM('  mSQL ') FROM dual; --mSQL

--TRANSLATE - замена значений посимвольно
SELECT TRANSLATE('123-SQL-123', '123', '456') FROM dual; --456-SQL-456
SELECT TRANSLATE('123-SQL-123', '123', '_') FROM dual; --_-SQL-_

--REPLACE
SELECT REPLACE('Курс по базовому SQL', 'базовому', 'продвинутому') FROM dual; --Курс по продвинутому SQL
SELECT REPLACE('Курс по базовому SQL', 'SQL','') FROM dual; --Курс по продвинутому

--INSTR - вхождение подстроки в строке
SELECT INSTR('Курс по базовому SQL', 'SQL') FROM dual; --18  порядковый номер в строке

--SUBSTR - извлечение подстроки из строки
SELECT SUBSTR('Курс по базовому SQL', 10, 3) FROM dual; --азо

--TO_CHAR - преобразует дату или число в строку (т.е. получаем ТЕКСТОВОЕ ЗНАЧЕНИЕ)
--но можно использовать её с масками
--написать с одной цифрой после запятой
SELECT TO_CHAR(1234.567, '9999.9') FROM dual; --1234.5
--написать с двумя цифрами после запятой
SELECT TO_CHAR(12345.6789, '99999.99') FROM dual; --12345.68
--отобразить с учетом разрядности
SELECT TO_CHAR(12345.6789, '99,999.99') FROM dual; --12,345.68
--вывести целую часть числа а недостающее дописываем нулями
SELECT TO_CHAR(12345.6789, '0000099') FROM dual; --0012345


SELECT TO_CHAR(SYSDATE,'dd.mm.yyyy') FROM dual; --24.06.2022
SELECT TO_CHAR(SYSDATE,'yyyy.mm.dd') FROM dual; --2022.06.24
SELECT TO_CHAR(SYSDATE,'FMMonth DD, YYYY') FROM dual; -- Июнь 24, 2022
SELECT TO_CHAR(SYSDATE,'YYYY') FROM dual; -- 2022
SELECT TO_CHAR(SYSDATE,'Q') FROM dual; --это квартал =2
SELECT TO_CHAR(SYSDATE,'DAY') FROM dual; --это день недели = ПЯТНИЦА
SELECT TO_CHAR(SYSDATE,'day') FROM dual; --это день недели = пятница    

--МОЖНО СОБРАТЬ ДАННЫЕ В ТАБЛИЦУ

SELECT 'дата 1' AS FORMAT, TO_CHAR(SYSDATE,'dd.mm.yyyy') AS SDATE FROM dual UNION ALL 
SELECT 'дата 2' AS FORMAT, TO_CHAR(SYSDATE,'yyyy.mm.dd') AS SDATE FROM dual UNION ALL 
SELECT 'дата 3' AS FORMAT, TO_CHAR(SYSDATE,'FMMonth DD, YYYY') AS SDATE FROM dual UNION ALL 
SELECT 'год из даты' AS FORMAT, TO_CHAR(SYSDATE,'YYYY') AS SDATE FROM dual UNION ALL 
SELECT 'квартал из даты' AS FORMAT, TO_CHAR(SYSDATE,'Q') AS SDATE FROM dual UNION ALL 
SELECT 'день недели из даты 1' AS FORMAT, TO_CHAR(SYSDATE,'DAY') AS SDATE FROM dual UNION ALL 
SELECT 'день недели из даты 2' AS FORMAT, TO_CHAR(SYSDATE,'day') AS SDATE FROM dual; 




--Функции для ДАТЫ/ВРЕМЕНИ
--SYSDATE, TO_DATE, LAST_DATE, ADD_MONTHS, EXTRACT, TRUNC
--получим системную дату и время на сервере
SELECT SYSDATE FROM dual; --2022-06-24 13:24:43.000
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:DD') FROM dual; --2022/06/24 13:38:24


--TO_DATE - преобразует строку в дату
SELECT TO_DATE('29.12.2021', 'dd.mm.yyyy') FROM dual; --2021-12-29 00:00:00.000
SELECT TO_DATE('29/12/2021', 'dd/mm/yyyy') FROM dual; --2021-12-29 00:00:00.000
SELECT TO_DATE('2021.12.29', 'yyyy.mm.dd') FROM dual; --2021-12-29 00:00:00.000

--также работает и со временем
SELECT TO_DATE('2021.12.29 15:45:30', 'yyyy.mm.dd HH24:MI:SS') FROM dual; --2021-12-29 15:45:30.000
SELECT TO_DATE('29.12.2021 15:45:30', 'DD.MM.YYYY HH24:MI:SS') FROM dual; --2021-12-29 15:45:30.000

--LAST_DAY - последнее значение месяца из указнной даты - когда нужно считать с первого числа месяца по последний
SELECT LAST_DAY(TO_DATE('11.12.2021', 'DD.MM.YYYY')) FROM dual; --2021-12-31 00:00:00.000
SELECT LAST_DAY(TO_DATE('11.12.2021 15:45:30', 'DD.MM.YYYY HH24:MI:SS')) FROM dual; --2021-12-31 15:45:30.000

--В итоге:
--первый день месяца: TO_DATE ( TRUNC ( DATE, ’MM’ ), ’DD.MM.YYYY’ );
--последний день месяца: LAST_DAY ( DATE ).
--А условие запроса с двумя днями соответственно выглядит вот так:

...AND a.request_date BETWEEN ( TO_DATE ( TRUNC ( SYSDATE, 'MM' ), 'DD.MM.YYYY' ) - 2 ) AND ( LAST_DAY ( SYSDATE ) + 2 )



--ADD_MONTHS - возвращает дату с прибавленным количеством месяцев
SELECT ADD_MONTHS(TO_DATE('11.12.2021', 'DD.MM.YYYY'), 2) FROM dual; --2022-02-11 00:00:00.000 - прибавили 2 месяца
SELECT ADD_MONTHS(TO_DATE('11.12.2021', 'DD.MM.YYYY'), -5) FROM dual; --2021-07-11 00:00:00.000 - отняли 5 месяцев

--EXTRACT - извлекает указаное значение из даты
SELECT EXTRACT(YEAR FROM TO_DATE('11.12.2021', 'DD.MM.YYYY')) FROM dual; --2021
SELECT EXTRACT(MONTH  FROM TO_DATE('11.12.2021', 'DD.MM.YYYY')) FROM dual; --12
SELECT EXTRACT(DAY FROM TO_DATE('11.12.2021', 'DD.MM.YYYY')) FROM dual; --11

--TRUNC - усечение даты к определенной ед.измерения - данные остаются датой
SELECT trunc (SYSDATE, 'YEAR') FROM dual; --2022-01-01 00:00:00.000
SELECT trunc (SYSDATE, 'Q') FROM dual; --2022-04-01 00:00:00.000
SELECT trunc (SYSDATE, 'MONTH') FROM dual; --2022-06-01 00:00:00.000
SELECT trunc (SYSDATE, 'IW') FROM dual; --2022-06-20 00:00:00.000 - первый день недели
SELECT SYSDATE , trunc (SYSDATE) FROM dual; --2022-06-27 10:22:14.000  2022-06-27 00:00:00.000

--ЕЩЕ вариант TRUNC
SELECT SYSDATE, trunc (SYSDATE), TRUNC(SYSDATE) + 0.99999, trunc(SYSDATE)-20  FROM dual;

--минус 1 день
SELECT SYSDATE, trunc (SYSDATE - 1), TRUNC(SYSDATE - 1) + 0.99999, trunc(SYSDATE - 20), trunc(SYSDATE + 20) + 0.99999  FROM dual;


SELECT (TO_DATE(TRUNC(SYSDATE,'MM'),'DD.MM.YYYY') ), (LAST_DAY(trunc(SYSDATE)+0.99999)) FROM dual;


SELECT add_months(trunc(sysdate), 1), (LAST_DAY(trunc(SYSDATE)+0.99999)) FROM dual;

select add_months(trunc(sysdate,'mm'),-1), last_day(add_months(trunc(sysdate,'mm'),-1)) from dual; 

--first day next month oracle and last day next 
--Выбор даты +1 месяц и конец следующего месяца
select add_months(trunc(sysdate,'mm'),+1), last_day(add_months(trunc(sysdate,'mm'),+1))+0.99999 from dual;

select add_months(trunc(sysdate,'mm'),+2), last_day(add_months(trunc(sysdate,'mm'),+2))+0.99999 from dual;



SELECT sysdate + 1 FROM dual; 				-- Tomorrow    12/01/2021 14:27:27
SELECT trunc(sysdate) + 1 FROM dual; 		-- Tomorrow    12/01/2021 00:00:00
SELECT sysdate + INTERVAL '20' DAY FROM DUAL;		-- 20 days ahead (other way)
SELECT sysdate + 1 / 24 FROM dual;					-- 1 hour ahead
SELECT sysdate + 1 / 24 / 60 FROM dual;				-- 1 minute ahead
SELECT add_months(trunc(sysdate), 1) FROM dual;   	-- 1 month ahead (no time)
SELECT trunc(sysdate) + 30 FROM dual;				-- 30 days ahead (no time)
SELECT add_months(trunc(sysdate), +12*2) FROM dual;	-- 2 years ahead (no time)


SELECT sysdate - 1 FROM dual; 				-- Yesterday    12/01/2021 14:27:27
SELECT trunc(sysdate) - 1 FROM dual; 		-- Yesterday    12/01/2021 00:00:00
SELECT sysdate + INTERVAL '20' DAY FROM DUAL;		-- 20 days ahead (other way)
SELECT sysdate - 1 / 24 FROM dual;					-- 1 hour ago
SELECT sysdate - 1 / 24 / 60 FROM dual;				-- 1 minute ago
SELECT add_months(trunc(sysdate), -1) FROM dual;   	-- 1 month ago (no time)
SELECT trunc(sysdate) - 30 FROM dual;				-- 30 days ago (no time)
SELECT add_months(trunc(sysdate), -12*2) FROM dual;	-- 2 years ago (no time)



--https://russianblogs.com/article/13081017073/
--Просмотрите имя и размер табличного пространства.
SELECT t.tablespace_name, round(SUM(bytes / (1024 * 1024)), 0) ts_size 
FROM dba_tablespaces t, dba_data_files d 
WHERE t.tablespace_name = d.tablespace_name 
GROUP BY t.tablespace_name; 


--Просмотрите имя и размер физического файла в табличном пространстве.
SELECT tablespace_name, 
file_id, 
file_name, 
round(bytes / (1024 * 1024), 0) total_space 
FROM dba_data_files 
ORDER BY tablespace_name; 

--Проверьте версию базы данных.
SELECT version 
FROM product_component_version 
WHERE substr(product, 1, 6) = 'Oracle';


--просмотрите использование табличного пространства
SELECT SUM(bytes) / (1024 * 1024) AS free_space, tablespace_name 
FROM dba_free_space 
GROUP BY tablespace_name; 
SELECT a.tablespace_name, 
a.bytes total, 
b.bytes used, 
c.bytes free, 
(b.bytes * 100) / a.bytes "% USED ", 
(c.bytes * 100) / a.bytes "% FREE " 
FROM sys.sm$ts_avail a, sys.sm$ts_used b, sys.sm$ts_free c 
WHERE a.tablespace_name = b.tablespace_name 
AND a.tablespace_name = c.tablespace_name;


--Создание таблицы
CREATE TABLE TESTUSER.persons(
    person_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    PRIMARY KEY(person_id)
);

--Например имея уже какую-нибудь таблицу с данными можн создать на её основе новую таблицу
--но вставить рандомно сгенерированные данные о дате
CREATE TABLE EMP_TEST AS
SELECT first_name, last_name,
SYSDATE-DBMS_RANDOM.VALUE(0,9) CREATED_DATE FROM employees;


--Создание схемы и выделение тейбспейса без лимитного (пароль можно любой, я указал пароль от рута):
CREATE USER TESTUSER01 IDENTIFIED BY Passw0rd_317 DEFAULT TABLESPACE "USERS" QUOTA UNLIMITED ON "USERS" ACCOUNT UNLOCK;
GRANT CREATE SESSION TO TESTUSER01;

--Установить формат даты-времени для вывода в таблицах
ALTER SESSION SET nls_date_format = 'DD-MON-YYYY HH24:MI:SS';
--будем иметь такой вид: 17-JUN-2010 00:00:00


--Вывод рандомного числа
SELECT DBMS_RANDOM.VALUE(0,9) FROM dual; -- 6.6912231850794525341720319692547910914
-- 2.97734445521591862337809733451853841635

--Так можно генерировать различные даты, т.е. отнимая рандомное число получаем рандоную дату
SELECT SYSDATE - DBMS_RANDOM.VALUE(0,9) FROM dual; -- 2022-06-21 09:42:01.000

--Так можно генерировать различные числа целые в диапазоне от 100 до 800
SELECT round(DBMS_RANDOM.VALUE(100,800)) num FROM dual;


--системная дата-время
SELECT SYSDATE FROM dual;

--Выбор данных из промежутка даты-время
SELECT * FROM emp_test
WHERE created_date BETWEEN TO_DATE('22-sep-2020 00:00:00', 'dd-mon-yyyy hh24:mi:ss')
AND TO_DATE('22-sep-2020 23:59:59', 'dd-mon-yyyy hh24:mi:ss')
ORDER BY created_date;

--или так (результат аналогиченый)
SELECT * FROM emp_test
WHERE created_date BETWEEN TO_DATE('22-sep-2020', 'dd-mon-yyyy')
AND TO_DATE('22-sep-2020 23:59:59', 'dd-mon-yyyy hh24:mi:ss')
ORDER BY created_date;

--вставить колонку в таблицу
ALTER TABLE PERSONS  ADD birth_date DATE NOT NULL;

--вставить колонки в таблицу
ALTER TABLE
    PERSONS ADD(
        created_at TIMESTAMP WITH TIME ZONE NOT NULL,
        updated_at TIMESTAMP WITH TIME ZONE NOT NULL
    );

--удалить колонки из таблицы
   ALTER TABLE PERSONS DROP (modified_time, created_time);
  
--посмотреть название колонок таблицы по условию
 SELECT column_name
  FROM all_tab_cols
 WHERE table_name = 'USERS'
   AND owner = '" +_db+ "'
   AND column_name NOT IN ( 'PASSWORD', 'VERSION', 'ID' );

--посмотреть название колонок таблицы
SELECT column_name
  FROM all_tab_cols
 WHERE table_name = 'DEFERRED_DOC_OP';
  

--Как при создании таблицы задать столбец с датой создания записи по умолчанию?
--Вот два способа указать дату и время создания записи и оба работают:
create table svod (
    createdt date default sysdate,
    createts timestamp default systimestamp
);


--Таблица, доступная текущему пользователю
select col.column_id, 
       col.owner as schema_name,
       col.table_name, 
       col.column_name, 
       col.data_type, 
       col.data_length, 
       col.data_precision, 
       col.data_scale, 
       col.nullable
from sys.all_tab_columns col
inner join sys.all_tables t on col.owner = t.owner 
                              and col.table_name = t.table_name
where col.owner = 'AP'
and col.table_name = 'V_OFFER_KO_XML_COORDINATION'
order by col.column_id;

--Если у вас есть права на dba_tab_columns и dba_tables
select col.column_id, 
       col.owner as schema_name,
       col.table_name, 
       col.column_name, 
       col.data_type, 
       col.data_length, 
       col.data_precision, 
       col.data_scale, 
       col.nullable
from sys.dba_tab_columns col
inner join sys.dba_tables t on col.owner = t.owner 
                              and col.table_name = t.table_name
where col.owner = 'AP'
and col.table_name = 'AP_INVOICES_ALL'
order by col.column_id;


--Чтобы из даты получить конкретное значение года, месяца, дня и т.п. можно использовать функцию extract, например:
select extract(year from sysdate) from dual; --вернет 2015
select extract(month from sysdate) from dual; --вернет 9
select extract(day from sysdate) from dual; --вернет 30

--Тогда запрос будет иметь вид:
select * 
from Table_Name  
where extract(year from '30.10.22') = 2015;

--Так же можно использовать функцию trunc, например:
select trunc(sysdate, 'yy') from dual; --вернет 01.01.2015
select trunc(sysdate, 'mm') from dual; --вернет 01.09.2015

select trunc(sysdate - 50, 'mm') from dual;

--Тогда запрос будет иметь вид:
select * 
from Table_Name  
where trunc('30.10.22', 'yy') = date'2015-01-01';

--Добавление комметарий к колонкам таблицы
COMMENT ON TABLE table_name IS 'A table comment';
COMMENT ON COLUMN table_name.MY_COLUMN IS 'A column comment';

SELECT * FROM ALL_TAB_COMMENTS WHERE TABLE_NAME = 'TABLE_NAME';
SELECT * FROM ALL_COL_COMMENTS WHERE TABLE_NAME = 'TABLE_NAME';


SELECT sysdate - 1 FROM dual; 				-- Yesterday    12/01/2021 14:27:27
SELECT trunc(sysdate) - 1 FROM dual; 		-- Yesterday    12/01/2021 00:00:00
SELECT sysdate - 1 / 24 FROM dual;					-- 1 hour ago
SELECT sysdate - 1 / 24 / 60 FROM dual;				-- 1 minute ago
SELECT add_months(trunc(sysdate), -1) FROM dual;   	-- 1 month ago (no time)
SELECT trunc(sysdate) - 30 FROM dual;				-- 30 days ago (no time)
SELECT add_months(trunc(sysdate), -12*2) FROM dual;	-- 2 years ago (no time)
SELECT add_months(trunc(sysdate), -19) FROM dual;
SELECT last_day(add_months(trunc(sysdate,'mm'),-19))+0.99999 FROM dual;

--///////////////////////////////////////////////////////////
--Выбор по максимальному ID
--Это один селект. 
--Конструкция with здесь - это имитация таблицы test. 
select 1 x, 3 y from dual union all
           select 2, 4 from dual union all
           select 3, 2 from dual union all
           select 4, 5 from dual;

--Запрос эквивалентен этому: select max(x) keep (dense_rank last order by y) from test; 
--Просто в таком виде его удобнее запускать - не приходится создавать таблицу и заполнять ее данными.

with t as (select 1 x, 3 y from dual union all
           select 2, 4 from dual union all
           select 3, 2 from dual union all
           select 4, 5 from dual)
select max(x) keep (dense_rank last order by y) MAX_VALUE
  from t;
--///////////////////////////////////////////////////////////

--Подсчет повторяющихся строк, группируя по названию
 SELECT
    category_name,
    COUNT( product_id )
FROM
    product_categories
LEFT JOIN products
        USING(category_id)
GROUP BY
    category_name
ORDER BY
    category_name; 
   
--Oracle PL/SQL оператор WITH позволяет дать блоку подзапроса имя/псевдоним, 
--на которое можно ссылаться в нескольких местах основного SQL-запроса. 
--Имя, присвоенное подзапросу, обрабатывается так, как если бы оно было встроенным представлением или таблицей. 
--SQL оператор WITH по сути является заменой обычному подзапросу.
--Cинтаксис Oracle PL/SQL WITH с с несколькими подзапросами:

WITH query_name_A AS
	 (SELECT expressions FROM table_A),
     query_name_B AS
	 ([SELECT expressions FROM query_name_A] | [SELECT expressions FROM table_B])
SELECT column_list
  FROM query_name_A, query_name_B [,table_X | Join table_Z]
[WHERE conditions]

--expressions - поля или расчеты подзапроса.
--column_list - поля или расчеты основного запроса.
--table_A, table_B, table_X, table_Z - таблицы или соединения для подзапросов.
--query_name_A, query_name_B - псевдоним подзапроса. Если подзапросов несколько, то они перечисляются через запятую.

--WHERE conditions - условия которые должны быть выполнены для основных запросов.

 --Для получения иерархических данных используется временное представление, которое описывается оператором WITH.
--После этого из нее выбираются данные простым селектом. В общем виде синтаксис примерно такой:
WITH [recursive] имя_алиаса_запроса [ (список столбцов) ]
AS (запрос) 
основной запрос


--Функция Oracle INSTR()ищет подстроку в строке и возвращает позицию подстроки в строке.
SELECT
  INSTR( 'isThis is a playlist', 'is') first_occurrence,
  INSTR( 'isThis is a playlist', 'is', 1, 2 ) second_occurrence,
  INSTR( 'isThis is a playlist', 'is', 1, 3 ) third_occurrence
FROM
  dual;
 
--Добавление таблицы с PK и FK констреинтами. Где удалять можно каскадом 
CREATE TABLE "CBILL"."CT_CUSELLRATEDETAIL"
  (
    "NUMCUSELLRATEDMSGUID" NUMBER(10,0) NOT NULL ENABLE,
    "NUMCUSELLRATEGUID"    NUMBER(10,0),
    "VC2SELLDMSNAME"       VARCHAR2(100 BYTE),
    "NUMVALIDFLAG"         NUMBER(1,0),
    "DATBEGINDATE" DATE,
    "NUMCURATE"     NUMBER(10,5),
    "NUMCUSELLRATE" NUMBER(10,5),
    "VC2DESC"       VARCHAR2(100 BYTE),
    "VC2REMARK"     VARCHAR2(100 BYTE),
    "DATCREATEDATE" DATE,
    "NUMCREATECODE" NUMBER(10,0),
    "DATOPERDATE" DATE,
    "NUMOPERCODE" NUMBER(10,0),
    CONSTRAINT "PK_CT_CUSELLRATEDETAIL" PRIMARY KEY ("NUMCUSELLRATEDMSGUID") USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT) TABLESPACE "CTBS_STAT" ENABLE,
    CONSTRAINT "FK_CT_CUSEL_REFERENCE_CT_CUSEL" FOREIGN KEY ("NUMCUSELLRATEGUID") REFERENCES "CBILL"."CT_CUSELLRATEINFO" ("NUMCUSELLRATEGUID") ON
  DELETE CASCADE ENABLE
  )
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING STORAGE
  (
    INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  )
  TABLESPACE "CTBS_STAT" ;
 
 
 --https://russianblogs.com/article/8714192261/
--START WITH ...CONNNECT BY PRIOR Основной синтаксис:
 SELECT ...FROM
WHERE  (Фильтруйте возвращенные записи, фильтруются только узлы с ограниченным доступом, а корневые и дочерние узлы не затрагиваются)
START WITH  (Корневой узел, вы можете указать несколько узлов)
CONNECT BY PRIOR= (Условия подключения,PRIORПомещенный перед знаком равенства, поиск начинается от корневого узла до конечного узла, после размещения знака равенства начинается поиск от конечного узла до корневого узла)
 


--1Анализ сначала выяснить, сколько ‘,’ запятых:length(str) - length(regexp_replace(str, ',', '')) + 1 ;
--2. В соответствии с функцией regexp_substr (), чтобы найти положение запятой;
-- regexp_substr(str, '[^,]+', 1, level, 'i') как str, где уровень представляет запятую (‘,’)
--3.function REGEXP_SUBSTR(__srcstr, __pattern, __position, __occurrence, __modifier) ;
--                       Значение параметров:
--                       __srcstr: строка, которая нуждается в регулярной обработке
--                       __pattern: регулярное выражение для соответствия
--                       __position: начальная позиция, начиная с первых нескольких символов совпадения регулярного выражения (по умолчанию1）
--                       __occurrence: определить количество подходящих групп, по умолчанию1
--                       __modifier: mode ('i'Регистронезависимый поиск;'c'Поиск с учетом регистра. По умолчанию'c'。）

 with temp as
 (select 'A,B,C,D,E,F,G,W' str from dual)
select regexp_substr(str, '[^,]+', 1, level, 'i') as str
  from temp
connect by level <= length(str) - length(regexp_replace(str, ',', '')) + 1;


--а это для MySql -------------------------
SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE, COLUMN_DEFAULT
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE table_name = 'tbl_name'
  [AND table_schema = 'db_name']
  [AND column_name LIKE 'wild']

  SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE, COLUMN_DEFAULT
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE table_name = DEFERRED_DOC_OP;
 
 SHOW COLUMNS
  FROM tbl_name
  [FROM db_name]
  [LIKE 'wild']
---------------------------------------------

--Узнать название ограничения PK: (хорошо работает)
SELECT * FROM ALL_CONSTRAINTS 									-- or DBA_CONSTRAINTS or UESR_CONSTRAINTS
WHERE TABLE_NAME= 'K006_ELECTRONIC_CATALOG_TEMPLATE' 
AND CONSTRAINT_TYPE = 'P';


  --Узнать название ограничения PK:  (мало информации)
  SELECT cols.table_name, cols.column_name, cols.position, cons.status, cons.owner
FROM all_constraints cons, all_cons_columns cols
WHERE cols.table_name = 'K006_ELECTRONIC_CATALOG_TEMPLATE' 
AND cons.constraint_type = 'P'
AND cons.constraint_name = cols.constraint_name
AND cons.owner = cols.owner;


---Генерация GUID с дефисами:
CREATE OR REPLACE FUNCTION DEV_OLTP_APPID_DATA.new_guid
   RETURN VARCHAR2
AS
   guid   VARCHAR2 (50);
BEGIN
   guid := (RAWTOHEX (SYS_GUID ()));
   RETURN LOWER (
                SUBSTR (guid, 1, 8)
             || '-'
             || SUBSTR (guid, 9, 4)
             || '-'
             || SUBSTR (guid, 13, 4)
             || '-'
             || SUBSTR (guid, 17, 4)
             || '-'
             || SUBSTR (guid, 21, 12));
END;

--ВЫБОР ДАННЫХ СО СДВИГОМ И ПАДЖИНАЦИЕЙ, Т.Е. ТОЖЕ ЧТО И СОБЪЕКТОМ Pageable в JPA
--https://stackoverflow.com/questions/2912144/alternatives-to-limit-and-offset-for-paging-in-oracle
--1
SELECT *
FROM K001_CABINET_WORK_GROUP k
ORDER BY to_number(k.K001_CODE_CAB) desc
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;
--2
SELECT *
FROM K001_CABINET_WORK_GROUP k
ORDER BY to_number(k.K001_CODE_CAB) desc
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;
--3
SELECT *
FROM K001_CABINET_WORK_GROUP k
ORDER BY to_number(k.K001_CODE_CAB) desc
OFFSET 20 ROWS FETCH NEXT 10 ROWS ONLY;

 --Технические запросы по полям таблицы - в каких таблицах есть колонки с именем USER_ID. LIKE РЕГИСТРОЗАВИСИМЫЙ!!!
 --Выполни и увидешь:
 SELECT table_name, column_name, data_type FROM USER_TAB_COLUMNS WHERE COLUMN_NAME LIKE '%USER_ID%'; --есть результат
 SELECT table_name, column_name, data_type FROM USER_TAB_COLUMNS WHERE COLUMN_NAME LIKE '%user_id%'; --нет результата

 --Обойти регистрозависимость поможет нам функция UPPER или LOWER
 SELECT table_name, column_name, data_type FROM USER_TAB_COLUMNS WHERE LOWER(COLUMN_NAME) LIKE '%user_id%'; --есть результат!!
 SELECT table_name, column_name, data_type FROM USER_TAB_COLUMNS WHERE UPPER(COLUMN_NAME) LIKE '%USER_ID%'; --есть результат

--добавить , удалить , переименовать колонки в существующей таблице, изменить дефолтное значение
ALTER TABLE PERSONS  ADD birth_date DATE NOT NULL;

ALTER TABLE
    PERSONS ADD(
        created_at TIMESTAMP WITH TIME ZONE NOT NULL,
        updated_at TIMESTAMP WITH TIME ZONE NOT NULL
    );

ALTER TABLE CODE_LIST_TYPE_ERROR
ADD ID_CODE_LISTS VARCHAR2(50) NOT NULL
CONSTRAINT CODE_LIST_TYPE_ERROR_FK REFERENCES CODE_LISTS(ID);

ALTER TABLE PERSONS DROP (modified_time, created_time);

ALTER TABLE PERSONS
ADD CONSTRAINT pk_persons PRIMARY KEY (person_id);

ALTER TABLE table_name RENAME COLUMN column_name TO new_name;

ALTER TABLE *table_name*
MODIFY *column_name* DEFAULT *value*;

ALTER TABLE K005_SETTINGS_WORK_GROUP_CABINET  MODIFY K005_CREATED_AT DEFAULT CURRENT_TIMESTAMP;
--------------------------------------------------------------------


create sequence tt_sequence
start with 1
increment by 1;


create trigger tt_trigger
before insert on PERSONS for each row
begin
  select tt_sequence.nextval
  into :new.id
  from dual;
end;

--Как при создании таблицы задать столбец с датой создания записи по умолчанию?
--Вот два способа указать дату и время создания записи и оба работают:
create table svod (
    createdt date default sysdate,
    createts timestamp default systimestamp
);
SELECT * FROM svod;
INSERT INTO svod (createdt) VALUES ( to_date('19.01.1980', 'dd.mm.yyyy'));
INSERT INTO svod (createts) VALUES ( to_date('01.01.2000', 'dd.mm.yyyy'));


CREATE  TABLE PERSONS  (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    FIRST_NAME VARCHAR2(100),
    LAST_NAME VARCHAR2(100),
    BIRTHDAY DATE,
    CREATED_AT TIMESTAMP WITH TIME ZONE DEFAULT SYSDATE,
    description VARCHAR2(100) not NULL
  );

INSERT INTO PERSONS(first_name, last_name, birthday, description) VALUES ('Ivan', 'Short', to_date('19.01.1980', 'dd.mm.yyyy'), 'in city Omsk');
insert into PERSONS(first_name, last_name, birthday, description) values ('Petr', 'Fox',to_date('20.10.1980','dd.mm.yyyy'),'in city Dushanbe');
insert into PERSONS(first_name, last_name, birthday, description) values ('Kolya', 'Host',to_date('20.10.1982 15:15:00','dd.mm.yyyy hh24:mi:ss'),'in city Kazan');
insert into PERSONS(first_name, last_name, birthday, description) values ('Gosha', 'Dom',to_date('20.10.1990','dd.mm.yyyy'),'in city Kazan');
insert into PERSONS(first_name, last_name, birthday, description) values ('Vova', 'Tito',to_date('10.10.1988','dd.mm.yyyy'),'in city Kazan');
SELECT * FROM persons;

 


