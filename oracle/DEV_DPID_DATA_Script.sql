SELECT COUNT(*) FROM P367_INSP_PENALTY_NFO pipn ;
SELECT COUNT(*) FROM P360_INSP_CHK_NFO;

SELECT COLUMN_NAME AS ColumnName,TABLE_NAME AS TableName
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME LIKE '%MyName%'
ORDER BY TableName,ColumnName;



 
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


--посмотреть название колонок таблицы 
select col.column_id, 
       --col.owner as schema_name,
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
where  col.table_name = 'P360_INSP_CHK_NFO'
order by col.column_id;

--where  col.table_name = 'DEFERRED_DOC_OP'

SELECT DISTINCT col.table_name FROM sys.all_tab_columns col WHERE col.table_name = 'P360_INSP_CHK_NFO';


--найти таблицы в которых есть колонка с именем
SELECT * FROM ALL_TAB_COLUMNS 
WHERE COLUMN_NAME LIKE '%REGNUM%'; 
--AND owner = 'database_name';

SELECT * FROM ALL_TAB_COLUMNS 
WHERE COLUMN_NAME LIKE '%Reg%' 
AND owner = 'sys';



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
where col.table_name = 'DEFERRED_DOC_OP'
order by col.column_id;


SELECT DISTINCT QST_STRING  FROM V_OFFER_QUESTIONS_NFO_STRING voqns 
ORDER BY QST_STRING ASC ;


--DROP TABLE DEV_OLTP_APPID_DATA.X111_WORK_GROUP_CAB;
 
 --ПЕРЕИМЕНОВАНИЕ НАЗВАНИЙ КОЛОНОК
ALTER TABLE DEV_OLTP_APPID_DATA.X111_WORK_GROUP_CAB  RENAME COLUMN id TO X111_id;
ALTER TABLE DEV_OLTP_APPID_DATA.X111_WORK_GROUP_CAB  RENAME COLUMN chk_description TO X111_chk_description;
ALTER TABLE DEV_OLTP_APPID_DATA.X111_WORK_GROUP_CAB  RENAME COLUMN created_at TO X111_created_at;
ALTER TABLE table_name RENAME COLUMN column_name TO new_name;


--ALTER TABLE CODE_LIST_TYPE_ERROR 
--ADD ID_CODE_LISTS VARCHAR2(50) NOT NULL
--CONSTRAINT CODE_LIST_TYPE_ERROR_FK REFERENCES CODE_LISTS(ID);

 --добавление КОЛОНОК в таблицу
ALTER TABLE K001_CABINET_WORK_GROUP  
ADD K005_ID VARCHAR2(50) 
CONSTRAINT K001_CABINET_WORK_GROUP_FK REFERENCES K005_SETTINGS_WGC(K005_ID);


ALTER TABLE DEV_OLTP_APPID_DATA.K001_CABINET_WORK_GROUP  ADD K005_ID varchar2(50);

ALTER TABLE K007_DOCUMENTS_METADATA  ADD K008_HEAD_ID NUMBER(12,0);

ALTER TABLE K007_CABINET_FILES ADD K006_ID NUMBER(12,0);
ALTER TABLE K007_CABINET_FILES MODIFY K006_ID NUMBER(12,0);




SELECT DISTINCT  p360_chk_status FROM P360_INSP_CHK_NFO picn ;
SELECT DISTINCT  p320_chk_status FROM P320_COMPOSITE_CHK_NFO pccn  ;




 --Вставить данные из одной таблицы в другую
INSERT INTO exception_codes( code, message )
  SELECT code, message
    FROM exception_code_tmp ;


SELECT UPPER('quota for one cabinet') FROM dual;



 
 
INSERT INTO X111_WORK_GROUP_CAB_TEST a ( a.X111_CHK_CODE,a.X111_CHK_DATE_BEGIN  ,a.X111_CHK_END_DATE  ,a.X111_ORG_NAME  ,a.X111_ORG_INN  ,a.X111_REGNUM  ,a.X111_STATUS  )
  SELECT p.P360_CHK_CODE , p.P360_CHK_DATE_BEGIN , p.P360_CHK_END_DATE  , p.P360_ORG_NAME , p.P360_ORG_INN , p.P360_KO_REGNUM , p.P360_CHK_STATUS 
    FROM P360_INSP_CHK_NFO p WHERE  ROWNUM <=10;
   
   SELECT * FROM X111_WORK_GROUP_CAB xwgct ;
  

  
  UPDATE
    X111_WORK_GROUP_CAB_TEST a 
SET
    a.X111_CHK_DESCRIPTION  = 'какое-то текстовое описание 10'
WHERE
    a.X111_ID  = 10;
   
SELECT * FROM VS_INSP_CHK_STATUS vics  ;
--CASE P360_CHK_STATUS
--    WHEN 0 THEN 'Плановые предложения'
--    WHEN 1 THEN 'Отсутствует'
--    WHEN 2 THEN 'Отсрочена'
--    WHEN 3 THEN 'Начата' *
--    WHEN 4 THEN 'Приостановлена'
--    WHEN 5 THEN 'Возобновлена'
--    WHEN 6 THEN 'Завершена' * 
--    WHEN 7 THEN 'Прекращена' *
--    WHEN 8 THEN 'Противодействие'
--	WHEN 98 THEN 'Неизвестно'
--	WHEN 99 THEN 'Предпроверочная' *
--	ELSE '--не понятно--' END


SELECT * FROM K_MERGED km WHERE KBANK_CNAME LIKE '%ПУБ%';
SELECT KBANK_CNAME , KBANK_CREGNUM  FROM K_MERGED km WHERE KBANK_CNAME LIKE '%ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО%';

/*АКЦИОНЕРНЫЙ КОММЕРЧЕСКИЙ БАНК "ЭНО" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	1988
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО КОММЕРЧЕСКИЙ БАНК "ЕВРОКОММЕРЦ"	1777
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО КОММЕРЧЕСКИЙ БАНК "ТУЛЬСКИЙ ПРОМЫШЛЕННИК"	2382
АКЦИОНЕРНЫЙ КОММЕРЧЕСКИЙ БАНК "МЕТАЛЛУРГИЧЕСКИЙ ИНВЕСТИЦИОННЫЙ БАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	2440
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО БАНК "ЮГРА"	880
АКЦИОНЕРНЫЙ КОММЕРЧЕСКИЙ БАНК "ЭНО" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	1988
АКЦИОНЕРНЫЙ КОММЕРЧЕСКИЙ БАНК "ЭНО" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	1988
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО КОММЕРЧЕСКИЙ БАНК "ЕВРОКОММЕРЦ"	1777
АКЦИОНЕРНЫЙ КОММЕРЧЕСКИЙ БАНК "ЭНО" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	1988
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО КОММЕРЧЕСКИЙ БАНК "ЕВРОКОММЕРЦ"	1777
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО КОММЕРЧЕСКИЙ БАНК "ЕВРОКОММЕРЦ"	1777
АКЦИОНЕРНЫЙ КОММЕРЧЕСКИЙ БАНК "МЕТАЛЛУРГИЧЕСКИЙ ИНВЕСТИЦИОННЫЙ БАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	2440
АКЦИОНЕРНЫЙ КОММЕРЧЕСКИЙ БАНК "АКТИВ БАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	2529
АКЦИОНЕРНЫЙ КОММЕРЧЕСКИЙ БАНК "АКТИВ БАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	2529
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО БАНК "ЮГРА"	880
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "НОВЫЙ ИНВЕСТИЦИОННО-КОММЕРЧЕСКИЙ ОРЕНБУРГСКИЙ БАНК РАЗВИТИЯ ПРОМЫШЛЕННОСТИ"	702
АКЦИОНЕРНЫЙ КОММЕРЧЕСКИЙ БАНК "МЕТАЛЛУРГИЧЕСКИЙ ИНВЕСТИЦИОННЫЙ БАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	2440
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО БАНК "ЮГРА"	880
АКЦИОНЕРНЫЙ КОММЕРЧЕСКИЙ БАНК "ЭНО" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	1988
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО БАНК "ЮГРА"	880
АКЦИОНЕРНЫЙ КОММЕРЧЕСКИЙ БАНК "ЭНО" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	1988
АКЦИОНЕРНЫЙ КОММЕРЧЕСКИЙ БАНК "МЕТАЛЛУРГИЧЕСКИЙ ИНВЕСТИЦИОННЫЙ БАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	2440
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО БАНК "ЮГРА"	880
АКЦИОНЕРНЫЙ КОММЕРЧЕСКИЙ БАНК "МЕТАЛЛУРГИЧЕСКИЙ ИНВЕСТИЦИОННЫЙ БАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	2440
АКЦИОНЕРНЫЙ КОММЕРЧЕСКИЙ БАНК "АКТИВ БАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	2529
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО КОММЕРЧЕСКИЙ БАНК "ТУЛЬСКИЙ ПРОМЫШЛЕННИК"	2382
АКЦИОНЕРНЫЙ КОММЕРЧЕСКИЙ БАНК "МЕТАЛЛУРГИЧЕСКИЙ ИНВЕСТИЦИОННЫЙ БАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	2440
АКЦИОНЕРНЫЙ ЧЕЛЯБИНСКИЙ ИНВЕСТИЦИОННЫЙ БАНК "ЧЕЛЯБИНВЕСТБАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	493
АКЦИОНЕРНЫЙ ЧЕЛЯБИНСКИЙ ИНВЕСТИЦИОННЫЙ БАНК "ЧЕЛЯБИНВЕСТБАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	493
АКЦИОНЕРНЫЙ ЧЕЛЯБИНСКИЙ ИНВЕСТИЦИОННЫЙ БАНК "ЧЕЛЯБИНВЕСТБАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	493
АКЦИОНЕРНЫЙ ЧЕЛЯБИНСКИЙ ИНВЕСТИЦИОННЫЙ БАНК "ЧЕЛЯБИНВЕСТБАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	493
АКЦИОНЕРНЫЙ ЧЕЛЯБИНСКИЙ ИНВЕСТИЦИОННЫЙ БАНК "ЧЕЛЯБИНВЕСТБАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	493
АКЦИОНЕРНЫЙ ЧЕЛЯБИНСКИЙ ИНВЕСТИЦИОННЫЙ БАНК "ЧЕЛЯБИНВЕСТБАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	493
АКЦИОНЕРНЫЙ ЧЕЛЯБИНСКИЙ ИНВЕСТИЦИОННЫЙ БАНК "ЧЕЛЯБИНВЕСТБАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	493
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "НОВЫЙ ИНВЕСТИЦИОННО-КОММЕРЧЕСКИЙ ОРЕНБУРГСКИЙ БАНК РАЗВИТИЯ ПРОМЫШЛЕННОСТИ"	702
АКЦИОНЕРНЫЙ ЧЕЛЯБИНСКИЙ ИНВЕСТИЦИОННЫЙ БАНК "ЧЕЛЯБИНВЕСТБАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	493
АКЦИОНЕРНЫЙ ЧЕЛЯБИНСКИЙ ИНВЕСТИЦИОННЫЙ БАНК "ЧЕЛЯБИНВЕСТБАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	493
АКЦИОНЕРНЫЙ ЧЕЛЯБИНСКИЙ ИНВЕСТИЦИОННЫЙ БАНК "ЧЕЛЯБИНВЕСТБАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	493
АКЦИОНЕРНЫЙ ЧЕЛЯБИНСКИЙ ИНВЕСТИЦИОННЫЙ БАНК "ЧЕЛЯБИНВЕСТБАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	493
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "НОВЫЙ ИНВЕСТИЦИОННО-КОММЕРЧЕСКИЙ ОРЕНБУРГСКИЙ БАНК РАЗВИТИЯ ПРОМЫШЛЕННОСТИ"	702
АКЦИОНЕРНЫЙ ЧЕЛЯБИНСКИЙ ИНВЕСТИЦИОННЫЙ БАНК "ЧЕЛЯБИНВЕСТБАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	493
АКЦИОНЕРНЫЙ ЧЕЛЯБИНСКИЙ ИНВЕСТИЦИОННЫЙ БАНК "ЧЕЛЯБИНВЕСТБАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	493
АКЦИОНЕРНЫЙ ЧЕЛЯБИНСКИЙ ИНВЕСТИЦИОННЫЙ БАНК "ЧЕЛЯБИНВЕСТБАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	493
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО БАНК "ЮГРА"	880
АКЦИОНЕРНЫЙ ЧЕЛЯБИНСКИЙ ИНВЕСТИЦИОННЫЙ БАНК "ЧЕЛЯБИНВЕСТБАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	493
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО БАНК "ЮГРА"	880
АКЦИОНЕРНЫЙ КОММЕРЧЕСКИЙ БАНК "АКТИВ БАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	2529
АКЦИОНЕРНЫЙ КОММЕРЧЕСКИЙ БАНК "АКТИВ БАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	2529
АКЦИОНЕРНЫЙ КОММЕРЧЕСКИЙ БАНК "АКТИВ БАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	2529
АКЦИОНЕРНЫЙ КОММЕРЧЕСКИЙ БАНК "МЕТАЛЛУРГИЧЕСКИЙ ИНВЕСТИЦИОННЫЙ БАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	2440
АКЦИОНЕРНЫЙ КОММЕРЧЕСКИЙ БАНК "МЕТАЛЛУРГИЧЕСКИЙ ИНВЕСТИЦИОННЫЙ БАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	2440
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО БАНК "ЮГРА"	880
АКЦИОНЕРНЫЙ ЧЕЛЯБИНСКИЙ ИНВЕСТИЦИОННЫЙ БАНК "ЧЕЛЯБИНВЕСТБАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	493
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО БАНК "ЮГРА"	880
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
АКЦИОНЕРНЫЙ КОММЕРЧЕСКИЙ БАНК "АЗИМУТ" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	3154
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО "БАНК "САНКТ-ПЕТЕРБУРГ"	436
АКЦИОНЕРНЫЙ КОММЕРЧЕСКИЙ БАНК "МЕТАЛЛУРГИЧЕСКИЙ ИНВЕСТИЦИОННЫЙ БАНК" (ПУБЛИЧНОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО)	2440*/


SELECT a.P3077_HEAD_ID  FROM P3077_HEAD_GIBR  a WHERE a.P3077_DATE_BEG <= CURRENT_DATE AND (a.P3077_DATE_END >= CURRENT_DATE OR a.P3077_DATE_END  IS NULL);



SELECT pccqn.P324_DETAIL  FROM P324_COMPOSITE_CHK_QST_NFO pccqn WHERE pccqn.P324_DETAIL IS NOT NULL  ; 
   

   
 SELECT A.P3071_FULL_NAME FROM DEV_OLTP_APPID_DATA.P3071_OBJ_AREA A WHERE A.P3071_OKATO = 32 AND A.P3071_DATE_END > SYSDATE AND ROWNUM=1;
 
SELECT DISTINCT ppn.P200_PLAN_ID  FROM P200_PLAN_NFO ppn ; 
SELECT DISTINCT pccn.P200_PLAN_ID  FROM P320_COMPOSITE_CHK_NFO pccn ORDER BY pccn.P200_PLAN_ID asc; 


SELECT 
pc.p320_chk_id, pc.P320_CHK_PERIOD_B , pc.P320_CHK_PERIOD_E , pc.P320_ORG_OGRN , pc.P320_ORG_NAME , pc.P320_ORG_INN, pc.P600_ID  ,
pio.P600_OGRN , pio.P600_FULLNAME , pio.P600_INN, km.KBANK_CREGNUM 
--pl.P610_REGNO 
FROM P320_COMPOSITE_CHK_NFO pc  JOIN P600_INSP_OBJECT pio ON pc.P600_ID = pio.P600_ID 
--JOIN P610_LICENCE pl ON pl.P600_ID = pio.P600_ID 
JOIN K_MERGED km ON pc.P320_ORG_NAME = km.KBANK_CSNAME 
WHERE pc.P200_PLAN_ID = 924; --1006 9996 986


SELECT 
pccn.p320_chk_id, 
ppn.P200_VALD_BEG ,
ppn.P200_VALD_END ,
pccn.P320_CHK_PERIOD_B , 
pccn.P320_CHK_PERIOD_E ,
pccn.P320_CHK_SHEDULE_DATE ,
pccn.P320_ORG_OGRN , 
pccn.P320_ORG_NAME , 
pccn.P320_ORG_INN, 
pccn.P600_ID  ,
pio.P600_OGRN , 
pio.P600_FULLNAME , 
pio.P600_INN, 
km.KBANK_CREGNUM 
FROM P200_PLAN_NFO ppn JOIN P320_COMPOSITE_CHK_NFO pccn ON ppn.P200_PLAN_ID = pccn.P200_PLAN_ID  
JOIN P600_INSP_OBJECT pio ON pccn.P600_ID = pio.P600_ID 
JOIN K_MERGED km ON pccn.P320_ORG_NAME = km.KBANK_CSNAME 
WHERE ppn.P200_PLAN_ID = 924; 
--1006 9996 986

SELECT 
pccn.p320_chk_id, 
ppn.P200_VALD_BEG ,
ppn.P200_VALD_END ,
pccn.P320_CHK_PERIOD_B , 
pccn.P320_CHK_PERIOD_E ,
pccn.P320_CHK_SHEDULE_DATE ,
pccn.P320_ORG_OGRN , 
pccn.P320_ORG_NAME , 
pccn.P320_ORG_INN, 
pccn.P600_ID  ,
pio.P600_OGRN , 
pio.P600_FULLNAME , 
pio.P600_INN, 
km.KBANK_CREGNUM 
FROM P200_PLAN_NFO ppn JOIN P320_COMPOSITE_CHK_NFO pccn ON ppn.P200_PLAN_ID = pccn.P200_PLAN_ID
 JOIN P600_INSP_OBJECT pio ON pccn.P600_ID = pio.P600_ID 
 JOIN K_MERGED km ON pccn.P320_ORG_NAME = km.KBANK_CSNAME
 WHERE ppn.P200_PLAN_ID = 924;

--
SELECT 
pccn.p320_chk_id, 
ppn.P200_VALD_BEG ,
ppn.P200_VALD_END ,
pccn.P320_CHK_SHEDULE_DATE ,
pio.P600_FULLNAME , 
pio.P600_INN, 
pio.P600_OGRN , 
km.KBANK_CREGNUM 
--pccn.P600_ID  ,
--pccn.P320_ORG_NAME , 
--pccn.P320_CHK_PERIOD_B , 
--pccn.P320_CHK_PERIOD_E ,
--pccn.P320_ORG_OGRN , 
--pccn.P320_ORG_INN, 
FROM P200_PLAN_NFO ppn, P320_COMPOSITE_CHK_NFO pccn, P600_INSP_OBJECT pio, K_MERGED km
WHERE ppn.P200_PLAN_ID = pccn.P200_PLAN_ID AND pccn.P600_ID = pio.P600_ID AND pccn.P320_ORG_NAME = km.KBANK_CSNAME 
AND  ppn.P200_PLAN_ID = 924 ;

SELECT 
pccn.p320_chk_id, 
ppn.P200_VALD_BEG ,
ppn.P200_VALD_END ,
pccn.P320_CHK_SHEDULE_DATE ,
pccn.P320_ORG_NAME ,
pio.P600_FULLNAME ,
--km.KBANK_CNAMER ,
pio.P600_ADDRESS ,
pio.P600_INN, 
pio.P600_OGRN , 
km.KBANK_CREGNUM 
FROM P200_PLAN_NFO ppn, P320_COMPOSITE_CHK_NFO pccn, P600_INSP_OBJECT pio, K_MERGED km
WHERE ppn.P200_PLAN_ID = pccn.P200_PLAN_ID AND pccn.P600_ID = pio.P600_ID AND pccn.P320_ORG_NAME = km.KBANK_CSNAME 
AND  ppn.P200_PLAN_ID = 924 ;

-- ВЫБОРКА ДАННЫХ С УСЛОВИЕМ ВЫБОРКИ НА 1 МЕСЯЦ ВПЕРЕД
SELECT 
pccn.P320_CHK_SHEDULE_DATE ,
pccn.P320_CHK_PERIOD_E  ,
pccn.P320_ORG_NAME ,
pio.P600_FULLNAME , 
pio.P600_ADDRESS ,
pio.P600_INN, 
km.KBANK_CREGNUM, 
pio.P600_OGRN
FROM P320_COMPOSITE_CHK_NFO pccn, P600_INSP_OBJECT pio, K_MERGED km
WHERE pccn.P600_ID = pio.P600_ID AND pccn.P320_ORG_NAME = km.KBANK_CSNAME 
AND  pccn.P320_CHK_SHEDULE_DATE BETWEEN add_months(trunc(sysdate,'mm'),+1) AND last_day(add_months(trunc(sysdate,'mm'),+1))+0.99999;


--выбока данных SelectData для крг, образец, смотрел, что выбирается в определенный период
SELECT 
max(p.P320_CHK_ID) as P320_CHK_ID, 
p.P320_INITIAL_CHK, 
p.P320_CHK_SHEDULE_DATE, 
p.P320_CHK_PERIOD_E, 
p.P320_ORG_NAME, 
pio.P600_FULLNAME, 
pio.P600_ADDRESS, 
pio.P600_INN, 
pio.P600_OGRN, 
km.FREGNUM ,
(CASE WHEN p.P320_ORG_OKATO  IS NOT NULL THEN p.P320_ORG_OKATO ELSE pio.P600_OKATO END) AS okato
FROM P320_COMPOSITE_CHK_NFO p 
LEFT JOIN P600_INSP_OBJECT pio ON p.P600_ID = pio.P600_ID 
LEFT JOIN K_MERGED km ON  pio.RBASE_CID = km.RBASE_CID 
WHERE p.P320_CHK_SHEDULE_DATE >= to_date('2020-08-02', 'yyyy-MM-dd') 
AND p.P320_CHK_SHEDULE_DATE <= to_date('2020-08-31', 'yyyy-MM-dd')
GROUP BY p.P320_INITIAL_CHK, p.P320_CHK_SHEDULE_DATE, p.P320_CHK_PERIOD_E, p.P320_ORG_NAME, pio.P600_FULLNAME, 
pio.P600_ADDRESS, pio.P600_INN, pio.P600_OGRN, km.FREGNUM, p.P320_ORG_OKATO, pio.P600_OKATO ORDER BY p.P320_INITIAL_CHK ASC;

--выбока данных SelectData для крг, образец, смотрел, что выбирается по определенному ID
SELECT 
max(p.P320_CHK_ID) as P320_CHK_ID, 
p.P320_INITIAL_CHK, 
p.P200_PLAN_ID ,
p.P320_CHK_SHEDULE_DATE, 
p.P320_CHK_PERIOD_E, 
p.P320_ORG_NAME, 
pio.P600_FULLNAME, 
pio.P600_ADDRESS, 
p.P320_ORG_ADDRESS_FACT AS address_fact,
pio.P600_INN, 
pio.P600_OGRN, 
km.FREGNUM ,
(CASE WHEN p.P320_ORG_OKATO  IS NOT NULL THEN p.P320_ORG_OKATO ELSE pio.P600_OKATO END) AS okato
FROM P320_COMPOSITE_CHK_NFO p 
LEFT JOIN P600_INSP_OBJECT pio ON p.P600_ID = pio.P600_ID 
LEFT JOIN K_MERGED km ON  pio.RBASE_CID = km.RBASE_CID 
WHERE pio.P600_ID = 2603720 
GROUP BY p.P320_INITIAL_CHK, p.P200_PLAN_ID , p.P320_CHK_SHEDULE_DATE, p.P320_CHK_PERIOD_E, p.P320_ORG_NAME, pio.P600_FULLNAME, 
pio.P600_ADDRESS, p.P320_ORG_ADDRESS_FACT, pio.P600_INN, pio.P600_OGRN, km.FREGNUM, p.P320_ORG_OKATO, pio.p600_okato  ORDER BY p.P320_INITIAL_CHK ASC;



--Выбор данных из плана P200 и P320 и потом добавляем P360
SELECT 
max(p.P320_CHK_ID) as P320_CHK_ID, 
p.P320_INITIAL_CHK, 
p.P320_CHK_SHEDULE_DATE, 
p.P320_CHK_PERIOD_E, 
p.P320_ORG_NAME, 
pio.P600_FULLNAME, 
pio.P600_ADDRESS, 
p.P320_ORG_ADDRESS_FACT AS address_fact,
pio.P600_INN, 
pio.P600_OGRN, 
km.FREGNUM ,
(CASE WHEN p.P320_ORG_OKATO  IS NOT NULL THEN p.P320_ORG_OKATO ELSE pio.P600_OKATO END) AS okato
FROM P320_COMPOSITE_CHK_NFO p 
LEFT JOIN P600_INSP_OBJECT pio ON p.P600_ID = pio.P600_ID 
LEFT JOIN K_MERGED km ON  pio.RBASE_CID = km.RBASE_CID 
WHERE pio.P600_ID = 2603720 
GROUP BY p.P320_INITIAL_CHK, p.P320_CHK_SHEDULE_DATE, p.P320_CHK_PERIOD_E, p.P320_ORG_NAME, pio.P600_FULLNAME, 
pio.P600_ADDRESS, p.P320_ORG_ADDRESS_FACT, pio.P600_INN, pio.P600_OGRN, km.FREGNUM, p.P320_ORG_OKATO, pio.p600_okato  ORDER BY p.P320_INITIAL_CHK ASC;


SELECT count(*) FROM P320_COMPOSITE_CHK_NFO p WHERE p.P200_PLAN_ID = 9996; --1020

SELECT 
p.P320_INITIAL_CHK, 
--count(p.P320_CHK_ID),
p.P320_CHK_SHEDULE_DATE, 
p.P320_CHK_PERIOD_E, 
p.P320_ORG_NAME, 
p.P320_ORG_ADDRESS_FACT AS address_fact
, p.P320_CHK_STATUS 
FROM P320_COMPOSITE_CHK_NFO p WHERE p.P200_PLAN_ID = (SELECT max(pp.P200_PLAN_ID)FROM P200_PLAN_NFO pp)
GROUP BY p.P320_INITIAL_CHK, p.P320_CHK_SHEDULE_DATE, p.P320_CHK_PERIOD_E, p.P320_ORG_NAME,  
 p.P320_ORG_ADDRESS_FACT, p.P320_ORG_OKATO
, p.P320_CHK_STATUS  
ORDER BY p.P320_INITIAL_CHK ASC;

SELECT * FROM P320_COMPOSITE_CHK_NFO p WHERE p.P320_ORG_NAME = 'АО БАНК НБС' AND p.P200_PLAN_ID = (SELECT max(pcc.P200_PLAN_ID) FROM P320_COMPOSITE_CHK_NFO pcc) ORDER BY p.P320_CHK_ID ASC;
SELECT * FROM P320_COMPOSITE_CHK_NFO p WHERE p.P320_ORG_NAME = 'АО "Банк ФИНАМ"' AND p.P200_PLAN_ID = (SELECT max(pcc.P200_PLAN_ID) FROM P320_COMPOSITE_CHK_NFO pcc) ORDER BY p.P320_CHK_ID ASC;




SELECT * FROM p320_COMPOSITE_CHK_NFO WHERE P320_ORG_NAME = 'АО "Банк ФИНАМ"' 
AND P200_PLAN_ID = (SELECT max(pcc.P200_PLAN_ID) FROM P320_COMPOSITE_CHK_NFO pcc) 
AND  
--p320_initial_chk=2936912 
--AND 
p320_chk_status IN (1,2,3) AND 
p320_chk_id IN (
SELECT max(p320_chk_id) FROM p320_composite_chk_nfo WHERE p320_chk_status <> 4 GROUP BY p320_initial_chk);

--Выборка по планируемым проверкам на основании таблицы p320
SELECT * FROM p320_COMPOSITE_CHK_NFO WHERE  
P200_PLAN_ID = (SELECT max(c.P200_PLAN_ID) FROM P320_COMPOSITE_CHK_NFO c) 
AND P320_CHK_STATUS IN (1,2,3) 
AND P320_CHK_ID IN (SELECT max(P320_CHK_ID) FROM P320_COMPOSITE_CHK_NFO WHERE P320_CHK_STATUS <> 4 GROUP BY P320_INITIAL_CHK);


--Выборка по планируемым проверкам на основании таблицы p320 + p600
SELECT 
p.P320_CHK_ID ,
p.P200_PLAN_ID ,
p.P320_CHK_PERIOD_B ,
p.P320_CHK_PERIOD_E ,
p.P320_CHK_SHEDULE_DATE ,
p.P320_CHK_STATUS ,
p.P320_INITIAL_CHK ,
p.P320_ORG_NAME ,
p.P320_ORG_SHORTNAME ,
(CASE WHEN p.P320_ORG_INN IS NOT NULL THEN p.P320_ORG_INN ELSE pio.P600_INN END) AS org_inn,
(CASE WHEN p.P320_ORG_OGRN IS NOT NULL THEN p.P320_ORG_OGRN ELSE pio.P600_OGRN END) AS org_ogrn,
(CASE WHEN p.P320_ORG_OKATO IS NOT NULL THEN p.P320_ORG_OKATO ELSE pio.P600_OKATO END) AS okato,
p.P320_ORG_ADDRESS_FACT ,
p.P320_ORG_ADDRESS_LEGAL ,
km.FREGNUM
FROM p320_COMPOSITE_CHK_NFO p
LEFT JOIN P600_INSP_OBJECT pio ON p.P600_ID = pio.P600_ID 
LEFT JOIN K_MERGED km ON  pio.RBASE_CID = km.RBASE_CID 
WHERE  
P200_PLAN_ID = (SELECT max(c.P200_PLAN_ID) FROM P320_COMPOSITE_CHK_NFO c) 
AND P320_CHK_STATUS IN (1,2,3) 
AND P320_CHK_ID IN (SELECT max(P320_CHK_ID) FROM P320_COMPOSITE_CHK_NFO WHERE P320_CHK_STATUS <> 4 GROUP BY P320_INITIAL_CHK);


SELECT * FROM P320_COMPOSITE_CHK_NFO p WHERE p.P320_CHK_ID = 22699491;

SELECT 
count(*)
FROM p320_COMPOSITE_CHK_NFO p
LEFT JOIN P600_INSP_OBJECT pio ON p.P600_ID = pio.P600_ID 
LEFT JOIN K_MERGED km ON  pio.RBASE_CID = km.RBASE_CID 
WHERE  
P200_PLAN_ID = (SELECT max(c.P200_PLAN_ID) FROM P320_COMPOSITE_CHK_NFO c) 
AND P320_CHK_STATUS IN (1,2,3) 
AND P320_CHK_ID IN (SELECT max(P320_CHK_ID) FROM P320_COMPOSITE_CHK_NFO WHERE P320_CHK_STATUS <> 4 GROUP BY P320_INITIAL_CHK);

SELECT count(*) FROM P320_COMPOSITE_CHK_NFO p WHERE p.P200_PLAN_ID = (SELECT max(c.P200_PLAN_ID) FROM P320_COMPOSITE_CHK_NFO c)  ;



SELECT * FROM P600_INSP_OBJECT p WHERE p.P600_ID = 2396399;
(CASE WHEN p.P320_ORG_OKATO  IS NOT NULL THEN p.P320_ORG_OKATO ELSE pio.P600_OKATO END) AS okato



SELECT * FROM P320_COMPOSITE_CHK_NFO p WHERE p.P320_ORG_INN = '7714324003' 
AND  p.P200_PLAN_ID = (SELECT max(pcc.P200_PLAN_ID) FROM P320_COMPOSITE_CHK_NFO pcc)
AND p.P320_CHK_ID in (SELECT max(p320_chk_id) FROM p320_composite_chk_nfo WHERE p320_chk_status <> 4 GROUP BY p320_initial_chk);




 
 SELECT * FROM P320_COMPOSITE_CHK_NFO p WHERE  p.P320_CHK_STATUS = 4 AND p.P200_PLAN_ID = (SELECT max(pcc.P200_PLAN_ID) FROM P320_COMPOSITE_CHK_NFO pcc);



SELECT * FROM p320_COMPOSITE_CHK_NFO WHERE P200_PLAN_ID = (SELECT max(pcc.P200_PLAN_ID) FROM P320_COMPOSITE_CHK_NFO pcc) 
AND p320_chk_status IN (1,2,3) 
AND P320_ORG_INN = '7714324003'
AND p320_chk_id IN (SELECT max(p320_chk_id) FROM p320_composite_chk_nfo WHERE p320_chk_status <> 4 GROUP BY p320_initial_chk);





SELECT count(*) FROM P320_COMPOSITE_CHK_NFO p WHERE p.P320_CHK_STATUS <> 4 
AND p.P320_CHK_ID IN (SELECT max(p320_chk_id) FROM p320_composite_chk_nfo);


SELECT 
max(p.P320_CHK_ID) as P320_CHK_ID, 
p.P320_INITIAL_CHK, 
p.P320_CHK_SHEDULE_DATE, 
p.P320_CHK_PERIOD_E, 
p.P320_ORG_NAME, 
pio.P600_FULLNAME, 
pio.P600_ADDRESS, 
p.P320_ORG_ADDRESS_FACT AS ADDRESS_FACT, 
pio.P600_INN, 
pio.P600_OGRN, 
km.FREGNUM, 
(CASE WHEN p.P320_ORG_OKATO  IS NOT NULL THEN p.P320_ORG_OKATO ELSE pio.P600_OKATO END) AS okato 
FROM P320_COMPOSITE_CHK_NFO p 
LEFT JOIN P600_INSP_OBJECT pio ON p.P600_ID = pio.P600_ID 
LEFT JOIN K_MERGED km ON  pio.RBASE_CID = km.RBASE_CID 
WHERE p.P200_PLAN_ID = (SELECT max(c.P200_PLAN_ID) FROM P320_COMPOSITE_CHK_NFO c) 
GROUP BY p.P320_INITIAL_CHK, p.P320_CHK_SHEDULE_DATE, p.P320_CHK_PERIOD_E, p.P320_ORG_NAME, pio.P600_FULLNAME, 
pio.P600_ADDRESS, p.P320_ORG_ADDRESS_FACT, pio.P600_INN, pio.P600_OGRN, km.FREGNUM, p.P320_ORG_OKATO, pio.P600_OKATO 
ORDER BY p.P320_INITIAL_CHK ASC;

 
 
 
 
 

SELECT *
FROM P320_COMPOSITE_CHK_NFO p WHERE p.P200_PLAN_ID = (SELECT max(pp.P200_PLAN_ID) FROM P200_PLAN_NFO pp)  AND p.P320_INITIAL_CHK = 2936912 ORDER BY p.P320_CHK_ID ASC;

SELECT *
FROM P360_INSP_CHK_NFO p WHERE p.P200_PLAN_ID = (SELECT max(pp.P200_PLAN_ID)FROM P360_INSP_CHK_NFO pp);



SELECT * FROM P360_INSP_CHK_NFO pic WHERE pic.P200_PLAN_ID = ( SELECT max(P200_PLAN_ID) FROM P360_INSP_CHK_NFO );
SELECT * FROM P320_COMPOSITE_CHK_NFO pc WHERE pc.P200_PLAN_ID = ( SELECT max(P200_PLAN_ID) FROM P320_COMPOSITE_CHK_NFO );





SELECT count(*) FROM P600_INSP_OBJECT pio ;
SELECT count(*) FROM P320_COMPOSITE_CHK_NFO pccn  ;



SELECT *  FROM P320_COMPOSITE_CHK_NFO p  JOIN P600_INSP_OBJECT pio ON p.P600_ID = pio.P600_ID  WHERE p.P320_CHK_ID = 2685802;
SELECT p.P320_ORG_ADDRESS_FACT , p.P320_ORG_ADDRESS_LEGAL , pio.P600_ADDRESS  FROM P320_COMPOSITE_CHK_NFO p  JOIN P600_INSP_OBJECT pio ON p.P600_ID = pio.P600_ID  WHERE p.P320_CHK_ID = 2685802;

SELECT * FROM P600_INSP_OBJECT p WHERE p.P600_ADDRESS IS NULL;
SELECT p.P320_ORG_ADDRESS_FACT , p.P320_ORG_ADDRESS_LEGAL , pio.P600_ADDRESS  FROM P320_COMPOSITE_CHK_NFO p  JOIN P600_INSP_OBJECT pio ON p.P600_ID = pio.P600_ID  WHERE pio.P600_ID = 2527585;

SELECT * FROM P600_INSP_OBJECT pio WHERE pio.P600_ID = 2603720;

SELECT * FROM P320_COMPOSITE_CHK_NFO p WHERE p.P320_ORG_OGRN = 1144824000188;



--Создание таблицы Историчности структуры Каталога ЭПП (Заголовок - Хедер):
CREATE TABLE "DEV_OLTP_APPID_DATA"."K008_HEAD_EPC" 
   (	
    "K008_HEAD_ID" NUMBER(12,0) NOT NULL DISABLE, 
	"K008_HEAD_COMM" VARCHAR2(2000), 
	"k008_DATE_BEG" TIMESTAMP WITH TIME ZONE NOT NULL DISABLE, 
	"K008_DATE_END" TIMESTAMP WITH TIME ZONE NOT NULL DISABLE, 
	 PRIMARY KEY ("K008_HEAD_ID")
  ) TABLESPACE "TS_APPID_DT_S" ;

 --"P3077_DATE_BEG"
 
 SELECT * FROM P307_OBJ_GIBR p WHERE p.P3077_HEAD_ID = 2391755;



ALTER TABLE DEV_OLTP_APPID_DATA.K008_HEAD_EPC RENAME COLUMN K008_ID TO K008_HEAD_ID;






SELECT p.P600_ID AS ID, k.FREGNUM AS FULL_REG_NUM, p.P600_INN AS ORG_INN , p.P600_OGRN AS ORG_OGRN, 
p.P600_FULLNAME AS ORG_FULL_NAME, p.P600_SHORTNAME AS ORG_SHORT_NAME, 
p.P600_ADDRESS AS ORG_ADDRESS,  k.KBANK_CREGNUM15  AS REG_NUM, 
(CASE WHEN p.P600_OKATO IS NOT NULL THEN p.P600_OKATO ELSE p END) AS dateRegistration, 
(CASE WHEN p.P600_END_DATE IS NOT NULL THEN p.P600_END_DATE ELSE k.KBANK_CEDATE END) AS dateClosing 
FROM P600_INSP_OBJECT p LEFT JOIN K_MERGED k ON p.RBASE_CID = k.RBASE_CID ;



--########################################################
 --Вставить данные из нескольких таблиц в не нужную
INSERT INTO K001_CABINET_WORK_GROUP ( K001_CHK_DATE_BEGIN , K001_CHK_DATE_END , K001_ORG_NAME , K001_ORG_FULLNAME , K001_ORG_ADDRESS , K001_ORG_INN , K001_ORG_REGNUM , K001_ORG_OGRN   )
  SELECT 
pccn.P320_CHK_SHEDULE_DATE ,
ppn.P200_VALD_END ,
pccn.P320_ORG_NAME ,
pio.P600_FULLNAME , 
pio.P600_ADDRESS ,
pio.P600_INN, 
km.KBANK_CREGNUM, 
pio.P600_OGRN
FROM P200_PLAN_NFO ppn, P320_COMPOSITE_CHK_NFO pccn, P600_INSP_OBJECT pio, K_MERGED km
WHERE ppn.P200_PLAN_ID = pccn.P200_PLAN_ID AND pccn.P600_ID = pio.P600_ID AND pccn.P320_ORG_NAME = km.KBANK_CSNAME 
AND  ppn.P200_PLAN_ID = 924 AND ROWNUM <=20;
--########################################################

--
SELECT 
pccn.P320_CHK_SHEDULE_DATE ,
pccn.P320_CHK_PERIOD_E  ,
pccn.P320_ORG_NAME ,
pio.P600_FULLNAME , 
pio.P600_ADDRESS ,
pio.P600_INN, 
km.KBANK_CREGNUM, 
pio.P600_OGRN
FROM P320_COMPOSITE_CHK_NFO pccn, P600_INSP_OBJECT pio, K_MERGED km
WHERE pccn.P600_ID = pio.P600_ID AND pccn.P320_ORG_NAME = km.KBANK_CSNAME 
AND  pccn.P320_CHK_SHEDULE_DATE >= to_date('2020-08-02', 'yyyy-MM-dd') 
AND pccn.P320_CHK_SHEDULE_DATE <= to_date('2020-08-31', 'yyyy-MM-dd')
AND ROWNUM <=500;

SELECT count(*) FROM P320_COMPOSITE_CHK_NFO pccn WHERE pccn.P320_CHK_SHEDULE_DATE >= to_date('2020-12-01', 'yyyy-MM-dd')
AND pccn.P320_CHK_SHEDULE_DATE <= to_date('2020-12-31', 'yyyy-MM-dd');  


SELECT 
pccn.P320_CHK_SHEDULE_DATE ,
pccn.P320_CHK_PERIOD_E  ,
pccn.P320_ORG_NAME ,
pio.P600_FULLNAME , 
pio.P600_ADDRESS ,
pio.P600_INN, 
km.KBANK_CREGNUM, 
pio.P600_OGRN
FROM P320_COMPOSITE_CHK_NFO pccn, P600_INSP_OBJECT pio, K_MERGED km
WHERE pccn.P600_ID = pio.P600_ID AND pccn.P320_ORG_NAME = km.KBANK_CSNAME 
AND  pccn.P320_CHK_SHEDULE_DATE BETWEEN add_months(trunc(sysdate,'mm'),-19) AND last_day(add_months(trunc(sysdate,'mm'),-19))+0.99999 AND ROWNUM <=300;


SELECT 
pccn.P320_CHK_SHEDULE_DATE ,
pccn.P320_CHK_PERIOD_E  ,
pccn.P320_ORG_NAME ,
pio.P600_FULLNAME , 
pio.P600_ADDRESS ,
pio.P600_INN, 
km.KBANK_CREGNUM, 
pio.P600_OGRN
FROM P320_COMPOSITE_CHK_NFO pccn, P600_INSP_OBJECT pio, K_MERGED km
WHERE pccn.P600_ID = pio.P600_ID AND pccn.P320_ORG_NAME = km.KBANK_CSNAME 
AND  pccn.P320_CHK_SHEDULE_DATE BETWEEN add_months(trunc(sysdate,'mm'),-19) AND last_day(add_months(trunc(sysdate,'mm'),-19))+0.99999 AND ROWNUM <=300;

--12345
SELECT 
pccn.P320_CHK_ID ,
pccn.P320_CHK_SHEDULE_DATE ,
pccn.P320_CHK_PERIOD_E  ,
pccn.P320_ORG_NAME ,
pccn.P320_ORG_ADDRESS_FACT, 
pio.P600_ADDRESS ,
km.KBANK_CREGNUM, 
pio.P600_INN, 
pio.P600_OGRN
FROM P320_COMPOSITE_CHK_NFO pccn 
LEFT JOIN P600_INSP_OBJECT pio ON pccn.P600_ID = pio.P600_ID
LEFT JOIN K_MERGED km ON  pio.RBASE_CID = km.RBASE_CID
WHERE pccn.P320_CHK_SHEDULE_DATE >= to_date('2020-12-01', 'yyyy-MM-dd') AND pccn.P320_CHK_SHEDULE_DATE <= to_date('2020-12-31', 'yyyy-MM-dd')
ORDER BY pccn.P320_ORG_NAME, pccn.P320_CHK_ID  asc;


--6789
SELECT 
pccn.P320_CHK_ID ,
pccn.P320_CHK_SHEDULE_DATE ,
pccn.P320_CHK_PERIOD_E  ,
pccn.P320_ORG_NAME ,
pio.P600_FULLNAME , 
pio.P600_ADDRESS ,
km.KBANK_CREGNUM, 
pio.P600_INN, 
pio.P600_OGRN
FROM P320_COMPOSITE_CHK_NFO pccn 
LEFT JOIN P600_INSP_OBJECT pio ON pccn.P600_ID = pio.P600_ID
LEFT JOIN K_MERGED km ON  pio.RBASE_CID = km.RBASE_CID
WHERE pccn.P320_CHK_SHEDULE_DATE BETWEEN (add_months(trunc(sysdate,'mm'),-19)) AND (last_day(add_months(trunc(sysdate,'mm'),-19))+0.99999) AND ROWNUM <=300
ORDER BY pccn.P320_CHK_ID asc;

--10 11 12
SELECT 
pccn.P320_CHK_ID ,
pccn.P320_INITIAL_CHK ,
pccn.P320_CHK_SHEDULE_DATE ,
pccn.P320_CHK_PERIOD_E  ,
pccn.P320_ORG_NAME ,
pio.P600_FULLNAME , 
pio.P600_ADDRESS ,
km.KBANK_CREGNUM, 
pio.P600_INN, 
pio.P600_OGRN
FROM P320_COMPOSITE_CHK_NFO pccn 
LEFT JOIN P600_INSP_OBJECT pio ON pccn.P600_ID = pio.P600_ID
LEFT JOIN K_MERGED km ON  pio.RBASE_CID = km.RBASE_CID
WHERE pccn.P320_CHK_SHEDULE_DATE >= to_date('2019-01-01','yyyy-MM-dd') AND pccn.P320_CHK_SHEDULE_DATE <= to_date('2019-01-31','yyyy-MM-dd') 
AND  pccn.P320_CHK_ID IN (SELECT max(p.P320_CHK_ID) FROM P320_COMPOSITE_CHK_NFO p GROUP BY p.P320_INITIAL_CHK)
AND ROWNUM <=300
ORDER BY pccn.P320_ORG_NAME, pccn.P320_CHK_ID asc;


SELECT 
count(pccn.P320_CHK_ID ),
pccn.P320_INITIAL_CHK 
--pccn.P320_CHK_SHEDULE_DATE ,
--pccn.P320_CHK_PERIOD_E  ,
--pccn.P320_ORG_NAME 
--pio.P600_FULLNAME , 
--pio.P600_ADDRESS ,
--km.KBANK_CREGNUM, 
--pio.P600_INN, 
--pio.P600_OGRN
FROM P320_COMPOSITE_CHK_NFO pccn 
LEFT JOIN P600_INSP_OBJECT pio ON pccn.P600_ID = pio.P600_ID
LEFT JOIN K_MERGED km ON  pio.RBASE_CID = km.RBASE_CID
WHERE pccn.P320_CHK_SHEDULE_DATE >= to_date('2019-01-01','yyyy-MM-dd') AND pccn.P320_CHK_SHEDULE_DATE <= to_date('2019-01-31','yyyy-MM-dd') 
--AND  pccn.P320_CHK_ID IN (SELECT max(p.P320_CHK_ID) FROM P320_COMPOSITE_CHK_NFO p GROUP BY p.P320_INITIAL_CHK)
AND ROWNUM <=300
GROUP BY pccn.P320_INITIAL_CHK
ORDER BY pccn.P320_INITIAL_CHK asc;
--ORDER BY pccn.P320_ORG_NAME, pccn.P320_CHK_ID asc;

SELECT 
pccn.P320_CHK_ID,
pccn.P320_INITIAL_CHK ,
pccn.P320_ORG_NAME,
pccn.P320_CHK_SHEDULE_DATE ,
pccn.P320_CHK_PERIOD_E  ,
pio.P600_FULLNAME , 
pio.P600_ADDRESS ,
km.KBANK_CREGNUM, 
pio.P600_INN, 
pio.P600_OGRN
FROM P320_COMPOSITE_CHK_NFO pccn 
LEFT JOIN P600_INSP_OBJECT pio ON pccn.P600_ID = pio.P600_ID
LEFT JOIN K_MERGED km ON  pio.RBASE_CID = km.RBASE_CID
WHERE pccn.P320_CHK_SHEDULE_DATE >= to_date('2019-01-01','yyyy-MM-dd') AND pccn.P320_CHK_SHEDULE_DATE <= to_date('2019-01-31','yyyy-MM-dd') 
AND pccn.P320_INITIAL_CHK in (13608949)
--AND  pccn.P320_CHK_ID IN (SELECT max(p.P320_CHK_ID) FROM P320_COMPOSITE_CHK_NFO p GROUP BY p.P320_INITIAL_CHK)
--GROUP BY pccn.P320_INITIAL_CHK 
ORDER BY pccn.P320_INITIAL_CHK, pccn.P320_CHK_ID , pccn.P320_ORG_NAME  asc;

--Выборка данных для создания кабинетов рабочих групп
--!!!!!!! ПОЛЬЗУЮСЬ ЭТОЙ ВЫБОРКОЙ
SELECT 
max(p.P320_CHK_ID) AS P320_CHK_ID, 
p.P320_INITIAL_CHK,
p.P320_CHK_SHEDULE_DATE ,
p.P320_CHK_PERIOD_E  ,
p.P320_ORG_NAME,
pio.P600_FULLNAME, 
pio.P600_ADDRESS ,
pio.P600_INN, 
pio.P600_OGRN,
km.FREGNUM --KBANK_CREGNUM 
FROM P320_COMPOSITE_CHK_NFO p 
LEFT JOIN P600_INSP_OBJECT pio ON p.P600_ID = pio.P600_ID
LEFT JOIN K_MERGED km ON  pio.RBASE_CID = km.RBASE_CID
WHERE p.P320_CHK_SHEDULE_DATE >= to_date('2018-01-01','yyyy-MM-dd') 
AND p.P320_CHK_SHEDULE_DATE <= to_date('2018-01-31','yyyy-MM-dd')
GROUP BY p.P320_INITIAL_CHK,p.P320_CHK_SHEDULE_DATE ,p.P320_CHK_PERIOD_E  , p.P320_ORG_NAME, pio.P600_FULLNAME, 
pio.P600_ADDRESS, pio.P600_INN, pio.P600_OGRN, km.FREGNUM --km.KBANK_CREGNUM
ORDER BY p.P320_INITIAL_CHK ASC ;
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

--Выборка данных для создания кабинетов рабочих групп
--!!!!!!! ПОЛЬЗУЮСЬ ЭТОЙ ВЫБОРКОЙ - так она написана в java
SELECT 
max(p.P320_CHK_ID) as P320_CHK_ID, 
p.P320_INITIAL_CHK, 
p.P320_CHK_SHEDULE_DATE, 
p.P320_CHK_PERIOD_E, 
p.P320_ORG_NAME, 
pio.P600_FULLNAME, 
pio.P600_ADDRESS, 
pio.P600_INN, 
pio.P600_OGRN, 
km.FREGNUM 
FROM P320_COMPOSITE_CHK_NFO p 
LEFT JOIN P600_INSP_OBJECT pio ON p.P600_ID = pio.P600_ID 
LEFT JOIN K_MERGED km ON  pio.RBASE_CID = km.RBASE_CID 
WHERE p.P320_CHK_SHEDULE_DATE >=? 
AND p.P320_CHK_SHEDULE_DATE <=? 
GROUP BY p.P320_INITIAL_CHK, p.P320_CHK_SHEDULE_DATE, p.P320_CHK_PERIOD_E, p.P320_ORG_NAME, pio.P600_FULLNAME, 
pio.P600_ADDRESS, pio.P600_INN, pio.P600_OGRN, km.FREGNUM 
ORDER BY p.P320_INITIAL_CHK ASC;
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!




--Выборка адрасов юр. и фактического по разным таблицам:
SELECT p.P600_ID , p.P600_ADDRESS , p.P600_ACTIVITY_ADDRESS  FROM P600_INSP_OBJECT p WHERE rownum <= 50;

SELECT p.P320_CHK_ID , p.P320_ORG_ADDRESS_FACT , p.P320_ORG_ADDRESS_FACT  FROM P320_COMPOSITE_CHK_NFO p WHERE rownum <= 50;

SELECT p.P360_ID , p.P360_ORG_ADDRESS_EGRUL , p.P360_ORG_ADDRESS_ACTUAL , p.P360_ORG_ADDRESS_POST 
FROM P360_INSP_CHK_NFO p WHERE rownum <= 50;


SELECT * FROM P600_INSP_OBJECT p LEFT JOIN P360_INSP_CHK_NFO i ON p.P600_ID = i.P600_ID WHERE p.P600_ID = 2738081;

SELECT * FROM K001_CABINET_WORK_GROUP k WHERE k.K001_CODE_CAB = '1041402041768-19-0015';



--заменил все не правильные даты на NULL
UPDATE K001_CABINET_WORK_GROUP k SET k.K001_CHK_DATE_END = NULL WHERE k.K001_CHK_DATE_END = TO_DATE('0001-01-01', 'yyyy-MM-dd'); 

SELECT * FROM K001_CABINET_WORK_GROUP k WHERE k.K001_CHK_DATE_END = TO_DATE('0001-01-01', 'yyyy-MM-dd'); 





--Это так в PostgreSQL
(SELECT array_to_json(array_agg(row_to_json(t))) FROM
    (SELECT
    cm.P600_ID ,
	cm.P600_ADDRESS ,
    au.P360_ORG_INN ,
    au.P360_ORG_OGRN ,
    au.P360_ORG_NAME ,
    au.P360_ORG_ADDRESS_ACTUAL 
FROM P600_INSP_OBJECT cm JOIN P360_INSP_CHK_NFO au ON cm.P600_ID = au.P600_ID
WHERE cm.P600_ID = 2738081
 ) t);

(SELECT array_to_json(array_agg(row_to_json(t))) FROM
    (SELECT
    cm.P600_ID ,
	cm.P600_ADDRESS ,
    au.P360_ORG_INN ,
    au.P360_ORG_OGRN ,
    au.P360_ORG_NAME ,
    au.P360_ORG_ADDRESS_ACTUAL 
FROM P600_INSP_OBJECT cm JOIN P360_INSP_CHK_NFO au ON cm.P600_ID = au.P600_ID
WHERE cm.P600_ID = 2738081
 ) t);


SELECT JSON_ARRAY(json_object(
'id' VALUE p.P600_ID  ,
'inn' VALUE p.P600_INN , 
'name' VALUE p.P600_SHORTNAME 
) returning clob) from P600_INSP_OBJECT p WHERE p.P600_ID IN ( 2738081, 3099636 ) ;

select json_object ('Id' is d.K001_ID  , 'code_cab' is d.K001_CODE_CAB , d.K001_ORG_NAME , d.K001_ORG_INN  ) cabinets
  from K001_CABINET_WORK_GROUP d ;




SELECT a.K001_ID, a.K001_CODE_CAB  FROM K001_CABINET_WORK_GROUP a WHERE a.K001_CHK_DATE_BEGIN >= to_date('2019-01-01', 'yyyy-MM-dd')
and a.K001_CHK_DATE_BEGIN <= to_date('2019-12-31', 'yyyy-MM-dd') ORDER BY a.K001_CODE_CAB ; 
SELECT a.K001_ID, a.K001_CODE_CAB FROM K001_CABINET_WORK_GROUP a WHERE a.K001_ID IN ('cec50586-f193-41b6-b0e9-273ec16861d4', '98a2b849-7cb6-4fea-8626-8641c56f077b', 'b1130d77-e756-426b-8583-5709b804c04f');

SELECT COUNT(a.K001_ID)  FROM K001_CABINET_WORK_GROUP a WHERE a.K001_CHK_DATE_BEGIN >= to_date('2019-01-01', 'yyyy-MM-dd') and a.K001_CHK_DATE_BEGIN <= to_date('2019-12-31', 'yyyy-MM-dd');
--SELECT COUNT(a.id) FROM K001_CABINET_WORK_GROUP a WHERE a.dateBegin >= ?1 and a.dateBegin >= ?2

--DELETE FROM K001_CABINET_WORK_GROUP kcwg ;

SELECT p.P360_WORKGROUP_LST  FROM P360_INSP_CHK_NFO p WHERE rownum <=20;

SELECT 
pe.P410_FIO ,
pe.P410_POSITION_NAME 
FROM P410_EMPLOYEE pe WHERE rownum <= 50;

--выбор данных для Планируемых кабинетов
SELECT 
p.P320_CHK_ID AS CHK_ID, 
p.P200_PLAN_ID AS PLAN_ID, 
p.P320_CHK_PERIOD_B AS CHK_PERIOD_BEGIN, 
p.P320_CHK_PERIOD_E AS CHK_PERIOD_END, 
p.P320_CHK_SHEDULE_DATE AS CHK_SHEDULE_DATE, 
p.P320_CHK_STATUS AS CHK_STATUS, 
p.P320_INITIAL_CHK AS INITIAL_CHK_ID, 
p.P320_ORG_NAME AS ORG_NAME, 
p.P320_ORG_SHORTNAME AS ORG_SHORT_NAME, 
(CASE WHEN p.P320_ORG_INN IS NOT NULL THEN p.P320_ORG_INN ELSE pio.P600_INN END) AS ORG_INN, 
(CASE WHEN p.P320_ORG_OGRN IS NOT NULL THEN p.P320_ORG_OGRN ELSE pio.P600_OGRN END) AS ORG_ORGN, 
(CASE WHEN p.P320_ORG_OKATO IS NOT NULL THEN p.P320_ORG_OKATO ELSE pio.P600_OKATO END) AS OKATO, 
p.P320_ORG_ADDRESS_FACT AS ORG_ADDRESS_FACT, 
p.P320_ORG_ADDRESS_LEGAL AS ORG_ADDRESS_LEGAL, 
km.FREGNUM AS REG_NUM,
pc.K015_DATE_OF_CREATION AS DATE_OF_CABINET_CREATION,
pc.K015_ENABLE_CREATION AS ENABLE_CREATION_OF_CABINET,
pc.K015_TEXT_OF_DESCRIPTION AS TEXT_OF_DESCRIPTION_OF_CABINET,
pc.K015_FOUNDATION_FOR_CREATION AS FOUNDATION_FOR_CREATION,
pc.K015_CREATION_MODE_IS_AUTOMATIC AS CREATION_MODE_IS_AUTOMATIC,
pc.K015_USER AS USER_WHO_CREATED,
pc.K015_IS_CREATED AS CABINET_IS_CREATED,
pc.K015_COMMENT AS COMMENT_FOR_CABINET,
pc.K001_ID AS CABINET_ID
FROM p320_COMPOSITE_CHK_NFO p 
LEFT JOIN P600_INSP_OBJECT pio ON p.P600_ID = pio.P600_ID 
LEFT JOIN K_MERGED km ON  pio.RBASE_CID = km.RBASE_CID 
LEFT JOIN K015_PLANNED_CABINETS pc ON p.P320_CHK_ID = pc.P320_CHK_ID 
WHERE  
p.P200_PLAN_ID = (SELECT max(c.P200_PLAN_ID) FROM P320_COMPOSITE_CHK_NFO c) 
AND p.P320_CHK_STATUS IN (1,2,3) 
AND p.P320_CHK_ID IN (SELECT max(P320_CHK_ID) FROM P320_COMPOSITE_CHK_NFO WHERE P320_CHK_STATUS <> 4 GROUP BY P320_INITIAL_CHK);

--выбрать данные из К015 и добавить данные из Р320 и других
SELECT 
p.P320_CHK_ID AS CHK_ID, 
p.P200_PLAN_ID AS PLAN_ID, 
p.P320_CHK_PERIOD_B AS CHK_PERIOD_BEGIN, 
p.P320_CHK_PERIOD_E AS CHK_PERIOD_END, 
p.P320_CHK_SHEDULE_DATE AS CHK_SHEDULE_DATE, 
p.P320_CHK_STATUS AS CHK_STATUS, 
p.P320_INITIAL_CHK AS INITIAL_CHK_ID, 
p.P320_ORG_NAME AS ORG_NAME, 
p.P320_ORG_SHORTNAME AS ORG_SHORT_NAME, 
(CASE WHEN p.P320_ORG_INN IS NOT NULL THEN p.P320_ORG_INN ELSE pio.P600_INN END) AS ORG_INN, 
(CASE WHEN p.P320_ORG_OGRN IS NOT NULL THEN p.P320_ORG_OGRN ELSE pio.P600_OGRN END) AS ORG_ORGN, 
(CASE WHEN p.P320_ORG_OKATO IS NOT NULL THEN p.P320_ORG_OKATO ELSE pio.P600_OKATO END) AS OKATO, 
p.P320_ORG_ADDRESS_FACT AS ORG_ADDRESS_FACT, 
p.P320_ORG_ADDRESS_LEGAL AS ORG_ADDRESS_LEGAL, 
km.FREGNUM AS REG_NUM,
pc.K015_DATE_OF_CREATION AS DATE_OF_CABINET_CREATION,
pc.K015_ENABLE_CREATION AS ENABLE_CREATION_OF_CABINET,
pc.K015_TEXT_OF_DESCRIPTION AS TEXT_OF_DESCRIPTION_OF_CABINET,
pc.K015_FOUNDATION_FOR_CREATION AS FOUNDATION_FOR_CREATION,
pc.K015_CREATION_MODE_IS_AUTOMATIC AS CREATION_MODE_IS_AUTOMATIC,
pc.K015_USER AS USER_WHO_CREATED,
pc.K015_IS_CREATED AS CABINET_IS_CREATED,
pc.K015_COMMENT AS COMMENT_FOR_CABINET,
pc.K001_ID AS CABINET_ID
FROM  K015_PLANNED_CABINETS pc
LEFT JOIN p320_COMPOSITE_CHK_NFO p ON p.P320_CHK_ID = pc.P320_CHK_ID 
LEFT JOIN P600_INSP_OBJECT pio ON p.P600_ID = pio.P600_ID 
LEFT JOIN K_MERGED km ON  pio.RBASE_CID = km.RBASE_CID 
WHERE  
p.P200_PLAN_ID = (SELECT max(c.P200_PLAN_ID) FROM P320_COMPOSITE_CHK_NFO c) 
AND p.P320_CHK_STATUS IN (1,2,3) 
AND p.P320_CHK_ID IN (SELECT max(P320_CHK_ID) FROM P320_COMPOSITE_CHK_NFO WHERE P320_CHK_STATUS <> 4 GROUP BY P320_INITIAL_CHK);


SELECT * FROM K015_PLANNED_CABINETS k WHERE k.K015_IS_CREATED = 0 AND k.K015_ENABLE_CREATION = 0;
SELECT * FROM K015_PLANNED_CABINETS k WHERE k.P320_CHK_ID = 3004330;

UPDATE K015_PLANNED_CABINETS k 
SET k.K015_TEXT_OF_DESCRIPTION = ?1, 
k.K015_FOUNDATION_FOR_CREATION = ?2,
k.K015_COMMENT = ?3,
k.K015_USER = ?4,
k.K015_ENABLE_CREATION = ?5,
k.K015_DATE_OF_CREATION = ?6,
k.K015_CREATION_MODE_IS_AUTOMATIC = ?7,
k.K015_MODIFIED_AT = ?8
WHERE k.P320_CHK_ID = ?9;

UPDATE K015_PLANNED_CABINETS k SET k.K015_IS_CREATED = 0 WHERE k.K015_ID = 'f495b966-b274-47ff-ac4d-d7632313275a';

--DELETE FROM K015_PLANNED_CABINETS k WHERE k.K015_ID = '7cc81dad-6677-443a-bb24-d0e7a6adc954';

SELECT CURRENT_TIMESTAMP FROM dual;

SELECT 
p.P320_CHK_ID AS CHK_ID, 
p.P200_PLAN_ID AS PLAN_ID, 
p.P320_CHK_PERIOD_B AS CHK_PERIOD_BEGIN, 
p.P320_CHK_PERIOD_E AS CHK_PERIOD_END, 
p.P320_CHK_SHEDULE_DATE AS CHK_SHEDULE_DATE, 
p.P320_CHK_STATUS AS CHK_STATUS, 
p.P320_INITIAL_CHK AS INITIAL_CHK_ID, 
p.P320_ORG_NAME AS ORG_NAME, 
p.P320_ORG_SHORTNAME AS ORG_SHORT_NAME, 
(CASE WHEN p.P320_ORG_INN IS NOT NULL THEN p.P320_ORG_INN ELSE pio.P600_INN END) AS ORG_INN, 
(CASE WHEN p.P320_ORG_OGRN IS NOT NULL THEN p.P320_ORG_OGRN ELSE pio.P600_OGRN END) AS ORG_ORGN, 
(CASE WHEN p.P320_ORG_OKATO IS NOT NULL THEN p.P320_ORG_OKATO ELSE pio.P600_OKATO END) AS OKATO, 
p.P320_ORG_ADDRESS_FACT AS ORG_ADDRESS_FACT, 
p.P320_ORG_ADDRESS_LEGAL AS ORG_ADDRESS_LEGAL, 
km.FREGNUM AS REG_NUM,
pc.K015_DATE_OF_CREATION AS DATE_OF_CABINET_CREATION,
pc.K015_ENABLE_CREATION AS ENABLE_CREATION_OF_CABINET,
pc.K015_TEXT_OF_DESCRIPTION AS TEXT_OF_DESCRIPTION_OF_CABINET,
pc.K015_FOUNDATION_FOR_CREATION AS FOUNDATION_FOR_CREATION,
pc.K015_CREATION_MODE_IS_AUTOMATIC AS CREATION_MODE_IS_AUTOMATIC,
pc.K015_USER AS USER_WHO_CREATED,
pc.K015_IS_CREATED AS CABINET_IS_CREATED,
pc.K015_COMMENT AS COMMENT_FOR_CABINET,
pc.K001_ID AS CABINET_ID
FROM  K015_PLANNED_CABINETS pc
LEFT JOIN p320_COMPOSITE_CHK_NFO p ON p.P320_CHK_ID = pc.P320_CHK_ID 
LEFT JOIN P600_INSP_OBJECT pio ON p.P600_ID = pio.P600_ID 
LEFT JOIN K_MERGED km ON  pio.RBASE_CID = km.RBASE_CID 
WHERE  
p.P200_PLAN_ID = (SELECT max(c.P200_PLAN_ID) FROM P320_COMPOSITE_CHK_NFO c) 
AND p.P320_CHK_STATUS IN (1,2,3) 
AND p.P320_CHK_ID IN (SELECT max(P320_CHK_ID) FROM P320_COMPOSITE_CHK_NFO WHERE P320_CHK_STATUS <> 4 GROUP BY P320_INITIAL_CHK)
AND pc.K015_IS_CREATED = 0 AND pc.K015_ENABLE_CREATION = 1;



 

--выбор данных 
SELECT 
p.P320_CHK_ID AS CHK_ID, 
p.P200_PLAN_ID AS PLAN_ID, 
p.P320_CHK_PERIOD_B AS CHK_PERIOD_BEGIN, 
p.P320_CHK_PERIOD_E AS CHK_PERIOD_END, 
p.P320_CHK_SHEDULE_DATE AS CHK_SHEDULE_DATE 
FROM p320_COMPOSITE_CHK_NFO p 
WHERE  
P200_PLAN_ID = (SELECT max(c.P200_PLAN_ID) FROM P320_COMPOSITE_CHK_NFO c) 
AND P320_CHK_STATUS IN (1,2,3) 
AND P320_CHK_ID IN (SELECT max(P320_CHK_ID) FROM P320_COMPOSITE_CHK_NFO WHERE P320_CHK_STATUS <> 4 GROUP BY P320_INITIAL_CHK);


INSERT INTO K015_PLANNED_CABINETS pc (pc.K015_ID , pc.P320_CHK_ID, pc.K015_DATE_OF_CREATION)  
VALUES ('7cc81dad-6677-443a-bb24-d0e7a6adc954', 3057452, to_date('2020-11-01', 'yyyy-MM-dd'))
WHERE NOT EXISTS (
    SELECT 1 FROM K015_PLANNED_CABINETS kk 
    WHERE kk.P320_CHK_ID = 3057452 );

   --встака записи при сохранении кабинета
INSERT INTO K001_CABINET_WORK_GROUP p (p.K001_ID , p.P320_CHK_ID, p.K001_CODE_CAB, p.K001_WORKING_MODE, p.K001_STATUS_CAB, p.K005_ID, p.K001_CREATED_AT)  
SELECT ? , ? , ?, ?, ?, ?, CURRENT_TIMESTAMP) FROM dual
WHERE NOT EXISTS (
  SELECT 1 FROM K001_CABINET_WORK_GROUP kk 
  WHERE kk.P320_CHK_ID = ? );
 
INSERT INTO K001_CABINET_WORK_GROUP p (p.K001_ID , p.P320_CHK_ID, p.K001_CODE_CAB, p.K001_CHK_DATE_BEGIN, p.K001_WORKING_MODE, p.K001_STATUS_CAB, p.K005_ID, p.K001_CREATED_AT)  
SELECT 'c8d85d54-089b-4edb-8e05-55835b63a217' , 2977580 , '87', to_date('2022-10-01', 'yyyy-MM-dd'), 1, 'создан', '2c9e25c583363a3a0183363e1de50002', CURRENT_TIMESTAMP FROM dual
WHERE NOT EXISTS (
  SELECT 1 FROM K001_CABINET_WORK_GROUP kk 
  WHERE kk.P320_CHK_ID = 2977580 );
 
 --DELETE FROM K001_CABINET_WORK_GROUP k WHERE k.K001_CODE_CAB = '87';
 
 SELECT * FROM K015_PLANNED_CABINETS k WHERE k.P320_CHK_ID = 3090778;

ALTER TABLE K003_NOTIFICATIONS_AND_CONFIRMATIONS  ADD K003_PLANNING_SENDING TIMESTAMP WITH TIME ZONE ;

INSERT INTO K006_ELECTRONIC_CATALOG_TEMPLATE k (
k.TITLE, k.TITLE_MATERIALIZED_PATH, k.DEPTH_LEVEL, k.PARENT_TITLE_MATERIALIZED_PATH, k.IS_DIRECTORY, k.PARENT_ID, k.K008_HEAD_ID) 
VALUES (:title, :titleMaterializedPath, :depthLevel, :parentTitleMaterializedPath, :isDirectory, :parentId, :headerId)


UPDATE K006_ELECTRONIC_CATALOG_TEMPLATE k SET k.TITLE = :title WHERE k.K006_ID = :templateId AND k.K008_HEAD_ID = :headerId;

SELECT k.K008_HEAD_ID FROM K008_HEAD_EPC k WHERE k.K008_HEAD_ID = (SELECT max(e.K008_HEAD_ID) FROM K008_HEAD_EPC e);

   

SELECT * FROM K015_PLANNED_CABINETS p WHERE p.K015_IS_CREATED = 1;
SELECT COUNT(*) FROM K015_PLANNED_CABINETS p WHERE p.K015_ENABLE_CREATION = 0;

DELETE FROM K015_PLANNED_CABINETS k WHERE k.K015_ID = 'bb941593-a48c-46a5-ab84-6540e07a95f1';

SELECT * FROM K015_PLANNED_CABINETS k WHERE k.P320_CHK_ID = 2977580;
UPDATE K015_PLANNED_CABINETS k SET k.K015_IS_CREATED = 1 WHERE k.K015_ID = 'bb941593-a48c-46a5-ab84-6540e07a95f1';
UPDATE K015_PLANNED_CABINETS k SET k.K001_ID = '96014fb1-c99d-4103-8c74-847da063e5c4' WHERE k.K015_ID = 'bb941593-a48c-46a5-ab84-6540e07a95f1';

UPDATE K015_PLANNED_CABINETS p SET p.K015_IS_CREATED = 1, p.K001_ID =  :cabinetId , p.K015_USER = :user,
p.K015_MODIFIED_AT = CURRENT_TIMESTAMP WHERE p.K015_ID = :id;
   
   
--ALTER TABLE K001_CABINET_WORK_GROUP ; --P320_CHK_ID
 ALTER TABLE K001_CABINET_WORK_GROUP ADD ( P320_CHK_ID NUMBER(12,0)  );

ALTER TABLE K001_CABINET_WORK_GROUP ADD  K001_FOUNDATION_OF_CREATION VARCHAR2(1000)  ;

SELECT * FROM K001_CABINET_WORK_GROUP p WHERE p.K001_FOUNDATION_OF_CREATION 

UPDATE K001_CABINET_WORK_GROUP p SET p.K005_ID  = null WHERE p.K001_CODE_CAB  = 1;


SELECT DISTINCT k.K001_ID  FROM K001_CABINET_WORK_GROUP k LEFT JOIN K004_MEMBER_TO_CABINET km ON k.K001_ID = km.K001_ID WHERE k.K001_CODE_CAB = 4;
--DELETE FROM K004_MEMBER_TO_CABINET k WHERE k.K001_ID = 'b5977d4a-fa76-418d-b29a-89359aa48847';
--DELETE FROM K003_NOTIFICATIONS_AND_CONFIRMATIONS k WHERE k.K001_ID = (SELECT DISTINCT k.K001_ID  FROM K001_CABINET_WORK_GROUP k 
--LEFT JOIN K004_MEMBER_TO_CABINET km ON k.K001_ID = km.K001_ID WHERE k.K001_CODE_CAB = 86);
--DELETE FROM K001_CABINET_WORK_GROUP k WHERE k.K001_CODE_CAB = 86;

SELECT * FROM K001_CABINET_WORK_GROUP k LEFT JOIN K003_NOTIFICATIONS_AND_CONFIRMATIONS n ON k.K001_ID = n.K001_ID  WHERE k.K001_CODE_CAB  = 86;


SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K006_ID = 69 AND k.K008_HEAD_ID = 125;
DELETE FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K006_ID = 69 AND k.K008_HEAD_ID = 125;
INSERT INTO K006_ELECTRONIC_CATALOG_TEMPLATE k (k.K006_ID, k.TITLE_MATERIALIZED_PATH , k.DEPTH_LEVEL ,k.IS_DIRECTORY, k.PARENT_TITLE_MATERIALIZED_PATH  ,k.K008_HEAD_ID) 
values (69, '6AaKLW_KSYmSwRFfMCgKNgaa4UJmYyT2unH-B67uxJGwewqStduoQs21Bo5tV9q9Iw_P1EBv2gQgCd5b-PgYC8wA',4,1,'6AaKLW_KSYmSwRFfMCgKNgaa4UJmYyT2unH-B67uxJGwewqStduoQs21Bo5tV9q9Iw~',125);

--69	Title Folder 111	6AaKLW_KSYmSwRFfMCgKNgaa4UJmYyT2unH-B67uxJGwewqStduoQs21Bo5tV9q9Iw_P1EBv2gQgCd5b-PgYC8wA	4	6AaKLW_KSYmSwRFfMCgKNgaa4UJmYyT2unH-B67uxJGwewqStduoQs21Bo5tV9q9Iw~	2022-09-02 12:13:31.609 +0300		1	66	125

SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K006_ID = 66 AND k.K008_HEAD_ID = 125;

INSERT INTO K006_ELECTRONIC_CATALOG_TEMPLATE k (
k.TITLE, k.TITLE_MATERIALIZED_PATH, k.DEPTH_LEVEL, k.PARENT_TITLE_MATERIALIZED_PATH, k.IS_DIRECTORY, k.PARENT_ID, k.K008_HEAD_ID) 
VALUES ();

--DELETE FROM K008_HEAD_EPC k WHERE k.K008_HEAD_ID = 2007;
--UPDATE K008_HEAD_EPC p SET p.K008_DATE_END = null WHERE p.K008_HEAD_ID = 125;

SELECT * FROM K015_PLANNED_CABINETS k WHERE k.K015_ENABLE_CREATION = 0;

SELECT * FROM P320_COMPOSITE_CHK_NFO p WHERE p.P320_CHK_ID = 2937048;




SELECT * FROM K001_CABINET_WORK_GROUP k WHERE k.K001_ID = '6d59402b-1f91-4799-af9f-d9462fe9a1c2';


UPDATE files SET PATH = REPLACE(PATH, :subNodeParentPath, :parentPath)
		WHERE  path like REPLACE (:subNodeParentPath || :delimiter ||'%','\','\\') OR path = :subNodeParentPath

--посмотреть на данные согласно коду кабинета
SELECT 
p.P320_CHK_ID AS CHK_ID, 
p.P200_PLAN_ID AS PLAN_ID, 
p.P320_CHK_PERIOD_B AS CHK_PERIOD_BEGIN, 
p.P320_CHK_PERIOD_E AS CHK_PERIOD_END, 
p.P320_CHK_SHEDULE_DATE AS CHK_SHEDULE_DATE, 
p.P320_CHK_STATUS AS CHK_STATUS, 
p.P320_INITIAL_CHK AS INITIAL_CHK_ID, 
p.P320_ORG_NAME AS ORG_NAME, 
p.P320_ORG_SHORTNAME AS ORG_SHORT_NAME, 
(CASE WHEN p.P320_ORG_INN IS NOT NULL THEN p.P320_ORG_INN ELSE pio.P600_INN END) AS ORG_INN, 
(CASE WHEN p.P320_ORG_OGRN IS NOT NULL THEN p.P320_ORG_OGRN ELSE pio.P600_OGRN END) AS ORG_ORGN, 
(CASE WHEN p.P320_ORG_OKATO IS NOT NULL THEN p.P320_ORG_OKATO ELSE pio.P600_OKATO END) AS OKATO, 
p.P320_ORG_ADDRESS_FACT AS ORG_ADDRESS_FACT, 
p.P320_ORG_ADDRESS_LEGAL AS ORG_ADDRESS_LEGAL, 
km.FREGNUM AS REG_NUM, 
pc.K015_DATE_OF_CREATION AS DATE_OF_CABINET_CREATION, 
pc.K015_ENABLE_CREATION AS ENABLE_CREATION_OF_CABINET, 
pc.K015_TEXT_OF_DESCRIPTION AS TEXT_OF_DESCRIPTION_OF_CABINET, 
pc.K015_FOUNDATION_FOR_CREATION AS FOUNDATION_FOR_CREATION, 
pc.K015_CREATION_MODE_IS_AUTOMATIC AS CREATION_MODE_IS_AUTOMATIC, 
pc.K015_USER AS USER_WHO_CREATED, 
pc.K015_IS_CREATED AS CABINET_IS_CREATED, 
pc.K015_COMMENT AS COMMENT_FOR_CABINET, 
pc.K001_ID AS CABINET_ID,
pc.K015_ID AS ID 
FROM  K015_PLANNED_CABINETS pc 
LEFT JOIN p320_COMPOSITE_CHK_NFO p ON p.P320_CHK_ID = pc.P320_CHK_ID 
LEFT JOIN P600_INSP_OBJECT pio ON p.P600_ID = pio.P600_ID 
LEFT JOIN K_MERGED km ON  pio.RBASE_CID = km.RBASE_CID 
WHERE 

pc.K015_IS_CREATED = 0 AND pc.K015_ENABLE_CREATION = 1 AND 
p.P200_PLAN_ID = (SELECT max(c.P200_PLAN_ID) FROM P320_COMPOSITE_CHK_NFO c) 
AND p.P320_CHK_STATUS IN (1,2,3) 
AND p.P320_CHK_ID IN (SELECT max(P320_CHK_ID) FROM P320_COMPOSITE_CHK_NFO WHERE P320_CHK_STATUS <> 4 GROUP BY P320_INITIAL_CHK);


--получить рег номер организации
SELECT 
km.FREGNUM AS regNum,
km.KBANK_CREGNUM15 AS regNum15
FROM  
p320_COMPOSITE_CHK_NFO p 
LEFT JOIN P600_INSP_OBJECT pio ON p.P600_ID = pio.P600_ID 
LEFT JOIN K_MERGED km ON  pio.RBASE_CID = km.RBASE_CID 
WHERE  p.P320_CHK_ID = 2937008; 


--получить рег номер организации
SELECT 
p.P320_CHK_ID ,
p.P200_PLAN_ID ,
km.FREGNUM ,
km.KBANK_CREGNUM15 
FROM  
p320_COMPOSITE_CHK_NFO p 
LEFT JOIN P600_INSP_OBJECT pio ON p.P600_ID = pio.P600_ID 
LEFT JOIN K_MERGED km ON  pio.RBASE_CID = km.RBASE_CID 
WHERE  km.FREGNUM = '3529'; 



SELECT * FROM K015_PLANNED_CABINETS k WHERE k.K015_FOUNDATION_FOR_CREATION IS NOT NULL;

--ALTER TABLE K001_CABINET_WORK_GROUP MODIFY K001_MODIFIED_AT  DEFAULT CURRENT_TIMESTAMP;
SELECT * FROM K001_CABINET_WORK_GROUP k WHERE k.K001_ID = 'ba498e41-f432-4a1c-93e2-0be0c92eb04f';

SELECT k.P320_CHK_ID FROM K001_CABINET_WORK_GROUP k WHERE k.K001_ID = '01848e18-7ddc-4d97-9093-830c2bc8a3fa';

SELECT * FROM K001_CABINET_WORK_GROUP k JOIN K003_NOTIFICATIONS_AND_CONFIRMATIONS kn ON k.K001_ID = kn.K001_ID  WHERE k.K001_CODE_CAB = '102';

SELECT * FROM P320_COMPOSITE_CHK_NFO p WHERE p.P320_CHK_ID = 2937207;

INSERT INTO K001_CABINET_WORK_GROUP p ( 
p.K001_ID , p.P320_CHK_ID, p.K001_CODE_CAB, p.K001_CHK_DATE_BEGIN, p.K001_WORKING_MODE, p.K001_STATUS_CAB, p.K005_ID, p.K001_CREATED_AT, p.K001_COMMENT, p.K001_DESCRIPTION_CAB  )  
SELECT :cabinetId , :auditId , :codeCabinet, :dateChkBegin, :workingMode, :cabinetStatus, :settingId, CURRENT_TIMESTAMP, :comment, :textDescription FROM dual 
WHERE NOT EXISTS ( SELECT 1 FROM K001_CABINET_WORK_GROUP kk WHERE kk.P320_CHK_ID = :auditId );

SELECT * FROM K015_PLANNED_CABINETS k WHERE k.K015_IS_CREATED = 1;

   
 INSERT INTO K015_PLANNED_CABINETS pc (pc.K015_ID , pc.P320_CHK_ID, pc.K015_DATE_OF_CREATION)  
SELECT '7cc81dad-6677-443a-bb24-d0e7a6adc954', 3057452, to_date('2020-11-01', 'yyyy-MM-dd') FROM dual
WHERE NOT EXISTS (
    SELECT 1 FROM K015_PLANNED_CABINETS kk 
    WHERE kk.P320_CHK_ID = 3057452 );

   



--ГЕНЕРАЦИЯ GUID с помощью Oracle
SELECT LOWER(RAWTOHEX( SYS_GUID())) FROM dual;

--Вставил сгенерированные и нет данные в таблицу K014_NOTIFICATION_FEED
INSERT INTO K014_NOTIFICATION_FEED s (s.K014_ID , s."SOURCE" , s.ERROR_CODE_OR_TEXT , s.IS_VIEWED , s.K001_ID )
  SELECT LOWER(RAWTOHEX( SYS_GUID())), 'ВП ЕПВВ', round(DBMS_RANDOM.VALUE(100,800)), 0, p.K001_ID  
    FROM K001_CABINET_WORK_GROUP p WHERE  p.K001_CODE_CAB < 85 AND p.K001_CODE_CAB > 70 ;
   
   INSERT INTO K014_NOTIFICATION_FEED s (s.K014_ID , s."SOURCE" , s.ERROR_CODE_OR_TEXT , s.IS_VIEWED , s.K001_ID )
  VALUES ( LOWER(RAWTOHEX( SYS_GUID())), 'ВП ЕПВВ', round(DBMS_RANDOM.VALUE(100,800)), 0, '418bdde6-17aa-4043-931c-7bbbcb9e796b');
 
 


--///////////Создал таблицу для КАБИНЕТОВ РАБОЧИХ ГРУПП
CREATE TABLE "DEV_OLTP_APPID_DATA"."K001_CABINET_WORK_GROUP" 
   (	"K001_ID" VARCHAR2(50), 
	"K001_DESCRIPTION_CAB" VARCHAR2(4000), 
	"K001_CODE_CAB" VARCHAR2(40), 
	"K001_CHK_DATE_BEGIN" DATE, 
	"K001_CHK_DATE_END" DATE, 
	"K001_ORG_NAME" VARCHAR2(400), 
	"K001_ORG_FULLNAME" VARCHAR2(400), 
	"K001_ORG_ADDRESS" VARCHAR2(1000), 
	"K001_ORG_INN" VARCHAR2(20), 
	"K001_ORG_REGNUM" VARCHAR2(20), 
	"K001_STATUS_CAB" VARCHAR2(20), 
	"K001_ORG_OGRN" VARCHAR2(20), 
	"K001_CREATED_AT" TIMESTAMP (6) WITH TIME ZONE DEFAULT SYSDATE, 
	"K001_MODIFIED_AT" TIMESTAMP (6) WITH TIME ZONE DEFAULT SYSDATE, 
	"K005_ID" VARCHAR2(50), 
	"K001_WORKING_MODE" NUMBER(1,0) DEFAULT 1 NOT NULL ENABLE, 
	"K001_CHK_MONTH_BEGIN" NUMBER(2,0), 
	"K001_COMMENT" VARCHAR2(2000), 
	 PRIMARY KEY ("K001_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_APPID_DT_S"  ENABLE, 
	 CONSTRAINT "K001_CABINET_WORK_GROUP_FK" FOREIGN KEY ("K005_ID")
	  REFERENCES "DEV_OLTP_APPID_DATA"."K005_SETTINGS_WORK_GROUP_CABINET" ("K005_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_APPID_DT_S" ;
--////////////////////////////////////////////
 
 
 --///////////Создал таблицу K015 для планируемых КАБИНЕТОВ РАБОЧИХ ГРУПП по таблице P320 взятых из планов
CREATE TABLE "DEV_OLTP_APPID_DATA"."K015_PLANNED_CABINETS" 
   (	
    "K015_ID" VARCHAR2(50), 
    "P320_CHK_ID" NUMBER(12,0) NOT NULL ENABLE,
	"K015_DATE_OF_CREATION" DATE, 
	"K015_ENABLE_CREATION" NUMBER(1,0) DEFAULT 1 NOT NULL ENABLE, --создавать кабинет, по умолчанию = 1 (true)
	"K015_TEXT_OF_DESCRIPTION" VARCHAR2(1000), 
	"K015_FOUNDATION_FOR_CREATION" VARCHAR2(1000),
	"K015_CREATION_MODE_IS_AUTOMATIC" NUMBER(1,0) DEFAULT 1 NOT NULL ENABLE, --ПО УМОЛЧАНИЮ АВТОМАТИЧЕСКИЙ = 1
	"K015_USER" VARCHAR2(255), 
	"K015_IS_CREATED" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE,
	"K015_COMMENT" VARCHAR2(1000),
	"K001_ID" VARCHAR2(50), 
    "K015_CREATED_AT" TIMESTAMP (6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP, 
	"K015_MODIFIED_AT" TIMESTAMP (6) WITH TIME ZONE, 
	 PRIMARY KEY ("K015_ID") 
   )TABLESPACE  "TS_APPID_DT_S" ;
--////////////////////////////////////////////
 
 
 
--Добавить колонку с указанием её как вторичный ключ на столбец определенной таблицы:
alter table tab1
    add c1 number(20) constraint tab1_c1_fk references tab2(c2);
   
--или так
ALTER TABLE CODE_LIST_TYPE_ERROR 
ADD ID_CODE_LISTS VARCHAR2(50) NOT NULL
CONSTRAINT CODE_LIST_TYPE_ERROR_FK REFERENCES CODE_LISTS(ID);

 
 ALTER TABLE K001_CABINET_WORK_GROUP ADD(
        K001_CHK_ESTIMATE_DATE_END TIMESTAMP WITH TIME ZONE );
       
       
 ALTER TABLE K001_CABINET_WORK_GROUP ADD(
        K001_ORG_OKATO VARCHAR2(12) );
       
 ALTER TABLE K001_CABINET_WORK_GROUP ADD(
        K001_ORG_ADDRESS_FACT VARCHAR2(1000) );
       
       
ALTER TABLE
    PERSONS ADD(
        created_at TIMESTAMP WITH TIME ZONE NOT NULL,
        updated_at TIMESTAMP WITH TIME ZONE NOT NULL
    );

ALTER TABLE K001_CABINET_WORK_GROUP ADD (K001_WORKING_MODE NUMBER(1,0) DEFAULT 1 NOT NULL);

ALTER TABLE DEV_OLTP_APPID_DATA.DOCS MODIFY DOC_TYPE VARCHAR2(150) NULL;
       

ALTER TABLE K001_CABINET_WORK_GROUP ADD K001_COMMENT VARCHAR2(2000);

ALTER TABLE K003_NOTIFICATIONS_AND_CONFIRMATIONS ADD K003_CREATED_AT TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE K005_SETTINGS_WORK_GROUP_CABINET  MODIFY K005_CREATED_AT DEFAULT CURRENT_TIMESTAMP;



ALTER TABLE K006_ELECTRONIC_CATALOG_TEMPLATE 
ADD PARENT_ID NUMBER(12,0) CONSTRAINT K006_ELECTRONIC_CATALOG_TEMPLATE_ID_FK REFERENCES K006_ELECTRONIC_CATALOG_TEMPLATE(ID) ;




ALTER TABLE K006_ELECTRONIC_CATALOG_TEMPLATE 
DROP CONSTRAINT K006_ELECTRONIC_CATALOG_TEMPLATE_ID_FK;

ALTER TABLE K006_ELECTRONIC_CATALOG_TEMPLATE 
DROP CONSTRAINT K006_ELECTRONIC_CATALOG_TEMPLATE_HEAD_FK;
 

ALTER TABLE K006_ELECTRONIC_CATALOG_TEMPLATE
ADD CONSTRAINT K006_ELECTRONIC_CATALOG_TEMPLATE_ID_FK FOREIGN KEY (PARENT_ID) REFERENCES K006_ELECTRONIC_CATALOG_TEMPLATE (ID)
ON DELETE CASCADE ENABLE;


ALTER TABLE K006_ELECTRONIC_CATALOG_TEMPLATE 
ADD K008_HEAD_ID NUMBER(12,0) ;

ALTER TABLE K006_ELECTRONIC_CATALOG_TEMPLATE
ADD CONSTRAINT K006_ELECTRONIC_CATALOG_TEMPLATE_HEAD_FK FOREIGN KEY (K008_HEAD_ID) REFERENCES K008_HEAD_EPC (K008_HEAD_ID)
ON DELETE CASCADE ENABLE;


--Удалил PK с одной колонки
alter table K006_ELECTRONIC_CATALOG_TEMPLATE drop constraint SYS_C0037214;
--Сделал PK составной -> (ID + K008_HEAD_ID)
alter table K006_ELECTRONIC_CATALOG_TEMPLATE add constraint pk_id primary key (ID, K008_HEAD_ID);


SELECT cols.table_name, cols.column_name, cols.position, cons.status, cons.owner
FROM all_constraints cons, all_cons_columns cols
WHERE cols.table_name = 'K006_ELECTRONIC_CATALOG_TEMPLATE' 
AND cons.constraint_type = 'P'
AND cons.constraint_name = cols.constraint_name
AND cons.owner = cols.owner;

--Узнать название ограничения PK:
SELECT * FROM ALL_CONSTRAINTS 									-- or DBA_CONSTRAINTS or UESR_CONSTRAINTS
WHERE TABLE_NAME= 'K006_ELECTRONIC_CATALOG_TEMPLATE' 
AND CONSTRAINT_TYPE = 'P';






--//Работа с К002_GROUP_MEMBER, K004_MEMBER_TO_CABINET (START) ------------------------------------------------------


--///////////Создал таблицу для ЧЛЕНОВ КАБИНЕТА РАБОЧЕЙ ГРУППЫ
CREATE TABLE "DEV_OLTP_APPID_DATA"."K002_GROUP_MEMBER" 
   ("K002_ID" VARCHAR2(50), 
	"K002_FIO" VARCHAR2(100), 
	"K002_JOB_TITLE" VARCHAR2(100), 
	"K002_ADDITIONAL_POWERS" VARCHAR2(100), 
	"K002_ROLE" VARCHAR2(100), 
	"K002_START_DATE_IN_CWG" DATE, 
	"K002_FINISH_DATE_IN_CWG" DATE, 
	"K002_NOTES" VARCHAR2(400), 
	PRIMARY KEY ("K002_ID")
   ) TABLESPACE "TS_APPID_DT_S" ;
--////////////////////////////////////////////
  
    

   --///////////Создал таблицу для СВЯЗИ ЧЛЕНОВ И КАБИНЕТА СО КОЛОНКОЙ С ПРАЙМАРИ КЛЮЧОМ
  CREATE TABLE "DEV_OLTP_APPID_DATA"."K004_MEMBER_TO_CABINET" 
   (	 
   K004_ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	K001_ID VARCHAR2(50)  REFERENCES K001_CABINET_WORK_GROUP , 
	K002_ID VARCHAR2(50)  REFERENCES K002_GROUP_MEMBER 
)  TABLESPACE "TS_APPID_DT_S" ;
 --///////////////////////////////////////////////////////

--GET_ADDITIONAL_POWERS_AND_CODE_CABINET_BY_GROUP_MEMBER_ID:
SELECT
gm.K002_ID AS member_id, c.K004_ADDITIONAL_POWERS AS additional_powers, k.K001_CODE_CAB AS code_cabinet, k.K001_ID AS cabinet_id   
FROM K002_GROUP_MEMBER gm LEFT JOIN K004_MEMBER_TO_CABINET c ON gm.K002_ID = c.K002_ID 
LEFT JOIN K001_CABINET_WORK_GROUP k ON c.K001_ID = k.K001_ID WHERE gm.K002_ID = 'ce36cbea-9adc-47f4-ae78-51896c47fbcd' 
AND c.K004_ID IN (SELECT MAX(cc2.K004_ID) FROM K004_MEMBER_TO_CABINET cc2  GROUP BY cc2.K002_ID, cc2.K001_ID);

(SELECT MAX(cc2.K004_ID) FROM K004_MEMBER_TO_CABINET cc2  GROUP BY cc2.K002_ID, cc2.K001_ID);


--FIND_MEMBERS_BY_CABINET_ID
SELECT 
c.K004_ID AS record_id, 
g.K002_ID as id, 
g.K002_FIO as fio, 
g.K002_JOB_TITLE as job_title, 
c.K004_ADDITIONAL_POWERS as additional_powers, 
g.K002_ROLE as role_of_members, 
c.K004_EXCLUDED_STATUS AS excluded, 
c.K004_DATE_FROM  as date_from, 
c.K004_DATE_TO as date_to, 
c.K004_ACTIVE_STATUS AS active, 
c.K004_LOCK_DATE AS lock_date, 
c.K004_UNLOCK_DATE AS unlock_date, 
c.K004_COMMENT  as notes  
FROM K004_MEMBER_TO_CABINET c JOIN K002_GROUP_MEMBER g on c.K002_ID = g.K002_ID  WHERE 
c.K001_ID = '3e9b52a1-a76f-4d13-9530-477eb4d988de' AND k004_id IN (SELECT max(k004_id) FROM k004_member_to_cabinet GROUP BY k002_id, k001_id);

SELECT 
c.K004_ID AS record_id, 
g.K002_ID as id, 
g.K002_FIO as fio, 
g.K002_JOB_TITLE as job_title, 
c.K004_ADDITIONAL_POWERS as additional_powers, 
g.K002_ROLE as role_of_members, 
c.K004_EXCLUDED_STATUS AS excluded, 
c.K004_DATE_FROM  as date_from, 
c.K004_DATE_TO as date_to, 
c.K004_ACTIVE_STATUS AS active, 
c.K004_LOCK_DATE AS lock_date, 
c.K004_UNLOCK_DATE AS unlock_date, 
c.K004_COMMENT  as notes  
FROM K004_MEMBER_TO_CABINET c JOIN K002_GROUP_MEMBER g on c.K002_ID = g.K002_ID  WHERE 
c.K001_ID = '3e9b52a1-a76f-4d13-9530-477eb4d988de';



--INSERT INTO K015_PLANNED_CABINETS pc (pc.K015_ID , pc.P320_CHK_ID) values(LOWER(RAWTOHEX( SYS_GUID())), 3004330);

if not exists (...) insert ... 

--////////////////////////////вставка связи между кабинетами и членами группы
INSERT INTO K004_MEMBER_TO_CABINET (K001_ID,K002_ID) 
SELECT
    '2dd81e27-2b25-4636-9c12-53f5f22efef2', 'd348be3e-4a80-460a-9f8e-d26a103de366' 
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 
    FROM K004_MEMBER_TO_CABINET kk
    WHERE kk.K001_ID  = '2dd81e27-2b25-4636-9c12-53f5f22efef2' AND kk.K002_ID = 'd348be3e-4a80-460a-9f8e-d26a103de366' 
);


--///добавил колонки в таблицу К004
ALTER TABLE K004_MEMBER_TO_CABINET ADD (K004_EXCLUDED_STATUS NUMBER(1,0) DEFAULT 0 NOT NULL);
ALTER TABLE K004_MEMBER_TO_CABINET ADD (K004_DATE_FROM TIMESTAMP WITH TIME ZONE);
ALTER TABLE K004_MEMBER_TO_CABINET ADD (K004_DATE_TO TIMESTAMP WITH TIME ZONE);

ALTER TABLE K004_MEMBER_TO_CABINET ADD (K004_ACTIVE_STATUS NUMBER(1,0) DEFAULT 1 NOT NULL);
ALTER TABLE K004_MEMBER_TO_CABINET ADD (K004_LOCK_DATE TIMESTAMP WITH TIME ZONE);
ALTER TABLE K004_MEMBER_TO_CABINET ADD (K004_UNLOCK_DATE TIMESTAMP WITH TIME ZONE);

ALTER TABLE K004_MEMBER_TO_CABINET ADD (K004_COMMENT VARCHAR2(4000));

ALTER TABLE K004_MEMBER_TO_CABINET ADD (K004_CREATED_AT TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP);

 
--//Работа с К002_GROUP_MEMBER, K004_MEMBER_TO_CABINET (END) ------------------------------------------------------

SELECT * FROM A_REPORT_VIEW_RESULT_GRIDS ar LEFT JOIN "H$FPSID_USER" hf ON ar.USER_ID = hf.USER_ID ;

--
SELECT new ru.lanit.fpsid.kzid_backend.persistence.value_objects.AuditEmployeeValueObject(
ae.employee.guid,
ae.employee.name,
ae.employee.secondName,
ae.employee.patronymic, 
ae.employee.fio,
ae.duty,
ae.department,
ae.employeeStatus,
ae.dateFrom,
ae.dateTo,
ae.inspDeptOrNot,
ae.employeeStay,
ae.comment) 
FROM AuditNfoEmployeesP362 ae WHERE ae.audit.id=?1;


SELECT e.P307_OBJ_ID ,lpad('     ', 5*level)||e.P307_SNAME   as Tree
FROM P307_OBJ_BR e
START WITH e.P307_UP_OBJ_ID is null
CONNECT BY PRIOR e.P307_OBJ_ID = e.P307_UP_OBJ_ID  
ORDER SIBLINGS BY e.P307_SNAME  ;

--
SELECT 
pe.P410_GUID AS "employee.guid",
pe.P410_I AS "employee.name",
pe.P410_F as "employee.secondName",
pe.P410_O AS "employee.patronymic", 
pe.P410_FIO AS "employee.fio",
ae.P362_DUTYID AS duty,
ae.P362_VSP as department,
ae.P362_EMPL_CHK_STATUS  as employeeStatus,
ae.P362_DT_FROM  AS dateFrom,
ae.P362_DT_TO  as dateTo,
ae.P362_INSP_DEPT AS inspDeptOrNot,
ae.P362_EMPL_INCLUDED as employeeStay,
ae.P362_COMMENT AS "comment"
FROM P362_INSP_EMPL_NFO ae LEFT JOIN P410_EMPLOYEE pe ON ae.P410_EMPL_ID = pe.P410_EMPL_REC_ID 
WHERE ae.P362_INSP_EMPL_ID = 13651092;


--///////////Создал таблицу для УВЕДОМЛЕНИЙ И ПОДТВЕРЖДЕНИЙ
CREATE TABLE DEV_OLTP_APPID_DATA.K003_NOTIFICATIONS_AND_CONFIRMATIONS 
   (K003_ID VARCHAR2(50), 
	K003_STATUS VARCHAR2(50), 
	K003_OPERATION VARCHAR2(50), 
	K003_PARAMETERS VARCHAR2(200), 
	K003_OPERATION_MODE VARCHAR2(50), 
	K003_SENDING_NOTIFICATION TIMESTAMP, 
	K003_RECEIVING_CONFIRMATION TIMESTAMP, 
	K003_ERROR VARCHAR2(100), 
	K003_AUTHOR VARCHAR2(100),
	K003_NOTE VARCHAR2(400),
	K001_ID VARCHAR2(50) NOT NULL REFERENCES K001_CABINET_WORK_GROUP,
	PRIMARY KEY (K003_ID)
   ) TABLESPACE "TS_APPID_DT_S" ;
--////////////////////////////////////////////
  
  
  
--///////////Создал таблицу для хранения директорий с привязкой для конкретного кабинета
CREATE TABLE "K012_ECT_CABINET" 
   (	"K012_ID" NUMBER(12,0) NOT NULL ENABLE,
   "K001_ID" VARCHAR2(50) NOT NULL ENABLE, 
	"TITLE" VARCHAR2(400), 
	"TITLE_MATERIALIZED_PATH" VARCHAR2(704) NOT NULL ENABLE, 
	"DEPTH_LEVEL" NUMBER(4,0), 
	"PARENT_TITLE_MATERIALIZED_PATH" VARCHAR2(704), 
	"CREATED_AT" TIMESTAMP (6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP, 
	"MODIFIED_AT" TIMESTAMP (6) WITH TIME ZONE, 
	"IS_DIRECTORY" NUMBER(1,0), 
	"PARENT_ID" NUMBER(12,0), 
	 PRIMARY KEY ("K012_ID", "K001_ID")
   ) TABLESPACE "TS_APPID_DT_S" ;  
--/////////////////////////////////////////////////////////////
  
  --DROP TABLE K012_ECT_CABINET ;
  
  
   INSERT INTO  K008_HEAD_EPC nc (
  K008_HEAD_ID , K008_HEAD_COMM , K008_DATE_BEG , K008_DATE_END
  ) VALUES (
 123, 'Дерево из истории за ' , TO_DATE('15.08.2022 11:30:00', 'DD.MM.YYYY HH24:MI:SS'), null );

--SELECT (TO_DATE('11.12.2021 15:45:30', 'DD.MM.YYYY HH24:MI:SS')) FROM dual; --2021-12-31 15:45:30.000
  

SELECT * FROM P307_OBJ_GIBR p WHERE p.P3077_HEAD_ID  ; 
  
  
  
--  catalog historicity
  
  
  
  INSERT INTO  K003_NOTIFICATIONS_AND_CONFIRMATIONS nc (
  K003_ID,K003_STATUS,K003_OPERATION,K003_PARAMETERS,K003_OPERATION_MODE,K003_SENDING_NOTIFICATION,K003_RECEIVING_CONFIRMATION,K003_ERROR,K003_AUTHOR ,K003_NOTE ,K001_ID  
  ) VALUES(
 '123',
 'send-confirmed',
 ''
  );
 
 
 INSERT INTO K004_MEMBER_TO_CABINET (K001_ID,K002_ID,K004_ADDITIONAL_POWERS) 
SELECT '38fbd4a3-3fc3-4788-be3b-39e9b1b7e1d0' , '03c69a8e-7541-4047-8980-e5c0b3f83a20' , 'Куратор ПЛ' FROM DUAL 
WHERE NOT EXISTS (
    SELECT 1 FROM K004_MEMBER_TO_CABINET kk 
    WHERE kk.K001_ID  = '38fbd4a3-3fc3-4788-be3b-39e9b1b7e1d0' AND kk.K002_ID = '03c69a8e-7541-4047-8980-e5c0b3f83a20' 
);

INSERT INTO K004_MEMBER_TO_CABINET (K001_ID,K002_ID,K004_ADDITIONAL_POWERS) VALUES ('38fbd4a3-3fc3-4788-be3b-39e9b1b7e1d0', '03c69a8e-7541-4047-8980-e5c0b3f83a20', 'Руководитель РГ');


SELECT gm.K002_ID AS member_id, c.K004_ADDITIONAL_POWERS AS additional_powers, k.K001_CODE_CAB AS code_cabinet, k.K001_ID AS cabinet_id   
FROM K002_GROUP_MEMBER gm LEFT JOIN K004_MEMBER_TO_CABINET c ON gm.K002_ID = c.K002_ID 
LEFT JOIN K001_CABINET_WORK_GROUP k ON c.K001_ID = k.K001_ID WHERE gm.K002_ID = '03c69a8e-7541-4047-8980-e5c0b3f83a20' AND c.K004_ID = 
(SELECT MAX(cc2.K004_ID) FROM K004_MEMBER_TO_CABINET cc2  WHERE cc2.K001_ID = '38fbd4a3-3fc3-4788-be3b-39e9b1b7e1d0' and cc2.K002_ID = '03c69a8e-7541-4047-8980-e5c0b3f83a20');

WHERE cc.id = (SELECT MAX(cc2.id) FROM candidates_consideration cc2  WHERE cc2.candidate_id = cand.id and cc2.state = 'archived')

SELECT g.K002_ID , g.K002_FIO , g.K002_JOB_TITLE , g.K002_ROLE , c.K004_ADDITIONAL_POWERS AS adii,
g.K002_START_DATE_IN_CWG , g.K002_FINISH_DATE_IN_CWG , g.K002_NOTES as notes 
FROM K004_MEMBER_TO_CABINET c JOIN K002_GROUP_MEMBER g on c.K002_ID = g.K002_ID  
WHERE c.K001_ID = '38fbd4a3-3fc3-4788-be3b-39e9b1b7e1d0';

SELECT c.K004_ID , g.K002_ID as id, g.K002_FIO as fio, g.K002_JOB_TITLE as job_title, c.K004_ADDITIONAL_POWERS  as additional_powers, g.K002_ROLE as role_of_members, 
g.K002_START_DATE_IN_CWG as start_date_in_cwg, g.K002_FINISH_DATE_IN_CWG as finish_date_in_cwg, g.K002_NOTES as notes FROM 
K004_MEMBER_TO_CABINET c JOIN K002_GROUP_MEMBER g on c.K002_ID = g.K002_ID  
WHERE c.K001_ID = '38fbd4a3-3fc3-4788-be3b-39e9b1b7e1d0' ;

AND c.K004_ID = (SELECT MAX(cc2.K004_ID) FROM K004_MEMBER_TO_CABINET cc2  WHERE cc2.K001_ID = '38fbd4a3-3fc3-4788-be3b-39e9b1b7e1d0');


----Вывод всех пользователей одного кабинета - мой вариант
SELECT c.K004_ID , g.K002_ID as id, g.K002_FIO as fio, g.K002_JOB_TITLE as job_title, c.K004_ADDITIONAL_POWERS  as additional_powers, g.K002_ROLE as role_of_members, 
g.K002_START_DATE_IN_CWG as start_date_in_cwg, g.K002_FINISH_DATE_IN_CWG as finish_date_in_cwg, g.K002_NOTES as notes FROM 
K004_MEMBER_TO_CABINET c JOIN K002_GROUP_MEMBER g on c.K002_ID = g.K002_ID  
WHERE c.K001_ID = '38fbd4a3-3fc3-4788-be3b-39e9b1b7e1d0' AND k004_ID IN (SELECT max(K004_ID) FROM K004_MEMBER_TO_CABINET GROUP BY K002_ID, K001_ID);


SELECT 
g.K002_ID as id, g.K002_FIO as fio, g.K002_JOB_TITLE as job_title, c.K004_ADDITIONAL_POWERS as additional_powers, 
g.K002_ROLE as role_of_members, g.K002_START_DATE_IN_CWG as start_date_in_cwg, g.K002_FINISH_DATE_IN_CWG as finish_date_in_cwg, 
g.K002_NOTES as notes  FROM K004_MEMBER_TO_CABINET c JOIN K002_GROUP_MEMBER g on c.K002_ID = g.K002_ID  WHERE 
c.K001_ID ='38fbd4a3-3fc3-4788-be3b-39e9b1b7e1d0' AND k004_id IN (SELECT max(k004_id) FROM k004_member_to_cabinet GROUP BY k002_id);


(SELECT max(k004_id) FROM k004_member_to_cabinet GROUP BY k002_id, K001_ID);
(SELECT count(*), K002_ID, K001_ID  FROM k004_member_to_cabinet GROUP BY k002_id, K001_ID);
(SELECT max(k004_id) FROM k004_member_to_cabinet GROUP BY k001_id);
(SELECT count(*), K001_ID  FROM k004_member_to_cabinet GROUP BY k001_id);


SELECT k.K001_ID, k.K001_DESCRIPTION_CAB, k.K001_CODE_CAB, k.K001_CHK_DATE_BEGIN, k.K001_CHK_DATE_END, 
k.K001_ORG_NAME, k.K001_ORG_FULLNAME, k.K001_ORG_ADDRESS, k.K001_ORG_INN, k.K001_ORG_REGNUM, k.K001_STATUS_CAB, 
k.K001_ORG_OGRN, k.K001_CREATED_AT, k.K001_MODIFIED_AT , c.K004_ID 
FROM 
K001_CABINET_WORK_GROUP k LEFT OUTER JOIN K004_MEMBER_TO_CABINET c on c.K001_ID = k.K001_ID 
WHERE c.K002_ID = '03c69a8e-7541-4047-8980-e5c0b3f83a20' 
AND k004_ID IN (SELECT max(K004_ID) FROM K004_MEMBER_TO_CABINET GROUP BY K002_ID, K001_ID);





SELECT * FROM K001_CABINET_WORK_GROUP k LEFT JOIN K004_MEMBER_TO_CABINET c ON k.K001_ID = c.K001_ID 
LEFT JOIN K002_GROUP_MEMBER gm ON c.K002_ID = gm.K002_ID WHERE k.K001_ID = '2dd81e27-2b25-4636-9c12-53f5f22efef2';



SELECT gm.K002_ID AS member_id, c.K004_ADDITIONAL_POWERS AS additional_powers, k.K001_CODE_CAB AS code_cabinet, k.K001_ID AS cabinet_id 
FROM K002_GROUP_MEMBER gm LEFT JOIN K004_MEMBER_TO_CABINET c ON gm.K002_ID = c.K002_ID 
LEFT JOIN K001_CABINET_WORK_GROUP k ON c.K001_ID = k.K001_ID WHERE c.K001_ID = '87a78c2e-1df5-4021-b6bf-5a5fdafcb25b'
AND gm.K002_ID = '9da268ad-3746-4cc5-bb77-d7b5d80efc53' 
AND c.K004_ID IN (SELECT MAX(cc2.K004_ID) FROM K004_MEMBER_TO_CABINET cc2  GROUP BY cc2.K002_ID, cc2.K001_ID);


--Выбор члена кабинета с его полномочиями и номаерами КРГ где он еще работает.
SELECT gm.K002_ID AS member_id, c.K004_ADDITIONAL_POWERS AS additional_powers, k.K001_CODE_CAB AS code_cabinet, k.K001_ID AS cabinet_id   
FROM K002_GROUP_MEMBER gm LEFT JOIN K004_MEMBER_TO_CABINET c ON gm.K002_ID = c.K002_ID 
LEFT JOIN K001_CABINET_WORK_GROUP k ON c.K001_ID = k.K001_ID 
WHERE gm.K002_ID = '9da268ad-3746-4cc5-bb77-d7b5d80efc53'
AND c.K004_ID IN (SELECT MAX(cc2.K004_ID) FROM K004_MEMBER_TO_CABINET cc2  GROUP BY cc2.K002_ID, cc2.K001_ID);








--Вывод всех пользователей одного кабинета
SELECT c.K004_ID , gm.K002_ID , gm.K002_FIO , gm.K002_ROLE , c.K004_ADDITIONAL_POWERS , k.K001_ID , k.K001_CODE_CAB , k.K001_ORG_NAME  FROM K002_GROUP_MEMBER gm 
LEFT OUTER JOIN K004_MEMBER_TO_CABINET c ON gm.K002_ID = c.K002_ID 
LEFT OUTER JOIN K001_CABINET_WORK_GROUP k  ON c.K001_ID = k.K001_ID 
WHERE k.K001_ID = '38fbd4a3-3fc3-4788-be3b-39e9b1b7e1d0'
AND k004_id IN (SELECT max(k004_id) FROM k004_member_to_cabinet GROUP BY k002_id, K001_ID);




SELECT c.K004_ID , g.K002_ID as id, g.K002_FIO as fio, g.K002_JOB_TITLE as job_title, c.K004_ADDITIONAL_POWERS as additional_powers, g.K002_ROLE as role_of_members, 
g.K002_START_DATE_IN_CWG as start_date_in_cwg, g.K002_FINISH_DATE_IN_CWG as finish_date_in_cwg, g.K002_NOTES as notes FROM 
K004_MEMBER_TO_CABINET c JOIN K002_GROUP_MEMBER g on c.K002_ID = g.K002_ID  
WHERE c.K001_ID = '38fbd4a3-3fc3-4788-be3b-39e9b1b7e1d0' ;
AND k004_id IN (SELECT max(k004_id) FROM k004_member_to_cabinet GROUP BY k002_id);


INSERT INTO K004_MEMBER_TO_CABINET (K001_ID,K002_ID)
VALUES ('2a2945a7-4b30-401d-b331-3377b9195195','03c69a8e-7541-4047-8980-e5c0b3f83a20');








 
 --///////////Создал таблицу Настройки для Управления Кабинета Рабочих Групп
CREATE  TABLE K005_SETTINGS_WGC  (
    K005_ID varchar2(50) PRIMARY KEY,
    K005_DATE_OF_CREATION_WORKGROUP_CABINET NUMBER(12,0),
    K005_RESOURCE_BOOKING_START_DATE NUMBER(12,0),
    K005_WORKGROUP_CABINET_ACTIVATION_TERM NUMBER(12,0),
    K005_RESOURCE_VOLUME NUMBER(12,0),
    K005_QUOTA_SIZE_FOR_ONE_CABINET NUMBER(12,0),
    K005_WORKGROUP_CABINET_CLOSING_DATE NUMBER(12,0), 
    K005_CREATED_AT TIMESTAMP WITH TIME ZONE DEFAULT SYSDATE,
    K005_VALID_UNTILL TIMESTAMP WITH TIME ZONE
  ) TABLESPACE "TS_APPID_DT_S" ;
 
 
 

  
  SELECT g.K002_ID , g.K002_FIO , g.K002_JOB_TITLE , g.K002_ADDITIONAL_POWERS , g.K002_ROLE , " +
            "g.K002_START_DATE_IN_CWG , g.K002_FINISH_DATE_IN_CWG , g.K002_NOTES FROM " +
            "K004_MEMBER_TO_CABINET c JOIN K002_GROUP_MEMBER g on c.K002_ID = g.K002_ID  " +
            "WHERE c.K001_ID = ?;
  

SELECT * FROM K001_CABINET_WORK_GROUP k 
JOIN K004_MEMBER_TO_CABINET con on k.K001_ID = con.K001_ID 
JOIN K002_GROUP_MEMBER g ON  con.K002_ID = g.K002_ID 
WHERE k.K001_ID = 'f8f62a99-e78d-4bf7-a953-a58e6df735fb';

SELECT g.K002_ID , g.K002_FIO , g.K002_JOB_TITLE , g.K002_ADDITIONAL_POWERS , g.K002_ROLE , g.K002_START_DATE_IN_CWG , g.K002_FINISH_DATE_IN_CWG , g.K002_NOTES 
FROM 
K004_MEMBER_TO_CABINET c JOIN K002_GROUP_MEMBER g on c.K002_ID = g.K002_ID  
WHERE c.K001_ID = 'f8f62a99-e78d-4bf7-a953-a58e6df735fb';

SELECT* FROM K001_CABINET_WORK_GROUP k WHERE k.K001_ID = '83be1600-82e2-4546-860a-0e8c8e890bfe';

SELECT DISTINCT  count(k.K001_ORG_NAME) FROM K001_CABINET_WORK_GROUP k ;
SELECT k.K001_ID , k.K001_ORG_NAME , k.K001_ORG_ADDRESS  FROM K001_CABINET_WORK_GROUP k ORDER BY k.K001_ORG_NAME ASC ;

INSERT INTO K004_MEMBER_TO_CABINET (K001_ID,K002_ID)
VALUES ('2a2945a7-4b30-401d-b331-3377b9195195','5ac37c62-44a8-424e-9735-617201ad981d');

--МОЖНО ВСТАВЛЯТЬ ДАННЫЕ ИЗ SELECT
INSERT INTO K004_MEMBER_TO_CABINET (K001_ID,K002_ID)
SELECT '2a2945a7-4b30-401d-b331-3377b9195195','5ac37c62-44a8-424e-9735-617201ad981d' FROM DUAL;


SELECT * FROM K004_MEMBER_TO_CABINET k WHERE k.K001_ID = '2a2945a7-4b30-401d-b331-3377b9195195' AND k.K002_ID = '5ac37c62-44a8-424e-9735-617201ad981d';



begin
    select count (*)
    into   l_is_matching_row
    from   customer_orders
    where  order_id = 1234
    ;

    if (l_is_matching_row = 0)
    then
      insert into customer_orders
             (order_id, customer, product)
      values (    1234,     9876,  'K698')
      ;
      commit;
    end if;
exception
  when DUP_VAL_ON_INDEX
  then ROLLBACK;
end;


if not exists (...) insert ... 

--////////////////////////////вставка связи между кабинетами и членами группы
INSERT INTO K004_MEMBER_TO_CABINET (K001_ID,K002_ID) 
SELECT
    '2dd81e27-2b25-4636-9c12-53f5f22efef2', 'd348be3e-4a80-460a-9f8e-d26a103de366' 
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 
    FROM K004_MEMBER_TO_CABINET kk
    WHERE kk.K001_ID  = '2dd81e27-2b25-4636-9c12-53f5f22efef2' AND kk.K002_ID = 'd348be3e-4a80-460a-9f8e-d26a103de366' 
);


SELECT* FROM K001_CABINET_WORK_GROUP k WHERE k.K001_ID = '2dd81e27-2b25-4636-9c12-53f5f22efef2'; --38fbd4a3-3fc3-4788-be3b-39e9b1b7e1d0 = АО "Кранбанк"

SELECT* FROM K001_CABINET_WORK_GROUP k WHERE k.K001_ORG_NAME  like '%АСКО%';


--SELECT '2a2945a7-4b30-401d-b331-3377b9195195','5ac37c62-44a8-424e-9735-617201ad981d' FROM DUAL;

SELECT * FROM K001_CABINET_WORK_GROUP k WHERE  k.K001_ORG_INN  = '7710869528';
SELECT * FROM K001_CABINET_WORK_GROUP k WHERE  k.K001_ID  = '38fbd4a3-3fc3-4788-be3b-39e9b1b7e1d0';
SELECT * FROM K002_GROUP_MEMBER k WHERE  k.K002_ID  = '5ac37c62-44a8-424e-9735-617201ad981d';

DELETE FROM K004_MEMBER_TO_CABINET k WHERE  k.K004_ID in (47, 48, 49, 50);

--DELETE FROM K004_MEMBER_TO_CABINET k WHERE  k.K001_ID = '2a2945a7-4b30-401d-b331-3377b9195195' AND k.K002_ID = '5ac37c62-44a8-424e-9735-617201ad981d';





SELECT k.K001_ID , k.K001_DESCRIPTION_CAB , k.K001_CODE_CAB  , k.K001_CHK_DATE_BEGIN , k.K001_CHK_DATE_END , k.K001_ORG_NAME , k.K001_ORG_FULLNAME , k.K001_ORG_ADDRESS , k.K001_ORG_INN ,
k.K001_ORG_REGNUM , k.K001_STATUS_CAB , k.K001_ORG_OGRN 
FROM
K004_MEMBER_TO_CABINET c JOIN K001_CABINET_WORK_GROUP k on c.K001_ID = k.K001_ID 
WHERE c.K002_ID = 'db433458-6bf8-4354-96e4-b535519b91cc';

--обновление данных----------------------------------------
UPDATE     parts SET     cost = 130 WHERE     part_id = 1;
   
UPDATE K002_GROUP_MEMBER SET K002_ROLE = 'Пользователь КРГ'  WHERE K002_ID = '83a66494-b9c8-460f-9801-982903e6d644';
------------------------------------------------------------

SELECT gm.K002_ID , gm.K002_FIO ,gm.K002_JOB_TITLE ,gm.K002_ADDITIONAL_POWERS ,gm.K002_ROLE , k.K001_ID ,k.K001_ORG_NAME 
FROM K002_GROUP_MEMBER gm  LEFT JOIN K004_MEMBER_TO_CABINET c ON gm.K002_ID = c.K002_ID 
LEFT JOIN K001_CABINET_WORK_GROUP k ON c.K001_ID = k.K001_ID ; 


SELECT gm.K002_ID AS member_id, gm.K002_ADDITIONAL_POWERS AS additional_powers, k.K001_CODE_CAB AS code_cabinet, k.K001_ID AS cabinet_id  
FROM K002_GROUP_MEMBER gm  LEFT JOIN K004_MEMBER_TO_CABINET c ON gm.K002_ID = c.K002_ID 
LEFT JOIN K001_CABINET_WORK_GROUP k ON c.K001_ID = k.K001_ID WHERE gm.K002_ID = '9da268ad-3746-4cc5-bb77-d7b5d80efc53'; 

--Выборка и вставка членов рабочих групп
INSERT INTO K002_GROUP_MEMBER(K002_ID , K002_FIO, K002_JOB_TITLE)
 SELECT 
 SYS_GUID(), 
pe.P410_FIO ,
pe.P410_POSITION_NAME 
FROM P410_EMPLOYEE pe WHERE rownum <= 30;

--INSERT INTO K003_MEMBER_TO_CABINET (K001_ID,K002_ID)
--VALUES ('9284d7af-5b1a-471b-bb7c-e53d2ca28a5f','765c64c7-e843-4635-a387-25fe28fdd75f');

SELECT * FROM K003_MEMBER_TO_CABINET kmtc ;




--DELETE from K003_NOTIFICATIONS_AND_CONFIRMATIONS ;


SELECT * FROM "H$FPSID_USER" h LEFT JOIN "S$FPSID_USER" s ON h.USER_ID = s.USER_ID ORDER BY h.USER_ID ,h.LTS ;

--UPDATE K002_GROUP_MEMBER SET K002_ROLE = 'Пользователь КРГ'  WHERE K002_ID = '83a66494-b9c8-460f-9801-982903e6d644';

--UPDATE K003_NOTIFICATIONS_AND_CONFIRMATIONS SET K003_SENDING_NOTIFICATION = '' WHEN  K003_ID = '2c9e25c582695b000182696744b00002';

--DELETE FROM K003_NOTIFICATIONS_AND_CONFIRMATIONS WHERE K003_ID = '2c9e25c5826cd61101826cd8fe8d0000';

SELECT * FROM K003_NOTIFICATIONS_AND_CONFIRMATIONS  WHERE K001_ID = '2dd81e27-2b25-4636-9c12-53f5f22efef2';




--так можно хранить значения для булевого типа а в сервисе их пререводить в true/false
IS_COOL NUMBER(1,0)
1 - TRUE
0 - FALSE
---------------------------------------------------


--ГЕНЕРАЦИЯ GUID с помощью Oracle
SELECT LOWER(RAWTOHEX( SYS_GUID())) FROM dual;


--Вставил нагенерированные данные в таблицу K014_NOTIFICATION_FEED
INSERT INTO K014_NOTIFICATION_FEED s (s.K014_ID , s."SOURCE" , s.ERROR_CODE_OR_TEXT , s.IS_VIEWED , s.K001_ID ) 
values(LOWER(RAWTOHEX( SYS_GUID())), 'ВП ЕПВВ', '505', 0,  );

--Вставил сгенерированные и нет данные в таблицу K014_NOTIFICATION_FEED
INSERT INTO K014_NOTIFICATION_FEED s (s.K014_ID , s."SOURCE" , s.ERROR_CODE_OR_TEXT , s.IS_VIEWED , s.K001_ID )
  SELECT LOWER(RAWTOHEX( SYS_GUID())), 'ВП ЕПВВ', round(DBMS_RANDOM.VALUE(100,800)), 0, p.K001_ID  
    FROM K001_CABINET_WORK_GROUP p WHERE  p.K001_CODE_CAB < 85 AND p.K001_CODE_CAB > 70 ;
   
--
 ALTER TABLE K014_NOTIFICATION_FEED ADD "MESSAGE_VIEWED_BY_USER" VARCHAR2(255);



INSERT INTO K005_SETTINGS_WORK_GROUP_CABINET s(s.K005_ID, s.K005_DATE_OF_CREATION_WORKGROUP_CABINET, s.K005_RESOURCE_BOOKING_START_DATE, s.K005_WORKGROUP_CABINET_ACTIVATION_TERM,
s.K005_RESOURCE_VOLUME,s.K005_QUOTA_SIZE_FOR_ONE_CABINET, s.K005_WORKGROUP_CABINET_CLOSING_DATE) 
values(LOWER(RAWTOHEX( SYS_GUID())), 30, 30, 30, 4000, 50, 5 );

INSERT INTO K005_SETTINGS_WORK_GROUP_CABINET s(s.K005_ID, s.K005_DATE_OF_CREATION_WORKGROUP_CABINET, s.K005_RESOURCE_BOOKING_START_DATE, s.K005_WORKGROUP_CABINET_ACTIVATION_TERM,
s.K005_RESOURCE_VOLUME,s.K005_QUOTA_SIZE_FOR_ONE_CABINET, s.K005_WORKGROUP_CABINET_CLOSING_DATE) 
values(LOWER(RAWTOHEX( SYS_GUID())), 40, 40, 40, 4000, 55, 7 );


UPDATE K005_SETTINGS_WORK_GROUP_CABINET k SET k.K005_VALID_UNTIL = null 
WHERE K005_ID = '2c9e25c5826e0eb401826e27fb3f0009';

UPDATE K005_SETTINGS_WORK_GROUP_CABINET k SET k.K005_VALID_UNTIL = CURRENT_TIMESTAMP 
WHERE k.K005_ID = 'e551e1ed0bfb5b88e053040011acadb3'; 
(
SELECT s.K005_ID  FROM K005_SETTINGS_WORK_GROUP_CABINET s WHERE s.K005_VALID_UNTIL IS NULL AND rownum = 1 ORDER BY s.K005_CREATED_AT );


SELECT * FROM K005_SETTINGS_WORK_GROUP_CABINET WHERE K005_VALID_UNTIL IS NULL AND rownum = 1 ORDER BY K005_CREATED_AT;

SELECT * FROM K005_SETTINGS_WORK_GROUP_CABINET WHERE K005_VALID_UNTIL IS NULL AND rownum = 1 ORDER BY K005_CREATED_AT;

--UPDATE K005_SETTINGS_WORK_GROUP_CABINET k SET k.K005_VALID_UNTIL = CURRENT_TIMESTAMP 
--WHERE k.K005_ID = (SELECT s.K005_ID  FROM K005_SETTINGS_WORK_GROUP_CABINET s WHERE s.K005_VALID_UNTIL IS NULL );


--UPDATE K005_SETTINGS_WORK_GROUP_CABINET k SET k.K005_VALID_UNTIL = CURRENT_TIMESTAMP 
--WHERE k.K005_ID = (SELECT s.K005_ID  FROM K005_SETTINGS_WORK_GROUP_CABINET s WHERE s.K005_VALID_UNTIL IS NULL)

SELECT * FROM K005_SETTINGS_WORK_GROUP_CABINET ORDER BY K005_CREATED_AT;

--DELETE FROM K005_SETTINGS_WORK_GROUP_CABINET WHERE K005_ID = 'e57d7f1dc576c864e053040011acbe02';





SELECT SYSDATE  from dual;
SELECT SYSDATE, CURRENT_TIMESTAMP  FROM DUAL;






SELECT * FROM K001_CABINET_WORK_GROUP k WHERE k.K001_ID = '2dd81e27-2b25-4636-9c12-53f5f22efef2';
SELECT * FROM K001_CABINET_WORK_GROUP k WHERE k.K001_ID = 'b5977d4a-fa76-418d-b29a-89359aa48847';
SELECT * FROM K001_CABINET_WORK_GROUP k WHERE k.K001_WORKING_MODE = 0;



 

  

SELECT * FROM K001_CABINET_WORK_GROUP k WHERE k.K001_CODE_CAB LIKE '%-0209%'; 

SELECT k.K001_ID , k.K001_CODE_CAB , k.K001_CHK_DATE_BEGIN ,k.K001_ORG_NAME, k.K001_ORG_FULLNAME, k.K001_ORG_ADDRESS  FROM K001_CABINET_WORK_GROUP k ORDER BY k.K001_CHK_DATE_BEGIN ;

SELECT * FROM P320_COMPOSITE_CHK_NFO p WHERE p.P320_CHK_SHEDULE_DATE >= to_date('2019-06-01', 'yyyy-MM-dd') AND p.P320_CHK_SHEDULE_DATE <= to_date('2019-12-31', 'yyyy-MM-dd');  

--Выборка данных по максимальному id для таблицы проверок
SELECT * FROM DEV_OLTP_APPID_DATA.P320_COMPOSITE_CHK_NFO 
WHERE P320_CHK_ID IN (SELECT max(P320_CHK_ID) FROM DEV_OLTP_APPID_DATA.P320_COMPOSITE_CHK_NFO GROUP BY P320_INITIAL_CHK);



--AND cc.id = (SELECT MAX(cc2.id) FROM candidates_consideration cc2  WHERE cc2.candidate_id = cand.id)
--(SELECT cc.finished FROM candidates_consideration cc WHERE cc.id = (SELECT MAX(cc2.id) FROM candidates_consideration cc2  WHERE cc2.candidate_id = cand.id and cc2.state = 'archived')) AS last_consideration_finished_date,

--WHERE pccn.P320_CHK_ID = 234132
--WHERE pccn.P320_CHK_SHEDULE_DATE BETWEEN add_months(trunc(sysdate,'mm'),-19) AND last_day(add_months(trunc(sysdate,'mm'),-19))+0.99999 AND ROWNUM <=300

--SELECT department, MAX(salary) AS "Highest salary"
--FROM employees
--GROUP BY department;

--SELECT category_name, MAX( list_price )
--FROM  products INNER JOIN product_categories USING(category_id)
--GROUP BY  category_name ORDER BY category_name;


--121212121
SELECT 
*
--pccn.P320_CHK_ID ,
--pccn.P320_CHK_SHEDULE_DATE ,
--pccn.P320_CHK_PERIOD_E  ,
--pccn.P320_ORG_NAME ,
--pio.P600_FULLNAME , 
--pio.P600_ADDRESS ,
--km.KBANK_CREGNUM, 
--pio.P600_INN, 
--pio.P600_OGRN
FROM P320_COMPOSITE_CHK_NFO pccn 
LEFT JOIN P600_INSP_OBJECT pio ON pccn.P600_ID = pio.P600_ID
LEFT JOIN K_MERGED km ON  pio.RBASE_CID = km.RBASE_CID
WHERE pccn.P320_CHK_SHEDULE_DATE >= to_date('2020-12-01','yyyy-MM-dd') AND pccn.P320_CHK_SHEDULE_DATE <= to_date('2020-12-31','yyyy-MM-dd') 
--AND pccn.P320_ORG_NAME LIKE '%Народный банк%'
AND pccn.P320_CHK_ID in(17740656, 25513440, 26122556, 27331112, 27645864)
AND ROWNUM <=300
ORDER BY pccn.P320_ORG_NAME, pccn.P320_CHK_ID asc;


SELECT to_date('2020-12-01','yyyy-MM-dd') FROM dual;

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
select max(x) keep (dense_rank last order by y) MAX_VALUE from t;
--///////////////////////////////////////////////////////////


SELECT * FROM P320_COMPOSITE_CHK_NFO pccn 
LEFT JOIN P600_INSP_OBJECT pio ON pccn.P600_ID = pio.P600_ID 
LEFT JOIN K_MERGED km ON pio.RBASE_CID = km.RBASE_CID 
WHERE pccn.P320_CHK_ID = 234132;
--WHERE pccn.P600_ID = 3098888;    

SELECT * FROM P320_COMPOSITE_CHK_NFO pccn  WHERE pccn.P320_CHK_ID = 234132;
SELECT * FROM P320_COMPOSITE_CHK_NFO pccn  WHERE pccn.P600_ID = 2738056;
SELECT * FROM P600_INSP_OBJECT pio  WHERE pio.P600_ID = 3098888;


SELECT * FROM K_MERGED km WHERE km.KBANK_CSNAME = 'ООО КБ "РБС"';
SELECT * FROM P320_COMPOSITE_CHK_NFO pccn WHERE pccn.P320_ORG_NAME = 'ООО КБ "РБС"';


--########################################################
--Переделал запрос на выборку на месяц вперед
 --Вставить данные из нескольких таблиц в не нужную
INSERT INTO K001_CABINET_WORK_GROUP ( K001_CHK_DATE_BEGIN , K001_CHK_DATE_END , K001_ORG_NAME , K001_ORG_FULLNAME , K001_ORG_ADDRESS , K001_ORG_INN , K001_ORG_REGNUM , K001_ORG_OGRN  )
  SELECT 
pccn.P320_CHK_SHEDULE_DATE ,
pccn.P320_CHK_PERIOD_E  ,
pccn.P320_ORG_NAME ,
pio.P600_FULLNAME , 
pio.P600_ADDRESS ,
pio.P600_INN, 
km.KBANK_CREGNUM, 
pio.P600_OGRN
FROM P320_COMPOSITE_CHK_NFO pccn, P600_INSP_OBJECT pio, K_MERGED km
WHERE pccn.P600_ID = pio.P600_ID AND pccn.P320_ORG_NAME = km.KBANK_CSNAME 
AND  pccn.P320_CHK_SHEDULE_DATE BETWEEN add_months(trunc(sysdate,'mm'),+1) AND last_day(add_months(trunc(sysdate,'mm'),+1))+0.99999 AND ROWNUM <=20;
--########################################################

SELECT * FROM X111_WORK_GROUP_CAB x WHERE x.X111_CHK_DATE_BEGIN BETWEEN ( TO_DATE ( TRUNC ( SYSDATE, 'MM' ), 'DD.MM.YYYY' ) - 15 ) AND ( LAST_DAY ( SYSDATE ) + 15 );

SELECT TO_DATE ( TRUNC ( SYSDATE, 'MM' ), 'DD.MM.YYYY' ) FROM dual;

--########################################################
--выбор данных на 1 месяц вперед
SELECT * FROM X111_WORK_GROUP_CAB x WHERE x.X111_CHK_DATE_BEGIN BETWEEN add_months(trunc(sysdate,'mm'),+1) AND last_day(add_months(trunc(sysdate,'mm'),+1))+0.99999;
--########################################################


--
INSERT ALL
   INTO t (col1, col2, col3) VALUES ('val1_1', 'val1_2', 'val1_3')
   INTO t (col1, col2, col3) VALUES ('val2_1', 'val2_2', 'val2_3')
   INTO t (col1, col2, col3) VALUES ('val3_1', 'val3_2', 'val3_3')
   .
   .
   .
SELECT 1 FROM DUAL;

--Вставка некоторых тестовых данных в таб. КРГ
--'9851d02c-f448-4036-aa42-233fd2c02815'		'1027700342001-8-2022'		'ПАО "ХозБанк"'	'Публичное Акционерное общество "Хоз банк"'	'119034, г. Москва, Гагаринский пер., д.32'	'7725114487'	'3350' '1027700342001'
--'9852d02c-f448-4036-aa42-233fd2c02817'		'1027700342002-8-2022'		'АО "РосСельБанк"'	'Акционерное общество "Российский Сельский банк"'	'119034, г. Москва, Гагаринский пер., д.30'	'7725114489'	'3351' '1027700342002'

INSERT INTO X111_WORK_GROUP_CAB ( 
X111_ID, X111_CODE_CAB , 
--X111_CHK_DATE_BEGIN , 
--X111_CHK_DATE_END , 
X111_ORG_NAME , X111_ORG_FULLNAME , X111_ORG_ADDRESS , X111_ORG_INN , X111_ORG_REGNUM , X111_ORG_OGRN  ) 
VALUES ('9852d02c-f448-4036-aa42-233fd2c02817',
'1027700342002-8-2022',
'АО "РосСельБанк"',
'Акционерное общество "Российский Сельский банк"',
'119034, г. Москва, Гагаринский пер., д.30',
'7725114489',
'3351',
'1027700342002');





SELECT * FROM X111_WORK_GROUP_CAB xwgc ;


SELECT * FROM P600_INSP_OBJECT pio WHERE pio.P600_FULLNAME LIKE '%Волго-Вятский банк%';
SELECT * FROM P600_INSP_OBJECT pio WHERE pio.P600_INN = 7707083893;
SELECT * FROM P320_COMPOSITE_CHK_NFO pio WHERE UPPER(pio.P320_ORG_NAME)  LIKE '%ТУЛЬСКИЙ РЕГИОНАЛЬНЫЙ%';
SELECT * FROM P320_COMPOSITE_CHK_NFO pio WHERE LOWER(pio.P320_ORG_NAME)  LIKE '%росбанк%';

SELECT * FROM P320_COMPOSITE_CHK_NFO pio WHERE rownum <= 10;
SELECT * FROM P320_COMPOSITE_CHK_NFO pio  WHERE pio.P320_ORG_INN  = 7725114488;
SELECT * FROM P320_COMPOSITE_CHK_NFO pio  WHERE pio.P200_PLAN_ID  = 2601223;
SELECT * FROM P320_COMPOSITE_CHK_NFO pio  WHERE pio.P320_CHK_ID  = 2619610;

SELECT * FROM P200_PLAN_NFO ppn , P320_COMPOSITE_CHK_NFO pccn, P600_INSP_OBJECT pio  
WHERE ppn.P200_PLAN_ID = pccn.P200_PLAN_ID 
AND pccn.
AND ROWNUM <=20; 
 
   --Пример от Максима
SELECT 
   pg37_id, 
   b.P333_REMARK, 
   listagg(c.replicator_repo, ',') within GROUP (ORDER BY PG37_repo), 
   count(*), 
   max(P362_DATE) 
FROM DEV_OLTP_APPID_DATA.P362_INSP_FILES a, DEV_OLTP_APPID_DATA.P333_VALID_PARAMS b, DEV_OLTP_APPID_DATA.v_repo c 
WHERE b.P333_PARAM_ID=a.PG37_ID AND c.pg37_repo = b.P333_REMARK grOUP BY pg37_id, p333_remark, replicator_repo;



SELECT * FROM P320_COMPOSITE_CHK_NFO pc WHERE pc.P200_PLAN_ID = 9996;
SELECT * FROM P200_PLAN_NFO pc WHERE pc.P200_PLAN_ID = 9996;

SELECT * FROM P600_INSP_OBJECT pio WHERE pio.P600_ID = 2598715;



SELECT pc.P320_CHK_ID , pc.P200_PLAN_ID , pc.p600_id, pc.P320_ORG_NAME , pc.P320_CHK_PERIOD_B , pc.P320_CHK_PERIOD_E  FROM P320_COMPOSITE_CHK_NFO pc WHERE pc.P600_ID = 2056078 AND pc.P200_PLAN_ID = 1006
ORDER BY pc.P320_CHK_ID asc;

SELECT * FROM K_MERGED km WHERE km.KBANK_CSNAME = 'АО "ГУТА-БАНК"';
SELECT * FROM P600_INSP_OBJECT pio WHERE pio.P600_INN = 7725114488;


--/////////////////****************************************************************
--СОЗДАЛ ТАБЛИЦУ ДЛЯ ХРАНЕНИЯ КАБИНЕТОВ РАБОЧИХ ГРУПП
--ИСПОЛЬЗУЕМ ЕЕ !!! (29.07.2022)
--без автогенерации первичного ключа
--сюда из сервиса кидаю сгенерированный в виде uuid ключ
CREATE TABLE DEV_OLTP_APPID_DATA.K001_CABINET_WORK_GROUP (
	K001_ID VARCHAR2(50) PRIMARY KEY, 
	K001_DESCRIPTION_CAB VARCHAR2(4000),
	K001_CODE_CAB VARCHAR2(40),
	K001_CHK_DATE_BEGIN DATE,
	K001_CHK_DATE_END DATE,
	K001_ORG_NAME VARCHAR2(400),
	K001_ORG_FULLNAME VARCHAR2(400), 
	K001_ORG_ADDRESS VARCHAR2(1000), 
	K001_ORG_INN VARCHAR2(20),
	K001_ORG_REGNUM VARCHAR2(20),
	K001_STATUS_CAB NUMBER(6,0),
	K001_ORG_OGRN VARCHAR2(20),
	K001_CREATED_AT TIMESTAMP WITH TIME ZONE DEFAULT SYSDATE,
	K001_MODIFIED_AT TIMESTAMP WITH TIME ZONE DEFAULT SYSDATE
)
TABLESPACE TS_APPID_DT_S;
--/////////////////****************************************************************



SELECT * FROM P320_COMPOSITE_CHK_NFO pccn WHERE PCCN .P320_CHK_ID IN (13603311, 13603313);


SELECT p.P600_ID , p.P600_OGRN , p.P600_INN , p.P600_FULLNAME , p.P600_SHORTNAME , p.P600_ADDRESS , p.P600_BEGIN_DATE , p.P600_END_DATE ,
k.RBASE_CB_DATE , k.RBASE_CE_DATE , k.RBASE_CNAME , k.KBANK_CREGNUM , k.KBANK_CREGNUM15 
FROM P600_INSP_OBJECT p JOIN K_MERGED k ON p.RBASE_CID = k.RBASE_CID; 


SELECT p.P600_ID , p.P600_OGRN , p.P600_INN , p.P600_FULLNAME , p.P600_SHORTNAME , p.P600_ADDRESS , p.P600_BEGIN_DATE , p.P600_END_DATE ,
k.RBASE_CB_DATE , k.RBASE_CE_DATE , k.KBANK_CBDATE , k.KBANK_CEDATE  , k.RBASE_CNAME , k.KBANK_CREGNUM , k.KBANK_CREGNUM15 
FROM P600_INSP_OBJECT p LEFT JOIN K_MERGED k ON p.RBASE_CID = k.RBASE_CID WHERE p.P600_ID IN (2647270, 2647271, 2647272); 




SELECT p.P600_ID , p.P600_OGRN , p.P600_INN , p.P600_FULLNAME , p.P600_SHORTNAME , p.P600_ADDRESS , p.P600_BEGIN_DATE , p.P600_END_DATE ,
k.RBASE_CB_DATE , k.RBASE_CE_DATE , k.KBANK_CBDATE , k.KBANK_CEDATE  , k.RBASE_CNAME , k.KBANK_CREGNUM , k.KBANK_CREGNUM15 
FROM P600_INSP_OBJECT p LEFT JOIN K_MERGED k ON p.RBASE_CID = k.RBASE_CID WHERE p.P600_ID IN (3099646,
3099648,
3099649,
3099650,
3099651,
3099652,
3099653,
3099654,
3099655,
3099656,
3099657,
3099658,
3099659,
3099660,
3099661);


SELECT p.P600_ID AS ID, k.FREGNUM AS full_reg_num, p.P600_INN AS org_inn , p.P600_OGRN AS ORG_OGRN,  
p.P600_FULLNAME AS ORG_FULL_NAME, p.P600_SHORTNAME AS ORG_SHORT_NAME, 
p.P600_ADDRESS AS ORG_ADDRESS,  k.KBANK_CREGNUM15  AS REG_NUM_15, p.P600_BEGIN_DATE , p.P600_END_DATE ,
k.RBASE_CB_DATE , k.RBASE_CE_DATE , k.KBANK_CBDATE , k.KBANK_CEDATE  , k.RBASE_CNAME  
FROM P600_INSP_OBJECT p LEFT JOIN K_MERGED k ON p.RBASE_CID = k.RBASE_CID WHERE p.P600_ID IN (
2402122,
2402123,
2402124,
3099672);


SELECT p.P600_ID AS ID, k.FREGNUM AS full_reg_num, p.P600_INN AS org_inn , p.P600_OGRN AS ORG_OGRN,  
p.P600_FULLNAME AS ORG_FULL_NAME, p.P600_SHORTNAME AS ORG_SHORT_NAME, 
p.P600_ADDRESS AS ORG_ADDRESS,  k.KBANK_CREGNUM15  AS REG_NUM_15, 
nvl(p.P600_BEGIN_DATE , k.KBANK_CBDATE) AS DATE_FROM,
nvl(p.P600_END_DATE , k.KBANK_CEDATE) AS DATE_END
FROM P600_INSP_OBJECT p LEFT JOIN K_MERGED k ON p.RBASE_CID = k.RBASE_CID WHERE p.P600_ID IN (
2402122,
2402123,
2402124,
3099672);


SELECT p.P600_ID AS ID, k.FREGNUM AS full_reg_num, p.P600_INN AS org_inn , p.P600_OGRN AS ORG_OGRN,  
p.P600_FULLNAME AS ORG_FULL_NAME, p.P600_SHORTNAME AS ORG_SHORT_NAME, 
p.P600_ADDRESS AS ORG_ADDRESS,  k.KBANK_CREGNUM15  AS REG_NUM_15, 
nvl(p.P600_BEGIN_DATE , k.KBANK_CBDATE) AS DATE_FROM,
nvl(p.P600_END_DATE , k.KBANK_CEDATE) AS DATE_END
FROM P600_INSP_OBJECT p LEFT JOIN K_MERGED k ON p.RBASE_CID = k.RBASE_CID 
WHERE k.FREGNUM LIKE '%1588%' 
AND p.P600_INN LIKE '%%' AND  LOWER(p.P600_FULLNAME) LIKE '%%' AND LOWER(p.P600_SHORTNAME) LIKE '%%';



SELECT p.P600_ID AS ID, k.FREGNUM AS FULL_REG_NUM, p.P600_INN AS ORG_INN , p.P600_OGRN AS ORG_OGRN,
            p.P600_FULLNAME AS ORG_FULL_NAME, p.P600_SHORTNAME AS ORG_SHORT_NAME,
            p.P600_ADDRESS AS ORG_ADDRESS,  k.KBANK_CREGNUM15  AS REG_NUM15,
            nvl(p.P600_BEGIN_DATE , k.KBANK_CBDATE) AS DATE_FROM,
            nvl(p.P600_END_DATE , k.KBANK_CEDATE) AS DATE_END
            FROM P600_INSP_OBJECT p LEFT JOIN K_MERGED k ON p.RBASE_CID = k.RBASE_CID 
            WHERE k.FREGNUM LIKE '%1588%' AND p.P600_INN LIKE '%%' AND 
            LOWER(p.P600_FULLNAME) LIKE '%%' AND LOWER(p.P600_SHORTNAME) LIKE '%%';
           
CASE
WHEN e1 IS NOT NULL THEN
  e1
ELSE
  e2
END
    

SELECT p.P600_ID AS ID, k.FREGNUM AS FULL_REG_NUM, p.P600_INN AS ORG_INN , p.P600_OGRN AS ORG_OGRN,
            p.P600_FULLNAME AS ORG_FULL_NAME, p.P600_SHORTNAME AS ORG_SHORT_NAME,
            p.P600_ADDRESS AS ORG_ADDRESS,  k.KBANK_CREGNUM15  AS REG_NUM15,
            (CASE WHEN p.P600_BEGIN_DATE IS NOT NULL THEN p.P600_BEGIN_DATE ELSE k.KBANK_CBDATE END) AS FROM_DATE_START, 
            (CASE WHEN p.P600_END_DATE IS NOT NULL THEN p.P600_END_DATE ELSE k.KBANK_CEDATE END) AS TO_DATE_END
            FROM P600_INSP_OBJECT p LEFT JOIN K_MERGED k ON p.RBASE_CID = k.RBASE_CID 
            WHERE k.FREGNUM = '354/6' AND p.P600_INN LIKE '%%' AND 
            LOWER(p.P600_FULLNAME) LIKE '%%' AND LOWER(p.P600_SHORTNAME) LIKE '%%';
           
SELECT p.P600_ID AS ID, k.FREGNUM AS FULL_REG_NUM, p.P600_INN AS ORG_INN , p.P600_OGRN AS ORG_OGRN,
            p.P600_FULLNAME AS ORG_FULL_NAME, p.P600_SHORTNAME AS ORG_SHORT_NAME,
            p.P600_ADDRESS AS ORG_ADDRESS,  k.KBANK_CREGNUM15  AS REG_NUM15,
            (CASE WHEN p.P600_BEGIN_DATE IS NOT NULL THEN p.P600_BEGIN_DATE ELSE k.KBANK_CBDATE END) AS FROM_DATE_START, 
            (CASE WHEN p.P600_END_DATE IS NOT NULL THEN p.P600_END_DATE ELSE k.KBANK_CEDATE END) AS TO_DATE_END
            FROM P600_INSP_OBJECT p LEFT JOIN K_MERGED k ON p.RBASE_CID = k.RBASE_CID 
            WHERE  p.P600_ID = '2646920';
            


SELECT p.P600_ID AS ID, k.FREGNUM AS full_reg_num, p.P600_INN AS org_inn , p.P600_OGRN AS ORG_OGRN,  p.P600_FULLNAME AS ORG_FULL_NAME, p.P600_SHORTNAME AS ORG_SHORT_NAME, 
p.P600_ADDRESS AS ORG_ADDRESS,  k.KBANK_CREGNUM15  AS REG_NUM_15, p.P600_BEGIN_DATE , p.P600_END_DATE ,
k.RBASE_CB_DATE , k.RBASE_CE_DATE , k.KBANK_CBDATE , k.KBANK_CEDATE  , k.RBASE_CNAME  
FROM P600_INSP_OBJECT p LEFT JOIN K_MERGED k ON p.RBASE_CID = k.RBASE_CID WHERE k.FREGNUM LIKE '%1043%';

UPDATE K001_CABINET_WORK_GROUP SET K001_DESCRIPTION_CAB  = 'тестовое описание крг'  WHERE K001_ID = 'da2ac279-f346-4d9e-a90e-a176690842fb';

--UPDATE K001_CABINET_WORK_GROUP SET K001_CREATED_AT = TIMESTAMP '2019-05-01 00:00:01.10'  WHERE K001_ID
 IN ( 
--'42651690-2bec-435b-ba8c-8839f4b40766',
--'be743612-a943-4afe-9ce1-b2e8fdd82470',
--'a911abf3-c029-4cc8-ab92-1b5bf927be5a',
--'618cdbd2-65d8-4a1f-bd1e-94cdfc8abb83',
--'d7dfd3c7-c69a-4632-a09a-f6e9d1b13088',
--'ff6ecd38-0934-4c69-9bb5-e4c2038a057f',
--'4d0cbf11-cc5d-4669-b079-3cba9310aa27',
--'7728d685-964f-406f-b247-05e2917b4014',
--'87a78c2e-1df5-4021-b6bf-5a5fdafcb25b',
--'3f3efc76-1b3a-4077-8fef-406655207f45',
--'d26329ed-7866-4b1d-9a7b-01c81a5ad62b',
--'1b677abe-389b-4bb3-ba76-394c9489a7f4',
--'1633df1e-92b9-4951-9598-440c940b462c');

SELECT K001_ID , K001_CREATED_AT  FROM K001_CABINET_WORK_GROUP ORDER BY K001_CREATED_AT ;



  UPDATE
    X111_WORK_GROUP_CAB_TEST a 
SET
    a.X111_CHK_DESCRIPTION  = 'какое-то текстовое описание 10'
WHERE
    a.X111_ID  = 10;




SELECT * FROM K_MERGED k WHERE k.FREGNUM LIKE '%1043%';

 --LPAD(ASIP_REGNUM1,32,'0')||CASE WHEN ASIP_REGNUM2=0 THEN '' ELSE CAST(ASIP_REGNUM2 AS VARCHAR2(32)) END ; --? эта формула из класса CreditOrganizationKMerged


SELECT 
max(p.P320_CHK_ID) as P320_CHK_ID, 
p.P320_INITIAL_CHK, 
p.P320_CHK_SHEDULE_DATE, 
p.P320_CHK_PERIOD_E, 
p.P320_ORG_NAME, 
pio.P600_FULLNAME, 
pio.P600_ADDRESS, 
pio.P600_INN, 
pio.P600_OGRN, 
km.FREGNUM 
FROM P320_COMPOSITE_CHK_NFO p 
LEFT JOIN P600_INSP_OBJECT pio ON p.P600_ID = pio.P600_ID 
LEFT JOIN K_MERGED km ON  pio.RBASE_CID = km.RBASE_CID 
WHERE p.P320_CHK_SHEDULE_DATE >= to_date('01.01.2019', 'dd.mm.yyyy') AND p.P320_CHK_SHEDULE_DATE <= to_date('31.12.2019', 'dd.mm.yyyy') 
GROUP BY p.P320_INITIAL_CHK, p.P320_CHK_SHEDULE_DATE, p.P320_CHK_PERIOD_E, p.P320_ORG_NAME, pio.P600_FULLNAME, 
pio.P600_ADDRESS, pio.P600_INN, pio.P600_OGRN, km.FREGNUM ORDER BY p.P320_INITIAL_CHK ASC;


--Селект из public class CoordinatedChecksSubSelect
SELECT
A.P340_ID,
LISTAGG(CASE 
	WHEN P320_ID IS NOT NULL AND P320_KO_ID IS NOT NULL THEN CAST(P320_ID AS VARCHAR2(22))||','||CAST(P320_KO_ID  AS VARCHAR2(22))
    WHEN P320_ID IS NOT NULL AND P320_KO_ID IS NULL THEN CAST(P320_ID AS VARCHAR2(22)) 
    WHEN P320_ID IS NULL AND P320_KO_ID IS NULL THEN '-' 
    WHEN P320_ID IS NULL AND P320_KO_ID IS NOT NULL THEN CAST(P320_KO_ID  AS VARCHAR2(22))
    END, ',')  
    WITHIN GROUP (ORDER BY P341_ORDER) AS CHECK_MEMBERS  
FROM P341_COORD_CHK A GROUP BY A.P340_ID;





--Это Люда писала запрос
--SELECT count(*) FROM P333_VALID_PARAMS a, H$AUDIT_QUESTION_PERM b WHERE a.P333_PARAM_ID = b.P333_PARAM_ID ---142
--SELECT count(*) FROM P333_VALID_PARAMS a, H$CHECK_QUESTION_PERM b WHERE a.P333_PARAM_ID = b.P333_PARAM_ID ---420


--опреатор WITH позволяет дать блоку подзапроса имя/псевдоним, на которое можно ссылаться в нескольких местах основного SQL-запроса
--Имя, присвоенное подзапросу, обрабатывается так, как если бы оно было встроенным представлением или таблицей. 
--SQL оператор WITH по сути является заменой обычному подзапросу.
WITH ins AS (
INSERT INTO "FBIntegration".archived_objects 
(integration_id,actual_femida_id,femida_id,beamery_id,state,object_type,updated_datetime,beamery_hash_id) 
SELECT integration_id,? AS actual_femida_id,femida_id,beamery_id,state,object_type,updated_datetime,beamery_hash_id 
FROM "FBIntegration".object_states WHERE femida_id = ? AND object_type = ? LIMIT 1) 
DELETE FROM "FBIntegration".object_states WHERE femida_id = ? AND object_type = ?;


--///////////////// СОЗДАЛ ТАБЛИЦУ ДЛЯ ХРАНЕНИЯ ДАННЫХ
CREATE TABLE DEV_OLTP_APPID_DATA.DOCS (
	ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
	DOC_NAME VARCHAR2(400),
	DOC_TYPE VARCHAR2(50),
	FILE_DATA BLOB,
	CREATED_AT TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP 
);
--////////////////////////////////////////////////////


--///////////////// СОЗДАЛ ТАБЛИЦУ ДЛЯ ХРАНЕНИЯ ШАБЛОНА ЭЛЕКТРОННОГО КАТАЛОГА 
CREATE TABLE DEV_OLTP_APPID_DATA.K006_ELECTRONIC_CATALOG_TEMPLATE (
	ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	TITLE VARCHAR2(400), 
	TITLE_MATERIALIZED_PATH VARCHAR2(704) NOT NULL ENABLE, 
	DEPTH_LEVEL NUMBER(4,0), 
	PARENT_TITLE_MATERIALIZED_PATH VARCHAR2(704), 
	MODIFIED_AT TIMESTAMP (6) WITH TIME ZONE, 
	IS_DIRECTORY NUMBER(1,0), 
	PARENT_ID NUMBER(12,0), 
	CREATED_AT TIMESTAMP (6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP 
);
--///////////////////////////////////////////////////


--///////////////// СОЗДАЛ ТАБЛИЦУ ДЛЯ ХРАНЕНИЯ экспериментальных DOCUMENT_FILES
CREATE TABLE DEV_OLTP_APPID_DATA.DOCUMENT_FILES (
	ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	MATERIALIZED_PATH VARCHAR2(704) NOT NULL ENABLE,
	PATH_NAME VARCHAR2(704) NOT NULL ENABLE,
	DEPTH_LEVEL NUMBER(4,0),
--	PARENT_TITLE_MATERIALIZED_PATH VARCHAR2(704),
	CREATED_AT TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP 
);
--////////////////////////////////////////////////////

--///////////////// СОЗДАЛ ТАБЛИЦУ ДЛЯ ХРАНЕНИЯ ДАННЫХ КОТОРЫЕ загружаем в каталог "upload" при загрузке файлов в ЭПП
CREATE TABLE DEV_OLTP_APPID_DATA.DOCS (
	ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
	DOC_NAME VARCHAR2(400),
	DOC_TYPE VARCHAR2(50),
	FILE_DATA BLOB,
	CREATED_AT TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP 
);
--///////////////////////////////////////////////////



--///////////////// СОЗДАЛ ТАБЛИЦУ ДЛЯ ХРАНЕНИЯ Метаданных Документов K007_DOCUMENTS_METADATA
CREATE TABLE DEV_OLTP_APPID_DATA.K007_CABINET_FILES (
	K007_ID NUMBER (12,0) NOT NULL ENABLE,
	FILE_NAME VARCHAR2(255) NOT NULL,
	DATE_OF_DOWNLOAD TIMESTAMP (6) WITH TIME ZONE,
	DOC_TYPE VARCHAR2(100) NOT NULL ENABLE,
	PATH_NAME VARCHAR2(704) NOT NULL ENABLE,
	FILE_HASH VARCHAR2(100) NOT NULL ENABLE,
	FILE_LENGTH NUMBER (14,0) NOT NULL ENABLE,
	FILE_DATA BLOB,
	PARENT_DIRECTORY_ID NUMBER (12,0) NOT NULL ENABLE,
	K008_HEAD_ID NUMBER(12,0),
	K001_ID VARCHAR2(50),
	CREATED_AT TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	 PRIMARY KEY ("K007_ID")
);
--///////////////////////////////////////////////////


CREATE TABLE "DEV_OLTP_APPID_DATA"."K007_CABINET_FILES" 
   (	
    "K007_ID" NUMBER(12,0) NOT NULL ENABLE, 
	"K001_ID" VARCHAR2(50) NOT NULL ENABLE, 
	"K007_UPLOAD_DATE" TIMESTAMP NOT NULL ENABLE, 
	"K007_MOD_DATE" TIMESTAMP NOT NULL DISABLE,
	"K007_USERNAME" VARCHAR2(200) NOT NULL ENABLE, 
	"K007_MACHINE_NAME" VARCHAR2(200) NOT NULL DISABLE, 
	"K007_FILE_NAME" VARCHAR2(200) NOT NULL ENABLE, 
	"k007_FILE_HASH" VARCHAR2(32), 
	"K007_FILE_DATA" BLOB, 
	"K007_XML_DATA" CLOB,
	"K007_XML_HASH" VARCHAR2(32), 
	"K007_PATH_NAME" VARCHAR2(250) NOT NULL DISABLE, 
	"K007_FILE_LENGTH" NUMBER(14,0), 
	"K007_SOURCE_IDENTIFIER" VARCHAR2(255) NOT NULL DISABLE,
	"K007_DATE_SENDING_TO_SADD" TIMESTAMP NOT NULL DISABLE,
	"K007_DATE_REGISTRATION_IN_SADD" TIMESTAMP NOT NULL DISABLE,
	"K007_REGISTRATION_NUMBER_IN_SAAD" VARCHAR2(50) NOT NULL DISABLE,
	

	
	
	"PG104_ID" NUMBER(12,0) NOT NULL DISABLE, 
	"P362_FILE_STS" NUMBER(2,0) NOT NULL DISABLE, 
	"P362_DATE_STS" DATE NOT NULL DISABLE, 
	 
	"P362_USER_CHG_STS" VARCHAR2(200) NOT NULL DISABLE, 
	 
 
	
 
	"K015_ID" NUMBER(12,0) NOT NULL DISABLE, /*Таблица Аттрибутов к файлу*/
	 PRIMARY KEY ("K007_ID"),
	 CONSTRAINT "K007_CABINET_FILES_TO_K015_FK" FOREIGN KEY ("K015_ID")
	  REFERENCES "DEV_OLTP_APPID_DATA"."K015_CABINET_FILE_ATTRIBS" ("K015_ATTRIBS_ID") DISABLE, 
	 CONSTRAINT "K007_CABINET_FILES_TO_K001_FK" FOREIGN KEY ("K001_ID")
	  REFERENCES "DEV_OLTP_APPID_DATA"."K001_CABINET_WORK_GROUP" ("K001_ID") DISABLE
   ) TABLESPACE "TS_APPID_DT_S";
 
  
  SELECT * FROM P362_INSP_FILES p WHERE p.P362_PARENT_ID = 22497608;
   SELECT * FROM P362_INSP_FILES p WHERE p.P362_ID = 22497608; --q4i27081.docx --2019\4I\Q4I27081\Q4I27081_1\q4i27081.docx
 
 
 CREATE TABLE "DEV_OLTP_APPID_DATA"."P364_INSP_FILE_ATTRIBS" 
   (	"P364_ATTRIBS_ID" NUMBER(12,0) NOT NULL DISABLE, 
	"P310_GIBR_ID" NUMBER(12,0) NOT NULL DISABLE, 
	"P364_ORG_NAME" VARCHAR2(400) NOT NULL DISABLE, 
	"P364_ORG_INN" VARCHAR2(10), 
	"P364_ORG_OGRN" VARCHAR2(13), 
	"P364_DT_BEGIN" DATE, 
	"P364_ACT_TYPES" VARCHAR2(50), 
	"P364_PG51" NUMBER(12,0), 
	"P364_FILE_STS" NUMBER(12,0) NOT NULL DISABLE, 
	"P307_REGION" NUMBER(12,0) NOT NULL DISABLE, 
	"P364_DT_MISS" DATE, 
	"P364_DT_OPPOSITION" DATE, 
	"P364_DT_DELAY" DATE, 
	"P364_DT_PAUSE" DATE, 
	"P364_DT_RESUME" DATE, 
	"P364_FLG_VIEWED" NUMBER(1,0) NOT NULL DISABLE, 
	"P364_FLG_VIEWED_WHO" VARCHAR2(400), 
	"P364_FLG_VIEWED_WHEN" DATE, 
	"P364_REGNUM" VARCHAR2(9), 
	"P364_PG108_ID" NUMBER(12,0), 
	"P364_PG14_ID" NUMBER(12,0), 
	"P364_SADD_REGN" VARCHAR2(50), 
	"P364_SADD_DATE" DATE, 
	"P364_SADD_PARENT_REGN" VARCHAR2(50), 
	"P364_SADD_PARENT_DATE" DATE, 
	"P364_IS_REPLACED" NUMBER(1,0) NOT NULL DISABLE, 
	 PRIMARY KEY ("P364_ATTRIBS_ID")
   ) TABLESPACE "TS_APPID_DT_S" ;
 
 


--///////////////// СОЗДАЛ ТАБЛИЦУ ДЛЯ ХРАНЕНИЯ ЛЕНТЫ УВЕДОМЛЕНИЙ K014_NOTIFICATION_FEED
CREATE TABLE DEV_OLTP_APPID_DATA.K014_NOTIFICATION_FEED (
	"K014_ID" VARCHAR2(50),
	"SOURCE" VARCHAR2(1000) NOT NULL ENABLE,
	"ERROR_CODE_OR_TEXT" VARCHAR2(1000) NOT NULL ENABLE,
	"IS_VIEWED" NUMBER(1,0) DEFAULT 0, 
	"MESSAGE_VIEWED_BY_USER" VARCHAR2(255),
	"K001_ID" VARCHAR2(50) NOT NULL ENABLE,
	"CREATED_AT" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	"MODIFIED_AT" TIMESTAMP WITH TIME ZONE,
	 PRIMARY KEY ("K014_ID")
);
--///////////////////////////////////////////////////


--///////////////// СОЗДАЛ ТАБЛИЦУ ДЛЯ ХРАНЕНИЯ УЗЛОВ КАТАЛОГА
CREATE TABLE DEV_OLTP_APPID_DATA.K010_DIR_ECT (
	"ROLE_MATERIALIZED_PATH" VARCHAR2(704) NOT NULL ENABLE, 
	"LTS" TIMESTAMP (6) WITH TIME ZONE NOT NULL ENABLE, 
	"CREATED_AT" TIMESTAMP (6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP, 
	PRIMARY KEY ("ROLE_MATERIALIZED_PATH")
);
--////////////////////////////////////////////////////


--///////////////// СОЗДАЛ ТАБЛИЦУ ДЛЯ ХРАНЕНИЯ УЗЛОВ КАТАЛОГА
CREATE TABLE DEV_OLTP_APPID_DATA.K011_ECT (
	"ROLE_MATERIALIZED_PATH" VARCHAR2(704) NOT NULL ENABLE, 
	"LTS" TIMESTAMP (6) NOT NULL ENABLE, 
	"ETS" TIMESTAMP (6), 
	"TITLE" VARCHAR2(128) NOT NULL ENABLE, 
	"VALID" NUMBER(1,0) NOT NULL ENABLE, 
	"IS_DIRECTORY" NUMBER(1,0) NOT NULL ENABLE,
	"CREATED_AT" TIMESTAMP (6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP, 
	"PARENT_ROLE_MATERIALIZED_PATH" VARCHAR2(683) NOT NULL ENABLE, 
	 PRIMARY KEY ("ROLE_MATERIALIZED_PATH", "LTS")
);
--////////////////////////////////////////////////////


--СОЗДАЛ ПОСЛЕДОВАТЕЛЬНОСТЬ для таблицы K007_DOCUMENTS_METADATA
--Это просит Hibernate
CREATE SEQUENCE ID_METADATA_SEQ
START WITH 10
MAXVALUE 999999999999999999999999999
MINVALUE 1
NOCYCLE
CACHE 20
NOORDER;


--СОЗДАЛ ПОСЛЕДОВАТЕЛЬНОСТЬ для таблицы Docs
--Это просит Hibernate
CREATE SEQUENCE ID_DOC_SEQ
START WITH 1
MAXVALUE 999999999999999999999999999
MINVALUE 1
NOCYCLE
CACHE 20
NOORDER;


--СОЗДАЛ ПОСЛЕДОВАТЕЛЬНОСТЬ для таблицы K006_ELECTRONIC_CATALOG_TEMPLATE
--Это просит Hibernate
CREATE SEQUENCE ID_ECT_SEQ
START WITH 40
MAXVALUE 999999999999999999999999999
MINVALUE 1
NOCYCLE
CACHE 20
NOORDER;


--СОЗДАЛ ПОСЛЕДОВАТЕЛЬНОСТЬ для таблицы K008_K008_HEAD_EPC
--Это просит Hibernate
CREATE SEQUENCE ID_EPC_HEAD_SEQ
START WITH 2000
MAXVALUE 999999999999999999999999999
MINVALUE 1
NOCYCLE
CACHE 20
NOORDER;

--СОЗДАЛ ПОСЛЕДОВАТЕЛЬНОСТЬ для таблицы K004_MEMBER_TO_CABINET
--Это просит Hibernate
CREATE SEQUENCE k004_id_seq
START WITH 1000
MAXVALUE 999999999999999999999999999
MINVALUE 1
NOCYCLE
CACHE 20
NOORDER;

--СОЗДАЛ ПОСЛЕДОВАТЕЛЬНОСТЬ для таблицы K012_ECT_CABINET
--Это просит Hibernate
CREATE SEQUENCE ID_ECT_CABINET_SEQ
START WITH 2000
MAXVALUE 999999999999999999999999999
MINVALUE 1
NOCYCLE
CACHE 20
NOORDER;

--СОЗДАЛ ПОСЛЕДОВАТЕЛЬНОСТЬ для таблицы K007_DOCUMENTS_METADATA
--Это просит Hibernate
CREATE SEQUENCE ID_METADATA_SEQ
START WITH 100
MAXVALUE 999999999999999999999999999
MINVALUE 1
NOCYCLE
CACHE 20
NOORDER;

SELECT current_date FROM dual;
SELECT CURRENT_TIMESTAMP  FROM dual;




INSERT INTO ELECTRONIC_CATALOG_TEMPLATE e (e.TITLE, e.TITLE_MATERIALIZED_PATH, e.DEPTH_LEVEL, e.PARENT_TITLE_MATERIALIZED_PATH) 
VALUES('Подписки', '1',1,'1');


INSERT INTO DOCUMENT_FILES d (TITLE_NAME,MATERIALIZED_PATH) values('A', 'A');
INSERT INTO DOCUMENT_FILES d (TITLE_NAME,MATERIALIZED_PATH) values('B', 'A\B');
INSERT INTO DOCUMENT_FILES d (TITLE_NAME,MATERIALIZED_PATH) values('D', 'A\B\D');
INSERT INTO DOCUMENT_FILES d (TITLE_NAME,MATERIALIZED_PATH) values('E', 'A\B\E');
INSERT INTO DOCUMENT_FILES d (TITLE_NAME,MATERIALIZED_PATH) values('C', 'A\C');
INSERT INTO DOCUMENT_FILES d (TITLE_NAME,MATERIALIZED_PATH) values('F', 'A\C\F');
INSERT INTO DOCUMENT_FILES d (TITLE_NAME,MATERIALIZED_PATH) values('H', 'A\C\F\H');
INSERT INTO DOCUMENT_FILES d (TITLE_NAME,MATERIALIZED_PATH) values('K', 'A\C\F\K');
INSERT INTO DOCUMENT_FILES d (TITLE_NAME,MATERIALIZED_PATH) values('G', 'A\C\G');




--getAllСhildren
![CDATA[        
            SELECT *, DENSE_RANK() OVER (ORDER BY (length(path) - length(replace(path, :delimiter, ''))) ASC) AS LEVEL 
            FROM files 
            WHERE path like :parentPath || :delimiter ||'%'
            ]]

            
--выбрать всех детей - Получение всех потомков
SELECT * FROM (
            SELECT DENSE_RANK() OVER (ORDER BY (LENGTH(MATERIALIZED_PATH) - LENGTH (REPLACE(MATERIALIZED_PATH, '\',''))) ASC ) AS LEV , df.ID , df.MATERIALIZED_PATH , df.TITLE_NAME 
FROM DOCUMENT_FILES df WHERE df.MATERIALIZED_PATH LIKE 'A' || '\' || '%'  )
WHERE lev = 2
;


SELECT * FROM (
            SELECT DENSE_RANK() OVER (ORDER BY (LENGTH(TITLE_MATERIALIZED_PATH) - LENGTH (TITLE_MATERIALIZED_PATH)) ASC ) AS LEV , df.ID , df.TITLE_MATERIALIZED_PATH , df.TITLE 
FROM ELECTRONIC_CATALOG_TEMPLATE df WHERE df.TITLE_MATERIALIZED_PATH LIKE '6AaKLW_KSYmSwRFfMCgKNg' || '%'  )
WHERE lev = 1 ;

SELECT DENSE_RANK() OVER (ORDER BY (LENGTH(TITLE_MATERIALIZED_PATH)/22 - LENGTH (TITLE_MATERIALIZED_PATH)/22) ASC ) FROM ELECTRONIC_CATALOG_TEMPLATE;

SELECT * FROM ELECTRONIC_CATALOG_TEMPLATE e WHERE e.PARENT_TITLE_MATERIALIZED_PATH LIKE '6AaKLW_KSYmSwRFfMCgKNg~';

SELECT * FROM ELECTRONIC_CATALOG_TEMPLATE e WHERE DEPTH_LEVEL = 3;




SELECT id, MAX(LENGTH(TITLE_MATERIALIZED_PATH)) 
  FROM ELECTRONIC_CATALOG_TEMPLATE  GROUP BY id;

SELECT * FROM ELECTRONIC_CATALOG_TEMPLATE e ORDER BY e.id ASC ;

SELECT * FROM ELECTRONIC_CATALOG_TEMPLATE e WHERE LENGTH (TITLE_MATERIALIZED_PATH) = 
SELECT 
(LENGTH (TITLE_MATERIALIZED_PATH) / 22) ;

SELECT t1.*
FROM ELECTRONIC_CATALOG_TEMPLATE t1
  LEFT OUTER JOIN ELECTRONIC_CATALOG_TEMPLATE t2
    ON t1.ID  = t2.Id AND LENGTH (t1.TITLE_MATERIALIZED_PATH) < LENGTH (t2.TITLE_MATERIALIZED_PATH)
WHERE t2.Id IS NULL;



--Получение всех родителей - getAllParents
-- Recursive Query
            WITH RECURSIVE cte (MATERIALIZED_PATH, LEV) AS
            (SELECT split_part(MATERIALIZED_PATH, :delimiter, 1), 1 AS LEV
             FROM DOCUMENT_FILES
             WHERE id = :id
             UNION ALL 
             SELECT CONCAT (c.MATERIALIZED_PATH, :delimiter, split_part(f.MATERIALIZED_PATH, :delimiter, LEV+1)), LEV + 1
             FROM cte c,
                  DOCUMENT_FILES f
             WHERE f.id = :id AND f.MATERIALIZED_PATH!=c.MATERIALIZED_PATH)
          -- Result Query  
          SELECT f.*, c.lev
          FROM cte c,
               DOCUMENT_FILES f
          WHERE 
                f.MATERIALIZED_PATH=c.MATERIALIZED_PATH;
               
               
--WITH RECURSIVE cte (MATERIALIZED_PATH, LEV) AS
--            (SELECT split_part(MATERIALIZED_PATH, '\', 1), 1 AS LEV
--             FROM DOCUMENT_FILES
--             WHERE id = 2
--             UNION ALL 
--             SELECT CONCAT (c.MATERIALIZED_PATH, '\', split_part(f.MATERIALIZED_PATH, '\', LEV+1)), LEV + 1
--             FROM cte c,
--                  DOCUMENT_FILES f
--             WHERE f.id = 2 AND f.MATERIALIZED_PATH!=c.MATERIALIZED_PATH)
--          -- Result Query  
--          SELECT f.*, c.lev
--          FROM cte c,
--               DOCUMENT_FILES f
--          WHERE 
--                f.MATERIALIZED_PATH=c.MATERIALIZED_PATH;



INSERT INTO ELECTRONIC_CATALOG_TEMPLATE (TITLE, TITLE_MATERIALIZED_PATH, DEPTH_LEVEL, PARENT_TITLE_MATERIALIZED_PATH) values('INNddmmk', '6AaKLW_KSYmSwRFfMCgKNg', 1, '~');
INSERT INTO ELECTRONIC_CATALOG_TEMPLATE (TITLE, TITLE_MATERIALIZED_PATH, DEPTH_LEVEL, PARENT_TITLE_MATERIALIZED_PATH) values('Описи', '6AaKLW_KSYmSwRFfMCgKNgyqiqmr_MTQegY3YaAwQYTA', 2, '6AaKLW_KSYmSwRFfMCgKNg');
INSERT INTO ELECTRONIC_CATALOG_TEMPLATE (TITLE, TITLE_MATERIALIZED_PATH, DEPTH_LEVEL, PARENT_TITLE_MATERIALIZED_PATH) values('Предпроверка', '6AaKLW_KSYmSwRFfMCgKNgI8d9BQeRSXejqPqPqMRvSg', 2, '6AaKLW_KSYmSwRFfMCgKNg');
INSERT INTO ELECTRONIC_CATALOG_TEMPLATE (TITLE, TITLE_MATERIALIZED_PATH, DEPTH_LEVEL, PARENT_TITLE_MATERIALIZED_PATH) values('ОРД', '6AaKLW_KSYmSwRFfMCgKNgtBlVpgo5TLenq9loadLpSA', 2, '6AaKLW_KSYmSwRFfMCgKNg');
INSERT INTO ELECTRONIC_CATALOG_TEMPLATE (TITLE, TITLE_MATERIALIZED_PATH, DEPTH_LEVEL, PARENT_TITLE_MATERIALIZED_PATH) values('ИЗИО', '6AaKLW_KSYmSwRFfMCgKNg8sSo7rN3QyOKJIS6vYNthw', 2, '6AaKLW_KSYmSwRFfMCgKNg');
INSERT INTO ELECTRONIC_CATALOG_TEMPLATE (TITLE, TITLE_MATERIALIZED_PATH, DEPTH_LEVEL, PARENT_TITLE_MATERIALIZED_PATH) values('Заявки', '6AaKLW_KSYmSwRFfMCgKNgVb1OzVMMREqDCM_TFzk29g', 2, '6AaKLW_KSYmSwRFfMCgKNg');
INSERT INTO ELECTRONIC_CATALOG_TEMPLATE (TITLE, TITLE_MATERIALIZED_PATH, DEPTH_LEVEL, PARENT_TITLE_MATERIALIZED_PATH) values('Материалы', '6AaKLW_KSYmSwRFfMCgKNgddd32EdCQNqUpFdMnl0nTg', 2, '6AaKLW_KSYmSwRFfMCgKNg');
INSERT INTO ELECTRONIC_CATALOG_TEMPLATE (TITLE, TITLE_MATERIALIZED_PATH, DEPTH_LEVEL, PARENT_TITLE_MATERIALIZED_PATH) values('Мониторинг', '6AaKLW_KSYmSwRFfMCgKNgH84QW5ZmRRqogtyu6ZnCWg', 2, '6AaKLW_KSYmSwRFfMCgKNg');
INSERT INTO ELECTRONIC_CATALOG_TEMPLATE (TITLE, TITLE_MATERIALIZED_PATH, DEPTH_LEVEL, PARENT_TITLE_MATERIALIZED_PATH) values('Взаимодействие', '6AaKLW_KSYmSwRFfMCgKNg4r4N36TWQhycuoHKGL1pPA', 2, '6AaKLW_KSYmSwRFfMCgKNg');
INSERT INTO ELECTRONIC_CATALOG_TEMPLATE (TITLE, TITLE_MATERIALIZED_PATH, DEPTH_LEVEL, PARENT_TITLE_MATERIALIZED_PATH) values('УРВ', '6AaKLW_KSYmSwRFfMCgKNglfaOJxFmQIy8dI7OUz6q1A', 2, '6AaKLW_KSYmSwRFfMCgKNg');
INSERT INTO ELECTRONIC_CATALOG_TEMPLATE (TITLE, TITLE_MATERIALIZED_PATH, DEPTH_LEVEL, PARENT_TITLE_MATERIALIZED_PATH) values('Результаты', '6AaKLW_KSYmSwRFfMCgKNghXoEtT77QVm_CbgPFIOyig', 2, '6AaKLW_KSYmSwRFfMCgKNg');
 
INSERT INTO ELECTRONIC_CATALOG_TEMPLATE (TITLE, TITLE_MATERIALIZED_PATH, DEPTH_LEVEL, PARENT_TITLE_MATERIALIZED_PATH) values('Материалы', '6AaKLW_KSYmSwRFfMCgKNgI8d9BQeRSXejqPqPqMRvSgEemRUh7XRf-qQLavFUXUeQ', 3, '6AaKLW_KSYmSwRFfMCgKNgI8d9BQeRSXejqPqPqMRvSg');
INSERT INTO ELECTRONIC_CATALOG_TEMPLATE (TITLE, TITLE_MATERIALIZED_PATH, DEPTH_LEVEL, PARENT_TITLE_MATERIALIZED_PATH) values('Аналитика', '6AaKLW_KSYmSwRFfMCgKNgI8d9BQeRSXejqPqPqMRvSg3mCGrOd7RLW3DuWxCR-YIw', 3, '6AaKLW_KSYmSwRFfMCgKNgI8d9BQeRSXejqPqPqMRvSg');
INSERT INTO ELECTRONIC_CATALOG_TEMPLATE (TITLE, TITLE_MATERIALIZED_PATH, DEPTH_LEVEL, PARENT_TITLE_MATERIALIZED_PATH) values('Иные документы', '6AaKLW_KSYmSwRFfMCgKNgI8d9BQeRSXejqPqPqMRvSghoGrZU6iQU2uiL2LUL52lw', 3, '6AaKLW_KSYmSwRFfMCgKNgI8d9BQeRSXejqPqPqMRvSg~');

SELECT * FROM ELECTRONIC_CATALOG_TEMPLATE s WHERE s.PARENT_TITLE_MATERIALIZED_PATH  LIKE '6AaKLW_KSYmSwRFfMCgKNgI8d9BQeRSXejqPqPqMRvSg~' ;

SELECT *  FROM ELECTRONIC_CATALOG_TEMPLATE e WHERE e.id = 35;

SELECT d.ID , d.MATERIALIZED_PATH , d.TITLE_NAME , d.DEPTH_LEVEL  , DENSE_RANK() OVER (ORDER BY (length(MATERIALIZED_PATH) - length(replace(MATERIALIZED_PATH, '\', ''))) ASC) AS LEV 
             FROM DOCUMENT_FILES d
             WHERE MATERIALIZED_PATH like REPLACE ('A' || '\' ||'%','\\','\\\\');
            
            
SELECT d.ID , d.TITLE_MATERIALIZED_PATH , d.TITLE , d.DEPTH_LEVEL  , DENSE_RANK() OVER (ORDER BY (length(TITLE_MATERIALIZED_PATH)) ASC) AS LEV 
             FROM ELECTRONIC_CATALOG_TEMPLATE d
             WHERE PARENT_TITLE_MATERIALIZED_PATH like ('6AaKLW_KSYmSwRFfMCgKNgI8d9BQeRSXejqPqPqMRvSg~' ||'%');
            
SELECT d.ID , d.TITLE_MATERIALIZED_PATH , d.TITLE , d.DEPTH_LEVEL  , DENSE_RANK() OVER (ORDER BY (length(TITLE_MATERIALIZED_PATH)) ASC) AS LEV 
             FROM ELECTRONIC_CATALOG_TEMPLATE d
             WHERE PARENT_TITLE_MATERIALIZED_PATH like ('6AaKLW_KSYmSwRFfMCgKNgI8d9BQeRSXejqPqPqMRvSg~%');
            

            
            SELECT d.ID , d.TITLE_MATERIALIZED_PATH , d.TITLE , d.DEPTH_LEVEL , d.PARENT_TITLE_MATERIALIZED_PATH 
            , DENSE_RANK() OVER (ORDER BY (length(TITLE_MATERIALIZED_PATH)) ASC) AS LEV 
             FROM K006_ELECTRONIC_CATALOG_TEMPLATE d
             WHERE PARENT_TITLE_MATERIALIZED_PATH like (
            SELECT (concat(e.TITLE_MATERIALIZED_PATH,'~%')) FROM K006_ELECTRONIC_CATALOG_TEMPLATE e WHERE e.ID = 21);
           
           
SELECT d.ID , d.TITLE_MATERIALIZED_PATH , d.TITLE , d.DEPTH_LEVEL , d.PARENT_TITLE_MATERIALIZED_PATH 
--, DENSE_RANK() OVER (ORDER BY (length(TITLE_MATERIALIZED_PATH)) ASC) AS LEV 
FROM K006_ELECTRONIC_CATALOG_TEMPLATE d
WHERE PARENT_TITLE_MATERIALIZED_PATH like (
SELECT e.PARENT_TITLE_MATERIALIZED_PATH FROM K006_ELECTRONIC_CATALOG_TEMPLATE e WHERE e.ID = 32);
           
           
           

           
SELECT (concat(e.TITLE_MATERIALIZED_PATH,'~%')) FROM ELECTRONIC_CATALOG_TEMPLATE e WHERE e.ID = 23;
          
--Теперь, если нам нужно подсчитать все виды в нашей базе данных с одной таблицей, которые относятся к одному типу, мы можем легко сделать это, используя следующий SQL:
SELECT 
count(*)
from k006_ELECTRONIC_CATALOG_TEMPLATE where PARENT_TITLE_MATERIALIZED_PATH like '6AaKLW_KSYmSwRFfMCgKNgI8d9BQeRSXejqPqPqMRvSg~%';

--
SELECT userid, MAX(value) KEEP (DENSE_RANK FIRST ORDER BY date DESC)
  FROM table
  GROUP BY userid


--Функция Oracle INSTR()ищет подстроку в строке и возвращает позицию подстроки в строке.

--Set<String> getSubfolders(long auditId, int folderNameLengthInclusiveEndDelimiter, String loweredFolderNameLikeStr);
SELECT DISTINCT SUBSTR(P362_ARCH_REL_PATH, 1, INSTR(P362_ARCH_REL_PATH, '\', ?2+1)) 
FROM DEV_OLTP_APPID_DATA.P362_INSP_FILES WHERE P360_ID=?1 AND P362_FILE_STS=1 AND LOWER(P362_ARCH_REL_PATH) LIKE ?3

--Set<String> getRootFolders(long auditId);
SELECT DISTINCT SUBSTR(P362_ARCH_REL_PATH, 1, INSTR(P362_ARCH_REL_PATH, '\', 9))
FROM DEV_OLTP_APPID_DATA.P362_INSP_FILES WHERE P360_ID=?1 AND P362_FILE_STS=1



--
SELECT
  INSTR( 'isThis is a playlist', 'is') first_occurrence,
  INSTR( 'isThis is a playlist', 'is', 1, 2 ) second_occurrence,
  INSTR( 'isThis is a playlist', 'is', 1, 3 ) third_occurrence
FROM
  dual;


            
--DENSE_RANK() Введение в функцию Oracle            
SELECT
	col,
	DENSE_RANK () OVER ( 
		ORDER BY col ) 
	col
FROM
	dense_rank_demo;










   

--UPDATE K006_ELECTRONIC_CATALOG_TEMPLATE a SET a.IS_DIRECTORY  = 1 WHERE a.ID = 35;

--UPDATE K001_CABINET_WORK_GROUP k SET k.K001_WORKING_MODE = 0 WHERE k.K001_ID = '0dabd323-4425-4057-8e24-ea70a1f2892b';

SELECT * FROM K001_CABINET_WORK_GROUP k WHERE k.K001_CODE_CAB  = 76;

--Метод перемещения папки в другую папку
UPDATE K006_ELECTRONIC_CATALOG_TEMPLATE e
		SET e.TITLE_MATERIALIZED_PATH = REPLACE(TITLE_MATERIALIZED_PATH, :subNodeParentPath, :parentPath)
		WHERE  e.TITLE_MATERIALIZED_PATH like REPLACE (:subNodeParentPath || :delimiter ||'%','\','\\') OR e.TITLE_MATERIALIZED_PATH  = :subNodeParentPath

--REPLACE		
SELECT REPLACE('Курс по базовому SQL', 'базовому', 'продвинутому') FROM dual; --Курс по продвинутому SQL
SELECT REPLACE('Курс по базовому SQL', 'SQL','') FROM dual; --Курс по продвинутому


SELECT d.ID , d.TITLE , d.TITLE_MATERIALIZED_PATH , d.DEPTH_LEVEL , d.PARENT_TITLE_MATERIALIZED_PATH, d.IS_DIRECTORY
            FROM K006_ELECTRONIC_CATALOG_TEMPLATE d 
            WHERE PARENT_TITLE_MATERIALIZED_PATH like ( 
            SELECT e.PARENT_TITLE_MATERIALIZED_PATH FROM K006_ELECTRONIC_CATALOG_TEMPLATE e WHERE e.ID = 40);
           
SELECT d.ID , d.TITLE , d.TITLE_MATERIALIZED_PATH , d.DEPTH_LEVEL , d.PARENT_TITLE_MATERIALIZED_PATH, d.IS_DIRECTORY, 
DENSE_RANK() OVER (ORDER BY (length(d.TITLE_MATERIALIZED_PATH)) ASC) AS LEV 
 FROM K006_ELECTRONIC_CATALOG_TEMPLATE d 
 WHERE d.PARENT_TITLE_MATERIALIZED_PATH like ( SELECT (concat(e.TITLE_MATERIALIZED_PATH,'~')) 
FROM K006_ELECTRONIC_CATALOG_TEMPLATE e WHERE e.ID = 40);

SELECT (concat(e.TITLE_MATERIALIZED_PATH,'~')) 
FROM K006_ELECTRONIC_CATALOG_TEMPLATE e WHERE e.ID = 40;

SELECT d.ID , d.TITLE , d.TITLE_MATERIALIZED_PATH , d.DEPTH_LEVEL , d.PARENT_TITLE_MATERIALIZED_PATH, d.IS_DIRECTORY, 
DENSE_RANK() OVER (ORDER BY (length(d.TITLE_MATERIALIZED_PATH)) ASC) AS LEV 
 FROM K006_ELECTRONIC_CATALOG_TEMPLATE d 
 WHERE d.PARENT_TITLE_MATERIALIZED_PATH like '6AaKLW_KSYmSwRFfMCgKNgiX9sdGsnQN2vMbprdxLVJw~' ;


SELECT d.ID , d.TITLE , d.TITLE_MATERIALIZED_PATH , d.DEPTH_LEVEL , d.PARENT_TITLE_MATERIALIZED_PATH, d.IS_DIRECTORY 
 FROM K006_ELECTRONIC_CATALOG_TEMPLATE d 
 WHERE d.PARENT_TITLE_MATERIALIZED_PATH = '6AaKLW_KSYmSwRFfMCgKNgiX9sdGsnQN2vMbprdxLVJw~' ;

SELECT d.ID , d.TITLE , d.TITLE_MATERIALIZED_PATH , d.DEPTH_LEVEL , d.PARENT_TITLE_MATERIALIZED_PATH, d.IS_DIRECTORY 
 FROM K006_ELECTRONIC_CATALOG_TEMPLATE d 
 WHERE d.PARENT_TITLE_MATERIALIZED_PATH = '6AaKLW_KSYmSwRFfMCgKNgaa4UJmYyT2unH-B67uxJGw~' ;

--6AaKLW_KSYmSwRFfMCgKNgaa4UJmYyT2unH-B67uxJGw~


--MATERIALIZED-PATH
--получить цепочку всех родителей 
WITH RECURSIVE cte (PATH, LEVEL) AS
            (SELECT split_part(PATH, :delimiter, 1), 1 AS LEVEL
             FROM files
             WHERE id = :id
             UNION ALL 
             SELECT CONCAT (c.path, :delimiter, split_part(f.path, :delimiter, LEVEL+1)), LEVEL + 1
             FROM cte c,
                  files f
             WHERE f.id = :id AND f.path!=c.path)
             
          SELECT f.*, c.level
          FROM cte c,
               files f
          WHERE 
                f.path=c.path 
                AND c.level != 
                (SELECT MAX(level) 
                FROM cte);
               
--Список смежности (Adjacency List)               
--Для получения же всей иерархии родителей с уровнем вложенности 
--потребуется рекурсивный запрос, который представлен ниже.
WITH RECURSIVE r (id, TITLE, parent_id, level) AS
        -- Initial Subquery
        (SELECT tr.id, tr.TITLE , tr.parent_id, 1
        FROM K006_ELECTRONIC_CATALOG_TEMPLATE tl
        LEFT JOIN K006_ELECTRONIC_CATALOG_TEMPLATE tr 
        ON tl.parent_id = tr.id
        WHERE tl.id = 67
        UNION ALL
        -- Recursive Subquery
        SELECT t.id, t.TITLE, t.parent_id, level+1
        FROM K006_ELECTRONIC_CATALOG_TEMPLATE t, r
        WHERE t.id = r.parent_id )
        -- Result Query
        SELECT id, TITLE , parent_id, ROW_NUMBER() OVER (ORDER BY level DESC) AS level
        FROM r;
       
--Для получения иерархических данных используется временное представление, которое описывается оператором WITH.
--После этого из нее выбираются данные простым селектом. В общем виде синтаксис примерно такой:
WITH [recursive] имя_алиаса_запроса [ (список столбцов) ]
AS (запрос) 
основной запрос


WITH RECURSIVE
 Rec (id, pid, title)
 AS (
   SELECT id, pid, title FROM test_table
   UNION ALL
   SELECT Rec.id, Rec.pid, Rec.title
    FROM Rec, test_table
    WHERE Rec.id = test_table.pid
   )
 SELECT * FROM Rec
 WHERE pid is null;


 SELECT d.ID , SUBSTR(d.PARENT_TITLE_MATERIALIZED_PATH, 1, (LENGTH(d.PARENT_TITLE_MATERIALIZED_PATH)-1)), d.PARENT_TITLE_MATERIALIZED_PATH  FROM K006_ELECTRONIC_CATALOG_TEMPLATE d ;
       
--ПОЛУЧЕНИЕ ВСЕЙ ЦЕПОЧКИ ДЕТЕЙ (MATERIALIZED-PATH)
 SELECT d.ID , d.TITLE , d.TITLE_MATERIALIZED_PATH , d.DEPTH_LEVEL , d.PARENT_TITLE_MATERIALIZED_PATH, d.IS_DIRECTORY,
 DENSE_RANK() OVER (ORDER BY (length(d.TITLE_MATERIALIZED_PATH)) ASC) AS LEV
            FROM K006_ELECTRONIC_CATALOG_TEMPLATE d 
            WHERE d.PARENT_TITLE_MATERIALIZED_PATH  LIKE (
           SELECT (CONCAT(e.TITLE_MATERIALIZED_PATH , '%')) FROM K006_ELECTRONIC_CATALOG_TEMPLATE e WHERE e.ID = 40);
      


--получение детей ближайшего уровня
SELECT d.ID , d.TITLE , d.TITLE_MATERIALIZED_PATH , d.DEPTH_LEVEL , d.PARENT_TITLE_MATERIALIZED_PATH, d.IS_DIRECTORY, 
DENSE_RANK() OVER (ORDER BY (length(d.TITLE_MATERIALIZED_PATH)) ASC) AS LEV 
 FROM K006_ELECTRONIC_CATALOG_TEMPLATE d 
 WHERE d.PARENT_TITLE_MATERIALIZED_PATH like ( SELECT (concat(e.TITLE_MATERIALIZED_PATH,'~%')) 
FROM K006_ELECTRONIC_CATALOG_TEMPLATE e WHERE e.ID = 40);



SELECT d.ID , d.TITLE , d.TITLE_MATERIALIZED_PATH , d.DEPTH_LEVEL , d.PARENT_TITLE_MATERIALIZED_PATH, d.IS_DIRECTORY,
 DENSE_RANK() OVER (ORDER BY (length(d.TITLE_MATERIALIZED_PATH)) ASC) AS LEV
            FROM K006_ELECTRONIC_CATALOG_TEMPLATE d 
            WHERE LOWER(d.TITLE)  LIKE LOWER((CONCAT('folder', '%')));
           
                
--Строим полный путь от указанного узла к самому верхнему родителю. (это без испотльзования хедера)
--Выбор полного пути и запись его через разделитель "\"             
SELECT SYS_CONNECT_BY_PATH(title, '\') as Path
FROM K006_ELECTRONIC_CATALOG_TEMPLATE e
WHERE e.K006_ID = 69
START WITH e.PARENT_ID is null
CONNECT BY PRIOR e.K006_ID  = e.PARENT_ID ;
--пример: \INNddmmk\Ведомости\Folder 123\Title Folder 111


--Строим полный путь от указанного узла к самому верхнему родителю. С учетом историчности хедера  !!!
--Выбор полного пути и запись его через разделитель "\" или "/" или "=="            
SELECT SYS_CONNECT_BY_PATH(title, '/') as Path
FROM K006_ELECTRONIC_CATALOG_TEMPLATE e
WHERE e.k006_id = 40 AND e.K008_HEAD_ID = 2061
START WITH e.PARENT_ID is NULL AND e.K008_HEAD_ID = 2061
CONNECT BY PRIOR e.k006_id = e.PARENT_ID AND e.K008_HEAD_ID = 2061;
--пример: \INNddmmk\Ведомости\Folder 123\Title Folder 111

--Или так, используя максимальный айди хедера
SELECT SYS_CONNECT_BY_PATH(title, '/') as Path
FROM K006_ELECTRONIC_CATALOG_TEMPLATE e
WHERE e.k006_id=69 AND e.K008_HEAD_ID = (SELECT max(k.K008_HEAD_ID) FROM K008_HEAD_EPC k )
START WITH e.PARENT_ID is NULL AND e.K008_HEAD_ID = 125
CONNECT BY PRIOR e.k006_id = e.PARENT_ID AND e.K008_HEAD_ID = (SELECT max(k.K008_HEAD_ID) FROM K008_HEAD_EPC k );


--так было бы без учета хедера
SELECT SYS_CONNECT_BY_PATH(title, '/') as Path 
FROM K006_ELECTRONIC_CATALOG_TEMPLATE e 
WHERE e.ID = ?1 
START WITH e.PARENT_ID is null 
CONNECT BY PRIOR e.ID = e.PARENT_ID;


SELECT d.K006_ID , d.TITLE , d.TITLE_MATERIALIZED_PATH , d.DEPTH_LEVEL , d.PARENT_TITLE_MATERIALIZED_PATH, d.IS_DIRECTORY , d.K008_HEAD_ID 
FROM K006_ELECTRONIC_CATALOG_TEMPLATE d 
WHERE PARENT_TITLE_MATERIALIZED_PATH like ( 
SELECT e.PARENT_TITLE_MATERIALIZED_PATH FROM K006_ELECTRONIC_CATALOG_TEMPLATE e WHERE e.K006_ID = 23 AND e.K008_HEAD_ID = 125 ) AND d.K008_HEAD_ID = 125;


INSERT INTO K008_HEAD_EPC k (k.K008_HEAD_ID, k.K008_HEAD_COMM) VALUES (125, 'Дерево из истории за 02.09.2022');
UPDATE K008_HEAD_EPC a SET a.K008_DATE_BEG  = CURRENT_TIMESTAMP  WHERE a.K008_HEAD_ID  = 125;


INSERT INTO K006_ELECTRONIC_CATALOG_TEMPLATE k (k.ID,k.TITLE, k.TITLE_MATERIALIZED_PATH, k.DEPTH_LEVEL, k.PARENT_TITLE_MATERIALIZED_PATH, k.IS_DIRECTORY,
k.PARENT_ID, k.K008_HEAD_ID) VALUES (125, 'Дерево из истории за 02.09.2022');

--удаление директории и её вложенных папок
DELETE FROM Files 
WHERE path like REPLACE (:path || :delimiter ||'%','\','\\') OR path = :PATH;


--перемещение узла 
UPDATE files
		SET PATH = REPLACE(PATH, :subNodeParentPath, :parentPath)
		WHERE  path like REPLACE (:subNodeParentPath || :delimiter ||'%','\','\\') OR path = :subNodeParentPath;
		
		
--получить всех детей
SELECT *, DENSE_RANK() OVER (ORDER BY (length(path) - length(replace(path, :delimiter, ''))) ASC) AS LEVEL
FROM files 
WHERE path like REPLACE (:parentPath || :delimiter ||'%','\','\\');

--получить всех родителей
WITH RECURSIVE cte (PATH, LEVEL) AS
            (SELECT split_part(PATH, :delimiter, 1), 1 AS LEVEL
             FROM files
             WHERE id = :id
             UNION ALL 
             SELECT CONCAT (c.path, :delimiter, split_part(f.path, :delimiter, LEVEL+1)), LEVEL + 1
             FROM cte c,
                  files f
             WHERE f.id = :id AND f.path!=c.path)
             
          SELECT f.*, c.level
          FROM cte c,
               files f
          WHERE 
                f.path=c.path 
                AND c.level != 
                (SELECT MAX(level) 
                FROM cte);

SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE s WHERE s.PARENT_TITLE_MATERIALIZED_PATH LIKE '6AaKLW_KSYmSwRFfMCgKNgI8d9BQeRSXejqPqPqMRvSg~' AND s.K008_HEAD_ID = 125 ;

--Выбрать всех детей на один уровень ниже:
SELECT d.K006_ID , d.TITLE , d.TITLE_MATERIALIZED_PATH , d.DEPTH_LEVEL , d.PARENT_TITLE_MATERIALIZED_PATH, d.IS_DIRECTORY, d.PARENT_ID,
 d.K008_HEAD_ID, DENSE_RANK() OVER (ORDER BY (length(d.TITLE_MATERIALIZED_PATH)) ASC) AS LEV 
 FROM K006_ELECTRONIC_CATALOG_TEMPLATE d 
 WHERE d.PARENT_TITLE_MATERIALIZED_PATH like 
(SELECT (concat(e.TITLE_MATERIALIZED_PATH,'~%')) FROM K006_ELECTRONIC_CATALOG_TEMPLATE e WHERE e.K006_ID = 40  AND e.K008_HEAD_ID = 
(SELECT max(k.K008_HEAD_ID) FROM K006_ELECTRONIC_CATALOG_TEMPLATE k )) AND d.K008_HEAD_ID = (SELECT max(k.K008_HEAD_ID) FROM K006_ELECTRONIC_CATALOG_TEMPLATE k );

--DELETE FROM K008_HEAD_EPC k WHERE k.K008_HEAD_ID =  126;

SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE s WHERE s.PARENT_TITLE_MATERIALIZED_PATH  = '~' AND s.K008_HEAD_ID = (SELECT max(k.K008_HEAD_ID) FROM K006_ELECTRONIC_CATALOG_TEMPLATE k );


SELECT d.K006_ID , d.TITLE , d.TITLE_MATERIALIZED_PATH , d.DEPTH_LEVEL , d.PARENT_TITLE_MATERIALIZED_PATH, d.IS_DIRECTORY, d.PARENT_ID,
 d.K008_HEAD_ID, DENSE_RANK() OVER (ORDER BY (length(d.TITLE_MATERIALIZED_PATH)) ASC) AS LEV 
 FROM K006_ELECTRONIC_CATALOG_TEMPLATE d 
 WHERE d.PARENT_TITLE_MATERIALIZED_PATH like 
(SELECT (concat(e.TITLE_MATERIALIZED_PATH,'~%')) FROM K006_ELECTRONIC_CATALOG_TEMPLATE e WHERE e.K006_ID = 66  AND e.K008_HEAD_ID = 
(SELECT max(k.K008_HEAD_ID) FROM K006_ELECTRONIC_CATALOG_TEMPLATE k )) AND d.K008_HEAD_ID = (SELECT max(k.K008_HEAD_ID) FROM K006_ELECTRONIC_CATALOG_TEMPLATE k );


SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K008_HEAD_ID = 125;



--вставка после select:
--INSERT INTO K006_ELECTRONIC_CATALOG_TEMPLATE
--  SELECT c.i2+b.i1, c.v
--  FROM (SELECT MAX(n) i1 FROM K006_ELECTRONIC_CATALOG_TEMPLATE) b
--     , (SELECT n, v, rownum i2 FROM K006_ELECTRONIC_CATALOG_TEMPLATE WHERE n BETWEEN 700 AND 730) c;

    
--вставка выбранных строк после select:
--UPDATE K008_HEAD_EPC k SET k.K008_DATE_END = CURRENT_TIMESTAMP WHERE k.K008_HEAD_ID = 125;
INSERT INTO K008_HEAD_EPC k (k.K008_HEAD_ID , k.K008_HEAD_COMM, k.K008_DATE_BEG) values( 126 ,concat('Версия структуры ЭПП от ',TO_CHAR(CURRENT_TIMESTAMP, 'YYYY/MM/DD HH24:MI:DD')), CURRENT_TIMESTAMP) ;

--DELETE FROM K008_HEAD_EPC k WHERE k.K008_HEAD_ID = 126;

INSERT INTO K006_ELECTRONIC_CATALOG_TEMPLATE k (k.K006_ID, k.TITLE, k.TITLE_MATERIALIZED_PATH, k.DEPTH_LEVEL, k.PARENT_TITLE_MATERIALIZED_PATH, k.IS_DIRECTORY,
k.PARENT_ID, k.K008_HEAD_ID)
  SELECT p.K006_ID, p.TITLE, p.TITLE_MATERIALIZED_PATH, p.DEPTH_LEVEL, p.PARENT_TITLE_MATERIALIZED_PATH, p.IS_DIRECTORY, p.PARENT_ID, 125 
    FROM K006_ELECTRONIC_CATALOG_TEMPLATE p WHERE  p.K008_HEAD_ID = 123;
   
   
   
   --getAllChildrenNextLevelByNodeId
SELECT d.K006_ID , d.TITLE , d.TITLE_MATERIALIZED_PATH , d.DEPTH_LEVEL , d.PARENT_TITLE_MATERIALIZED_PATH, d.IS_DIRECTORY, d.PARENT_ID , d.K008_HEAD_ID , 
DENSE_RANK() OVER (ORDER BY (length(d.TITLE_MATERIALIZED_PATH)) ASC) AS LEV 
 FROM K006_ELECTRONIC_CATALOG_TEMPLATE d 
 WHERE d.PARENT_TITLE_MATERIALIZED_PATH like 
 ( SELECT (concat(e.TITLE_MATERIALIZED_PATH,'~%')) FROM K006_ELECTRONIC_CATALOG_TEMPLATE e WHERE e.K006_ID = 21  AND e.K008_HEAD_ID = 
(SELECT max(k.K008_HEAD_ID) FROM K006_ELECTRONIC_CATALOG_TEMPLATE k )) AND d.K008_HEAD_ID = (SELECT max(k.K008_HEAD_ID) FROM K006_ELECTRONIC_CATALOG_TEMPLATE k );

SELECT d.K006_ID , d.TITLE , d.TITLE_MATERIALIZED_PATH , d.DEPTH_LEVEL , d.PARENT_TITLE_MATERIALIZED_PATH, d.IS_DIRECTORY, d.PARENT_ID , d.K008_HEAD_ID , 
DENSE_RANK() OVER (ORDER BY (length(d.TITLE_MATERIALIZED_PATH)) ASC) AS LEV 
 FROM K006_ELECTRONIC_CATALOG_TEMPLATE d 
 WHERE d.PARENT_TITLE_MATERIALIZED_PATH like 
 ( SELECT (concat(e.TITLE_MATERIALIZED_PATH,'~%')) FROM K006_ELECTRONIC_CATALOG_TEMPLATE e WHERE e.K006_ID = 21  AND e.K008_HEAD_ID = 125) AND d.K008_HEAD_ID = 125;


SELECT (concat(e.TITLE_MATERIALIZED_PATH,'~%')) FROM K006_ELECTRONIC_CATALOG_TEMPLATE e WHERE e.K006_ID = 21;


SELECT s.K006_ID as templateId, s.TITLE, s.TITLE_MATERIALIZED_PATH , s.DEPTH_LEVEL , s.PARENT_TITLE_MATERIALIZED_PATH, s.IS_DIRECTORY, s.PARENT_ID as parentId, s.K008_HEAD_ID as headerIdK008 
FROM K006_ELECTRONIC_CATALOG_TEMPLATE s WHERE s.PARENT_TITLE_MATERIALIZED_PATH  = '~' AND s.K008_HEAD_ID = 123;


--UPDATE K008_HEAD_EPC a SET a.K008_DATE_END  = timestamp '2022-09-02 12:01:00' WHERE a.K008_HEAD_ID  = 123;

SELECT p.K008_HEAD_ID FROM K008_HEAD_EPC p 
WHERE p.K008_DATE_BEG <= CURRENT_DATE AND (p.K008_DATE_END >=CURRENT_DATE OR p.K008_DATE_END  IS NULL);


   
   

   
  SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE s WHERE s.PARENT_TITLE_MATERIALIZED_PATH  = '~' AND s.K008_HEAD_ID = (SELECT max(k.K008_HEAD_ID) FROM K006_ELECTRONIC_CATALOG_TEMPLATE k );  
 SELECT s.K006_ID , s.TITLE , s.TITLE_MATERIALIZED_PATH , s.DEPTH_LEVEL , s.PARENT_TITLE_MATERIALIZED_PATH, s.IS_DIRECTORY , s.PARENT_ID , s.K008_HEAD_ID  
FROM K006_ELECTRONIC_CATALOG_TEMPLATE s WHERE s.PARENT_TITLE_MATERIALIZED_PATH  = '~' AND s.K008_HEAD_ID = (SELECT max(k.K008_HEAD_ID) FROM K006_ELECTRONIC_CATALOG_TEMPLATE k );
   


Hibernate: drop table if exists employee_tbl CASCADE 
Hibernate: create table employee_tbl (dept_id integer not null, employee_id integer not null, email varchar(255), name varchar(255), phone varchar(255), primary key (dept_id, employee_id));
Hibernate: create table employee_tbl (dept_id integer not null, employee_id integer not null, email varchar(255), name varchar(255), phone varchar(255), primary key (dept_id, employee_id))

Hibernate: insert into employee_tbl (email, name, phone, dept_id, employee_id) values (?, ?, ?, ?, ?)

Hibernate: select employee0_.dept_id as dept_id1_0_0_, employee0_.employee_id as employee2_0_0_, employee0_.email as email3_0_0_, employee0_.name as name4_0_0_, employee0_.phone as phone5_0_0_ from employee_tbl employee0_ where employee0_.dept_id=? and employee0_.employee_id=?


SELECT K001_CODE_CAB  FROM (SELECT *  FROM K001_CABINET_WORK_GROUP order BY K001_CREATED_AT desc)  WHERE rownum = 1;  

SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE p WHERE p.K006_ID = 25 AND p.K008_HEAD_ID = 2014;


--DELETE FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K008_HEAD_ID IN (2061,2062);
--DELETE FROM K008_HEAD_EPC k WHERE k.K008_HEAD_ID  IN (2061,2062);


SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE s WHERE s.PARENT_TITLE_MATERIALIZED_PATH LIKE '6AaKLW_KSYmSwRFfMCgKNgI8d9BQeRSXejqPqPqMRvSg~' AND s.K008_HEAD_ID = 2026;

UPDATE K006_ELECTRONIC_CATALOG_TEMPLATE k 
SET k.PARENT_ID = :parentId   
WHERE k.K006_ID = :templateId AND k.K008_HEAD_ID = :newHeaderId;



--~~~START~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--Вывод в иерархическом виде нашего дерева!              
--Можно добавить отступы для вывода иерархии
--https://habr.com/ru/post/43955/
--Весь кактлог
SELECT e.K006_ID ,lpad('     ', 5*level)||e.K006_TITLE  as Tree
FROM K006_ELECTRONIC_CATALOG_TEMPLATE e
START WITH e.K006_PARENT_ID is null
CONNECT BY PRIOR e.K006_ID = e.K006_PARENT_ID  
ORDER SIBLINGS BY e.K006_TITLE  ;

--Вывод в иерархическом виде нашего дерева! - этот не используется, уже другая таблица
--с учетом хедера
--SELECT e.K006_ID ,lpad('     ', 5*level)||title as Tree, e.K008_HEAD_ID AS heder, e.PARENT_TITLE_MATERIALIZED_PATH , e.TITLE_MATERIALIZED_PATH , e.PARENT_ID , e.DEPTH_LEVEL 
--FROM K006_ELECTRONIC_CATALOG_TEMPLATE e
--START WITH e.PARENT_ID is NULL AND e.K008_HEAD_ID = 2062
--CONNECT BY PRIOR e.K006_ID  = e.PARENT_ID AND e.K008_HEAD_ID = 2062
--ORDER SIBLINGS BY e.TITLE ;



INSERT INTO K001_CABINET_WORK_GROUP p ( 
p.K001_ID , p.P320_CHK_ID, p.K001_CODE_CAB, p.K001_CHK_DATE_BEGIN, p.K001_WORKING_MODE, p.K001_STATUS_CAB, p.K005_ID, p.K001_CREATED_AT,p.K001_COMMENT, p.K001_DESCRIPTION_CAB, p.K001_FOUNDATION_OF_CREATION )  
SELECT 'ccbee0611ed14faa86b574985e8b25e6'  , 2937172  , '120' , 1 , :5 , :6 , :7 , CURRENT_TIMESTAMP, :8 , :9 , :10   FROM dual WHERE NOT EXISTS ( SELECT 1 FROM K001_CABINET_WORK_GROUP kk WHERE kk.P320_CHK_ID = :11  )

SELECT * FROM K015_PLANNED_CABINETS k WHERE k.K015_TEXT_OF_DESCRIPTION = 'фывапр';
SELECT 1 d FROM dual;


--*************************************************************


--////---СТАРТ-------------------------------------------------------------------------------------
--////---ПРИМЕР РАБОТЫ С РЕКУРСИВНЫМИ ВЫЗОВАМИ-----------------------------------------------------
-- оператор WITH позволяет дать блоку подзапроса имя/псевдоним, на которое можно ссылаться в нескольких местах основного SQL-запроса.
WITH rs AS (SELECT 1 d FROM dual) SELECT * FROM rs;

WITH 	rs1 AS (SELECT 1 d FROM dual),
		rs2 AS (SELECT 2 d FROM dual),
		rs3 AS (SELECT 3 d FROM dual)
SELECT * FROM rs1
UNION 
SELECT * FROM rs2
UNION 
SELECT * FROM rs3;


WITH t(n) AS ( --n - ИМЯ СТОЛБЦА 
SELECT 1 FROM dual --ANKOR MEMBER -- Initial Subquery
UNION ALL
SELECT n+1 FROM t WHERE n < 5 --REQURCIVE MEMBER -- Recursive Subquery
)
SELECT * FROM t; -- Result Query


WITH t(n1, n2) AS ( 
SELECT 1, 'A' FROM dual 
UNION ALL
SELECT n1+1, n2||'A' FROM t WHERE n1 < 7 --REQURCIVE MEMBER
)
SELECT * FROM t;



--////---ПРИМЕР РАБОТЫ С РЕКУРСИВНЫМИ ВЫЗОВАМИ-----------------------------------------------------
--////---КОНЕЦ-------------------------------------------------------------------------------------






       --Получаем всех детей со всех уровней
       WITH r (id, parent_id, name, lev) AS
            (SELECT p.K006_ID, p.parent_id, p.TITLE, 1
            FROM K006_ELECTRONIC_CATALOG_TEMPLATE p
            WHERE p.parent_id = 21 AND p.K008_HEAD_ID = 2045
            UNION ALL
            SELECT t.K006_ID , t.parent_id, t.TITLE , tp.lev + 1
            FROM r tp INNER JOIN K006_ELECTRONIC_CATALOG_TEMPLATE t
            ON tp.id = t.parent_id WHERE t.K008_HEAD_ID = 2045)
            SELECT * FROM r;
           
           --получить детей на один уровень ниже 
           SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.PARENT_ID = 21 AND k.K008_HEAD_ID = 2045;
          
          --получить родителя на один уровень выше
          select
    	node0_.K006_ID as id1_0_0_,
	    node0_.TITLE  as name2_0_0_,
	    node0_.parent_id as parent_i3_0_0_,
	    node0_.K008_HEAD_ID AS header_0,
	    node1_.K006_ID as id1_0_1_,
	    node1_.TITLE  as name2_0_1_,
    	node1_.parent_id as parent_i3_0_1_ ,
	    node1_.K008_HEAD_ID AS header_1
		from
	    K006_ELECTRONIC_CATALOG_TEMPLATE node0_ 
		left outer join
	    K006_ELECTRONIC_CATALOG_TEMPLATE node1_ 
        on node0_.parent_id=node1_.K006_ID  AND node0_.K008_HEAD_ID = node1_.K008_HEAD_ID  
		where
	    node0_.K006_ID = 40 AND node0_.K008_HEAD_ID = 2045;
           
           
           --Получаем всех родителей - !!! не доделан !!! - А нужно ли это?!
           WITH r(id, name, parent_id, lev, header) AS
            (SELECT tr.K006_ID , tr.TITLE , tr.parent_id, 1, tr.K008_HEAD_ID 
	    FROM K006_ELECTRONIC_CATALOG_TEMPLATE tl 
	    LEFT JOIN K006_ELECTRONIC_CATALOG_TEMPLATE tr 
            ON tl.parent_id = tr.K006_ID 
	    WHERE tl.K006_ID  = 92 AND tr.K008_HEAD_ID = 2045
            UNION ALL
            SELECT t.K006_ID , t.TITLE , t.parent_id, lev+1, t.K008_HEAD_ID 
            FROM K006_ELECTRONIC_CATALOG_TEMPLATE t, r
            WHERE t.K006_ID  = r.parent_id  AND t.K008_HEAD_ID = 2045)
        SELECT id, name, parent_id, ROW_NUMBER() OVER (ORDER BY lev DESC) AS lev, header FROM r;
--            SELECT id, name, parent_id, lev, header FROM r;

           
           
           --Получаем корень
           WITH r(id, name, parent_id, header) AS
            (SELECT p.K006_ID , p.TITLE , p.PARENT_ID , p.K008_HEAD_ID 
            FROM K006_ELECTRONIC_CATALOG_TEMPLATE p
            WHERE p.K006_ID = 92 AND p.K008_HEAD_ID = 2045
            UNION ALL
            SELECT t.K006_ID ,t.TITLE ,t.PARENT_ID ,t.K008_HEAD_ID 
            FROM K006_ELECTRONIC_CATALOG_TEMPLATE t, r
            WHERE t.K006_ID = r.parent_id AND t.K008_HEAD_ID = 2045)
            SELECT id, name, parent_id, header FROM r WHERE parent_id is NULL;

--*************************************************************

       
--Строим полный путь от указанного узла к самому верхнему родителю. С учетом историчности хедера  !!!
--Выбор полного пути и запись его через разделитель "\" или "/" или "=="            
SELECT SYS_CONNECT_BY_PATH(title, '/') as Path
FROM K006_ELECTRONIC_CATALOG_TEMPLATE e
WHERE e.k006_id = 40 AND e.K008_HEAD_ID = 2045
START WITH e.PARENT_ID is NULL AND e.K008_HEAD_ID = 2045
CONNECT BY PRIOR e.k006_id = e.PARENT_ID AND e.K008_HEAD_ID = 2045;
--пример: \INNddmmk\Ведомости\Folder 123\Title Folder 111

--Или так, используя максимальный айди хедера
SELECT SYS_CONNECT_BY_PATH(title, '/') as Path
FROM K006_ELECTRONIC_CATALOG_TEMPLATE e
WHERE e.k006_id=66 AND e.K008_HEAD_ID = (SELECT max(k.K008_HEAD_ID) FROM K008_HEAD_EPC k )
START WITH e.PARENT_ID is NULL AND e.K008_HEAD_ID = 2045
CONNECT BY PRIOR e.k006_id = e.PARENT_ID AND e.K008_HEAD_ID = (SELECT max(k.K008_HEAD_ID) FROM K008_HEAD_EPC k );



--от определенного узла
SELECT e.ID ,lpad('     ', 5*level)||title as Tree
FROM K006_ELECTRONIC_CATALOG_TEMPLATE e
START WITH e.ID = 40
CONNECT BY PRIOR e.id = e.PARENT_ID 
ORDER SIBLINGS BY e.TITLE ;
--~~~END~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SELECT * FROM P307_OBJ_GIBR p WHERE p.P3077_HEAD_ID = 2391755;

--Вывод в иерархическом виде нашего дерева!              
--Можно добавить отступы для вывода иерархии
--https://habr.com/ru/post/43955/
--Весь каталог

SELECT e.P307_OBJ_ID  ,lpad('     ', 5*level)||P307_FULL_NAME as Tree, e.P3077_HEAD_ID 
FROM P307_OBJ_GIBR e
START WITH e.P307_OBJ_ID_PAR is null
CONNECT BY PRIOR e.P307_OBJ_ID = e.P307_OBJ_ID_PAR 
ORDER SIBLINGS BY e.P307_FULL_NAME  
;

WITH rs AS (
SELECT 1 d FROM dual
)SELECT * FROM rs;


SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE s WHERE s.PARENT_TITLE_MATERIALIZED_PATH LIKE '6AaKLW_KSYmSwRFfMCgKNg~' AND s.K008_HEAD_ID = 125;

SELECT k.K012_ID FROM K012_ECT_CABINET k WHERE k.K001_ID = '9bcdf937-60df-4450-9500-9c642981e4c5';


         




SELECT * FROM K009_NOTIFICATION_OPERATION_TYPE k WHERE k.K009_ID = '2c9e2512835b5e2401835b73c9570000'; 
SELECT *FROM K003_NOTIFICATIONS_AND_CONFIRMATIONS k WHERE k.K003_ID = '2c9e2512835b5e2401835b73c9570000';
SELECT * FROM K003_NOTIFICATIONS_AND_CONFIRMATIONS k JOIN K023_STATES ks on k.K023_ID = ks.K023_ID JOIN P320_COMPOSITE_CHK_NFO p ON k.K001_ID ;
SELECT k.K003_ID , (CASE WHEN p.P320_CHK_SHEDULE_DATE IS NULL THEN '00' ELSE TO_CHAR(p.P320_CHK_SHEDULE_DATE,'mm') END) AS auditMonth  FROM K003_NOTIFICATIONS_AND_CONFIRMATIONS k JOIN K001_CABINET_WORK_GROUP ks on k.K001_ID = ks.K001_ID JOIN P320_COMPOSITE_CHK_NFO p ON ks.P320_CHK_ID = p.P320_CHK_ID WHERE k.K003_ID = '2c9e2512836ab65901836ae0f7720000' ;

 
 INSERT INTO K0060_ELECTRONIC_CATALOG_TEMPLATE k ( 
     k.K006_ID, k.TITLE, k.IS_DIRECTORY, k.PARENT_ID, k.K008_HEAD_ID) 
     SELECT p.K006_ID, p.TITLE, p.IS_DIRECTORY, p.PARENT_ID , 2046 
     FROM K0060_ELECTRONIC_CATALOG_TEMPLATE p WHERE p.K008_HEAD_ID = 2045;
 
 UPDATE K008_HEAD_EPC k SET k.K008_DATE_END  = timestamp '2022-09-23 10:38:54' WHERE k.K008_HEAD_ID = 2021;

--DELETE FROM K008_HEAD_EPC k WHERE k.K008_HEAD_ID IN (2081,2082,2080);
--DELETE FROM K0060_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K008_HEAD_ID IN (2046);


--***************************************************************************



-----/////РАБОТА С ТАБЛИЦЕЙ К007-------------------------------------------------------
-----/////-----СТАРТ-----------------------------------------------------------------------------------           
 CREATE TABLE "DEV_OLTP_APPID_DATA"."K007_CABINET_FILES" 
   (	"K007_ID" NUMBER(12,0) NOT NULL ENABLE, 
	"K007_FILE_NAME" VARCHAR2(255) NOT NULL ENABLE, 
	"K007_DATE_OF_DOWNLOAD" TIMESTAMP (6) WITH TIME ZONE, 
	"K007_DOC_TYPE" VARCHAR2(100) NOT NULL ENABLE, 
	"K007_PATH_NAME" VARCHAR2(704) NOT NULL ENABLE, 
	"K007_FILE_HASH" VARCHAR2(100) NOT NULL ENABLE, 
	"K007_FILE_LENGTH" NUMBER(14,0) NOT NULL ENABLE, 
	"K007_FILE_DATA" BLOB, 
	"K008_HEAD_ID" NUMBER(12,0), 
	"K001_ID" VARCHAR2(50) NOT NULL ENABLE, 
	"K007_CREATED_AT" TIMESTAMP (6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP, 
	"K012_ID" NUMBER(12,0), 
	 CONSTRAINT "K007_PK" PRIMARY KEY ("K007_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_APPID_DT_S"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_APPID_DT_S" 
 LOB ("K007_FILE_DATA") STORE AS SECUREFILE (
  TABLESPACE "TS_APPID_DT_S" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

 --добавление КОЛОНОК в таблицу
ALTER TABLE K007_CABINET_FILES  
ADD K012_ID VARCHAR2(50) ;

--скопировать данные колонки из одной колонки в другую (одна и таже таблица)
UPDATE K007_CABINET_FILES k 
SET k.K007_ID  = TO_CHAR(k.K0070_ID), k.K012_ID = TO_CHAR(k.K0120_ID);


--Для удаления этой зависимость PK:
ALTER TABLE K007_CABINET_FILES 
DROP CONSTRAINT K007_PK;

--Удалите столбец
ALTER TABLE K007_CABINET_FILES DROP COLUMN K0070_ID;


 



SELECT * FROM K007_CABINET_FILES k;
INSERT INTO K007_CABINET_FILES k () VALUES ();




-----/////РАБОТА С ТАБЛИЦЕЙ К007-------------------------------------------------------
-----/////-----КОНЕЦ-----------------------------------------------------------------------------------           



--***************************************************************************
--ПРИМЕР ДЛЯ ИЗМЕНЕНИЯ ПОСЛЕДОВАТЕЛЬНОСТИ: Так была создана последовательность
"K006_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE

CREATE Table Test_alter (
id INTEGER GENERATED ALWAYS AS IDENTITY 
 (START WITH 1 
 INCREMENT BY 2 
 MAXVALUE 100 
 CACHE 10 
 CYCLE),
 name STRING, PRIMARY KEY (id)
);
--ТАК МОЖНО ЕЕ ИЗМЕНИТЬ:
ALTER TABLE Test_alter MODIFY id GENERATED BY DEFAULT AS IDENTITY
(START WITH 1000 
 INCREMENT BY 3 
 MAXVALUE 5000  
 CACHE 1
 CYCLE);

ALTER TABLE K0060_ELECTRONIC_CATALOG_TEMPLATE MODIFY "K006_ID" GENERATED BY DEFAULT AS IDENTITY
(MINVALUE 100
 MAXVALUE 9999999999999999999999999999
 INCREMENT BY 1 
START WITH 100 
 CACHE 20
 CYCLE
 --NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL 
 );
--еще пример
alter table chinook.artist modify artistid generated always as identity (start with 277);
--***************************************************************************



SELECT * FROM PUIR_AUDIT_EMPLOYEES p WHERE p.P320_ID = 2936951 ORDER BY p.K10_LAST_NAME ASC ;

SELECT * FROM PUIR_AUDIT_EMPLOYEES p LEFT JOIN P410_EMPLOYEE pe ON p.P410_EMPL_REC_ID = pe.P410_EMPL_REC_ID WHERE p.P320_ID = 2936951 ORDER BY p.K10_LAST_NAME ASC ;

SELECT p.P320_ID , p.P410_EMPL_REC_ID , p.K10_LAST_NAME , p.K10_FIRST_NAME , p.K10_MIDDLE_NAME , p.K10_DUTY , e.P410_FIO  , e.P410_DEPT_NAME 
FROM PUIR_AUDIT_EMPLOYEES p LEFT JOIN P410_EMPLOYEE e ON p.P410_EMPL_REC_ID = e.P410_EMPL_REC_ID WHERE p.P320_ID = 2936951 ORDER BY p.K10_LAST_NAME ASC ;

SELECT k.K001_CODE_CAB ,k.P320_CHK_ID  FROM K001_CABINET_WORK_GROUP k ;

SELECT * FROM P360_INSP_CHK_NFO p WHERE p.P360_ORG_NAME LIKE '%РЕГИОНАЛЬНАЯ%' AND p.P360_ORG_INN = '1832008660';
SELECT p.P360_WORKGROUP_HEAD , p.P360_WORKGROUP_DEPHEAD , p.P360_WORKGROUP_LST  FROM P360_INSP_CHK_NFO p WHERE p.P360_ORG_NAME LIKE '%РЕГИОНАЛЬНАЯ%' AND p.P360_ORG_INN = '1832008660';
SELECT * FROM P360_INSP_CHK_NFO p WHERE p.P360_ORG_INN = '1832008660';

SELECT * FROM P410_EMPLOYEE p WHERE LOWER(p.P410_F) = 'волобуев';


SELECT 
c.K004_ID AS record_id, 
g.K002_ID as id, 
g.K002_FIO as fio, 
g.K002_JOB_TITLE as job_title, 
c.K004_ADDITIONAL_POWERS as additional_powers, 
g.K002_ROLE as role_of_members, 
c.K004_EXCLUDED_STATUS AS excluded, 
c.K004_DATE_FROM  as date_from, 
c.K004_DATE_TO as date_to, 
c.K004_ACTIVE_STATUS AS active, 
c.K004_LOCK_DATE AS lock_date, 
c.K004_UNLOCK_DATE AS unlock_date, 
c.K004_COMMENT  as notes  
FROM K004_MEMBER_TO_CABINET c JOIN K002_GROUP_MEMBER g on c.K002_ID = g.K002_ID  WHERE 
c.K001_ID = '43b9045e-387c-4850-8333-f8d80a46baed' AND k004_id IN (SELECT max(k004_id) FROM k004_member_to_cabinet GROUP BY k002_id, k001_id);


SELECT 
NVL(c.USER_ID, c.K10_ID) AS memberId
--(CASE WHEN c.USER_ID IS NOT NULL THEN c.USER_ID WHEN c.K10_ID IS NOT NULL THEN c.K10_ID END) AS memberId
FROM K004_MEMBER_TO_CABINET c JOIN K002_GROUP_MEMBER g on c.K002_ID = g.K002_ID  WHERE 
c.K001_ID = '43b9045e-387c-4850-8333-f8d80a46baed' AND k004_id IN (SELECT max(k004_id) FROM k004_member_to_cabinet GROUP BY k002_id, k001_id);


SELECT (CASE WHEN k.K007_FILE_LENGTH IS NOT NULL THEN k.K007_FILE_LENGTH  ELSE 0 END) AS volume FROM K007_CABINET_FILES k WHERE k.K001_ID = '618644d1-9b73-424b-ab4f-085ff08077a7';
--CASE P360_CHK_STATUS
--    WHEN 0 THEN 'Плановые предложения'
--    WHEN 1 THEN 'Отсутствует'
--    WHEN 2 THEN 'Отсрочена'
--    WHEN 3 THEN 'Начата' *
--    WHEN 4 THEN 'Приостановлена'
--    WHEN 5 THEN 'Возобновлена'
--    WHEN 6 THEN 'Завершена' * 
--    WHEN 7 THEN 'Прекращена' *
--    WHEN 8 THEN 'Противодействие'
--	WHEN 98 THEN 'Неизвестно'
--	WHEN 99 THEN 'Предпроверочная' *
--	ELSE '--не понятно--' END

'ed96fdfc-95ff-4866-98d3-d4b28e2f049b'
SELECT * FROM K014_NOTIFICATION_FEED k 


-----/////---СТАРТ------------------------------------------------------------------------------------ 
-----/////РАБОТА С ТАБЛИЦЕЙ К006-------------------------------------------------------

CREATE TABLE "DEV_OLTP_APPID_DATA"."K006_ELECTRONIC_CATALOG_TEMPLATE" 
   (	"K0060_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"TITLE" VARCHAR2(400), 
	"IS_DIRECTORY" NUMBER(1,0), 
	"PARENT_ID" NUMBER(12,0) NULL , 
	"K008_HEAD_ID" NUMBER(12,0), 
	"CREATED_AT" TIMESTAMP (6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP, 
	"MODIFIED_AT" TIMESTAMP (6) WITH TIME ZONE, 
	 PRIMARY KEY ("K006_ID", "K008_HEAD_ID")
   ) TABLESPACE "TS_APPID_DT_S" ;
  
  CREATE INDEX fk_K006_ELECTRONIC_CATALOG_TEMPLATE_tree ON K006_ELECTRONIC_CATALOG_TEMPLATE (parent_id);
 
ALTER TABLE al_tree ADD CONSTRAINT fk_tree_tree
    FOREIGN KEY (parent_id) REFERENCES al_tree (id) ON UPDATE CASCADE ON DELETE CASCADE;
   
   
CREATE TABLE "DEV_OLTP_APPID_DATA"."K006_ELECTRONIC_CATALOG_TEMPLATE" 
   (	
    "K006_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 100 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 100 CACHE 20 NOORDER  CYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"TITLE" VARCHAR2(400), 
	"IS_DIRECTORY" NUMBER(1,0), 
	"PARENT_ID" NUMBER(12,0), 
	"K008_ID" NUMBER(12,0), 
	"CREATED_AT" TIMESTAMP (6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP, 
	"MODIFIED_AT" TIMESTAMP (6) WITH TIME ZONE, 
	"K006_IS_NECESSARY" NUMBER(1,0), 
	 PRIMARY KEY ("K006_ID", "K008_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_APPID_DT_S"  ENABLE, 
	 CONSTRAINT "FK_PARENT_ID_AND_HEADER_ID" FOREIGN KEY ("PARENT_ID", "K008_HEAD_ID")
	  REFERENCES "DEV_OLTP_APPID_DATA"."K0060_ELECTRONIC_CATALOG_TEMPLATE" ("K006_ID", "K008_HEAD_ID") ON DELETE CASCADE ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_APPID_DT_S" ;

 
 
   
--добавление КОЛОНОК в таблицу
ALTER TABLE K006_ELECTRONIC_CATALOG_TEMPLATE  
ADD PARENT_ID VARCHAR2(50) ;


UPDATE K006_ELECTRONIC_CATALOG_TEMPLATE  
SET K006_ID  = TO_CHAR(K0060_ID), PARENT_ID = TO_CHAR(K_PARENT_ID);





 
--Для удаления этой зависимость FK:
ALTER TABLE K006_ELECTRONIC_CATALOG_TEMPLATE 
DROP CONSTRAINT FK_PARENT_ID_AND_HEADER_ID;

--Для удаления PK:
ALTER TABLE K006_ELECTRONIC_CATALOG_TEMPLATE 
DROP CONSTRAINT SYS_C0038560;

ALTER TABLE K006_ELECTRONIC_CATALOG_TEMPLATE
ADD CONSTRAINT pk_id_and_header_id PRIMARY KEY (K006_ID, K008_HEAD_ID);


--Удалите столбец
ALTER TABLE K006_ELECTRONIC_CATALOG_TEMPLATE DROP COLUMN K_PARENT_ID;

 
--ALTER TABLE K0060_ELECTRONIC_CATALOG_TEMPLATE ADD (K006_IS_NECESSARY NUMBER(1,0) DEFAULT 1 NOT NULL);
   
ALTER TABLE K006_ELECTRONIC_CATALOG_TEMPLATE ADD (K006_IS_NECESSARY NUMBER(1,0));

--Пока удалили эту зависимость FK:
ALTER TABLE K006_ELECTRONIC_CATALOG_TEMPLATE 
DROP CONSTRAINT fk_parent_id;
 
--Зависимость создал для удаления вложенных папок (FK) - fk_parent_id_and_header_id:
ALTER TABLE K006_ELECTRONIC_CATALOG_TEMPLATE ADD
CONSTRAINT fk_parent_id_and_header_id FOREIGN KEY (PARENT_ID, K008_HEAD_ID)
REFERENCES K006_ELECTRONIC_CATALOG_TEMPLATE (K006_ID, K008_HEAD_ID) 
ON DELETE CASCADE;



INSERT INTO K0060_ELECTRONIC_CATALOG_TEMPLATE k (k.K006_ID , k.TITLE , k.PARENT_ID , k.K008_HEAD_ID , k.IS_DIRECTORY )
  SELECT c.K006_ID , c.TITLE , c.PARENT_ID , c.K008_HEAD_ID , c.IS_DIRECTORY 
  FROM K006_ELECTRONIC_CATALOG_TEMPLATE c;

 
 
 
--Вывод в иерархическом виде нашего дерева!
--START WITH... CONNECT BY
--В этом запросе с помощью START WITH мы задаём корень (начало) иерархии. 
--С помощью CONNECT BY указываем, каким образом записи в иерархии связываются друг с другом в таблице и какие из них отобрать для результата.
--В CONNECT BY может быть несколько условий, но одно из них должно быть помечено PRIOR, чтобы указать, что именно оно указывает на родительский узел. 
--С помощью ORDER SIBLINGS BY мы сортируем дочерние узлы каждого узла по отдельности (не весь результат!). 
-- хорашая статья по CONNECT BY, PRIOR: https://habr.com/ru/post/43955/ 
--https://urvanov.ru/2017/05/28/%D0%B8%D0%B5%D1%80%D0%B0%D1%80%D1%85%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%B5-%D0%B7%D0%B0%D0%BF%D1%80%D0%BE%D1%81%D1%8B-%D0%B2-oracle/
--с учетом хедера
	SELECT e.K006_ID ,lpad('     ', 5*level)||k006_title as Tree, e.K008_ID AS heder, e.k006_PARENT_ID , e.K006_IS_NECESSARY , e.K006_KEY
	FROM K006_ELECTRONIC_CATALOG_TEMPLATE e
	START WITH e.k006_PARENT_ID is NULL AND e.K008_ID =  'f23870fd-3092-42e4-818f-b9e05d608652' 
	CONNECT BY PRIOR e.K006_ID  = e.k006_PARENT_ID AND e.K008_ID = 'f23870fd-3092-42e4-818f-b9e05d608652' 
	ORDER SIBLINGS BY e.k006_TITLE ;


--псевдостолбец LEVEL от oracle
--Чтобы указать Ораклу, что сортировать надо только в пределах одного уровня иерархии, нам поможет маленькая добавка в виде оператора SIBLINGS
--PRIOR. Это обычный унарный оператор, точно такой же как + или -. “Позвоните родителям” – говорит он, заставляя Оракл обратиться к предыдущей записи
SELECT level,lpad('     ', 5*level)||k006_title as Tree,  e.K006_TITLE, e.K006_ID , e.K006_PARENT_ID  , e.K008_ID , e.K006_IS_NECESSARY 
FROM DEV_OLTP_APPID_DATA.K006_ELECTRONIC_CATALOG_TEMPLATE e
START WITH e.K006_PARENT_ID is NULL 
CONNECT BY PRIOR e.K006_ID = e.K006_PARENT_ID
ORDER SIBLINGS BY e.K006_TITLE ;


--Раньше мы использовали оператор PRIOR, который ссылался к родительской записи. 
--Помимо него есть другой унарный оператор CONNECT_BY_ROOT, который ссылается (ни за что не догадаетесь!) 
--на корневую запись, т.е. на самую первую в выборке.
SELECT  level, lpad('     ', 5*level)||k006_title as Tree, e.K006_TITLE , e.K006_ID , e.K006_PARENT_ID , e.K008_ID ,
 CONNECT_BY_ISLEAF AS IsLeaf,
 PRIOR e.K006_TITLE AS Parent,
 CONNECT_BY_ROOT e.K006_TITLE AS Root,
 SYS_CONNECT_BY_PATH(e.K006_TITLE , '/') AS "Path"
FROM DEV_OLTP_APPID_DATA.K006_ELECTRONIC_CATALOG_TEMPLATE e
CONNECT BY PRIOR e.K006_ID = e.K006_PARENT_ID
START WITH e.K006_PARENT_ID is NULL AND e.K008_ID = 'f23870fd-3092-42e4-818f-b9e05d608652' --добавил хедер чтоб работать с одной историчностью 
ORDER SIBLINGS BY e.K006_TITLE;



--Вывод в иерархическом виде нашего дерева!
--*- НО тут нужно знать id рутового узла -*-- (два шага)

--1) находим его по новейшему хедеру:
SELECT k.K006_ID, k.K008_ID  FROM K006_ELECTRONIC_CATALOG_TEMPLATE k 
WHERE k.K008_ID = (SELECT k.K008_ID FROM K008_HEAD_EPC k WHERE k.K008_DATE_BEG  = (SELECT max(e.K008_DATE_BEG) FROM K008_HEAD_EPC e)) 
AND k.K006_PARENT_ID IS NULL ;

--2)и строим дерево от рутового узла, зная его id
	SELECT e.K006_ID ,lpad('     ', 5*level)||k006_title as Tree, e.K008_ID AS heder, e.k006_PARENT_ID , e.K006_IS_NECESSARY , e.K006_KEY
	FROM K006_ELECTRONIC_CATALOG_TEMPLATE e
	START WITH e.k006_ID = 'cf3e7a26-66ad-4979-9c01-2ff0b98c0893' --5da5a16e-8ca7-4d5b-9695-b998d0dead68
	CONNECT BY PRIOR e.K006_ID  = e.k006_PARENT_ID 
	ORDER SIBLINGS BY e.k006_TITLE ;


 --**- Вывод в иерархическом виде нашего дерева! --с учетом НОВЕЙШЕГО хедера (один шаг)
	SELECT e.K006_ID ,lpad('     ', 5*level)||k006_title as Tree, e.K008_ID AS heder,e.k006_PARENT_ID , e.K006_IS_NECESSARY , e.K006_KEY, e.K027_ID 
	FROM DEV_OLTP_APPID_DATA.K006_ELECTRONIC_CATALOG_TEMPLATE e
	START WITH e.k006_PARENT_ID is NULL AND e.K008_ID = (SELECT k.K008_ID FROM DEV_OLTP_APPID_DATA.K008_HEAD_EPC k WHERE k.K008_DATE_BEG  = (SELECT max(e.K008_DATE_BEG) FROM DEV_OLTP_APPID_DATA.K008_HEAD_EPC e)) 
	CONNECT BY PRIOR e.K006_ID  = e.k006_PARENT_ID AND e.K008_ID = (SELECT k.K008_ID FROM DEV_OLTP_APPID_DATA.K008_HEAD_EPC k WHERE k.K008_DATE_BEG  = (SELECT max(e.K008_DATE_BEG) FROM DEV_OLTP_APPID_DATA.K008_HEAD_EPC e))
	ORDER SIBLINGS BY e.k006_TITLE ;

SELECT s.K006_ID AS id, s.K006_TITLE AS title, s.k006_IS_DIRECTORY AS isDirectory, 
s.k006_PARENT_ID AS parentId, s.K008_ID AS headerId, s.K006_IS_NECESSARY AS isNecessary, s.K006_KEY AS titleKey, s.K027_ID AS indexId 
FROM DEV_OLTP_APPID_DATA.K006_ELECTRONIC_CATALOG_TEMPLATE s WHERE s.K008_ID = 'f23870fd-3092-42e4-818f-b9e05d608652';

SELECT e.K006_ID ,lpad('     ', 5*level)||k006_title as Tree, e.K008_ID AS heder,e.k006_PARENT_ID , e.K006_IS_NECESSARY , e.K006_KEY  
	FROM K006_ELECTRONIC_CATALOG_TEMPLATE e
	START WITH e.k006_PARENT_ID is NULL AND e.K008_ID = 'eaada9d4-1795-4fef-e053-040011ac1fe4'
	CONNECT BY PRIOR e.K006_ID  = e.k006_PARENT_ID AND e.K008_ID = 'eaada9d4-1795-4fef-e053-040011ac1fe4'
	ORDER SIBLINGS BY e.k006_TITLE ;

--вывод всех каталогов из всех хедеров
SELECT e.K006_ID ,lpad('     ', 5*level)||k006_title as Tree, e.K008_ID AS heder,e.k006_PARENT_ID , e.K006_IS_NECESSARY , e.K006_KEY  
	FROM K006_ELECTRONIC_CATALOG_TEMPLATE e
	START WITH e.k006_PARENT_ID is NULL 
	CONNECT BY PRIOR e.K006_ID  = e.k006_PARENT_ID 
	ORDER SIBLINGS BY e.k006_TITLE ;


--вывод всех каталогов из всех кабинетов
SELECT e.K012_ID ,lpad('     ', 5*level)||k012_title as Tree, e.K001_ID AS cabinetId, e.k012_PARENT_ID , e.K012_KEY, e.K006_ID , e.K012_IS_DIRECTORY   
	FROM K012_ECT_CABINET e
	START WITH e.k012_PARENT_ID is NULL 
	CONNECT BY PRIOR e.K012_ID  = e.k012_PARENT_ID 
	ORDER SIBLINGS BY e.k012_TITLE ;

SELECT * FROM K001_CABINET_WORK_GROUP k WHERE k.K001_CODE_CAB  = '157'; --3089f116-9704-4ecc-96d7-9db7f67fe16b
SELECT * FROM K012_ECT_CABINET k WHERE k.K012_ID = '863d5e99-e97b-487f-8a48-a8b89b711a09';

SELECT s.K006_ID AS id, s.K006_TITLE AS title, s.k006_IS_DIRECTORY AS isDirectory, 
s.k006_PARENT_ID AS parentId, s.K008_ID AS headerId, s.K006_IS_NECESSARY AS isNecessary, s.K006_KEY AS titleKey 
FROM K006_ELECTRONIC_CATALOG_TEMPLATE s WHERE s.K008_ID = (SELECT k.K008_ID FROM K008_HEAD_EPC k WHERE k.K008_DATE_BEG = 
(SELECT max(e.K008_DATE_BEG) FROM K008_HEAD_EPC e));

--9d1669d5-861e-413a-af6e-556fff6d5667 - key для папки 123455

--17c02f2c-f031-45fb-a7bf-5efef571e761

--UPDATE K006_ELECTRONIC_CATALOG_TEMPLATE  
--SET K006_KEY  = '0ab2b242-6256-4c44-bbe0-67498a432d33' WHERE K006_TITLE = 'ВНУТРЕНИЕ РЕЗУЛЬТАТЫ 01_01';

--UPDATE K012_ECT_CABINET  
--SET K012_TITLE  = 'Реестры' WHERE K012_KEY  = '9de3e469-abc3-4765-b449-9128434c7edf';

--Вывод в иерархическом виде нашего дерева!
--с учетом новейшего хедера
	SELECT e.K012_ID ,lpad('     ', 5*level)||k012_title as Tree, e.K012_PARENT_ID  , e.K006_ID , e.K001_ID , e.K012_KEY 
	FROM K012_ECT_CABINET e
	START WITH e.k012_PARENT_ID is NULL AND e.K001_ID = '219d3085-e2a0-4ff9-9b6f-1c23a6ad3e09'
	CONNECT BY PRIOR e.K012_ID  = e.k012_PARENT_ID AND e.K001_ID = '219d3085-e2a0-4ff9-9b6f-1c23a6ad3e09'
	ORDER SIBLINGS BY e.k012_TITLE ;

SELECT * FROM K012_ECT_CABINET k WHERE k.K012_TITLE = 'ВНУТРЕНИЕ РЕЗУЛЬТАТЫ 01_01';
SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K006_TITLE = 'Заявки';



--INSERT INTO K006_ELECTRONIC_CATALOG_TEMPLATE k (k.K006_ID, k.K006_TITLE, k.K006_PARENT_ID, k.K006_KEY, k.K006_IS_DIRECTORY ,k.K008_ID, k.K006_CREATED_AT) 
--values('086d3000-793d-4d54-8872-4f5cecaf2f2d', 'Отчеты', 'b97faabc-df04-4480-b118-269470b27bda', 'd8485507-2090-4060-981b-23e177445395',1,'f23870fd-3092-42e4-818f-b9e05d608652', CURRENT_TIMESTAMP);


--Вывод информации в отсортированном по алфавиту виде
	SELECT k.K006_ID , k.K006_TITLE , k.K006_IS_DIRECTORY , k.k006_PARENT_ID , k.K008_ID , k.k006_KEY , k.k006_IS_NECESSARY 
	FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K006_PARENT_ID = '5da5a16e-8ca7-4d5b-9695-b998d0dead68' 
	AND k.K008_ID = 'f23870fd-3092-42e4-818f-b9e05d608652' 
	ORDER BY k.K006_TITLE ;


-- строим дерево от рутового узла, зная его id, до интересуемого нас узла
	SELECT e.K006_ID ,lpad('     ', 5*level)||k006_title as Tree, e.K008_ID AS heder, e.k006_PARENT_ID , e.K006_IS_NECESSARY , e.K006_KEY
	FROM K006_ELECTRONIC_CATALOG_TEMPLATE e
	START WITH e.k006_ID = '5da5a16e-8ca7-4d5b-9695-b998d0dead68'
	CONNECT BY PRIOR e.K006_ID  = e.k006_PARENT_ID 
	ORDER SIBLINGS BY e.k006_TITLE ;


--Строим полный путь от указанного узла к самому верхнему родителю. С учетом историчности хедера  !!!
--Выбор полного пути и запись его через разделитель "\" или "/" или "=="            
	SELECT SYS_CONNECT_BY_PATH(k006_title, '/') as Path
	FROM K006_ELECTRONIC_CATALOG_TEMPLATE e
	WHERE e.k006_id = '63cf461d-0709-495e-a92d-56a04c1aeece'  AND e.K008_ID = 'f23870fd-3092-42e4-818f-b9e05d608652'
	START WITH e.K006_PARENT_ID is NULL AND e.K008_ID = 'f23870fd-3092-42e4-818f-b9e05d608652'
	CONNECT BY PRIOR e.k006_id = e.k006_PARENT_ID AND e.K008_ID = 'f23870fd-3092-42e4-818f-b9e05d608652';
--пример: \INNddmmk\Ведомости\Folder 123\Title Folder 111


--Получить рут директорию по хедеру:
SELECT s.K006_ID AS id, s.K006_TITLE AS title, s.k006_IS_DIRECTORY AS isDirectory, 
s.k006_PARENT_ID AS parentId, s.K008_ID AS headerId , s.K006_IS_NECESSARY AS isNecessary, s.K006_KEY AS titleKey
FROM K006_ELECTRONIC_CATALOG_TEMPLATE s WHERE s.K006_PARENT_ID IS NULL AND 
s.K008_ID = '5e6276d8-bfac-48d6-a6fc-8df7ec023291'; 

--получить все записи согласно headerId:
SELECT s.K006_ID AS id, s.K006_TITLE AS title, s.k006_IS_DIRECTORY AS isDirectory, 
s.k006_PARENT_ID AS parentId, s.K008_ID AS headerId , s.K006_IS_NECESSARY AS isNecessary
FROM K006_ELECTRONIC_CATALOG_TEMPLATE s WHERE s.K008_ID = '78939cf7-e02b-4618-b6c3-fe669afa1691'; 


INSERT INTO K008_HEAD_EPC k (k.K008_ID, k.K008_HEAD_COMM , k.K008_DATE_BEG, k.K008_DATE_END) 
    VALUES (:id, :headComment, :dateBegin, null);

--UPDATE K008_HEAD_EPC k SET k.K008_DATE_END  = CURRENT_TIMESTAMP  WHERE k.K008_ID = :headerId;
   
   SELECT * FROM K003_NOTIFICATIONS_AND_CONFIRMATIONS k JOIN K001_CABINET_WORK_GROUP s ON k.K001_ID = s.K001_ID  WHERE k.K003_ID = '2c9e251283847045018384bb71b60003';
  
   SELECT * FROM    K001_CABINET_WORK_GROUP w JOIN P320_COMPOSITE_CHK_NFO n ON w.P320_CHK_ID = n.P320_CHK_ID WHERE w.K001_ID = '33b6606f-4835-4509-b1e8-f6e80d82fe2c';


--http://citforum.ru/database/oracle/recursive/
--общая запись употребления фразы WITH для построения рекурсивного запроса:
  WITH
numbers ( n ) AS (
   SELECT 1 AS n FROM dual 		  -- исходное множество -- одна строка --опорный запрос
   UNION ALL                      -- символическое «объединение» строк
   SELECT n + 1 AS n              -- рекурсия: добавок к предыдущему результату
   FROM   numbers                 -- предыдущий результат в качестве источника данных
   WHERE  n < 5                   -- если не ограничить, будет бесконечная рекурсия
)
SELECT n FROM numbers             -- основной запрос
;

--Еще один вывод из этого примера: подобно случаю с CONNECT BY, вынесенный рекурсивный подзапрос 
--применим вовсе необязательно только к иерархически организованным данным.
WITH
     anchor1234 ( n ) AS (             -- обычный
         SELECT 1 FROM dual UNION ALL
         SELECT 2 FROM dual UNION ALL
         SELECT 3 FROM dual UNION ALL
         SELECT 4 FROM dual
     )
    , numbers ( n ) AS (                -- рекурсивный
         SELECT n FROM anchor1234
           UNION ALL
        SELECT n + 1 AS n
        FROM   numbers
        WHERE n < 5
     )
   SELECT n FROM numbers
   ;

  
--Рекурсивные запросы с фразой WITH позволяют программисту больше, нежели запросы с CONNECT BY (тоже рекурсивные). 
--Например, они позволяют накапливать изменения, и не испытывают необходимости в функциях LEVEL или SYS_CONNECT_BY_PATH, имея возможность легко их моделировать.
--Пример запроса по маршрутам из Москвы с подсчетом километража:
  WITH stepbystep ( node, way, distance ) AS (
  SELECT node, parent || '-' || node, distance
  FROM   route
  WHERE  parent = 'Москва'
     UNION ALL
  SELECT r.node
       , s.way || '-' || r.node
       , r.distance + s.distance
  FROM route r
       INNER JOIN
       stepbystep s
       ON ( s.node = r.parent )
  )
SELECT way, distance FROM stepbystep;

--Запрос по маршрутам из Выборга аналогичен, но с поправкою на симметрию, вызванной движением по иерархии снизу вверх, а не сверху вниз:
WITH stepbystep ( parent, way, distance ) AS (
  SELECT parent, node || '-' || parent, distance
  FROM   route
  WHERE  node = 'Выборг'
     UNION ALL
  SELECT r.parent
       , s.way || '-' || r.parent
       , r.distance + s.distance
  FROM   route r
         INNER JOIN
         stepbystep s
         ON ( s.parent = r.node )
  )
SELECT way, distance FROM stepbystep;

--Для придания порядка строкам результата в запросах с CONNECT BY используется особая конструкция ORDER BY SIBLINGS. 
--Аналогично в вынесенном рекурсивном запросе используется специальное указание SEARCH. В рамках последнего, в частности, 
--задается вымышленое имя столбца, в котором СУБД автоматически проставит числовые значения, и который включит автоматически в 
--порождаемый набор столбцов, допуская в последующей обработке его использование во фразе ORDER BY для осуществления упорядочения. 
--Пример:

WITH stepbystep ( node, way, distance ) AS (
  SELECT node, parent || '-' || node, distance
  FROM   route
  WHERE  parent = 'Москва'
     UNION ALL
  SELECT r.node
       , s.way || '-' || r.node
       , r.distance + s.distance
  FROM route r
       INNER JOIN
       stepbystep s
       ON ( s.node = r.parent )
  )
  SEARCH DEPTH FIRST BY node DESC SET orderval
SELECT   way, distance, orderval
FROM     stepbystep
ORDER BY orderval DESC;


--Структура по К006 и хедеру
WITH stepbystep ( id, parentid, title, apath ) AS (
  SELECT e.K006_ID , e.K006_PARENT_ID,  e.K006_TITLE ,  (e.K006_TITLE ) 
  FROM   K006_ELECTRONIC_CATALOG_TEMPLATE e
  WHERE  e.k006_parent_id IS NULL AND e.K008_ID = 'f23870fd-3092-42e4-818f-b9e05d608652' 
     UNION ALL
  SELECT r.K006_ID , r.K006_PARENT_ID  , r.K006_TITLE, (s.apath || '--' || r.K006_TITLE) 
  FROM stepbystep s
       INNER JOIN  K006_ELECTRONIC_CATALOG_TEMPLATE r
       ON ( s.id = r.K006_PARENT_ID ) WHERE r.K008_ID = 'f23870fd-3092-42e4-818f-b9e05d608652'   )
  SEARCH DEPTH FIRST BY id DESC SET orderval
SELECT  * FROM  stepbystep ORDER BY orderval ASC ;


 
--Получаем всех детей со всех уровней С УКАЗАНИЕМ ХЕДЕРА
       WITH r ( id, title, parentId, titleKey, isDirectory, isNecessary, headerId, levell, relativePath ) AS
            (SELECT p.K006_ID, p.k006_TITLE, p.K006_PARENT_ID, p.K006_KEY , p.K006_IS_DIRECTORY , p.K006_IS_NECESSARY , p.K008_ID , 1, p.K006_TITLE 
            FROM K006_ELECTRONIC_CATALOG_TEMPLATE p
            WHERE p.k006_parent_id IS NULL AND p.K008_ID = 'f23870fd-3092-42e4-818f-b9e05d608652' 
            UNION ALL
            SELECT t.K006_ID, t.k006_TITLE, t.K006_PARENT_ID, t.K006_KEY, t.K006_IS_DIRECTORY, t.K006_IS_NECESSARY, t.K008_ID, tp.levell + 1, (tp.relativePath || '/' || t.K006_TITLE)
            FROM r tp 
            INNER JOIN K006_ELECTRONIC_CATALOG_TEMPLATE t
            ON tp.id = t.K006_PARENT_ID WHERE t.K008_ID = 'f23870fd-3092-42e4-818f-b9e05d608652' )
            SELECT * FROM r;
           
           
--Получаем все узлы каталога со всех уровней по parent_id = null и НОВЕЙШЕМУ хедеру с проставлением уровня вложенности
        WITH r (id, title, parentId, titleKey, isDirectory, isNecessary, headerId, levell) AS 
            (SELECT p.K006_ID, p.K006_TITLE, p.K006_PARENT_ID, p.K006_KEY, p.K006_IS_DIRECTORY, p.K006_IS_NECESSARY, p.K008_ID,  1 
            FROM K006_ELECTRONIC_CATALOG_TEMPLATE p 
            WHERE p.K006_PARENT_ID IS NULL AND p.K008_ID = (SELECT k.K008_ID FROM K008_HEAD_EPC k WHERE k.K008_DATE_BEG = (SELECT max(e.K008_DATE_BEG) FROM K008_HEAD_EPC e))
            UNION ALL 
            SELECT t.K006_ID, t.K006_TITLE, t.K006_PARENT_ID, t.K006_KEY, t.K006_IS_DIRECTORY, t.K006_IS_NECESSARY, t.K008_ID, tp.levell + 1 
            FROM r tp INNER JOIN K006_ELECTRONIC_CATALOG_TEMPLATE t 
            ON tp.id = t.K006_PARENT_ID WHERE t.K008_ID = (SELECT k.K008_ID FROM K008_HEAD_EPC k WHERE k.K008_DATE_BEG = (SELECT max(e.K008_DATE_BEG) FROM K008_HEAD_EPC e))) 
            SELECT id, title, parentId, titleKey, isDirectory, isNecessary, headerId, levell FROM r;
           
SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE t 
WHERE t.K008_ID = (SELECT k.K008_ID FROM K008_HEAD_EPC k WHERE k.K008_DATE_BEG = (SELECT max(e.K008_DATE_BEG) FROM K008_HEAD_EPC e));


SELECT s.K006_ID AS id, s.K006_TITLE AS title, s.k006_IS_DIRECTORY AS isDirectory, 
s.k006_PARENT_ID AS parentId, s.K008_ID AS headerId, s.K006_IS_NECESSARY AS isNecessary, s.K006_KEY AS titleKey 
FROM K006_ELECTRONIC_CATALOG_TEMPLATE s WHERE s.K008_ID = (SELECT k.K008_ID FROM K008_HEAD_EPC k WHERE k.K008_DATE_BEG = 
(SELECT max(e.K008_DATE_BEG) FROM K008_HEAD_EPC e)) AND s.K006_IS_NECESSARY = 1;



--Получаем всех детей со всех уровней по id root и по НОВЕЙШЕМУ ХЕДЕРУ и по IS_NECESSARY = 1
           WITH r (id, title, parentId, titleKey, isDirectory, isNecessary, headerId, levell) AS 
            (SELECT p.K006_ID, p.K006_TITLE, p.K006_PARENT_ID, p.K006_KEY, p.K006_IS_DIRECTORY, p.K006_IS_NECESSARY, p.K008_ID,  1 
            FROM K006_ELECTRONIC_CATALOG_TEMPLATE p 
            WHERE p.K006_PARENT_ID = 'e1a982c9-0497-4f3b-81c1-36ba622cec35' AND p.K008_ID = (SELECT k.K008_ID FROM K008_HEAD_EPC k WHERE k.K008_DATE_BEG = (SELECT max(e.K008_DATE_BEG) FROM K008_HEAD_EPC e))
            AND p.K006_IS_NECESSARY = 1 
            UNION ALL 
            SELECT t.K006_ID, t.K006_TITLE, t.K006_PARENT_ID, t.K006_KEY, t.K006_IS_DIRECTORY, t.K006_IS_NECESSARY, t.K008_ID, tp.levell + 1 
            FROM r tp INNER JOIN K006_ELECTRONIC_CATALOG_TEMPLATE t 
            ON tp.id = t.K006_PARENT_ID WHERE t.K008_ID = (SELECT k.K008_ID FROM K008_HEAD_EPC k WHERE k.K008_DATE_BEG = (SELECT max(e.K008_DATE_BEG) FROM K008_HEAD_EPC e))
            AND t.K006_IS_NECESSARY = 1) 
            SELECT id, title, parentId, titleKey, isDirectory, isNecessary, headerId, levell FROM r;
           
--получить детей на один уровень ниже 
           SELECT * FROM K0060_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.PARENT_ID = 21 AND k.K008_HEAD_ID = 2041;
--получить детей на один уровень ниже при новейшем хедере
          SELECT * FROM K0060_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.PARENT_ID = 21 AND k.K008_HEAD_ID = (SELECT max(k.K008_HEAD_ID) FROM K0060_ELECTRONIC_CATALOG_TEMPLATE k);
         
         
--достаем обязательные для создания при создании кабинета директории (K006_IS_NECESSARY = 1 - создать обязательно)
-- это root=INNddmmk, Материалы, Коды вопросов
--INNddmmk-
--		  |-Материалы- 
--		              |-Коды вопросов
--


         
--получить всех детей от рут директории  + ОБЯЗАТЕЛЬНЫХ ДЛЯ СОЗДАНИЯ (K006_IS_NECESSARY = 1)
--Получаем всех детей со всех уровней по новейшему хедеру
           WITH r (templateId,  title, parent_id, isDirectory, isNecessary, headerId, levell) AS 
            (SELECT p.K006_ID, p.K006_TITLE, p.K006_PARENT_ID, p.K006_IS_DIRECTORY, p.K006_IS_NECESSARY, p.K008_ID,  1 
            FROM K006_ELECTRONIC_CATALOG_TEMPLATE p 
            WHERE p.K006_PARENT_ID IS NULL AND p.K008_ID = 
            (SELECT k.K008_ID FROM K008_HEAD_EPC k WHERE k.K008_DATE_BEG = (SELECT max(e.K008_DATE_BEG) FROM K008_HEAD_EPC e)) AND p.K006_IS_NECESSARY = 1
            UNION ALL 
            SELECT t.K006_ID, t.K006_TITLE, t.K006_PARENT_ID, t.K006_IS_DIRECTORY, t.K006_IS_NECESSARY, t.K008_ID, tp.levell + 1 
            FROM r tp INNER JOIN K006_ELECTRONIC_CATALOG_TEMPLATE t 
            ON tp.templateId = t.K006_PARENT_ID WHERE t.K008_ID = (SELECT k.K008_ID FROM K008_HEAD_EPC k WHERE k.K008_DATE_BEG = 
            (SELECT max(e.K008_DATE_BEG) FROM K008_HEAD_EPC e)) AND t.K006_IS_NECESSARY = 1) 
            SELECT templateId,  title, parent_id, isDirectory,  isNecessary, headerId, levell FROM r;
          
--получить родителя на один уровень выше
        select
    	node0_.K006_ID as id1_0_0_,
	    node0_.TITLE  as name2_0_0_,
	    node0_.parent_id as parent_i3_0_0_,
	    node0_.K008_HEAD_ID AS header_0,
	    node1_.K006_ID as id1_0_1_,
	    node1_.TITLE  as name2_0_1_,
    	node1_.parent_id as parent_i3_0_1_ ,
	    node1_.K008_HEAD_ID AS header_1
		from
	    K0060_ELECTRONIC_CATALOG_TEMPLATE node0_ 
		left outer join
	    K0060_ELECTRONIC_CATALOG_TEMPLATE node1_ 
        on node0_.parent_id=node1_.K006_ID  AND node0_.K008_HEAD_ID = node1_.K008_HEAD_ID  
		where
	    node0_.K006_ID = 40 AND node0_.K008_HEAD_ID = 2045;
	   
	   
--получить родителя на один уровень выше по новейшему хедеру
          select
    	node0_.K006_ID as id1_0_0_,
	    node0_.TITLE  as name2_0_0_,
	    node0_.parent_id as parent_i3_0_0_,
	    node0_.K008_HEAD_ID AS header_0,
	    node1_.K006_ID as id1_0_1_,
	    node1_.TITLE  as name2_0_1_,
    	node1_.parent_id as parent_i3_0_1_ ,
	    node1_.K008_HEAD_ID AS header_1
		from
	    K0060_ELECTRONIC_CATALOG_TEMPLATE node0_ 
		left outer join
	    K0060_ELECTRONIC_CATALOG_TEMPLATE node1_ 
        on node0_.parent_id=node1_.K006_ID  AND node0_.K008_HEAD_ID = node1_.K008_HEAD_ID  
		where
	    node0_.K006_ID = 40 AND node0_.K008_HEAD_ID = (SELECT max(k.K008_HEAD_ID) FROM K0060_ELECTRONIC_CATALOG_TEMPLATE k);
	   
--получить родителя на один уровень выше по новейшему хедеру
        select
	    node1_.K006_ID as templateId,
	    node1_.TITLE  as title,
    	node1_.IS_DIRECTORY AS isDirectory,
    	node1_.parent_id as parentId,
	    node1_.K008_HEAD_ID AS headerIdK008
		from
	    K0060_ELECTRONIC_CATALOG_TEMPLATE node0_ 
		left outer join
	    K0060_ELECTRONIC_CATALOG_TEMPLATE node1_ 
        on node0_.parent_id = node1_.K006_ID  AND node0_.K008_HEAD_ID = node1_.K008_HEAD_ID  
		where
	    node0_.K006_ID = 30 AND node0_.K008_HEAD_ID = (SELECT max(k.K008_HEAD_ID) FROM K0060_ELECTRONIC_CATALOG_TEMPLATE k);
           
           
--Получаем всех родителей от указанного узла и на самый верх
           WITH r(templateId, title, parentId, isDirectory, levell, header) AS
            (SELECT tr.K006_ID , tr.k006_TITLE , tr.k006_PARENT_ID , tr.k006_IS_DIRECTORY , 1, tr.K008_ID  
	    FROM K006_ELECTRONIC_CATALOG_TEMPLATE tl 
	    LEFT JOIN K006_ELECTRONIC_CATALOG_TEMPLATE tr 
            ON tl.k006_PARENT_ID  = tr.K006_ID  
	    WHERE tl.K006_ID  = '7c8a65e1-d0f2-45cb-871d-612c41c88ea0' AND tr.K008_ID = 'f23870fd-3092-42e4-818f-b9e05d608652' AND tl.K008_ID = 'f23870fd-3092-42e4-818f-b9e05d608652'
            UNION ALL
            SELECT t.K006_ID , t.k006_TITLE , t.k006_PARENT_ID , t.k006_IS_DIRECTORY , levell+1, t.K008_ID 
            FROM K006_ELECTRONIC_CATALOG_TEMPLATE t, r
            WHERE t.K006_ID  = r.parentId  AND t.K008_ID = 'f23870fd-3092-42e4-818f-b9e05d608652')
        SELECT templateId, title, parentId, isDirectory, ROW_NUMBER() OVER (ORDER BY levell DESC) AS levell, header FROM r;
       
       
--******ПОИСК ПО КАТАЛОГУ УЗЛА С УКЗАНЫМ ИМЕНЕМ:
--Получаем всех родителей от указанного узла (ПО НАЗВАНИЮ УЗЛА) и на самый верх (ЭТО ИСПОЛЬЗУЕМ ДЛЯ ПОИСКА НУЖНОГО УЗЛА)
--1) СНАЧАЛА НАХОДИМ УЗЛЫ В ДЕРЕВЕ ПО ИХ ИМЕНИ:
       
    --вариант а) - можно получить данные с относительным путем вложенности папок
	SELECT k.K006_ID , k.K006_TITLE , k.K006_PARENT_ID , k.K006_KEY , k.K008_ID , k.K006_IS_NECESSARY , k.K006_IS_DIRECTORY,
	SYS_CONNECT_BY_PATH(K006_TITLE, '/') as relativePath 
	FROM K006_ELECTRONIC_CATALOG_TEMPLATE k 
	WHERE LOWER(k.K006_TITLE) LIKE LOWER('%тест%') 
	START WITH k.K006_PARENT_ID is NULL  
	AND k.K008_ID = 'f23870fd-3092-42e4-818f-b9e05d608652'
    CONNECT BY PRIOR k.K006_ID = k.K006_PARENT_ID;
   
   --вариант б) - можно получить данные БЕЗ относительного пути вложенности папок, а потом другим запросом получить этот путь для каждого узла
   SELECT k.K006_ID , k.K006_TITLE , k.K006_PARENT_ID , k.K006_KEY , k.K008_ID , k.K006_IS_NECESSARY , k.K006_IS_DIRECTORY
	FROM K006_ELECTRONIC_CATALOG_TEMPLATE k 
	WHERE LOWER(k.K006_TITLE) LIKE LOWER('%заяв%')
	AND k.K008_ID = 'f23870fd-3092-42e4-818f-b9e05d608652';

   --для понятного вида где лежит эта директория собираем для нее путь
       SELECT SYS_CONNECT_BY_PATH(K006_TITLE, '/') as Path 
       FROM K006_ELECTRONIC_CATALOG_TEMPLATE e 
       WHERE e.K006_ID = '63cf461d-0709-495e-a92d-56a04c1aeece'  
       START WITH e.K006_PARENT_ID is NULL  
       CONNECT BY PRIOR e.K006_ID = e.K006_PARENT_ID;
	
      
--2) т.к. их несколько, то смотрим что отдает первый найденныйузел и при следующих кликах последующие
          
       WITH r(id, title, parentId, titleKey, isDirectory, isNecessary, levell, header) AS 
            (SELECT tr.K006_ID , tr.K006_TITLE , tr.K006_PARENT_ID , tr.K006_KEY , tr.K006_IS_DIRECTORY , tr.K006_IS_NECESSARY , 1, tr.K008_ID 
      FROM K006_ELECTRONIC_CATALOG_TEMPLATE tl 
      LEFT JOIN K006_ELECTRONIC_CATALOG_TEMPLATE tr 
            ON tl.K006_PARENT_ID  = tr.K006_ID 
      WHERE tl.K006_ID  = '63cf461d-0709-495e-a92d-56a04c1aeece' 
            UNION ALL 
            SELECT t.K006_ID , t.K006_TITLE , t.K006_PARENT_ID , t.K006_KEY , t.K006_IS_DIRECTORY , t.K006_IS_NECESSARY , levell+1, t.K008_ID 
            FROM K006_ELECTRONIC_CATALOG_TEMPLATE t, r 
            WHERE t.K006_ID  = r.parentId ) 
        SELECT id, title, parentId, titleKey, isDirectory, isNecessary, ROW_NUMBER() OVER (ORDER BY levell DESC) AS levell, header FROM r;
       
       
--3) получаем всех детей для первого в списке узла (это будут дети у рута)
     SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K006_PARENT_ID = '5da5a16e-8ca7-4d5b-9695-b998d0dead68' ORDER BY k.K006_TITLE ASC ;
      
--4) проходимся по всем остальным найденным узлам опускаясь на уровень найденного по поиску узла
      SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K006_PARENT_ID = '71bbef1a-8395-468d-882f-6f6e14c1f9fb' ORDER BY k.K006_TITLE ASC ;
      SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K006_PARENT_ID = 'b97faabc-df04-4480-b118-269470b27bda' ORDER BY k.K006_TITLE ASC ;
     
--5) с помощью java собираем объект из полученного списка
     
     
      
      
            

--Получаем всех родителей и ИСКОМЫЙ узел от указанного узла и на самый верх с учетом уникальности каждой строчки
        WITH r (id, title, parentId, isDirectory, levell, header) AS
            --(SELECT tr.K006_ID , tr.k006_TITLE , tr.k006_PARENT_ID , tr.k006_IS_DIRECTORY , 1, tr.K008_ID  --1 все родители вверх без искомого узла
            (SELECT tl.K006_ID , tl.k006_TITLE , tl.k006_PARENT_ID , tl.k006_IS_DIRECTORY , 1, tl.K008_ID --2 все родители вверх с искомым узлом
	    FROM K006_ELECTRONIC_CATALOG_TEMPLATE tl 
	    LEFT JOIN K006_ELECTRONIC_CATALOG_TEMPLATE tr 
            ON tl.k006_PARENT_ID  = tr.K006_ID  
	    WHERE tl.K006_ID  = '7e9add59-df1b-43d1-9f1e-cb40e3900cff' --ID искомого узла
            UNION ALL
            SELECT t.K006_ID , t.k006_TITLE , t.k006_PARENT_ID , t.k006_IS_DIRECTORY , levell+1, t.K008_ID 
        FROM K006_ELECTRONIC_CATALOG_TEMPLATE t, r
            WHERE t.K006_ID  = r.parentId  )
        SELECT id, title, parentId, isDirectory, ROW_NUMBER() OVER (ORDER BY levell DESC) AS levell, header FROM r;
          
	   
       
--Получаем всех детей со всех уровней С УКАЗАНИЕМ ХЕДЕРА
       WITH r (id, title, parentId, titleKey, isDirectory, isNecessary, headerId, levell) AS
            (SELECT p.K006_ID, p.k006_TITLE, p.K006_PARENT_ID, p.K006_KEY , p.K006_IS_DIRECTORY , p.K006_IS_NECESSARY , p.K008_ID , 1
            FROM K006_ELECTRONIC_CATALOG_TEMPLATE p
            WHERE p.k006_parent_id IS NULL AND p.K008_ID = 'f23870fd-3092-42e4-818f-b9e05d608652'
            UNION ALL
            SELECT t.K006_ID, t.k006_TITLE, t.K006_PARENT_ID, t.K006_KEY, t.K006_IS_DIRECTORY, t.K006_IS_NECESSARY, t.K008_ID, tp.levell + 1
            FROM r tp INNER JOIN K006_ELECTRONIC_CATALOG_TEMPLATE t
            ON tp.id = t.K006_PARENT_ID WHERE t.K008_ID = 'f23870fd-3092-42e4-818f-b9e05d608652')
            SELECT * FROM r;
       

       
--Получаем корень - т.е. самый верхний узел дерева:
           WITH r(id, name, parent_id, is_directory, header) AS
            (SELECT p.K006_ID , p.K006_TITLE , p.K006_PARENT_ID , p.K006_IS_DIRECTORY, p.K008_ID 
        FROM K006_ELECTRONIC_CATALOG_TEMPLATE p
            WHERE p.K006_ID = '0a3c083a-d9b1-4aa9-8f58-17752168daa9' AND p.K008_ID = 'f23870fd-3092-42e4-818f-b9e05d608652'
            UNION ALL
            SELECT t.K006_ID ,t.K006_TITLE ,t.K006_PARENT_ID , t.K006_IS_DIRECTORY, t.K008_ID  
        FROM K006_ELECTRONIC_CATALOG_TEMPLATE t, r
            WHERE t.K006_ID = r.parent_id AND t.K008_ID = 'f23870fd-3092-42e4-818f-b9e05d608652')
            SELECT id, name, parent_id, is_directory, header FROM r WHERE parent_id is NULL;
           
--Получаем корень (еще такой способ)
        SELECT k.K006_ID , k.K006_TITLE , k.K006_IS_DIRECTORY , k.k006_PARENT_ID , k.K008_ID  FROM K006_ELECTRONIC_CATALOG_TEMPLATE k
        WHERE k.K008_ID = 'f23870fd-3092-42e4-818f-b9e05d608652' AND k.k006_PARENT_ID IS NULL ;
          

           SELECT k.K006_ID , k.TITLE , k.IS_DIRECTORY , k.PARENT_ID , k.K008_HEAD_ID  FROM K0060_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.PARENT_ID IS NULL 
          AND k.K008_HEAD_ID = (SELECT max(e.K008_HEAD_ID) FROM K0060_ELECTRONIC_CATALOG_TEMPLATE e);
          
--перемещения узла - требуется всего лишь обновить parent_id перемещаемого узла.
          UPDATE K0060_ELECTRONIC_CATALOG_TEMPLATE
			SET PARENT_ID = 23
			WHERE K006_ID = 33 AND K008_HEAD_ID = 2045;
		
		
		--удаление узла идет с удалением всех вложенных папок, т.к. стоит CONSTRAINT fk_parent_id_and_header_id FOREIGN KEY (PARENT_ID, K008_HEAD_ID)
--		DELETE FROM K006_ELECTRONIC_CATALOG_TEMPLATE WHERE K006_ID = 5 AND K008_HEAD_ID = 2045;
	
	
--	DELETE FROM K006_ELECTRONIC_CATALOG_TEMPLATE WHERE K006_ID = 4 AND K008_HEAD_ID = 2045;
	
	
--вставим новые директории
	INSERT INTO K0060_ELECTRONIC_CATALOG_TEMPLATE k (k.TITLE, k.IS_DIRECTORY, k.PARENT_ID, k.K008_HEAD_ID) 
	VALUES ('Тестовая папка 1-2', 1 ,5 ,2045);


--Находим новейший каталог
	SELECT s.K006_ID, s.TITLE, s.IS_DIRECTORY, s.PARENT_ID, s.K008_HEAD_ID
	FROM K0060_ELECTRONIC_CATALOG_TEMPLATE s WHERE s.PARENT_ID IS NULL AND 
	s.K008_HEAD_ID = (SELECT max(k.K008_HEAD_ID) FROM K0060_ELECTRONIC_CATALOG_TEMPLATE k);

--получаем каталог по id и headerId
	SELECT s.K006_ID as templateId, s.TITLE AS title, s.IS_DIRECTORY AS isDirectory, s.PARENT_ID AS parentId, s.K008_HEAD_ID as headerIdK008 
	FROM K006_ELECTRONIC_CATALOG_TEMPLATE s WHERE s.K006_ID = ? AND s.K008_ID = ?;


SELECT s.K006_ID AS templateId, s.K006_TITLE AS title, s.K006_IS_DIRECTORY AS isDirectory, 
s.K006_PARENT_ID AS parentId, s.K008_ID AS headerIdK008 
FROM K006_ELECTRONIC_CATALOG_TEMPLATE s WHERE s.K006_PARENT_ID IS NULL AND 
s.K008_ID = (SELECT k.K008_ID FROM K008_HEAD_EPC k WHERE k.K008_DATE_BEG = (SELECT max(e.K008_DATE_BEG) FROM K008_HEAD_EPC e));

SELECT s.K006_ID AS templateId, s.K006_TITLE AS title, s.k006_IS_DIRECTORY AS isDirectory, 
s.k006_PARENT_ID AS parentId, s.K008_ID AS headerIdK008 
FROM K006_ELECTRONIC_CATALOG_TEMPLATE s WHERE s.K006_PARENT_ID IS NULL AND 
s.K008_ID = 'eaada9d4-1799-4fef-e053-040011ac1fe4';

SELECT s.K006_ID AS templateId, s.K006_TITLE AS title, s.k006_IS_DIRECTORY AS isDirectory, 
s.k006_PARENT_ID AS parentId, s.K008_ID AS headerIdK008 
FROM K006_ELECTRONIC_CATALOG_TEMPLATE s WHERE s.K008_ID = 'eaada9d4-1799-4fef-e053-040011ac1fe4';
           



--Создать таблицу из существующей с некоторым наполнением 
 CREATE TABLE K0006_TEST 
 AS
   SELECT k.K006_ID , k.K006_PARENT_ID , k.K006_TITLE , k.K008_ID , k.K006_IS_DIRECTORY  , k.K006_CREATED_AT  
   FROM K006_ELECTRONIC_CATALOG_TEMPLATE k 
  WHERE k.K008_ID IN ('5e6276d8-bfac-48d6-a6fc-8df7ec023291', '387c9e10-414b-46c9-b02c-5114455294c9', '41f12e48-3764-4b48-8ca5-22fcbb3c6832');
  
 UPDATE K0006_TEST k SET k.K006_KEY = '11' WHERE k.K006_TITLE = 'Ведомости';

 
  CREATE TABLE tab2(fld2_1, fld2_2, fld2_3)
	AS
	SELECT fld1_1, fld1_2, fld1_3
	FROM tab1
	WHERE ...


  CREATE TABLE NEW_TABLE_NAME AS
   SELECT [ column1, column2...columnN ]
   FROM EXISTING_TABLE_NAME
   [ WHERE ]
   


--Вывод в иерархическом виде нашего дерева!
-- НО тут нужно знать id рутового узла
	SELECT e.K006_ID ,lpad('     ', 5*level)||k006_title as Tree, e.K008_ID AS heder, e.k006_PARENT_ID  , e.K006_KEY 
	FROM DEV_OLTP_APPID_DATA.K006_ELECTRONIC_CATALOG_TEMPLATE e
	START WITH e.k006_ID = '5da5a16e-8ca7-4d5b-9695-b998d0dead68'
	CONNECT BY PRIOR e.K006_ID  = e.k006_PARENT_ID 
	ORDER SIBLINGS BY e.k006_TITLE ;

-- ЗДЕСЬ можно не знать id рутового узла, т.к. мы ориентируемся на запись с k006_PARENT_ID = NULL
	SELECT e.K006_ID ,lpad('     ', 5*level)||k006_title as Tree, e.K008_ID AS heder, e.k006_PARENT_ID  , e.K006_KEY , e.K006_IS_NECESSARY 
	FROM DEV_OLTP_APPID_DATA.K006_ELECTRONIC_CATALOG_TEMPLATE e
	START WITH e.k006_PARENT_ID IS null
	CONNECT BY PRIOR e.K006_ID  = e.k006_PARENT_ID 
	ORDER SIBLINGS BY e.k006_TITLE ;


--это участок относится к таблице К012
SELECT e.K012_ID ,lpad('     ', 5*level)||k012_title as Tree, e.K001_ID AS cabinet_id, e.k012_PARENT_ID  , e.K012_KEY 
	FROM K012_ECT_CABINET e
	START WITH e.k012_ID = 'eaada9d4-2c5e-4fef-e053-040011ac1fe4'
	CONNECT BY PRIOR e.K012_ID  = e.k012_PARENT_ID 
	ORDER SIBLINGS BY e.k012_TITLE ;

--UPDATE  K006_ELECTRONIC_CATALOG_TEMPLATE k SET k.K006_KEY = 'c8506c07-4967-489b-959f-9b03afc949cf' WHERE k.K006_TITLE = 'УРВ 02';

--UPDATE  K012_ECT_CABINET k SET k.K012_KEY = 'c8506c07-4967-489b-959f-9b03afc949cf' WHERE k.K012_TITLE = 'УРВ 02';

SELECT * FROM K001_CABINET_WORK_GROUP k WHERE k.K001_CODE_CAB = '148';

SELECT * FROM K012_ECT_CABINET k WHERE k.K001_ID = 'ed96fdfc-95ff-4866-98d3-d4b28e2f049b';

--DELETE FROM K008_HEAD_EPC k WHERE k.K008_ID in
--(
--'eaada9d4-175f-4fef-e053-040011ac1fe4',
--'eaada9d4-1783-4fef-e053-040011ac1fe4',
--'eaada9d4-1784-4fef-e053-040011ac1fe4',
--'eaada9d4-1785-4fef-e053-040011ac1fe4'
--);

--DELETE FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K008_ID IN 
--(
--'eaada9d4-175f-4fef-e053-040011ac1fe4',
--'eaada9d4-1783-4fef-e053-040011ac1fe4',
--'eaada9d4-1784-4fef-e053-040011ac1fe4',
--'eaada9d4-1785-4fef-e053-040011ac1fe4'
--);





SELECT k1.K006_ID || ' -> ' || k2.K006_ID , K1 .K008_ID AS k008_id_1, k2.K008_ID AS k008_id_2, k1.K006_KEY 
FROM K0006_TEST k1  
JOIN K0006_TEST k2 ON k1.K006_KEY= k2.K006_KEY 
WHERE k1.K006_ID = 'e27923fb-90cb-45ea-99a7-44f3016fec2d';
--AND k2.K008_ID = '5e6276d8-bfac-48d6-a6fc-8df7ec023291';

   

--DELETE FROM K003_NOTIFICATIONS_AND_CONFIRMATIONS k WHERE k.K003_ID = '2c9e251283fa1e0a0183fa4672330003';

-----/////РАБОТА С ТАБЛИЦЕЙ К006-------------------------------------------------------
-----/////-----КОНЕЦ-----------------------------------------------------------------------------------





SELECT (CASE WHEN P320_CHK_SHEDULE_DATE IS NULL THEN '00' ELSE TO_CHAR(P320_CHK_SHEDULE_DATE,'mm') END) AS monthh FROM P320_COMPOSITE_CHK_NFO pccn ;
SELECT (CASE WHEN P320_CHK_SHEDULE_DATE IS NULL THEN '00' ELSE TO_CHAR(P320_CHK_SHEDULE_DATE,'mm.yyyy') END) AS monthh FROM P320_COMPOSITE_CHK_NFO pccn ;


SELECT * FROM K001_CABINET_WORK_GROUP k WHERE k.K001_CODE_CAB = '101';
SELECT * FROM K001_CABINET_WORK_GROUP k WHERE k.K001_CODE_CAB = '137';

SELECT * FROM P320_COMPOSITE_CHK_NFO p WHERE p.P320_CHK_ID = 2937184;
SELECT * FROM P320_COMPOSITE_CHK_NFO p WHERE p.P320_CHK_ID = 26925319;

--//////====РАБОТА С ТАБЛИЦЕЙ K012====СТАРТ===========================================================
--//////====РАБОТА С ТАБЛИЦЕЙ K012====================================================================
CREATE TABLE "DEV_OLTP_APPID_DATA"."K012_ECT_CABINET" 
   (	
    "K012_ID" NUMBER(12,0) NOT NULL ENABLE, 
	"K001_ID" VARCHAR2(50) NOT NULL ENABLE, 
	"K012_TITLE" VARCHAR2(400), 
	"K012_IS_DIRECTORY" NUMBER(1,0), 
	"K012_PARENT_ID" NUMBER(12,0), 
	"K012_CREATED_AT" TIMESTAMP (6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP, 
	"K012_MODIFIED_AT" TIMESTAMP (6) WITH TIME ZONE, 
	 PRIMARY KEY ("K012_ID", "K001_ID")
	 ) TABLESPACE "TS_APPID_DT_S" ;
	

ALTER TABLE DEV_OLTP_APPID_DATA.K012_ECT_CABINET
ADD CONSTRAINT K012_ECT_CABINET_PK PRIMARY KEY (K012_ID,K001_ID)
ENABLE;

ALTER TABLE DEV_OLTP_APPID_DATA.K0120_ECT_CABINET
ADD CONSTRAINT K0120_ECT_CABINET_PK PRIMARY KEY (K012_ID,K001_ID)
ENABLE;

ALTER TABLE "DEV_OLTP_APPID_DATA"."K012_ECT_CABINET"
ADD CONSTRAINT "FK_PARENT_ID_AND_CABINET_ID" FOREIGN KEY ("K012_PARENT_ID", "K001_ID")
	  REFERENCES "DEV_OLTP_APPID_DATA"."K0120_ECT_CABINET" ("K012_ID", "K001_ID") ON DELETE CASCADE ENABLE;	
	 
	
	 
--Для удаления этой зависимость FK:
ALTER TABLE K012_ECT_CABINET 
DROP CONSTRAINT fk_parent_id_and_cabinet_id;

ALTER TABLE K012_ECT_CABINET 
DROP CONSTRAINT SYS_C0038448;

--добавление КОЛОНОК в таблицу
ALTER TABLE K012_ECT_CABINET  
ADD K012_PARENT_ID VARCHAR2(50) ;

--UPDATE K012_ECT_CABINET 
--			SET PARENT_ID = 23
--			WHERE K006_ID = 33 AND K001_ID = 'ae7d50ed-7566-44f5-b658-49b1205dac81';
--		
--
--UPDATE 
SELECT count(*) FROM K012_ECT_CABINET k;  

UPDATE K012_ECT_CABINET k 
SET k.K012_ID  = TO_CHAR(k.K012_ID), k.K012_PARENT_ID = TO_CHAR(k.K012_PARENT_ID);


--скопировать данные колонки из одной колонки в другую (одна и таже таблица)
UPDATE table_name 
SET column1 = column2
--скопировать данные колонки из одной колонки в другую (разные таблицы)
UPDATE table_name1 
    SET column1 = (
        SELECT column2
        FROM table_name2
        WHERE table_name1.id = table_name2.id
    );

ALTER TABLE K012_ECT_CABINET DROP COLUMN k012_parent_id;


ALTER TABLE DEV_OLTP_APPID_DATA.K0120_ECT_CABINET
ADD CONSTRAINT K0120_ECT_CABINET_PK PRIMARY KEY (K012_ID,K001_ID)
ENABLE;

   
--Удалите столбец
ALTER TABLE table_name DROP COLUMN column_name
--Удалите несколько столбцов
ALTER TABLE table_name DROP (column_1,column_2,...)
 
--Создал Зависимость для удаления вложенных папок (FK) каскадом:
ALTER TABLE K012_ECT_CABINET ADD
CONSTRAINT fk_parent_id_and_cabinet_id FOREIGN KEY (K012_PARENT_ID, K001_ID)
REFERENCES K012_ECT_CABINET (K012_ID, K001_ID) 
ON DELETE CASCADE;


--нужно добавить констраинт для удаления каскадом как и в K006
ALTER TABLE "DEV_OLTP_APPID_DATA"."K012_ECT_CABINET"
ADD CONSTRAINT "FK_PARENT_ID_AND_ID" FOREIGN KEY ("K012_PARENT_ID")
REFERENCES "DEV_OLTP_APPID_DATA"."K012_ECT_CABINET" ("K001_ID") ON DELETE CASCADE;	



--пытался изменить генерацию для "K012_ID", изначально её не было. Не удачно. Поэтому выбрал вариант
--добавления ID_ECT_CABINET_SEQ.NEXTVAL (ниже), что очень удобно по-моему
ALTER TABLE K0120_ECT_CABINET MODIFY "K012_ID" NUMBER(12,0) GENERATED BY DEFAULT AS IDENTITY
(MINVALUE 100
 MAXVALUE 9999999999999999999999999999
 INCREMENT BY 1 
START WITH 100 
 CACHE 20
 CYCLE
 --NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL 
 );


--Добавил вызов последовательности ID_ECT_CABINET_SEQ чтобы не удалять и опять создавать колонку с автоинкрементом!!!
--Это очень удобно!!!
ALTER TABLE K0120_ECT_CABINET
    MODIFY K012_ID NUMBER(12,0) DEFAULT ID_ECT_CABINET_SEQ.NEXTVAL;
   
ALTER TABLE K0120_ECT_CABINET
    MODIFY K012_ID VARCHAR2(50);
   
	
	INSERT INTO K0120_ECT_CABINET e(
e.K012_ID , e.K001_ID , e.K012_TITLE , e.K012_IS_DIRECTORY , e.K012_PARENT_ID 
	) SELECT k.K012_ID , k.K001_ID , k.K012_TITLE , k.K012_IS_DIRECTORY , k.K012_PARENT_ID  FROM K012_ECT_CABINET k;


--Вывод в иерархическом виде нашего дерева!
--с учетом хедера
	SELECT e.K012_ID ,lpad('     ', 5*level)||K012_TITLE as Tree,  e.K012_PARENT_ID, e.K001_ID  AS cabinetId   
	FROM K012_ECT_CABINET e
	START WITH e.K012_PARENT_ID is NULL AND e.K001_ID = '0ce1b771-28a4-4acb-b94a-77659236a4b3'
	CONNECT BY PRIOR e.K012_ID  = e.K012_PARENT_ID AND e.K001_ID = '0ce1b771-28a4-4acb-b94a-77659236a4b3'
	ORDER SIBLINGS BY e.K012_TITLE  ;


SELECT * FROM K012_ECT_CABINET k WHERE k.K001_ID  = '418bdde6-17aa-4043-931c-7bbbcb9e796b';

SELECT * FROM K001_CABINET_WORK_GROUP k WHERE k.K001_ID = '418bdde6-17aa-4043-931c-7bbbcb9e796b';

--DELETE FROM K0120_ECT_CABINET k WHERE k.K012_ID IN (35,32,23,41) AND k.K001_ID = '3eab14e2-0a19-44cd-ad25-24867fdd6135';

--Строим полный путь от указанного узла к самому верхнему родителю. С учетом историчности хедера  !!!
--Выбор полного пути и запись его через разделитель "\" или "/" или "=="            
	SELECT K012_ID , SYS_CONNECT_BY_PATH(K012_TITLE , '/') as Path
	FROM K012_ECT_CABINET e
	WHERE e.k012_id = '123' AND e.K001_ID = 'c3f71333-d0fd-4f2f-b554-eb16ba45bf08'
	START WITH e.K012_PARENT_ID is NULL AND e.K001_ID = 'c3f71333-d0fd-4f2f-b554-eb16ba45bf08'
	CONNECT BY PRIOR e.K012_id = e.K012_PARENT_ID AND e.K001_ID = 'c3f71333-d0fd-4f2f-b554-eb16ba45bf08';


--Для создания вьюшки использцем такой запрос:
SELECT K012_ID ,K001_ID , SYS_CONNECT_BY_PATH(K012_TITLE , '/') as Path
	FROM K012_ECT_CABINET e
	START WITH e.K012_PARENT_ID is NULL
	CONNECT BY PRIOR e.K012_id = e.K012_PARENT_ID;



SELECT SYS_CONNECT_BY_PATH(K012_TITLE , '/') as Path
	FROM K0120_ECT_CABINET e
	WHERE e.k012_id = ?1 AND e.K001_ID = ?2
	START WITH e.K012_PARENT_ID is NULL AND e.K001_ID = ?2
	CONNECT BY PRIOR e.K012_id = e.K012_PARENT_ID AND e.K001_ID = ?2
--пример: \INNddmmk\Ведомости\Folder 123\Title Folder 111

 
--Получаем всех детей со всех уровней
       WITH r (id, parent_id, name, lev) AS
            (SELECT p.K012_ID, p.K012_PARENT_ID , p.K012_TITLE, 1
            FROM K0120_ECT_CABINET p
            WHERE p.K012_PARENT_ID  = 21 AND p.K001_ID = 'ae7d50ed-7566-44f5-b658-49b1205dac81'
            UNION ALL
            SELECT t.K012_ID , t.K012_PARENT_ID , t.K012_TITLE , tp.lev + 1
            FROM r tp INNER JOIN K0120_ECT_CABINET t
            ON tp.id = t.K012_PARENT_ID WHERE t.K001_ID = 'ae7d50ed-7566-44f5-b658-49b1205dac81')
            SELECT * FROM r;
           
--получить детей на один уровень ниже 
           SELECT k.K012_ID AS templateId, k.K001_ID AS cabinetId, k.K012_TITLE AS title, k.K012_IS_DIRECTORY AS isDirectory, k.K012_PARENT_ID AS parentId
          FROM K0120_ECT_CABINET k WHERE k.K012_PARENT_ID = 21 AND k.K001_ID = 'ae7d50ed-7566-44f5-b658-49b1205dac81';
           
           
--Получаем корень в конкретном кабинете
          SELECT s.K012_ID AS templateId, s.K001_ID AS cabinetId, s.K012_TITLE AS title, s.K012_IS_DIRECTORY AS isDirectory, s.K012_PARENT_ID AS parentId
         FROM K0120_ECT_CABINET s WHERE s.K012_PARENT_ID IS NULL AND s.K001_ID = 'ae7d50ed-7566-44f5-b658-49b1205dac81';
        
        
        
        
--получить родителя на один уровень выше по cabinetId
        SELECT 
	    node1_.K012_ID as templateId,
	    node1_.K012_TITLE  as title,
    	node1_.K012_IS_DIRECTORY AS isDirectory,
    	node1_.K012_PARENT_ID as parentId,
	    node1_.K001_ID AS cabinetId
		FROM 
	    K0120_ECT_CABINET node0_ 
		LEFT OUTER JOIN 
	    K0120_ECT_CABINET node1_ 
        ON node0_.K012_PARENT_ID = node1_.K012_ID AND node0_.K001_ID  = node1_.K001_ID   
		WHERE 
	    node0_.K012_ID = 21 AND node0_.K001_ID = 'c3f71333-d0fd-4f2f-b554-eb16ba45bf08';
           
           
--Получаем всех родителей - !!! 
          WITH r(templateId, title, parentId, levell, cabinetId) AS
            (SELECT tr.K012_ID , tr.K012_TITLE , tr.K012_PARENT_ID, 1, tr.K001_ID  
	       FROM K0120_ECT_CABINET tl 
	       LEFT JOIN K0120_ECT_CABINET tr 
            ON tl.K012_PARENT_ID  = tr.K012_ID  
	       WHERE tl.K012_ID  = 2006 AND tr.K001_ID = '3eab14e2-0a19-44cd-ad25-24867fdd6135' AND tl.K001_ID = '3eab14e2-0a19-44cd-ad25-24867fdd6135'
            UNION ALL
            SELECT t.K012_ID , t.K012_TITLE, t.K012_PARENT_ID, levell+1, t.K001_ID 
            FROM K0120_ECT_CABINET t, r
            WHERE t.K012_ID  = r.parentId  AND t.K001_ID = '3eab14e2-0a19-44cd-ad25-24867fdd6135')
           SELECT templateId, title, parentId, ROW_NUMBER() OVER (ORDER BY levell DESC) AS levell, cabinetId FROM r;
          
                    
--перемещения узла - требуется всего лишь обновить parent_id перемещаемого узла.
          UPDATE K0120_ECT_CABINET 
			SET PARENT_ID = 23
			WHERE K006_ID = 33 AND K001_ID = 'ae7d50ed-7566-44f5-b658-49b1205dac81';
		
		
--удаление узла идет с удалением всех вложенных папок, т.к. стоит CONSTRAINT fk_parent_id_and_header_id FOREIGN KEY (PARENT_ID, K008_HEAD_ID)
--		DELETE FROM K006_ELECTRONIC_CATALOG_TEMPLATE WHERE K006_ID = 5 AND K008_HEAD_ID = 2045;
	
	
--вставим новые директории
	INSERT INTO K012_ECT_CABINET k (k.K012_TITLE , k.K012_IS_DIRECTORY , k.K012_PARENT_ID , k.K001_ID) 
	VALUES ('Тестовая папка 1-2', 1 ,5 , 'ae7d50ed-7566-44f5-b658-49b1205dac81');


INSERT INTO K012_ECT_CABINET k (k.K012_ID, k.K012_TITLE, k.K012_IS_DIRECTORY , k.K012_PARENT_ID , k.K001_ID, k.K006_ID, K012_CREATED_AT) 
    VALUES (:id, :title, 1, :parentId, :cabinetId, :ectId, CURRENT_TIMESTAMP)
--K012_ID
--K012_TITLE
--K012_IS_DIRECTORY
--K012_PARENT_ID
--K001_ID
--K006_ID
--K012_CREATED_AT
--K012_MODIFIED_AT
    
    SELECT s.K012_ID AS templateId, s.K001_ID AS cabinetId, s.K012_TITLE AS title, s.K012_IS_DIRECTORY AS isDirectory, 
s.K012_PARENT_ID AS parentId,  s.K006_ID AS ectId
 FROM K012_ECT_CABINET s WHERE s.K012_PARENT_ID IS NULL AND s.K001_ID = '3eab14e2-0a19-44cd-ad25-24867fdd6135';

SELECT s.K012_ID AS templateId, s.K001_ID AS cabinetId, s.K012_TITLE AS title, s.K012_IS_DIRECTORY AS isDirectory, 
s.K012_PARENT_ID AS parentId,  s.K006_ID AS ectId
 FROM K012_ECT_CABINET s WHERE  s.K001_ID = (SELECT k.K001_id  FROM K001_CABINET_WORK_GROUP k WHERE k.K001_CODE_CAB  = '162');

SELECT *  FROM K022_FILE_DATA k WHERE k.K001_ID  = 'e7c892bf-690a-4416-898c-3e3cf2055267';


SELECT f.K012_ID AS catalogId , k.K012_TITLE  AS directoryName, f.K001_ID AS cabinetId, f.K022_FILE_NAME AS fileName, f.K022_DATE_UPLOAD AS dateUpload
FROM K022_FILE_DATA f  LEFT JOIN K012_ECT_CABINET k ON f.K012_ID = k.K012_ID 
WHERE f.K001_ID = 'e7c892bf-690a-4416-898c-3e3cf2055267' AND LOWER(f.K022_FILE_NAME ) LIKE LOWER('%' || 'кот' || '%');


SELECT *
FROM K022_FILE_DATA f 
LEFT JOIN K017_NOTICE_AND_REQUEST n ON f.K017_ID = n.K017_ID 
LEFT JOIN K018_REQUEST_ITEM r ON r.K017_ID = n.K017_ID  
LEFT JOIN K023_STATES s ON n.K023_ID = s.K023_ID  
LEFT JOIN K012_ECT_CABINET k ON f.K012_ID = k.K012_ID 
WHERE f.K001_ID = 'e7c892bf-690a-4416-898c-3e3cf2055267' 
AND LOWER(f.K022_FILE_NAME ) LIKE LOWER('%' || 'кот' || '%');



    
    
SELECT s.K012_ID AS templateId, s.K012_TITLE AS title, s.K012_IS_DIRECTORY AS isDirectory, s.K012_PARENT_ID AS parentId, 
s.K001_ID AS cabinetId FROM K0120_ECT_CABINET s WHERE s.K012_PARENT_ID IS NULL AND s.K001_ID = 'b4f7156a-9a61-44dc-a75e-28308b53ab4c';



--DELETE FROM K0120_ECT_CABINET k WHERE k.K012_ID = :nodeId AND K001_ID  = :cabinetId

--DELETE FROM K012_ECT_CABINET k WHERE k.K012_ID = '3948e7c6-8ff6-49ba-a788-bc218768c118';

SELECT * FROM K012_ECT_CABINET k WHERE k.K001_ID  = '0ce1b771-28a4-4acb-b94a-77659236a4b3';

SELECT * FROM K012_ECT_CABINET k WHERE k.K012_ID = '55736d18-9c2f-46ac-8424-d8efe6b5b63a';

UPDATE K0120_ECT_CABINET k SET k.K012_TITLE = :title WHERE k.K012_ID = :nodeId AND k.K001_ID = :headerId



UPDATE K0120_ECT_CABINET k 
       SET k.K012_PARENT_ID = :parentId 
       WHERE k.K012_ID = :nodeId AND K001_ID = :cabinetId
       
       id = '6522949d-9d88-41b2-8e2e-9c0aceae070b'
       parentId='85b9810b-5cc7-4394-adaa-088110e4c25e'

UPDATE K012_ECT_CABINET k 
       SET k.K012_PARENT_ID = '549bd76b-d911-4144-a48d-21fbbcfab221' 
       WHERE k.K012_ID = '7f838cad-eff7-404b-baa9-9ca5de35a84a';


SELECT s.K012_ID AS templateId, s.K012_TITLE AS title, s.K012_IS_DIRECTORY AS isDirectory, s.K012_PARENT_ID AS parentId, 
s.K001_ID AS cabinetId, s.K006_ID AS  FROM K012_ECT_CABINET s WHERE s.K012_PARENT_ID IS NULL AND s.K001_ID = '0ce1b771-28a4-4acb-b94a-77659236a4b3';



SELECT s.K012_ID AS templateId, s.K012_TITLE AS title, s.K012_IS_DIRECTORY AS isDirectory, s.K012_PARENT_ID AS parentId, 
s.K001_ID AS cabinetId, s.K006_ID AS ectId , k.K006_ID, k.K006_PARENT_ID 
FROM K012_ECT_CABINET s JOIN K006_ELECTRONIC_CATALOG_TEMPLATE k ON s.K006_ID = k.K006_ID  
WHERE s.K006_ID = 'eaada9d4-1642-4fef-e053-040011ac1fe4' --'eaada9d4-164f-4fef-e053-040011ac1fe4' 
AND s.K001_ID = '0ce1b771-28a4-4acb-b94a-77659236a4b3';


SELECT s.K012_ID AS templateId, s.K012_TITLE AS title, s.K012_IS_DIRECTORY AS isDirectory, s.K012_PARENT_ID AS parentId, 
s.K001_ID AS cabinetId, s.K006_ID AS ectId 
FROM K012_ECT_CABINET s   
WHERE s.K006_ID = 'eaada9d4-1642-4fef-e053-040011ac1fe4' --'eaada9d4-164f-4fef-e053-040011ac1fe4' 
AND s.K001_ID = '0ce1b771-28a4-4acb-b94a-77659236a4b3'; --cabinetId -> 0ce1b771-28a4-4acb-b94a-77659236a4b3

SELECT * FROM K012_ECT_CABINET k WHERE k.K001_ID = '0ce1b771-28a4-4acb-b94a-77659236a4b3'; --eaada9d4-1644-4fef-e053-040011ac1fe4

SELECT * FROM K012_ECT_CABINET k WHERE k.K006_ID = 'eaada9d4-1642-4fef-e053-040011ac1fe4' AND k.K001_ID = '0ce1b771-28a4-4acb-b94a-77659236a4b3';
SELECT * FROM K012_ECT_CABINET k WHERE k.K012_ID = '2c9e25c583c796b20183c79725c20000';

 --Вывод в иерархическом виде нашего дерева!
--с учетом новейшего хедера
	SELECT e.K012_ID ,lpad('     ', 5*level)||k012_title as Tree, e.K012_PARENT_ID  , e.K006_ID , e.K001_ID , e.K012_KEY 
	FROM K012_ECT_CABINET e
	START WITH e.k012_PARENT_ID is NULL AND e.K001_ID = '219d3085-e2a0-4ff9-9b6f-1c23a6ad3e09'
	CONNECT BY PRIOR e.K012_ID  = e.k012_PARENT_ID AND e.K001_ID = '219d3085-e2a0-4ff9-9b6f-1c23a6ad3e09'
	ORDER SIBLINGS BY e.k012_TITLE ;


--DELETE FROM K012_ECT_CABINET k WHERE k.K012_ID = 'a9e1bcc5-7d21-4eb8-b5ba-e0f284e0cc45';

SELECT * FROM K012_ECT_CABINET k WHERE k.K001_ID = 'e7c892bf-690a-4416-898c-3e3cf2055267';

SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K006_ID IN (
'eaada9d4-1642-4fef-e053-040011ac1fe4',
'eaada9d4-1646-4fef-e053-040011ac1fe4',
'eaada9d4-1643-4fef-e053-040011ac1fe4') ;



SELECT * FROM K012_ECT_CABINET k WHERE k.K012_PARENT_ID = 'eaada9d4-2b50-4fef-e053-040011ac1fe4'; 

SELECT k.K008_ID FROM K008_HEAD_EPC k WHERE k.K008_DATE_BEG  = (SELECT max(e.K008_DATE_BEG) FROM K008_HEAD_EPC e);



--DELETE FROM K008_HEAD_EPC k WHERE k.K008_ID = '2c9e25c583cc62ca0183cc658a0f0000';
--UPDATE K008_HEAD_EPC k SET k.K008_DATE_END = NULL WHERE k.K008_ID = 'eaada9d4-1799-4fef-e053-040011ac1fe4'; 




SELECT * FROM K012_ECT_CABINET k WHERE k.K006_ID = 'eaada9d4-1649-4fef-e053-040011ac1fe4'; --AND k.K001_ID = '0ce1b771-28a4-4acb-b94a-77659236a4b3';

INSERT INTO K012_ECT_CABINET k (k.K012_ID, k.K012_TITLE, k.K012_IS_DIRECTORY , k.K012_PARENT_ID , k.K001_ID, k.K006_ID) 
    VALUES (:id, :title, 1, :parentId, :cabinetId, :ectId);
    
    

SELECT * FROM K012_ECT_CABINET k WHERE k.K001_ID = (SELECT c.K001_ID  FROM K001_CABINET_WORK_GROUP c WHERE c.K001_CODE_CAB = '160');

SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K006_ID = '5da5a16e-8ca7-4d5b-9695-b998d0dead68';

SELECT * FROM K012_ECT_CABINET k LEFT JOIN K022_FILE_DATA f ON k.K012_ID = f.K012_ID  
WHERE k.K001_ID = (SELECT c.K001_ID  FROM K001_CABINET_WORK_GROUP c WHERE c.K001_CODE_CAB = '158');

--INSERT INTO K012_ECT_CABINET c 
--(c.K012_ID , c.K012_TITLE, c.K012_IS_DIRECTORY, c.K012_KEY, c.K006_ID , c.K012_CREATED_AT , c.K001_ID) 
--SELECT 
--'4ae5ba9d-15bb-41dd-92c1-c74525adeb94', k.K006_TITLE , k.K006_IS_DIRECTORY , k.K006_KEY, k.K006_ID , CURRENT_TIMESTAMP, 'e2b094c9-12d7-40af-9e7a-0ff97a344e42'  
--FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K006_ID = '5da5a16e-8ca7-4d5b-9695-b998d0dead68';




--//////===РАБОТА С ТАБЛИЦЕЙ K012=====================================================================
--//////===РАБОТА С ТАБЛИЦЕЙ K012====КОНЕЦ============================================================


--//////===РАБОТА С ТАБЛИЦЕЙ K012 + K022=====================================================================
--//////===РАБОТА С ТАБЛИЦЕЙ K012 + K022====START============================================================

   --  с выводом дерева, уровнями вложенности, листик или нет, названием родительской папки (Parent) и относительного пути к директориям
SELECT  level, lpad('     ', 5*level)||k012_title as Tree, e.K012_TITLE , e.K012_ID , e.K012_PARENT_ID , e.K001_ID ,
CONNECT_BY_ISLEAF AS IsLeaf,
PRIOR e.K012_TITLE AS Parent,
CONNECT_BY_ROOT e.K012_TITLE AS Root,
SYS_CONNECT_BY_PATH(e.K012_TITLE , '/') AS relativePath
FROM K012_ECT_CABINET e
CONNECT BY PRIOR e.K012_ID = e.K012_PARENT_ID
START WITH e.K012_PARENT_ID is NULL AND e.K001_ID = '3089f116-9704-4ecc-96d7-9db7f67fe16b' --добавил cabinetId чтоб работать с одним кабинетом 
ORDER SIBLINGS BY e.K012_TITLE;


SELECT k.K012_ID AS templateId, k.K001_ID AS cabinetId, k.K012_TITLE AS title, k.K012_IS_DIRECTORY AS isDirectory, k.K012_PARENT_ID AS parentId, 
 k.K012_KEY AS titleKey FROM K012_ECT_CABINET k WHERE k.K012_PARENT_ID = 'd9835ea4-1516-4034-b40e-aae24ceefca1' AND k.K001_ID = '3089f116-9704-4ecc-96d7-9db7f67fe16b' ORDER BY k.K012_TITLE;

SELECT k.K001_ID  FROM K001_CABINET_WORK_GROUP k WHERE k.K001_CODE_CAB = '157';


--ПОИСК ДАННЫХ ПО ДВУМ ТАБЛИЦАМ


--******ПОИСК ПО КАТАЛОГУ УЗЛА С УКЗАНЫМ ИМЕНЕМ:
--Получаем всех родителей от указанного узла (ПО НАЗВАНИЮ УЗЛА) и на самый верх (ЭТО ИСПОЛЬЗУЕМ ДЛЯ ПОИСКА НУЖНОГО УЗЛА)
--1) СНАЧАЛА НАХОДИМ УЗЛЫ В ДЕРЕВЕ ПО ИХ ИМЕНИ:
       
    --вариант а) - можно получить данные с относительным путем вложенности папок
	SELECT k.K012_ID , k.K012_TITLE , k.K012_PARENT_ID , k.K012_KEY , k.K001_ID , k.K012_IS_DIRECTORY,
	SYS_CONNECT_BY_PATH(K012_TITLE, '/') as relativePath 
	FROM K012_ECT_CABINET k 
	WHERE LOWER(k.K012_TITLE) LIKE LOWER('%' || 'опи' || '%') 
	START WITH k.K012_PARENT_ID is NULL  
	AND k.K001_ID = '3089f116-9704-4ecc-96d7-9db7f67fe16b'
    CONNECT BY PRIOR k.K012_ID = k.K012_PARENT_ID;
   
   
   --вариант б) (шаг 1) - с поиском данных можно получить данные БЕЗ относительного пути вложенности папок, а потом другим запросом получить этот путь для каждого узла
	SELECT * FROM K012_ECT_CABINET k LEFT JOIN K022_FILE_DATA f ON k.K012_ID = f.K012_ID 
	WHERE k.K001_ID = '3089f116-9704-4ecc-96d7-9db7f67fe16b' and
	LOWER(k.K012_TITLE) LIKE LOWER('%' || 'опи' || '%'); 


   		--(шаг 2) для понятного вида где лежит эта директория собираем для нее путь
	       SELECT SYS_CONNECT_BY_PATH(K012_TITLE, '/') as relativePath 
	       FROM K012_ECT_CABINET e 
    	   WHERE e.K012_ID = '0b4322f4-a315-473b-bb9a-6c63c36cf8ad'   --'27bb081f-f5cc-4664-9d54-20789ed6d08c'
	       START WITH e.K012_PARENT_ID is NULL  
    	   CONNECT BY PRIOR e.K012_ID = e.K012_PARENT_ID;
	
      
--2) т.к. их несколько, то смотрим что отдает первый найденныйузел и при следующих кликах последующие
    	  --находим всех родителей
          
       WITH r(id, title, parentId, titleKey, isDirectory, levell, cabinetId) AS 
            (SELECT tr.K012_ID , tr.K012_TITLE , tr.K012_PARENT_ID , tr.K012_KEY , tr.K012_IS_DIRECTORY , 1, tr.K001_ID 
      FROM K012_ECT_CABINET tl 
      LEFT JOIN K012_ECT_CABINET tr 
            ON tl.K012_PARENT_ID  = tr.K012_ID 
      WHERE tl.K012_ID  = '27bb081f-f5cc-4664-9d54-20789ed6d08c' 
            UNION ALL 
            SELECT t.K012_ID , t.K012_TITLE , t.K012_PARENT_ID , t.K012_KEY , t.K012_IS_DIRECTORY , levell+1, t.K001_ID 
            FROM K012_ECT_CABINET t, r 
            WHERE t.K012_ID  = r.parentId ) 
        SELECT id, title, parentId, titleKey, isDirectory, ROW_NUMBER() OVER (ORDER BY levell DESC) AS levell, cabinetId FROM r;
       
       
--3) получаем всех детей для первого в списке узла (это будут дети у рута)
     SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K006_PARENT_ID = '5da5a16e-8ca7-4d5b-9695-b998d0dead68' ORDER BY k.K006_TITLE ASC ;
      
--4) проходимся по всем остальным найденным узлам опускаясь на уровень найденного по поиску узла
      SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K006_PARENT_ID = '71bbef1a-8395-468d-882f-6f6e14c1f9fb' ORDER BY k.K006_TITLE ASC ;
      SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K006_PARENT_ID = 'b97faabc-df04-4480-b118-269470b27bda' ORDER BY k.K006_TITLE ASC ;
     
--5) с помощью java собираем объект из полученного списка
     
     

--10) вариант - с поиском данных
SELECT DISTINCT * FROM K012_ECT_CABINET k LEFT JOIN K022_FILE_DATA f ON k.K012_ID = f.K012_ID 
WHERE k.K001_ID = '3089f116-9704-4ecc-96d7-9db7f67fe16b';
     


SELECT * FROM K012_ECT_CABINET k LEFT JOIN K022_FILE_DATA f ON k.K012_ID = f.K012_ID 
WHERE k.K001_ID = '3089f116-9704-4ecc-96d7-9db7f67fe16b' 
AND (LOWER(k.K012_TITLE) LIKE LOWER('%' || 'виз' || '%')
OR LOWER(f.K022_FILE_NAME ) LIKE LOWER('%' || 'gi' || '%')
OR LOWER(f.K022_EXTENSION) LIKE LOWER('%' || 'gi' || '%')); 


SELECT * FROM K012_ECT_CABINET k LEFT JOIN K022_FILE_DATA f ON k.K012_ID = f.K012_ID 
WHERE k.K001_ID = '3089f116-9704-4ecc-96d7-9db7f67fe16b' AND LOWER(f.K022_FILE_NAME ) LIKE LOWER('%' || 'gi' || '%');
 

SELECT * FROM K012_ECT_CABINET k LEFT JOIN K022_FILE_DATA f ON k.K012_ID = f.K012_ID 
WHERE k.K001_ID = '3089f116-9704-4ecc-96d7-9db7f67fe16b' AND LOWER(k.K012_TITLE) LIKE LOWER('%' || 'виз' || '%');

SELECT * FROM K012_ECT_CABINET k LEFT JOIN K022_FILE_DATA f ON k.K012_ID = f.K012_ID 
WHERE k.K001_ID = '3089f116-9704-4ecc-96d7-9db7f67fe16b' AND LOWER(f.K022_EXTENSION) LIKE LOWER('%' || 'gi' || '%'); 

SELECT * FROM K012_ECT_CABINET k LEFT JOIN K022_FILE_DATA f ON k.K012_ID = f.K012_ID 
WHERE k.K001_ID = '3089f116-9704-4ecc-96d7-9db7f67fe16b' AND f.K022_DATE_UPLOAD <= dateEnd AND f.K022_DATE_UPLOAD >= dateStart; 


SELECT * FROM K012_ECT_CABINET k LEFT JOIN K022_FILE_DATA f ON k.K012_ID = f.K012_ID 
WHERE k.K001_ID = '3089f116-9704-4ecc-96d7-9db7f67fe16b' AND f.K022_DATE_UPLOAD >= TO_DATE('25.10.2022 01:00:00','DD.MM.YYYY HH24:MI:SS') 
AND f.K022_DATE_UPLOAD <= TO_DATE('25.10.2022 23:30:00', 'DD.MM.YYYY HH24:MI:SS'); 


SELECT * FROM K022_FILE_DATA k LEFT JOIN K021_DATA_PACKAGE_DEF d ON k.K021_ID = d.K021_ID 
WHERE k.K001_ID = '3089f116-9704-4ecc-96d7-9db7f67fe16b' 
AND d.K021_DATE_REG_OR_DISS_SADD >= TO_DATE('25.10.2022 01:00:00','DD.MM.YYYY HH24:MI:SS') 
AND d.K021_DATE_REG_OR_DISS_SADD <= TO_DATE('25.10.2022 23:30:00', 'DD.MM.YYYY HH24:MI:SS'); 

--перевод времени из строки в Timestamp
SELECT TO_DATE('25.12.4712 01:10:30','DD.MM.YYYY HH24:MI:SS') FROM dual;
--перевод даты из строки в Timestamp
SELECT TO_DATE('01-дек-4712','DD-MON-YYYY') FROM dual;

--пример выборки по временному интервалу
 SELECT price
    INTO p_price
    FROM prices
  WHERE product code = p_code
     AND date_from   <= p_when
     AND date_to     >= NVL(p_when, TO_DATE('01-дек-4712','DD-MON-YYYY');






SELECT * FROM P360_INSP_CHK_NFO  p WHERE lower(p.P360_CHK_CODE) = '7i21aj1' AND TO_CHAR(p.P360_CHK_DATE_BEGIN ,'YYYY') = '2015'; 
--7i21aj1  2015

SELECT * FROM K001_CABINET_WORK_GROUP c LEFT JOIN K003_NOTIFICATIONS_AND_CONFIRMATIONS kn ON kn.K001_ID = c.K001_ID WHERE c.K001_ID = '68c854e9-0c9c-4301-a746-3a03c4c4a1f6';

SELECT * FROM K001_CABINET_WORK_GROUP k WHERE k.K001_CODE_CAB = '162';


--eaada9d4-16e9-4fef-e053-040011ac1fe4
SELECT k.K006_ID , k.K006_TITLE , k.K006_IS_DIRECTORY , k.k006_PARENT_ID , k.K008_ID , k.k006_KEY , k.k006_IS_NECESSARY 
FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K006_PARENT_ID = 'eaada9d4-16e9-4fef-e053-040011ac1fe4' ORDER BY k.K006_TITLE ASC;

 



SELECT * FROM K022_FILE_DATA f 
LEFT JOIN K012_ECT_CABINET k ON f.K001_ID = k.K001_ID 
WHERE f.K022_EXTENSION IN ('jpg') AND f.K001_ID = '3089f116-9704-4ecc-96d7-9db7f67fe16b';

SELECT x.*,x.ROWID FROM DEV_OLTP_APPID_DATA.K022_FILE_DATA x WHERE x.K022_EXTENSION IN ('jpg')

SELECT x.*,x.ROWID FROM DEV_OLTP_APPID_DATA.K022_FILE_DATA x
WHERE x.K022_EXTENSION IN ('jpg');


OR LOWER(f.K022_FILE_NAME) LIKE LOWER('%' || 'тест' || '%') 
OR LOWER(f.K022_EXTENSION) LIKE LOWER('%' || 'тест' || '%')
and ; 

SELECT * FROM K001_CABINET_WORK_GROUP k WHERE k.K001_ID ='3089f116-9704-4ecc-96d7-9db7f67fe16b';



SELECT * FROM K013_DOCS_TEMP k WHERE k.K013_ID = '47dd8e51-2547-475f-b307-025614cb5880';




--UPSERT для записи :
MERGE INTO K013_DOCS_TEMP k
USING dual 
ON (K013_ID  = '47dd8e51-2547-475f-b307-025614cb5880' )
WHEN MATCHED THEN 
	UPDATE SET K013_TITLE = 'admin'
WHEN NOT MATCHED THEN 
INSERT (K013_TITLE , K013_ID)
    VALUES ('admin',  '47dd8e51-2547-475f-b307-025614cb5880');
   
   
   
   



--//////===РАБОТА С ТАБЛИЦЕЙ K012 + K022=====================================================================
--//////===РАБОТА С ТАБЛИЦЕЙ K012 + K022====END  ============================================================
   
   
--//////===РАБОТА С ТАБЛИЦЕЙ K027 ======СТАРТ===============================================================
--//////===РАБОТА С ТАБЛИЦЕЙ K027 ==========================================================================
   
   
   CREATE TABLE "DEV_OLTP_APPID_DATA"."K027_MARKING" 
   (	
    "K027_ID" VARCHAR2(50) DEFAULT NULL NOT NULL ENABLE, 
	"K027_NUMBER" NUMBER(2,0) NOT NULL ENABLE, 
	"K027_TEXT" VARCHAR2(128) NOT NULL ENABLE, 
	"K027_HINT" VARCHAR2(512), 
	"K027_INDEX_TYPE" VARCHAR2(5) NOT NULL ENABLE, 
	"K027_SHORT_KEY" VARCHAR2(50), 
	 CONSTRAINT "K027_PK" PRIMARY KEY ("K027_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_APPID_DT_S"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_APPID_DT_S" ;
 
INSERT INTO K027_MARKING
(K027_ID, K027_TYPE_NUMBER , K027_TEXT , K027_HINT , K027_INDEX_TYPE , K027_DOCUMENTS_TYPE )
VALUES(
'e718ccc4-93ba-4082-b1a3-cb19ba4dbd8a', 
3, 
'Задание (дополнение к заданию) на проведении проверки', 
'задание (дополнение к заданию) на проведении проверки [Информационные сообщения]', 
'z', 
'Информационные сообщения'
);

SELECT k.k001_id, SUM(k.K022_SIZE)  FROM DEV_OLTP_APPID_DATA.K022_FILE_DATA  k WHERE k.K022_SIZE <> 0 GROUP BY k.K001_ID ;

SELECT * FROM DEV_OLTP_APPID_DATA.K022_FILE_DATA k WHERE k.K001_ID IN (SELECT g.K001_ID  FROM DEV_OLTP_APPID_DATA.K001_CABINET_WORK_GROUP g WHERE g.K001_CODE_CAB = '160');


UPDATE DEV_OLTP_APPID_DATA.K022_FILE_DATA k 
       SET k.K012_ID = :parentId WHERE k.K022_ID = :fileId;

UPDATE DEV_OLTP_APPID_DATA.K022_FILE_DATA k  
       SET k.K012_ID = '0b4322f4-a315-473b-bb9a-6c63c36cf8ad' WHERE k.K022_ID = '92ae1b98-3558-42f8-9f19-a2957742d76e';
      
      
      SELECT *  FROM DEV_OLTP_APPID_DATA.K022_FILE_DATA k WHERE k.K022_ID = '92ae1b98-3558-42f8-9f19-a2957742d76e';
 
     SELECT k.K022_SIZE  FROM DEV_OLTP_APPID_DATA.K022_FILE_DATA k WHERE k.K001_ID = '32e7cd22-9237-4277-9819-5d6755d14d97';
    
    SELECT count(*)  FROM DEV_OLTP_APPID_DATA.K022_FILE_DATA k ;
   
   SELECT count(k.K027_ID), k.K027_DOCUMENTS_TYPE  FROM DEV_OLTP_APPID_DATA.K027_MARKING k  GROUP BY k.K027_DOCUMENTS_TYPE ;
   SELECT k.K027_ID, k.K027_INDEX_TYPE , k.K027_TEXT, k.K027_DOCUMENTS_TYPE  FROM DEV_OLTP_APPID_DATA.K027_MARKING k;
  
  
  SELECT * FROM DEV_OLTP_APPID_BACKUP_DATA.P320_COMPOSITE_CHK_NFO k WHERE k.P320_ORG_OKATO = '92';
  
  
  SELECT M.YYYYMMDD,
       M.HH24,
       M.HALF_PART,
  FROM (SELECT TO_CHAR(T.TIME_FIELD,
                       'yyyy/mm/dd') AS "YYYYMMDD",
               TO_CHAR(T.TIMESTAMP, 'HH24') AS "HH24",
               CASE
                WHEN TO_CHAR(T.TIME_FIELD, 'MI') BETWEEN 0 AND 30 THEN
                 '0-30 min'
                WHEN TO_CHAR(T.TIME_FIELD, 'MI') BETWEEN 31 AND 59 THEN
                 '31-59 min'
               END AS "HALF_PART"
          FROM TBL_NAME T) M
 GROUP BY M.YYYYMMDD, M.HH24, M.HALF_PART
 ORDER BY 1;

SELECT k.K006_TITLE  FROM DEV_OLTP_APPID_DATA.K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K006_ID IN (
'137877d8-e198-440d-96f2-11904c79d808',
'8e9ab41c-c2b0-400f-81c4-865231b39f50',
'9858ce38-4d82-460e-977a-91a233ff3f06',
'f205f3b8-bb5f-422d-853d-7ebd81d3e0f4',
'55fa4bad-8083-4e8a-8c09-b304a88e508d',
'0063579f-35eb-41f3-9ac7-9dad9c519d2f',
'07e7ea90-b9d5-48cf-b67a-df7dffb54e5a',
'71bbef1a-8395-468d-882f-6f6e14c1f9fb',
'35202cb3-985f-4793-8b7e-d7863131ed5d',
'5da5a16e-8ca7-4d5b-9695-b998d0dead68'
) ORDER BY k.K006_TITLE ;

SELECT * FROM DEV_OLTP_APPID_DATA.K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K008_ID = '21c86e71-e441-42ec-8067-cb2390094377';
SELECT * FROM DEV_OLTP_APPID_DATA.K008_HEAD_EPC WHERE K008_ID = '21c86e71-e441-42ec-8067-cb2390094377';
--DELETE FROM DEV_OLTP_APPID_DATA.K008_HEAD_EPC WHERE K008_ID = '21c86e71-e441-42ec-8067-cb2390094377';
   
--//////===РАБОТА С UPSERT======START===============================================================

--ссылка на источник https://stackoverflow.com/questions/237327/oracle-how-to-upsert-update-or-insert-into-a-table

--вариант 1) UPSERT - РАБОЧИЙ ВАРИАНТ, используем таблицу DUAL
MERGE INTO tablename 
USING dual 
ON ( val3 = in_val3 )
WHEN MATCHED THEN 
	UPDATE SET val1 = in_val1, val2 = in_val2
WHEN NOT MATCHED THEN 
INSERT 
    VALUES (in_val1, in_val2, in_val3);
   
--вариант 2) UPSERT
-- Oracle: Example for Insert or update in t1 from t2 values - использование двух таблиц - НЕ ИСПОЛЬЗОВАЛ
MERGE INTO table1 t1
USING table2 t2
ON (t1.CODE = t2.ID)
WHEN MATCHED THEN
    UPDATE SET t1.COL1 = t2.VALUE1
WHEN NOT MATCHED THEN
    INSERT (CODE, COL1)  VALUES (t2.ID, t2.VALUE1);

--вариант 3) UPSERT - НЕ ЗАРАБОТАЛ
UPDATE tablename SET val1 = in_val1, val2 = in_val2
    WHERE val3 = in_val3;
IF ( sql%notfound ) THEN
    INSERT INTO tablename
        VALUES (in_val1, in_val2, in_val3);
END IF;
   
--//////===РАБОТА С UPSERT======END===============================================================   

    
    
SELECT k.K008_ID FROM K008_HEAD_EPC k WHERE k.K008_DATE_BEG  = (SELECT max(e.K008_DATE_BEG) FROM K008_HEAD_EPC e);


SELECT s.K006_ID AS templateId, s.K006_TITLE AS title, s.K006_IS_DIRECTORY AS isDirectory, 
s.K006_PARENT_ID AS parentId, s.K008_ID AS headerIdK008 
FROM K006_ELECTRONIC_CATALOG_TEMPLATE s WHERE s.K006_PARENT_ID IS NULL AND 
s.K008_HEAD_ID = (SELECT k.K008_HEAD_ID FROM K008_HEAD_EPC k WHERE k.K008_DATE_BEG  = (SELECT max(e.K008_DATE_BEG) FROM K008_HEAD_EPC e));

SELECT s.K006_ID AS templateId, s.K006_TITLE AS title, s.k006_IS_DIRECTORY AS isDirectory, 
s.k006_PARENT_ID AS parentId, s.K008_ID AS headerIdK008 
FROM K006_ELECTRONIC_CATALOG_TEMPLATE s WHERE s.K006_PARENT_ID IS NULL AND 
s.K008_ID = 'eaada9d4-1799-4fef-e053-040011ac1fe4';

SELECT k.K008_HEAD_ID FROM K008_HEAD_EPC k WHERE k.K008_DATE_BEG = (SELECT max(e.K008_DATE_BEG) FROM K008_HEAD_EPC e);


WITH r (templateId,  title, parent_id, isDirectory, isNecessary, headerId, levell) AS 
            (SELECT p.K006_ID, p.K006_TITLE, p.K006_PARENT_ID, p.K006_IS_DIRECTORY, p.K006_IS_NECESSARY, p.K008_ID,  1 
            FROM K006_ELECTRONIC_CATALOG_TEMPLATE p 
            WHERE p.K006_PARENT_ID = 'eaada9d4-0e39-4fef-e053-040011ac1fe4' AND p.K008_ID = (SELECT k.K008_ID FROM K008_HEAD_EPC k WHERE k.K008_DATE_BEG  = (SELECT max(e.K008_DATE_BEG) FROM K008_HEAD_EPC e)) AND p.K006_IS_NECESSARY = 1 
            UNION ALL 
            SELECT t.K006_ID, t.K006_TITLE, t.K006_PARENT_ID, t.K006_IS_DIRECTORY, t.K006_IS_NECESSARY, t.K008_ID, tp.levell + 1 
            FROM r tp INNER JOIN K006_ELECTRONIC_CATALOG_TEMPLATE t 
            ON tp.templateId = t.K006_PARENT_ID WHERE t.K008_ID = (SELECT k.K008_ID FROM K008_HEAD_EPC k WHERE k.K008_DATE_BEG  = (SELECT max(e.K008_DATE_BEG) FROM K008_HEAD_EPC e)) AND t.K006_IS_NECESSARY = 1) 
            SELECT templateId, title, parent_id, isDirectory, isNecessary, headerId, levell FROM r;
           
           
           WITH r (templateId,  title, parent_id, isDirectory, isNecessary, headerId, levell) AS 
            (SELECT p.K006_ID, p.K006_TITLE, p.K006_PARENT_ID, p.K006_IS_DIRECTORY, p.K006_IS_NECESSARY, p.K008_ID,  1 
            FROM K006_ELECTRONIC_CATALOG_TEMPLATE p 
            WHERE p.K006_PARENT_ID = 'eaada9d4-0e47-4fef-e053-040011ac1fe4'  
            UNION ALL 
            SELECT t.K006_ID, t.K006_TITLE, t.K006_PARENT_ID, t.K006_IS_DIRECTORY, t.K006_IS_NECESSARY, t.K008_ID, tp.levell + 1 
            FROM r tp INNER JOIN K006_ELECTRONIC_CATALOG_TEMPLATE t 
            ON tp.templateId = t.K006_PARENT_ID ) 
            SELECT templateId, title, parent_id, isDirectory, isNecessary, headerId, levell FROM r;
           
           WITH r(templateId, title, parentId, isDirectory, levell, header) AS 
            (SELECT tr.K006_ID , tr.K006_TITLE , tr.K006_PARENT_ID , tr.K006_IS_DIRECTORY , 1, tr.K008_ID 
      FROM K006_ELECTRONIC_CATALOG_TEMPLATE tl 
      LEFT JOIN K006_ELECTRONIC_CATALOG_TEMPLATE tr 
            ON tl.K006_PARENT_ID  = tr.K006_ID 
      WHERE tl.K006_ID  = 'eaada9d4-0e47-4fef-e053-040011ac1fe4'   
            UNION ALL 
            SELECT t.K006_ID , t.K006_TITLE , t.K006_PARENT_ID , t.K006_IS_DIRECTORY , levell+1, t.K008_ID 
            FROM K006_ELECTRONIC_CATALOG_TEMPLATE t, r 
            WHERE t.K006_ID  = r.parentId  ) 
        SELECT templateId, title, parentId, isDirectory, ROW_NUMBER() OVER (ORDER BY levell DESC) AS levell, header FROM r;
           
           
           WITH r(templateId, title, parentId, isDirectory, levell, header) AS 
            (SELECT tr.K006_ID , tr.K006_TITLE , tr.K006_PARENT_ID , tr.K006_IS_DIRECTORY , 1, tr.K008_ID 
      FROM K006_ELECTRONIC_CATALOG_TEMPLATE tl 
      LEFT JOIN K006_ELECTRONIC_CATALOG_TEMPLATE tr 
            ON tl.K006_PARENT_ID  = tr.K006_ID 
      WHERE tl.K006_ID  = 'eaada9d4-0e39-4fef-e053-040011ac1fe4' 
            UNION ALL 
            SELECT t.K006_ID , t.K006_TITLE , t.K006_PARENT_ID , t.K006_IS_DIRECTORY , levell+1, t.K008_ID 
            FROM K006_ELECTRONIC_CATALOG_TEMPLATE t, r 
            WHERE t.K006_ID  = r.parentId ) 
        SELECT templateId, title, parentId, isDirectory, ROW_NUMBER() OVER (ORDER BY levell DESC) AS levell, header FROM r;
            
            
       SELECT s.K006_ID AS templateId, s.K006_TITLE AS title, s.K006_IS_DIRECTORY AS isDirectory, 
s.K006_PARENT_ID AS parentId, s.K008_ID AS headerIdK008 
FROM K006_ELECTRONIC_CATALOG_TEMPLATE s WHERE s.K006_PARENT_ID IS NULL AND 
s.K008_ID = (SELECT k.K008_ID FROM K008_HEAD_EPC k WHERE k.K008_DATE_BEG  = (SELECT max(e.K008_DATE_BEG) FROM K008_HEAD_EPC e)) ;


SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K006_PARENT_ID  = 'eaada9d4-1648-4fef-e053-040011ac1fe4' AND k.K008_ID = 'eaada9d4-1799-4fef-e053-040011ac1fe4';

SELECT * FROM K008_HEAD_EPC k WHERE k.K008_ID = 'eaada9d4-1799-4fef-e053-040011ac1fe4'; 

SELECT * FROM K012_ECT_CABINET k WHERE k.K001_ID = '00f8305d-16e2-4c61-ba01-41c564c82218';

SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K006_ID = 'eaada9d4-164b-4fef-e053-040011ac1fe4';
--//====K013_DOCS_TEMP====СТАРТ===========================================================
--//====K013_DOCS_TEMP====================================================================
	
	CREATE TABLE "DEV_OLTP_APPID_DATA"."K013_DOCS_TEMP" 
   (	
    "K013_ID" VARCHAR2(50) NOT NULL ENABLE, 
	"K013_TITLE" VARCHAR2(400), 
	"K013_PARENT_ID" VARCHAR2(50), 
	"K013_IS_DIRECTORY" NUMBER(1,0), 
	"K013_REL_PATH" VARCHAR2(400), 
	"K001_ID" VARCHAR2(50), 
	"USER_NAME" VARCHAR2(50), 
	"K007_ID" NUMBER(12,0), 
	 PRIMARY KEY ("K013_ID"),
	 --FOREIGN KEY ("K013_PARENT_ID") REFERENCES "DEV_OLTP_APPID_DATA"."K013_DOCS_TEMP" ("K013_ID")
	 CONSTRAINT "FK_K013_PARENT_ID_AND_ID" FOREIGN KEY ("K013_PARENT_ID")
	 REFERENCES "DEV_OLTP_APPID_DATA"."K013_DOCS_TEMP" ("K013_ID") ON DELETE CASCADE 
	 ) TABLESPACE "TS_APPID_DT_S" ;
	
	--DROP TABLE K013_DOCS_TEMP;

INSERT INTO DEV_OLTP_APPID_DATA.K013_DOCS_TEMP
(K013_ID, K013_TITLE, K013_PARENT_ID, K013_IS_DIRECTORY, K013_REL_PATH, K001_ID, USER_NAME, K007_ID)
VALUES('70ceccc7-7e5c-444f-91af-04466ec0fae8', 'TRANSFER', NULL, 1, '/TRANSFER', '3e9b52a1-a76f-4d13-9530-477eb4d988de', 'admin', NULL);
INSERT INTO DEV_OLTP_APPID_DATA.K013_DOCS_TEMP
(K013_ID, K013_TITLE, K013_PARENT_ID, K013_IS_DIRECTORY, K013_REL_PATH, K001_ID, USER_NAME, K007_ID)
VALUES('09aed49e-bab0-4aa1-9e2e-4d5f13aa673b', 'GGG', '70ceccc7-7e5c-444f-91af-04466ec0fae8', 1, '/TRANSFER/TEST/GGG', '3e9b52a1-a76f-4d13-9530-477eb4d988de', 'admin', NULL);
INSERT INTO DEV_OLTP_APPID_DATA.K013_DOCS_TEMP
(K013_ID, K013_TITLE, K013_PARENT_ID, K013_IS_DIRECTORY, K013_REL_PATH, K001_ID, USER_NAME, K007_ID)
VALUES('76cfbd0c-4810-42d4-8a6c-6cd3fd308bc4', '222.txt', '09aed49e-bab0-4aa1-9e2e-4d5f13aa673b', 0, '/TRANSFER/TEST/GGG/222.txt', '3e9b52a1-a76f-4d13-9530-477eb4d988de', 'admin', NULL);

INSERT INTO DEV_OLTP_APPID_DATA.K013_DOCS_TEMP
(K013_ID, K013_TITLE, K013_PARENT_ID, K013_IS_DIRECTORY, K013_REL_PATH, K001_ID, USER_NAME, K007_ID)
VALUES('72f6701d-5c12-4046-8241-edc1c421b798', 'TEST', '70ceccc7-7e5c-444f-91af-04466ec0fae8', 1, '/TRANSFER/TEST', '3e9b52a1-a76f-4d13-9530-477eb4d988de', 'admin', NULL);

INSERT INTO DEV_OLTP_APPID_DATA.K013_DOCS_TEMP
(K013_ID, K013_TITLE, K013_PARENT_ID, K013_IS_DIRECTORY, K013_REL_PATH, K001_ID, USER_NAME, K007_ID)
VALUES('73a32b16-109c-4f6f-9bdc-5e4a9bdbe668', '111.txt', '72f6701d-5c12-4046-8241-edc1c421b798', 0, '/TRANSFER/TEST/111.txt', '3e9b52a1-a76f-4d13-9530-477eb4d988de', 'admin', NULL);
INSERT INTO DEV_OLTP_APPID_DATA.K013_DOCS_TEMP
(K013_ID, K013_TITLE, K013_PARENT_ID, K013_IS_DIRECTORY, K013_REL_PATH, K001_ID, USER_NAME, K007_ID)
VALUES('b52b5d7e-57ec-4d97-8301-b85bd42c4949', '333.txt', '09aed49e-bab0-4aa1-9e2e-4d5f13aa673b', 0, '/TRANSFER/TEST/GGG/333.txt', '3e9b52a1-a76f-4d13-9530-477eb4d988de', 'admin', NULL);
INSERT INTO DEV_OLTP_APPID_DATA.K013_DOCS_TEMP
(K013_ID, K013_TITLE, K013_PARENT_ID, K013_IS_DIRECTORY, K013_REL_PATH, K001_ID, USER_NAME, K007_ID)
VALUES('e65deb4c-a110-49c8-a4ef-6e69447968d6', '555.txt', '72f6701d-5c12-4046-8241-edc1c421b798', 0, '/TRANSFER/TEST/555.txt', '3e9b52a1-a76f-4d13-9530-477eb4d988de', 'admin', NULL);
INSERT INTO DEV_OLTP_APPID_DATA.K013_DOCS_TEMP
(K013_ID, K013_TITLE, K013_PARENT_ID, K013_IS_DIRECTORY, K013_REL_PATH, K001_ID, USER_NAME, K007_ID)
VALUES('87248fec-3aa1-4216-aaad-e27c15b24cc2', 'BEST', '09aed49e-bab0-4aa1-9e2e-4d5f13aa673b', 1, '/TRANSFER/BEST', '3e9b52a1-a76f-4d13-9530-477eb4d988de', 'admin', NULL);
INSERT INTO DEV_OLTP_APPID_DATA.K013_DOCS_TEMP
(K013_ID, K013_TITLE, K013_PARENT_ID, K013_IS_DIRECTORY, K013_REL_PATH, K001_ID, USER_NAME, K007_ID)
VALUES('c37d2c2b-cc7b-4358-a264-6ead051514f6', 'BEST_123.txt', '87248fec-3aa1-4216-aaad-e27c15b24cc2', 1, '/TRANSFER/BEST/BEST_123.txt', '3e9b52a1-a76f-4d13-9530-477eb4d988de', 'admin', NULL);





--добавление КОЛОНОК в таблицу
ALTER TABLE K013_DOCS_TEMP  
ADD K001_ID VARCHAR2(50) ;
--CONSTRAINT K001_CABINET_WORK_GROUP_FK REFERENCES K005_SETTINGS_WGC(K005_ID);

ALTER TABLE K013_DOCS_TEMP  
ADD USER_NAME VARCHAR2(50) ;

ALTER TABLE K013_DOCS_TEMP
ADD K007_ID NUMBER(12,0) ;



--Создал Зависимость для удаления вложенных папок (FK) каскадом:
ALTER TABLE "K013_DOCS_TEMP" ADD
CONSTRAINT "fk__k013_parent_id_and_id" FOREIGN KEY ("K013_PARENT_ID")
REFERENCES "DEV_OLTP_APPID_DATA"."K013_DOCS_TEMP" ("K013_ID") 
ON DELETE CASCADE;

ALTER TABLE DEV_OLTP_APPID_DATA.K013_DOCS_TEMP 
ADD CONSTRAINT FK_K013_PARENT_ID_AND_ID_DOCS_TEMP FOREIGN KEY (K013_PARENT_ID) 
REFERENCES DEV_OLTP_APPID_DATA.K013_DOCS_TEMP(K013_ID) ON DELETE CASCADE;



--Вывод в иерархическом виде нашего дерева!
--с учетом хедера
	SELECT e.K013_ID ,lpad('     ', 5*level)||K013_TITLE as Tree, e.K013_PARENT_ID   
	FROM K013_DOCS_TEMP e
	START WITH e.K013_PARENT_ID is NULL 
	CONNECT BY PRIOR e.K013_ID  = K013_PARENT_ID 
	ORDER SIBLINGS BY e.K013_TITLE  ;

SELECT * FROM K001_CABINET_WORK_GROUP k WHERE k.K001_ID = 'ea0a0ad6-1b3a-47d4-8a8e-6847570546e8';

--DELETE FROM K0120_ECT_CABINET k WHERE k.K012_ID IN (35,32,23,41) AND k.K001_ID = '3eab14e2-0a19-44cd-ad25-24867fdd6135';

--Строим полный путь от указанного узла к самому верхнему родителю. С учетом историчности хедера  !!!
--Выбор полного пути и запись его через разделитель "\" или "/" или "=="            
	SELECT SYS_CONNECT_BY_PATH(K013_TITLE , '/') as Path
	FROM K013_DOCS_TEMP e
	WHERE e.K013_id = 'b52b5d7e-57ec-4d97-8301-b85bd42c4949' AND e.K001_ID = '3e9b52a1-a76f-4d13-9530-477eb4d988de'
	START WITH e.K013_PARENT_ID is NULL AND e.K001_ID = '3e9b52a1-a76f-4d13-9530-477eb4d988de'
	CONNECT BY PRIOR e.K013_ID = e.K013_PARENT_ID AND e.K001_ID = '3e9b52a1-a76f-4d13-9530-477eb4d988de';
--пример: \INNddmmk\Ведомости\Folder 123\Title Folder 111

 
--Получаем всех детей со всех уровней
       WITH r (id, parent_id, title, lev) AS
            (SELECT p.K013_ID, p.K013_PARENT_ID , p.K013_TITLE , 1
            FROM K013_DOCS_TEMP p
            WHERE p.K013_PARENT_ID is null AND p.K001_ID = '3e9b52a1-a76f-4d13-9530-477eb4d988de'
            UNION ALL
            SELECT t.K013_ID , t.K013_PARENT_ID , t.K013_TITLE , tp.lev + 1
            FROM r tp INNER JOIN K013_DOCS_TEMP t
            ON tp.id = t.K013_PARENT_ID WHERE t.K001_ID = '3e9b52a1-a76f-4d13-9530-477eb4d988de')
            SELECT * FROM r;

           
--получить детей на один уровень ниже 
           SELECT k.K013_ID AS id, k.K001_ID AS cabinetId, k.K013_TITLE AS title, k.K013_IS_DIRECTORY AS isDirectory, k.K013_PARENT_ID AS parentId, 
           k.K013_REL_PATH AS relPath, k.USER_NAME AS userName, k.K007_ID AS fileId
          FROM K013_DOCS_TEMP k WHERE k.K013_PARENT_ID = '70ceccc7-7e5c-444f-91af-04466ec0fae8' AND k.K001_ID = '3e9b52a1-a76f-4d13-9530-477eb4d988de';
         
          
          SELECT  k.K001_CODE_CAB FROM K001_CABINET_WORK_GROUP k WHERE k.K001_ID = '3e9b52a1-a76f-4d13-9530-477eb4d988de';
           
           
--Получаем корень в конкретном кабинете
          SELECT  k.K013_ID AS id, k.K001_ID AS cabinetId, k.K013_TITLE AS title, k.K013_IS_DIRECTORY AS isDirectory, k.K013_PARENT_ID AS parentId, 
           k.K013_REL_PATH AS relPath, k.USER_NAME AS userName, k.K007_ID AS fileId
         FROM K013_DOCS_TEMP k WHERE k.K013_PARENT_ID IS NULL AND k.K001_ID = '3e9b52a1-a76f-4d13-9530-477eb4d988de';
        
        
        
--получить родителя на один уровень выше по cabinetId и id записи
        SELECT 
	    node1_.K013_ID as id,
	    node1_.K013_TITLE  as title,
    	node1_.K013_IS_DIRECTORY AS isDirectory,
    	node1_.K013_PARENT_ID as parentId,
	    node1_.K001_ID AS cabinetId
		FROM 
	    K013_DOCS_TEMP node0_ 
		LEFT OUTER JOIN 
	    K013_DOCS_TEMP node1_ 
        ON node0_.K013_PARENT_ID = node1_.K013_ID AND node0_.K001_ID  = node1_.K001_ID   
		WHERE 
	    node0_.K013_ID = 'b52b5d7e-57ec-4d97-8301-b85bd42c4949' AND node0_.K001_ID = '3e9b52a1-a76f-4d13-9530-477eb4d988de';
           
           
--Получаем всех родителей - !!! 
          WITH r(id, title, parentId, levell, cabinetId) AS
            (SELECT tr.K013_ID , tr.K013_TITLE , tr.K013_PARENT_ID, 1, tr.K001_ID  
	       FROM K013_DOCS_TEMP tl 
	       LEFT JOIN K013_DOCS_TEMP tr 
            ON tl.K013_PARENT_ID  = tr.K013_ID  
	       WHERE tl.K013_ID  = '09aed49e-bab0-4aa1-9e2e-4d5f13aa673b' AND tr.K001_ID = '3e9b52a1-a76f-4d13-9530-477eb4d988de' AND tl.K001_ID = '3e9b52a1-a76f-4d13-9530-477eb4d988de'
            UNION ALL
            SELECT t.K013_ID , t.K013_TITLE, t.K013_PARENT_ID, levell+1, t.K001_ID 
            FROM K013_DOCS_TEMP t, r
            WHERE t.K013_ID  = r.parentId  AND t.K001_ID = '3e9b52a1-a76f-4d13-9530-477eb4d988de')
           SELECT id, title, parentId, ROW_NUMBER() OVER (ORDER BY levell DESC) AS levell, cabinetId FROM r;
          
                    
--перемещения узла - требуется всего лишь обновить parent_id (тот id который будет парентом теперь) для перемещаемого узла K013_ID.
          UPDATE K013_DOCS_TEMP 
			SET K013_PARENT_ID = '87248fec-3aa1-4216-aaad-e27c15b24cc2'
			WHERE K013_ID = 'e65deb4c-a110-49c8-a4ef-6e69447968d6' AND K001_ID = '3e9b52a1-a76f-4d13-9530-477eb4d988de';
		
		
--удаление узла идет с удалением всех вложенных папок, т.к. стоит CONSTRAINT fk_parent_id_and_header_id FOREIGN KEY (PARENT_ID, K008_HEAD_ID)
		DELETE FROM K013_DOCS_TEMP WHERE K013_ID = '72f6701d-5c12-4046-8241-edc1c421b798' AND K001_ID = '3e9b52a1-a76f-4d13-9530-477eb4d988de';
	
--изменить имя title
	UPDATE K013_DOCS_TEMP k SET k.K013_TITLE = :title WHERE k.K013_ID = :id AND k.K001_ID = :cabinetId
	
	
	
--DELETE FROM K013_DOCS_TEMP k WHERE k.K013_ID in (
--'2c9e25c583c127fc0183c128c4270000',
--'2c9e25c583c127fc0183c128c42f0001',
--'2c9e25c583c127fc0183c128cbfc0002',
--'2c9e25c583c127fc0183c128cbff0003',
--'2c9e25c583c127fc0183c128cbff0004',
--'a3eae223-af41-426e-9f6d-e0a8e6864856'
--);

--вставим новые записи
	INSERT INTO K013_DOCS_TEMP k (k.K013_ID , k.K013_TITLE , k.K013_PARENT_ID , k.K013_IS_DIRECTORY, k.K013_REL_PATH, k.K001_ID, k.USER_NAME, k.K007_ID) 
	VALUES ();





--//===K013_DOCS_TEMP=====================================================================
--//===K013_DOCS_TEMP====КОНЕЦ============================================================


--//====P362_insp_files====СТАРТ===========================================================
--//====P362_insp_files====================================================================


--Вывод в иерархическом виде нашего дерева!
--с учетом хедера
	SELECT e.K012_ID ,lpad('     ', 5*level)||K012_TITLE as Tree, e.K001_ID  AS cabinetId, e.K012_PARENT_ID   
	FROM K0120_ECT_CABINET e
	START WITH e.K012_PARENT_ID is NULL AND e.K001_ID = '67822df5-67dd-4bf7-a322-f516a5cafb87'
	CONNECT BY PRIOR e.K012_ID  = e.K012_PARENT_ID AND e.K001_ID = '67822df5-67dd-4bf7-a322-f516a5cafb87'
	ORDER SIBLINGS BY e.K012_TITLE  ;

SELECT p.P362_ARCH_REL_PATH  FROM P362_INSP_FILES p WHERE p.P362_PARENT_ID = 2744312;

SELECT * FROM K001_CABINET_WORK_GROUP k WHERE k.K001_ID = 'ea0a0ad6-1b3a-47d4-8a8e-6847570546e8';

--DELETE FROM K0120_ECT_CABINET k WHERE k.K012_ID IN (35,32,23,41) AND k.K001_ID = '3eab14e2-0a19-44cd-ad25-24867fdd6135';

--Строим полный путь от указанного узла к самому верхнему родителю. С учетом историчности хедера  !!!
--Выбор полного пути и запись его через разделитель "\" или "/" или "=="            
	SELECT SYS_CONNECT_BY_PATH(K012_TITLE , '/') as Path
	FROM K0120_ECT_CABINET e
	WHERE e.k012_id = 123 AND e.K001_ID = 'c3f71333-d0fd-4f2f-b554-eb16ba45bf08'
	START WITH e.K012_PARENT_ID is NULL AND e.K001_ID = 'c3f71333-d0fd-4f2f-b554-eb16ba45bf08'
	CONNECT BY PRIOR e.K012_id = e.K012_PARENT_ID AND e.K001_ID = 'c3f71333-d0fd-4f2f-b554-eb16ba45bf08';


SELECT SYS_CONNECT_BY_PATH(K012_TITLE , '/') as Path
	FROM K0120_ECT_CABINET e
	WHERE e.k012_id = ?1 AND e.K001_ID = ?2
	START WITH e.K012_PARENT_ID is NULL AND e.K001_ID = ?2
	CONNECT BY PRIOR e.K012_id = e.K012_PARENT_ID AND e.K001_ID = ?2
--пример: \INNddmmk\Ведомости\Folder 123\Title Folder 111

 
--Получаем всех детей со всех уровней
       WITH r (id, parent_id, name, lev) AS
            (SELECT p.K012_ID, p.K012_PARENT_ID , p.K012_TITLE, 1
            FROM K0120_ECT_CABINET p
            WHERE p.K012_PARENT_ID  = 21 AND p.K001_ID = 'ae7d50ed-7566-44f5-b658-49b1205dac81'
            UNION ALL
            SELECT t.K012_ID , t.K012_PARENT_ID , t.K012_TITLE , tp.lev + 1
            FROM r tp INNER JOIN K0120_ECT_CABINET t
            ON tp.id = t.K012_PARENT_ID WHERE t.K001_ID = 'ae7d50ed-7566-44f5-b658-49b1205dac81')
            SELECT * FROM r;
           
--получить детей на один уровень ниже 
           SELECT k.K012_ID AS templateId, k.K001_ID AS cabinetId, k.K012_TITLE AS title, k.K012_IS_DIRECTORY AS isDirectory, k.K012_PARENT_ID AS parentId
          FROM K0120_ECT_CABINET k WHERE k.K012_PARENT_ID = 21 AND k.K001_ID = 'ae7d50ed-7566-44f5-b658-49b1205dac81';
           
           
--Получаем корень в конкретном кабинете
          SELECT s.K012_ID AS templateId, s.K001_ID AS cabinetId, s.K012_TITLE AS title, s.K012_IS_DIRECTORY AS isDirectory, s.K012_PARENT_ID AS parentId
         FROM K0120_ECT_CABINET s WHERE s.K012_PARENT_ID IS NULL AND s.K001_ID = 'ae7d50ed-7566-44f5-b658-49b1205dac81';
        
        
        
        
--получить родителя на один уровень выше по cabinetId
        SELECT 
	    node1_.K012_ID as templateId,
	    node1_.K012_TITLE  as title,
    	node1_.K012_IS_DIRECTORY AS isDirectory,
    	node1_.K012_PARENT_ID as parentId,
	    node1_.K001_ID AS cabinetId
		FROM 
	    K0120_ECT_CABINET node0_ 
		LEFT OUTER JOIN 
	    K0120_ECT_CABINET node1_ 
        ON node0_.K012_PARENT_ID = node1_.K012_ID AND node0_.K001_ID  = node1_.K001_ID   
		WHERE 
	    node0_.K012_ID = 21 AND node0_.K001_ID = 'c3f71333-d0fd-4f2f-b554-eb16ba45bf08';
           
           
--Получаем всех родителей - !!! 
          WITH r(templateId, title, parentId, levell, cabinetId) AS
            (SELECT tr.K012_ID , tr.K012_TITLE , tr.K012_PARENT_ID, 1, tr.K001_ID  
	       FROM K0120_ECT_CABINET tl 
	       LEFT JOIN K0120_ECT_CABINET tr 
            ON tl.K012_PARENT_ID  = tr.K012_ID  
	       WHERE tl.K012_ID  = 2006 AND tr.K001_ID = '3eab14e2-0a19-44cd-ad25-24867fdd6135' AND tl.K001_ID = '3eab14e2-0a19-44cd-ad25-24867fdd6135'
            UNION ALL
            SELECT t.K012_ID , t.K012_TITLE, t.K012_PARENT_ID, levell+1, t.K001_ID 
            FROM K0120_ECT_CABINET t, r
            WHERE t.K012_ID  = r.parentId  AND t.K001_ID = '3eab14e2-0a19-44cd-ad25-24867fdd6135')
           SELECT templateId, title, parentId, ROW_NUMBER() OVER (ORDER BY levell DESC) AS levell, cabinetId FROM r;
          
                    
--перемещения узла - требуется всего лишь обновить parent_id перемещаемого узла.
          UPDATE K0120_ECT_CABINET 
			SET PARENT_ID = 23
			WHERE K006_ID = 33 AND K001_ID = 'ae7d50ed-7566-44f5-b658-49b1205dac81';
		
		
--удаление узла идет с удалением всех вложенных папок, т.к. стоит CONSTRAINT fk_parent_id_and_header_id FOREIGN KEY (PARENT_ID, K008_HEAD_ID)
--		DELETE FROM K0060_ELECTRONIC_CATALOG_TEMPLATE WHERE K006_ID = 5 AND K008_HEAD_ID = 2045;
	
	
--вставим новые директории
	INSERT INTO K0120_ECT_CABINET k (k.K012_TITLE , k.K012_IS_DIRECTORY , k.K012_PARENT_ID , k.K001_ID) 
	VALUES ('Тестовая папка 1-2', 1 ,5 , 'ae7d50ed-7566-44f5-b658-49b1205dac81');

SELECT s.K012_ID AS templateId, s.K012_TITLE AS title, s.K012_IS_DIRECTORY AS isDirectory, s.K012_PARENT_ID AS parentId, 
s.K001_ID AS cabinetId FROM K0120_ECT_CABINET s WHERE s.K012_PARENT_ID IS NULL AND s.K001_ID = 'b4f7156a-9a61-44dc-a75e-28308b53ab4c';



DELETE FROM K0120_ECT_CABINET k WHERE k.K012_ID = :nodeId AND K001_ID  = :cabinetId

UPDATE K0120_ECT_CABINET k SET k.K012_TITLE = :title WHERE k.K012_ID = :nodeId AND k.K001_ID = :headerId

UPDATE K0120_ECT_CABINET k 
       SET k.K012_PARENT_ID = :parentId 
       WHERE k.K012_ID = :nodeId AND K001_ID = :cabinetId
       
INSERT INTO K0120_ECT_CABINET k (k.K012_TITLE, k.K012_IS_DIRECTORY , k.K012_PARENT_ID , k.K001_ID) 
    VALUES (:title, 1, :parentId, :cabinetId)
    
    INSERT INTO K0120_ECT_CABINET k (k.K012_ID , k.K012_TITLE, k.K012_IS_DIRECTORY , k.K012_PARENT_ID , k.K001_ID) 
    VALUES (41, 'Файлы ИП', 1, 23, '3eab14e2-0a19-44cd-ad25-24867fdd6135');


SELECT * FROM K0120_ECT_CABINET k WHERE k.K001_ID  = '3eab14e2-0a19-44cd-ad25-24867fdd6135';
--//===P362_insp_files=====================================================================
--//===P362_insp_files====КОНЕЦ============================================================


SELECT * FROM K0120_ECT_CABINET k WHERE k.K001_ID = '43b9045e-387c-4850-8333-f8d80a46baed';
DELETE FROM K0120_ECT_CABINET k WHERE k.K001_ID = '43b9045e-387c-4850-8333-f8d80a46baed';
           
SELECT k.K007_ID, k.K007_FILE_NAME, k.K007_DATE_OF_DOWNLOAD, k.K007_DOC_TYPE, k.K007_PATH_NAME, k.K007_FILE_HASH,
k.K007_FILE_LENGTH, k.K007_FILE_DATA, k.K001_ID, k.K012_ID  
FROM K007_CABINET_FILES k WHERE k.K001_ID = '618644d1-9b73-424b-ab4f-085ff08077a7';

SELECT nvl(k.K007_FILE_LENGTH,0) FROM K007_CABINET_FILES k WHERE k.K001_ID = '618644d1-9b73-424b-ab4f-085ff08077a7';

SELECT (CASE WHEN k.K007_FILE_LENGTH IS NOT NULL THEN k.K007_FILE_LENGTH  ELSE 0 END) AS volume FROM K007_CABINET_FILES k WHERE k.K001_ID = '618644d1-9b73-424b-ab4f-085ff08077a7';

SELECT k.K001_CODE_CAB  FROM K001_CABINET_WORK_GROUP k WHERE k.K001_ID = '9296384a-76d1-4a7d-bae3-4aafb3380331';

(CASE WHEN p.P320_ORG_OKATO  IS NOT NULL THEN p.P320_ORG_OKATO ELSE pio.P600_OKATO END) AS okato

SELECT * FROM K015_PLANNED_CABINETS k WHERE k.K015_TEXT_OF_DESCRIPTION = 'Банк ЧБР';


SELECT p.P600_FULLNAME , p.P600_SHORTNAME , p.P600_ADDRESS , p.P600_OKATO  FROM P600_INSP_OBJECT p WHERE P600_OKATO IS  NULL ;

SELECT p.P600_FULLNAME , p.P600_SHORTNAME , p.P600_ADDRESS , p.P600_OKATO  FROM P600_INSP_OBJECT p JOIN P333_VALID_PARAMS pp 
ON p.P333_ID51 = pp.P333_PARAM_ID ; 


SELECT p.P600_ID , p.P320_ORG_OKATO  FROM P320_COMPOSITE_CHK_NFO p WHERE p.P320_ORG_OKATO  IS  NULL ;
SELECT p.P600_ID , p.P320_ORG_OKATO  FROM P320_COMPOSITE_CHK_NFO p WHERE p.P320_ORG_OKATO  IS not NULL ;
SELECT p.P600_FULLNAME , p.P600_SHORTNAME , p.P600_ADDRESS , p.P600_OKATO  FROM P600_INSP_OBJECT p WHERE P600_id = 2357053 ;
SELECT p.P600_FULLNAME , p.P600_SHORTNAME , p.P600_ADDRESS , p.P600_OKATO  FROM P600_INSP_OBJECT p WHERE P600_id = 3100842;

SELECT p.P600_OGRN , p.P600_INN , p.P600_FULLNAME , p.P600_SHORTNAME , p.P600_ADDRESS , p.P600_PARENT_ID ,
pc.P320_ORG_OKATO , p.P333_ID51 , p.P600_OKATO , pc.P320_ORG_NAME , pc.P320_ORG_SHORTNAME , pc.P320_ORG_INN , pc.P320_ORG_OGRN 
FROM P600_INSP_OBJECT p LEFT JOIN P320_COMPOSITE_CHK_NFO pc ON p.P600_ID = pc.P600_ID ;


SELECT '-=' || k.K001_ID || '=-' AS cabinetId, k.K001_CODE_CAB , k.K001_CHK_DATE_BEGIN  FROM K001_CABINET_WORK_GROUP k WHERE k.P320_CHK_ID  = 3004330;

--3004330


--Субселект по получению данных региона
SELECT 
       ID AS region_Id, 
       FOID AS district_Id,  
       FULLNAME AS full_Name, 
       SHORTNAME AS short_Name,  
       CODE AS okato_Code, 
       CODE2 AS region_Code  
       FROM DEV_OLTP_APPID_DATA.VS_REGIONS A 
       WHERE ID IN (SELECT MAX(TMP.ID) FROM DEV_OLTP_APPID_DATA.VS_REGIONS TMP GROUP BY TMP.CODE) ;
      
SELECT * FROM DEV_OLTP_APPID_DATA.VS_REGIONS;


INSERT INTO K006_ELECTRONIC_CATALOG_TEMPLATE(ID, FILED1, FILED2)
SELECT MAX(ID) + 1, 2, FILED2
FROM K006_ELECTRONIC_CATALOG_TEMPLATE
WHERE FILED1 = 1


INSERT INTO K006_ELECTRONIC_CATALOG_TEMPLATE
  SELECT c.i2+b.i1, c.v
  FROM (SELECT MAX(n) i1 FROM K006_ELECTRONIC_CATALOG_TEMPLATE) b
     , (SELECT n, v, rownum i2 FROM K006_ELECTRONIC_CATALOG_TEMPLATE WHERE n BETWEEN 700 AND 730) c

      
SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.PARENT_ID = 40 AND k.K008_HEAD_ID = 123;



Hibernate: create table k006_epc_template (k006_id bigint not null, k006_title varchar(2000), k008_id bigint not null, k008_header_id bigint not null, k006_parent_id bigint not null, primary key (k008_id, k006_id))
Hibernate: create table k008_header (k008_id bigint not null, k008_head_comment varchar(2000), k008_date_beg timestamp, k008_date_end timestamp, primary key (k008_id))

Hibernate: alter table k006_epc_template add constraint FKq07ngx22l2wytym4ash28osh5 foreign key (k008_id) references k008_header
Hibernate: alter table k006_epc_template add constraint FKtqjpfuudelk4gm1i2qjh3r0xw foreign key (k008_header_id, k006_parent_id) references k006_epc_template

Hibernate: create table k006_epc_template (k008_header_id bigint not null, k006_id bigint not null, k006_title varchar(2000), parent_k008_header_id bigint not null, parent_k006_id bigint not null, primary key (k008_header_id, k006_id))
Hibernate: create table k008_header (k008_id bigint not null, k008_head_comment varchar(2000), k008_date_beg timestamp, k008_date_end timestamp, primary key (k008_id))
Hibernate: create table task (task_id integer not null, employee_employee_id integer not null, primary key (employee_employee_id, task_id))
Hibernate: alter table k006_epc_template add constraint FKc2mm1rn82k0x07cq6lx62akx1 foreign key (parent_k008_header_id, parent_k006_id) references k006_epc_template


Hibernate: create table k006_epc_template (k008_header_id bigint not null, k006_id bigint not null, k006_title varchar(2000), parent_k008_header_id bigint not null, parent_k006_id bigint not null, primary key (k008_header_id, k006_id))
Hibernate: create table k008_header (k008_id bigint not null, k008_head_comment varchar(2000), k008_date_beg timestamp, k008_date_end timestamp, primary key (k008_id))

Hibernate: alter table k006_epc_template add constraint FKc2mm1rn82k0x07cq6lx62akx1 foreign key (parent_k008_header_id, parent_k006_id) references k006_epc_template

Hibernate: select k008header0_.k008_id as k1_3_0_, k008header0_.k008_head_comment as k2_3_0_, k008header0_.k008_date_beg as k3_3_0_, k008header0_.k008_date_end as k4_3_0_ from k008_header k008header0_ where k008header0_.k008_id=?
Hibernate: insert into k008_header (k008_head_comment, k008_date_beg, k008_date_end, k008_id) values (?, ?, ?, ?)
Hibernate: select k008header0_.k008_id as k1_3_0_, k008header0_.k008_head_comment as k2_3_0_, k008header0_.k008_date_beg as k3_3_0_, k008header0_.k008_date_end as k4_3_0_ from k008_header k008header0_ where k008header0_.k008_id=?
Найден хедер: K008Header(id=50, dateBegin=2022-08-26 19:01:40.194562, dateEnd=2022-08-26 19:31:40.194562, comment=История 1)
Есть такой К006: K006EpcTemplate(compositeId=CompositeIdForK006(id=100, header=50), title=INNPPK, parentId=0)
Hibernate: select k006epctem0_.k008_header_id as k1_2_0_, k006epctem0_.k006_id as k2_2_0_, k006epctem0_.k006_parent_id as k3_2_0_, k006epctem0_.k006_title as k4_2_0_ from k006_epc_template k006epctem0_ where k006epctem0_.k008_header_id=? and k006epctem0_.k006_id=?
Hibernate: insert into k006_epc_template (k006_parent_id, k006_title, k008_header_id, k006_id) values (?, ?, ?, ?)


Hibernate: 
select 
k006epctem0_.header_id as header_i1_3_, 
k006epctem0_.template_id as template2_3_, 
k006epctem0_.k008_parent_header_id as k3_3_, 
k006epctem0_.k006_parent_id as k5_3_, 
k006epctem0_.k006_title as k4_3_ 
from k006_epc_template k006epctem0_ 
where 
k006epctem0_.template_id=? 
and 
k006epctem0_.header_id=?

Hibernate: create table k006_epc_template (header_id bigint not null, template_id bigint not null, k006_title varchar(2000), k008_parent_header_id bigint not null, k006_parent_id bigint not null, primary key (header_id, template_id))

--Изменить тип колонки: 
ALTER TABLE k006_epc_template ALTER COLUMN k006_parent_id bigint  NULL;

SELECT * FROM "H$ROLE" h WHERE h.ROLE_MATERIALIZED_PATH = 'ACqhDUFWTJ6Pj37Uj2NLdAJqd6SzUsRNu6T8OQW36njQZeAOXa6ZQc67v9q1qu8sfgnpzHhChjRv6AcQ4FYWF7nAPX-s9D6KSESA5_iRWurBdA';
SELECT * FROM "S$ROLE" s WHERE s.ROLE_MATERIALIZED_PATH = 'LoXCLE4ZScO2MS-6ZTT2IwCpWwED1QTnChdvQzUTfu8AVmjWVSrwQSaYq5lgnHICDwRE6oxDYyRLSoGBOSd-U7bQIu6uAZT9RgmM2bHCaJYOpAN7DX70j-RFqvGJkzhKZhfQF8JEXfnIQdKOHefrMw0Q2gE5bRem8AT4yP2uTVLi8ftAVpOYphEBSn-RkK6jJBiuFQNwuwYFphTuGVGcm5ruj1PwD7p1BKPSRZGeVVWG6uWQNwwvYUcb6wS1qe-dy14RJSaQ2DonU2-sQPGJPHoSMEtrxA8x47t8x-T9y1HtBT7ED56QyQhPczbPRjabodWLUpMUJQXP_KwUKgS7eH7Ugx7vDGUg__exic1hRZa2_OghhYrougq8GrV_NQSrercj8r4uQ88gv_ldkSEATFmAGobkfCJM-wppqsJMulT9-r1i_xy1wZLA6F5aAefwRMeWkF0FkGuxWwPrd6it5NQDCAAYTxysL_JwTCDU3KoVQRyNS6TIIO37CgVqsAT_X5TnOy87v_YXW2GQ';
SELECT count(*) FROM "S$ROLE"; --1655
SELECT count(*) FROM "H$ROLE"; --400


SELECT * FROM P307_OBJ_GIBR p WHERE p.P307_CODE = '9.8';
SELECT * FROM P307_OBJ_GIBR p WHERE p.P307_OBJ_ID  = 2070513;


SELECT * FROM "H$RECORD_SOURCE" h WHERE h.SRC_ID = '2c9e074262f29d0c0162f29d27760151';
SELECT * FROM "H$RECORD_SOURCE" h LEFT outer JOIN "H$ROLE" hr ON h.SRC_ID = hr.SRC_ID WHERE h.SRC_ID = '2c9e074262f29d0c0162f29d27760151';

SELECT *  FROM "S$ROLE" s WHERE s.ROLE_MATERIALIZED_PATH = '-VSfEe3IQJmx9S4-h6tvuQWqHUhaRAQLG8v5lo8dXWsQ'; 
SELECT *  FROM "H$ROLE" s WHERE s.ROLE_MATERIALIZED_PATH = '-VSfEe3IQJmx9S4-h6tvuQWqHUhaRAQLG8v5lo8dXWsQ'; --2022-07-26 16:47:46.298

SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.ID = 40 ;
--DELETE FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.ID =

SELECT * FROM K003_NOTIFICATIONS_AND_CONFIRMATIONS k WHERE k.K003_OPERATION LIKE 'Квота';

 -- UPDATE K003_NOTIFICATIONS_AND_CONFIRMATIONS a SET a.K003_OPERATION  = 'Выделение квоты' WHERE a.K003_OPERATION  = 'Квота';
 --UPDATE K003_NOTIFICATIONS_AND_CONFIRMATIONS a SET a.K003_OPERATION  = 'Активация обмена' WHERE a.K003_OPERATION  = 'Активация';
--UPDATE K003_NOTIFICATIONS_AND_CONFIRMATIONS a SET a.K003_OPERATION  = 'Завершение обмена' WHERE a.K003_OPERATION  = 'Закрытие';
UPDATE K003_NOTIFICATIONS_AND_CONFIRMATIONS a SET a.K003_OPERATION  = 'Текстовое описание' WHERE a.K003_OPERATION  = 'Описание';


--///// Выборка для выбора дат когда были изменения по внесению новых или измененению старых ролей
SELECT DISTINCT trunc(lts,'mi') FROM DEV_OLTP_APPID_DATA.s$role order by 1;



--т.к. у timestamp кратная единица 1 день, то можно к указанному времени добавить 1 минуту = 1 день / 24 часа / 60 минут
--timestamp '2018-05-29 16:27:00.000' + 1/24/60  between lts and nvl(ets, timestamp '2099-12-31 00:00:00')
SELECT x.*,x.ROWID FROM DEV_OLTP_APPID_DATA."S$ROLE" x
WHERE timestamp '2018-04-26 17:36:00.000' + 1/24/60   between lts and nvl(ets, timestamp '2099-12-31 00:00:00')
ORDER BY x.VALID DESC;


--timestamp '2020-01-01 00:00:00' between lts and nvl(ets, timestamp '2099-12-31 00:00:00')

SELECT count(*) FROM "H$RECORD_SOURCE" h ; --9500
SELECT * FROM "H$RECORD_SOURCE" h ORDER BY 2 desc ;


--DELETE FROM K010_DIR_ECT k WHERE k.ROLE_MATERIALIZED_PATH = 'BlvbMVw7Q4SFkLl-4lTPbgYn2BAVegTLe8JSSORpBN3A';
--DELETE FROM K011_ECT k WHERE k.TITLE = 'Материалыыыыы!!!';

UPDATE K011_ECT k SET k.VALID = 1 WHERE k.ROLE_MATERIALIZED_PATH = 'BlvbMVw7Q4SFkLl-4lTPbgYn2BAVegTLe8JSSORpBN3A' ;

UPDATE K011_ECT k SET k.ETS = ? AND k.VALID = 0 WHERE k.ROLE_MATERIALIZED_PATH = ? AND k.ETS IS NULL ;

UPDATE K010_DIR_ECT k SET k.CREATED_AT  = timestamp '2022-08-31 14:37:55.158' WHERE k.ROLE_MATERIALIZED_PATH = 'BlvbMVw7Q4SFkLl-4lTPbgYn2BAVegTLe8JSSORpBN3A';

UPDATE K011_ECT k SET k.ETS = :timestamp AND k.VALID = 0 WHERE k.ROLE_MATERIALIZED_PATH = :id AND k.ETS IS NULL;



SELECT d.ID , d.TITLE , d.TITLE_MATERIALIZED_PATH , d.DEPTH_LEVEL , d.PARENT_TITLE_MATERIALIZED_PATH, d.IS_DIRECTORY, 
DENSE_RANK() OVER (ORDER BY (length(d.TITLE_MATERIALIZED_PATH)) ASC) AS LEV 
 FROM K006_ELECTRONIC_CATALOG_TEMPLATE  d 
 WHERE d.PARENT_TITLE_MATERIALIZED_PATH like ( SELECT (concat(e.TITLE_MATERIALIZED_PATH,'~%')) 
FROM K006_ELECTRONIC_CATALOG_TEMPLATE e WHERE e.ID = 21);

SELECT d.ID , d.TITLE , d.TITLE_MATERIALIZED_PATH , d.DEPTH_LEVEL , d.PARENT_TITLE_MATERIALIZED_PATH, d.IS_DIRECTORY, 
DENSE_RANK() OVER (ORDER BY (length(d.TITLE_MATERIALIZED_PATH)) ASC) AS LEV 
 FROM K006_ELECTRONIC_CATALOG_TEMPLATE  d 
 WHERE d.PARENT_TITLE_MATERIALIZED_PATH like ( SELECT (concat(e.TITLE_MATERIALIZED_PATH,'~%')) 
FROM K006_ELECTRONIC_CATALOG_TEMPLATE e WHERE e.ID = 21);


SELECT (concat(e.TITLE_MATERIALIZED_PATH,'~%')) 
FROM K010_DIR_ECT e WHERE e.TITLE_MATERIALIZED_PATH  = 'BlvbMVw7Q4SFkLl-4lTPbgnVn67KDsQfaICMOZt6IdjQ';


SELECT * FROM K011_ECT s WHERE s.TITLE_MATERIALIZED_PATH  LIKE CONCAT('BlvbMVw7Q4SFkLl-4lTPbg', '%') AND s.ETS IS NULL AND s.VALID = 1;

SELECT * FROM K011_ECT s WHERE s.PARENT_TITLE_MATERIALIZED_PATH LIKE 'BlvbMVw7Q4SFkLl-4lTPbg~' AND s.ETS IS NULL AND s.VALID=1;

SELECT * FROM K011_ECT s WHERE s.PARENT_TITLE_MATERIALIZED_PATH LIKE 'BlvbMVw7Q4SFkLl-4lTPbg~' AND s.ETS IS NULL;

 
UPDATE K004_MEMBER_TO_CABINET k SET k.K004_ADDITIONAL_POWERS = 'Куратор ПЛ' WHERE k.K001_ID = '2a2945a7-4b30-401d-b331-3377b9195195' 
AND k.K002_ID = 'e68fe9ad-ce5e-45c4-bfad-3baf5f654ed4' AND k.K004_EXCLUDED_STATUS = 0;

UPDATE K004_MEMBER_TO_CABINET k SET k.K004_EXCLUDED_STATUS = 1, k.K004_DATE_TO = CURRENT_TIMESTAMP  WHERE k.K001_ID = '2a2945a7-4b30-401d-b331-3377b9195195' 
AND k.K002_ID = 'e68fe9ad-ce5e-45c4-bfad-3baf5f654ed4' AND k.K004_EXCLUDED_STATUS = 0 AND k.K004_DATE_TO IS NULL ;

UPDATE K004_MEMBER_TO_CABINET k SET k.K004_ACTIVE_STATUS = 1, k.K004_UNLOCK_DATE = CURRENT_TIMESTAMP  WHERE k.K001_ID = '2a2945a7-4b30-401d-b331-3377b9195195' 
AND k.K002_ID = '5a5638e6-ab5a-4831-8f7f-acf6985b7239';

UPDATE K004_MEMBER_TO_CABINET k SET k.K004_EXCLUDED_STATUS = 0 WHERE k.K004_ID = 187; 

UPDATE K004_MEMBER_TO_CABINET k SET k.K004_EXCLUDED_STATUS = 0, k.K004_DATE_FROM = CURRENT_TIMESTAMP, k.K004_DATE_TO = null WHERE k.K001_ID = '28604f31-c949-4d30-baba-d0eecd43320c' 
AND k.K002_ID = '5a5638e6-ab5a-4831-8f7f-acf6985b7239';



SELECT * FROM K004_MEMBER_TO_CABINET k WHERE k.K001_ID = '28604f31-c949-4d30-baba-d0eecd43320c'; 
--AND k.K002_ID = '5a5638e6-ab5a-4831-8f7f-acf6985b7239';


SELECT 
c.K004_ID AS record_id,
g.K002_ID as id, 
g.K002_FIO as fio, 
g.K002_JOB_TITLE as job_title, 
c.K004_ADDITIONAL_POWERS as additional_powers, 
g.K002_ROLE as role_of_members, 
c.K004_EXCLUDED_STATUS AS excluded,
c.K004_DATE_FROM  as date_from, 
c.K004_DATE_TO as date_to, 
c.K004_ACTIVE_STATUS AS active, 
c.K004_LOCK_DATE AS lock_date,
c.K004_UNLOCK_DATE AS unlock_date,
c.K004_COMMENT  as notes  
FROM K004_MEMBER_TO_CABINET c JOIN K002_GROUP_MEMBER g on c.K002_ID = g.K002_ID  WHERE 
c.K001_ID = '28604f31-c949-4d30-baba-d0eecd43320c' 
AND k004_id IN (SELECT max(k004_id) FROM k004_member_to_cabinet GROUP BY k002_id, k001_id);


--DELETE FROM K004_MEMBER_TO_CABINET k WHERE k.K004_ID = 1001;



SELECT s.K012_ID as templateId, s.TITLE, s.TITLE_MATERIALIZED_PATH , s.DEPTH_LEVEL , s.PARENT_TITLE_MATERIALIZED_PATH, s.IS_DIRECTORY, s.PARENT_ID as parentId, s.K001_ID as cabinetId 
FROM K012_ECT_CABINET s WHERE s.PARENT_TITLE_MATERIALIZED_PATH  = '~' AND s.K001_ID = '57fc9253-7922-497c-8df7-03abaa7cdae3';

SELECT s.K006_ID as templateId, s.TITLE, s.TITLE_MATERIALIZED_PATH , s.DEPTH_LEVEL , s.PARENT_TITLE_MATERIALIZED_PATH, s.IS_DIRECTORY, s.PARENT_ID as parentId, s.K008_HEAD_ID as headerIdK008 
FROM K006_ELECTRONIC_CATALOG_TEMPLATE s WHERE s.PARENT_TITLE_MATERIALIZED_PATH  = '~' AND s.K008_HEAD_ID = (SELECT max(k.K008_HEAD_ID) FROM K006_ELECTRONIC_CATALOG_TEMPLATE k )


INSERT INTO K012_ECT_CABINET k (
k.K012_ID, k.TITLE, k.TITLE_MATERIALIZED_PATH, k.DEPTH_LEVEL, k.PARENT_TITLE_MATERIALIZED_PATH, k.IS_DIRECTORY, k.PARENT_ID, k.K001_ID) 
SELECT p.K006_ID , p.TITLE , p.TITLE_MATERIALIZED_PATH , p.DEPTH_LEVEL , p.PARENT_TITLE_MATERIALIZED_PATH , p.IS_DIRECTORY , p.PARENT_ID , '57fc9253-7922-497c-8df7-03abaa7cdae3' 
FROM K006_ELECTRONIC_CATALOG_TEMPLATE p WHERE p.K008_HEAD_ID = (SELECT max(s.K008_HEAD_ID) FROM K006_ELECTRONIC_CATALOG_TEMPLATE s );

--DELETE FROM K012_ECT_CABINET kec ;

INSERT INTO K006_ELECTRONIC_CATALOG_TEMPLATE k (
k.K006_ID,k.TITLE, k.TITLE_MATERIALIZED_PATH, k.DEPTH_LEVEL, k.PARENT_TITLE_MATERIALIZED_PATH, k.IS_DIRECTORY, k.PARENT_ID, k.K008_HEAD_ID) 
SELECT p.ID , p.TITLE , p.TITLE_MATERIALIZED_PATH , p.DEPTH_LEVEL , p.PARENT_TITLE_MATERIALIZED_PATH , p.IS_DIRECTORY , p.PARENT_ID , ?1 
FROM K006_ELECTRONIC_CATALOG_TEMPLATE p WHERE p.K008_HEAD_ID = ?2


SELECT p.K006_ID, p.TITLE , p.TITLE_MATERIALIZED_PATH , p.DEPTH_LEVEL , p.PARENT_TITLE_MATERIALIZED_PATH , p.IS_DIRECTORY , p.PARENT_ID , p.K008_HEAD_ID  
FROM K006_ELECTRONIC_CATALOG_TEMPLATE p WHERE p.K008_HEAD_ID = (SELECT max(s.K008_HEAD_ID) FROM K006_ELECTRONIC_CATALOG_TEMPLATE s );

SELECT* FROM K001_CABINET_WORK_GROUP k WHERE k.K001_ID = '57fc9253-7922-497c-8df7-03abaa7cdae3';

SELECT s.K012_ID as templateId, s.TITLE, s.TITLE_MATERIALIZED_PATH , s.DEPTH_LEVEL , s.PARENT_TITLE_MATERIALIZED_PATH, 
s.IS_DIRECTORY, s.PARENT_ID as parentId, s.K001_ID as cabinetId 
FROM K012_ECT_CABINET s WHERE s.PARENT_TITLE_MATERIALIZED_PATH  = '~' AND s.K001_ID =  'ccc79711-8aa5-4189-a774-97ec43f482f5';

--DELETE FROM K012_ECT_CABINET k WHERE k.K012_ID = ?1 AND k.K001_ID = ?2;

SELECT * FROM K012_ECT_CABINET k WHERE k.

--DELETE FROM K012_ECT_CABINET k WHERE k.TITLE_MATERIALIZED_PATH like ? OR k.TITLE_MATERIALIZED_PATH = ?;





SELECT d.K012_ID , d.TITLE , d.TITLE_MATERIALIZED_PATH , d.DEPTH_LEVEL , d.PARENT_TITLE_MATERIALIZED_PATH, d.IS_DIRECTORY, d.PARENT_ID,
 d.K001_ID, DENSE_RANK() OVER (ORDER BY (length(d.TITLE_MATERIALIZED_PATH)) ASC) AS LEV 
 FROM K012_ECT_CABINET d 
 WHERE d.PARENT_TITLE_MATERIALIZED_PATH like 
(SELECT (concat(e.TITLE_MATERIALIZED_PATH,'~%')) FROM K012_ECT_CABINET e WHERE e.K012_ID = 21  AND e.K001_ID = '57fc9253-7922-497c-8df7-03abaa7cdae3' ) 
AND d.K001_ID = '57fc9253-7922-497c-8df7-03abaa7cdae3';


SELECT max(k.K008_HEAD_ID) FROM K008_HEAD_EPC k ;

SELECT k.K006_ID  FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K008_HEAD_ID = 125;

SELECT k.K012_ID FROM K012_ECT_CABINET k WHERE k.K001_ID = '';

SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE s WHERE s.PARENT_TITLE_MATERIALIZED_PATH  = '~' AND s.K008_HEAD_ID = (SELECT max(k.K008_HEAD_ID) FROM K006_ELECTRONIC_CATALOG_TEMPLATE k );

SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE k WHERE k.K006_ID = 21 AND k.K008_HEAD_ID = 125;

--DELETE FROM K012_ECT_CABINET ;


SELECT d.K006_ID , d.TITLE , d.TITLE_MATERIALIZED_PATH , d.DEPTH_LEVEL , d.PARENT_TITLE_MATERIALIZED_PATH, d.IS_DIRECTORY, d.PARENT_ID, d.K008_HEAD_ID,
DENSE_RANK() OVER (ORDER BY (length(d.TITLE_MATERIALIZED_PATH)) ASC) AS LEV 
 FROM K006_ELECTRONIC_CATALOG_TEMPLATE d 
 WHERE d.PARENT_TITLE_MATERIALIZED_PATH like ( SELECT (concat(e.TITLE_MATERIALIZED_PATH,'%')) 
FROM K006_ELECTRONIC_CATALOG_TEMPLATE e WHERE e.K006_ID  = ?);


SELECT d.K006_ID , d.TITLE , d.TITLE_MATERIALIZED_PATH , d.DEPTH_LEVEL , d.PARENT_TITLE_MATERIALIZED_PATH, d.IS_DIRECTORY, d.PARENT_ID,
 d.K008_HEAD_ID, DENSE_RANK() OVER (ORDER BY (length(d.TITLE_MATERIALIZED_PATH)) ASC) AS LEV 
 FROM K006_ELECTRONIC_CATALOG_TEMPLATE d 
 WHERE d.PARENT_TITLE_MATERIALIZED_PATH like 
(SELECT (concat(e.TITLE_MATERIALIZED_PATH,'~%')) FROM K006_ELECTRONIC_CATALOG_TEMPLATE e WHERE e.K006_ID = 23  AND e.K008_HEAD_ID = 
(SELECT max(k.K008_HEAD_ID) FROM K006_ELECTRONIC_CATALOG_TEMPLATE k )) AND d.K008_HEAD_ID = (SELECT max(k.K008_HEAD_ID) FROM K006_ELECTRONIC_CATALOG_TEMPLATE k );

SELECT * FROM K006_ELECTRONIC_CATALOG_TEMPLATE s WHERE s.PARENT_TITLE_MATERIALIZED_PATH LIKE '6AaKLW_KSYmSwRFfMCgKNgI8d9BQeRSXejqPqPqMRvSg~' AND s.K008_HEAD_ID = 125;



 
INSERT INTO K014_NOTIFICATION_FEED a ( a.K014_ID ,a."SOURCE" ,a.ERROR_CODE_OR_TEXT , a.IS_VIEWED ,a.K001_ID )
  SELECT p.P360_CHK_CODE , p.P360_CHK_DATE_BEGIN , p.P360_CHK_END_DATE  , p.P360_ORG_NAME , p.P360_ORG_INN , p.P360_KO_REGNUM , p.P360_CHK_STATUS 
    FROM P360_INSP_CHK_NFO p WHERE  ROWNUM <=10; 

   
--Выборка данных для Уведомлений ДТО   
SELECT 
c.K014_ID AS id,
c.SOURCE AS source,
c.ERROR_CODE_OR_TEXT AS errorCodeOrText,
c.IS_VIEWED AS isViewed,
c.MESSAGE_VIEWED_BY_USER AS viewedByUser,
c.K001_ID AS cabinetId,
c.CREATED_AT AS createdAt,
c.MODIFIED_AT AS modifiedAt
FROM K014_NOTIFICATION_FEED c 
WHERE c.K001_ID = '3810a11e-693d-4842-9e82-4d051e450e14';


UPDATE K014_NOTIFICATION_FEED k SET k.MODIFIED_AT = CURRENT_TIMESTAMP , k.IS_VIEWED = 1, k.MESSAGE_VIEWED_BY_USER = ? WHERE k.K014_ID = 'e551e1ed0bfb5b88e053040011acadb3'; 


 
--Выюорка данных по названию регионов по ОКАТО
--start
SELECT  
    ID AS region_Id,  
    FOID AS district_Id,  
    FULLNAME AS full_Name,  
    SHORTNAME AS short_Name,  
    CODE AS okato_Code,  
    CODE2 AS region_Code  
FROM DEV_OLTP_APPID_DATA.VS_REGIONS A 
WHERE ID IN (SELECT MAX(TMP.ID) FROM DEV_OLTP_APPID_DATA.VS_REGIONS TMP GROUP BY TMP.CODE) AND A.CODE = 50;


SELECT FULLNAME AS full_Name FROM DEV_OLTP_APPID_DATA.VS_REGIONS A 
WHERE ID IN (SELECT MAX(TMP.ID) FROM DEV_OLTP_APPID_DATA.VS_REGIONS TMP GROUP BY TMP.CODE) AND A.CODE = 71 AND ROWNUM = 1;
--end

--
SELECT 
max(p.P320_CHK_ID) as P320_CHK_ID, 
p.P320_INITIAL_CHK, 
p.P320_CHK_SHEDULE_DATE, 
p.P320_CHK_PERIOD_E, 
p.P320_ORG_NAME, 
pio.P600_FULLNAME, 
pio.P600_ADDRESS, 
p.P320_ORG_ADDRESS_FACT AS ADDRESS_FACT, 
pio.P600_INN, 
pio.P600_OGRN, 
km.FREGNUM, 
(CASE WHEN p.P320_ORG_OKATO  IS NOT NULL THEN p.P320_ORG_OKATO ELSE pio.P600_OKATO END) AS okato 
FROM P320_COMPOSITE_CHK_NFO p 
LEFT JOIN P600_INSP_OBJECT pio ON p.P600_ID = pio.P600_ID 
LEFT JOIN K_MERGED km ON  pio.RBASE_CID = km.RBASE_CID 
WHERE p.P320_CHK_SHEDULE_DATE >= to_date('2018-08-31', 'yyyy-MM-dd') AND p.P320_CHK_SHEDULE_DATE <= to_date('2019-12-31', 'yyyy-MM-dd') 
GROUP BY p.P320_INITIAL_CHK, p.P320_CHK_SHEDULE_DATE, p.P320_CHK_PERIOD_E, p.P320_ORG_NAME, pio.P600_FULLNAME, 
pio.P600_ADDRESS, p.P320_ORG_ADDRESS_FACT, pio.P600_INN, pio.P600_OGRN, km.FREGNUM, p.P320_ORG_OKATO, pio.P600_OKATO 
ORDER BY p.P320_INITIAL_CHK ASC;


SELECT * FROM K001_CABINET_WORK_GROUP k WHERE k.K001_CODE_CAB = 85;


SELECT d.K006_ID , d.TITLE , d.TITLE_MATERIALIZED_PATH , d.DEPTH_LEVEL , d.PARENT_TITLE_MATERIALIZED_PATH, d.IS_DIRECTORY, d.K008_HEAD_ID ,
DENSE_RANK() OVER (ORDER BY (length(d.TITLE_MATERIALIZED_PATH)) ASC) AS LEV 
 FROM K006_ELECTRONIC_CATALOG_TEMPLATE d 
 WHERE d.TITLE_MATERIALIZED_PATH like ( SELECT (concat('6AaKLW_KSYmSwRFfMCgKNg','%')) 
FROM K006_ELECTRONIC_CATALOG_TEMPLATE e WHERE e.K006_ID = 21 AND e.K008_HEAD_ID = 125) AND d.K008_HEAD_ID = 125;

--получить всю чепочку каталога, т.е. все записи
SELECT d.K006_ID , d.TITLE , d.TITLE_MATERIALIZED_PATH , d.DEPTH_LEVEL , d.PARENT_TITLE_MATERIALIZED_PATH, d.IS_DIRECTORY, d.PARENT_ID, 
d.K008_HEAD_ID ,DENSE_RANK() OVER (ORDER BY (length(d.TITLE_MATERIALIZED_PATH)) ASC) AS LEV 
 FROM K006_ELECTRONIC_CATALOG_TEMPLATE d 
 WHERE d.TITLE_MATERIALIZED_PATH like ( SELECT (concat(e.TITLE_MATERIALIZED_PATH,'%')) 
FROM K006_ELECTRONIC_CATALOG_TEMPLATE e WHERE e.K006_ID = 21 AND e.K008_HEAD_ID = 125) AND d.K008_HEAD_ID = 125;

--получить детей на следующем уровне т.е. на 1 уровень ниже
SELECT d.K006_ID , d.TITLE , d.TITLE_MATERIALIZED_PATH , d.DEPTH_LEVEL , d.PARENT_TITLE_MATERIALIZED_PATH, d.IS_DIRECTORY, d.PARENT_ID,
 d.K008_HEAD_ID, DENSE_RANK() OVER (ORDER BY (length(d.TITLE_MATERIALIZED_PATH)) ASC) AS LEV 
 FROM K006_ELECTRONIC_CATALOG_TEMPLATE d 
 WHERE d.PARENT_TITLE_MATERIALIZED_PATH like 
(SELECT (concat(e.TITLE_MATERIALIZED_PATH,'~%')) FROM K006_ELECTRONIC_CATALOG_TEMPLATE e WHERE e.K006_ID = 23  AND e.K008_HEAD_ID = 125 ) 
AND d.K008_HEAD_ID = 125;


SELECT d.K006_ID , d.TITLE , d.TITLE_MATERIALIZED_PATH , d.DEPTH_LEVEL , d.PARENT_TITLE_MATERIALIZED_PATH, d.IS_DIRECTORY, d.PARENT_ID,
 d.K008_HEAD_ID, DENSE_RANK() OVER (ORDER BY (length(d.TITLE_MATERIALIZED_PATH)) ASC) AS LEV 
 FROM K006_ELECTRONIC_CATALOG_TEMPLATE d 
 WHERE d.PARENT_TITLE_MATERIALIZED_PATH like 
(SELECT (concat(e.TITLE_MATERIALIZED_PATH,'~%')) FROM K006_ELECTRONIC_CATALOG_TEMPLATE e WHERE e.K006_ID = 21  AND e.K008_HEAD_ID = 
(SELECT max(k.K008_HEAD_ID) FROM K006_ELECTRONIC_CATALOG_TEMPLATE k )) AND d.K008_HEAD_ID = (SELECT max(k.K008_HEAD_ID) FROM K006_ELECTRONIC_CATALOG_TEMPLATE k );


 
--UPDATE K014_NOTIFICATION_FEED a SET a.K001_ID = 'f60adf34-4c53-4cad-a7b6-cbf0db6d7d6e' WHERE a.K001_ID = 'c8d85d54-089b-4edb-8e05-55835b63a207';


SELECT * FROM V_AUDIT_QUESTIONS_NFO v WHERE v.P333_QUESTION_CODE = 'k00';

SELECT * FROM V_CHK_NFO_QST v WHERE v.QST_CODE  = 'k00';

SELECT * FROM V_QUESTIONS_NFO v WHERE v.QST_CODE = 'k00';

SELECT * FROM V_PLAN_QUESTIONS v WHERE v.P320_CHK_ID = ;


INSERT INTO K015_PLANNED_CABINETS pc (pc.K015_ID , pc.P320_CHK_ID, pc.K015_DATE_OF_CREATION, pc.K015_TEXT_OF_DESCRIPTION)  
SELECT :id, :chkId, :dateOfCreation, :textDescription FROM dual 
WHERE NOT EXISTS ( 
    SELECT 1 FROM K015_PLANNED_CABINETS kk 
    WHERE kk.P320_CHK_ID = :chkId );
    
    
   
--/////Если путь к файлу данных неизвестен, вы можете использовать следующую инструкцию для запроса:
SELECT a.tablespace_name "tbs name", b.NAME "file path" 
FROM dba_tablespaces a, v$datafile b, v$tablespace c 
  WHERE a.tablespace_name = c.NAME 
  AND c.ts# = b.ts#; 
--/////--------------------------------------------------------------------------------------------

DELETE FROM DOCS d WHERE id >= 1128 ;
SELECT count(*) FROM DOCS d ;
    
    

SELECT * FROM K004_MEMBER_TO_CABINET k WHERE k.K001_ID = '9bcdf937-60df-4450-9500-9c642981e4c5';

 
   
   
   
--выбрать дату и представить ее в виде МЕСЯЦ(словами) - ГОД   
SELECT p.P320_CHK_ID , p.P320_CHK_SHEDULE_DATE ,
--TO_CHAR(p.P320_CHK_SHEDULE_DATE,'dd.mm.yyyy'),
TO_CHAR(p.P320_CHK_SHEDULE_DATE,'FMMonth DD, YYYY'),
TO_CHAR(p.P320_CHK_SHEDULE_DATE,'FMMonth , YYYY'),
'Проверка ' || lower(TO_CHAR(p.P320_CHK_SHEDULE_DATE,'FMMonth , YYYY'))
FROM P320_COMPOSITE_CHK_NFO p WHERE p.P320_CHK_ID in( SELECT k.P320_CHK_ID  FROM K015_PLANNED_CABINETS k );

SELECT count(*) FROM P320_COMPOSITE_CHK_NFO p LEFT JOIN K015_PLANNED_CABINETS k ON p.P320_CHK_ID = k.P320_CHK_ID 
WHERE p.P320_CHK_ID in( SELECT k.P320_CHK_ID  FROM K015_PLANNED_CABINETS k ) AND k.K015_IS_CREATED  = 0;

--INSERT INTO K015_PLANNED_CABINETS k (k.K015_TEXT_OF_DESCRIPTION) 
--SELECT 
--'Проверка ' || lower(TO_CHAR(p.P320_CHK_SHEDULE_DATE,'FMMonth , YYYY'))
--FROM P320_COMPOSITE_CHK_NFO p LEFT JOIN K015_PLANNED_CABINETS k ON p.P320_CHK_ID = k.P320_CHK_ID
--WHERE p.P320_CHK_ID in( SELECT k.P320_CHK_ID  FROM K015_PLANNED_CABINETS k )  AND k.K015_IS_CREATED  = 0; 

--Проставил всем полям K015_TEXT_OF_DESCRIPTION утвержденную заготовку: "Проверка сентябрь, 2020"
UPDATE K015_PLANNED_CABINETS k 
SET k.K015_TEXT_OF_DESCRIPTION = (
SELECT 
'Проверка ' || (lower(TO_CHAR(p.P320_CHK_SHEDULE_DATE,'FMMonth, YYYY')))
FROM P320_COMPOSITE_CHK_NFO p WHERE p.P320_CHK_ID = k.P320_CHK_ID)
WHERE
k.K015_IS_CREATED  = 0;

--скопировать данные колонки из одной колонки в другую (одна и таже таблица)
UPDATE table_name 
SET column1 = column2
--скопировать данные колонки из одной колонки в другую (разные таблицы)
UPDATE table_name1 
    SET column1 = (
        SELECT column2
        FROM table_name2
        WHERE table_name1.id = table_name2.id
    );
   

TO_CHAR(CURRENT_TIMESTAMP, 'YYYY/MM/DD HH24:MI:DD')

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



--/////-СТАРТ--------------------------------------------------------------------------

SELECT * FROM "H$FPSID_USER" hu JOIN "L$USER_TO_ROLE" lu ON hu.USER_ID = lu.USER_ID JOIN "H$ROLE" hr ON hr.ROLE_MATERIALIZED_PATH = lu.ROLE_MATERIALIZED_PATH ; 

--/////-КОНЕЦ--------------------------------------------------------------------------





