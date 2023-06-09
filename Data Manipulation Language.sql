-- DATA MANIPULATION LANGUAGE, DML --

/* INSERT RECORDS INTO A TABLE */
INSERT INTO MARKSBOOK VALUES (001, 'ABDULLAH AISHA', 'SCIENCE', 16, 'F', 80, 'PASSED', 'AA@G.COM');
INSERT INTO MARKSBOOK VALUES (002, 'ABDULRAUF ROSHEEDAT', 'SCIENCE', 16, 'F', 77, 'PASSED', 'AR@G.COM');
INSERT INTO MARKSBOOK VALUES (003, 'CHARLES DICK', 'HUMANITIES', 18, 'M', 46, 'FAILED', 'CD@G.COM');
INSERT INTO MARKSBOOK VALUES (004, 'DICKSON AWESOME', 'SCIENCE', 16, 'M', 90, 'PASSED', 'DA@G.COM');
INSERT INTO MARKSBOOK VALUES (005, 'ELUTIDE BLESSING', 'SCIENCE', 15, 'F', 72, 'PASSED', 'EB@G.COM');
INSERT INTO MARKSBOOK VALUES (006, 'JAMES BLESSING', 'HUMANITIES', 18, 'F', 80, 'PASSED', 'JB@G.COM');
INSERT INTO MARKSBOOK VALUES (007, 'MOSES SIMON', 'BUSINESS', 17, 'M', 70, 'PASSED', 'MS@G.COM');
INSERT INTO MARKSBOOK VALUES (006, 'NATHAN FRED', 'HUMANITIES', 16, 'F', 40, 'FAILED', 'NF@G.COM');
INSERT INTO MARKSBOOK VALUES (009, 'WITZEN JONAS', 'BUSINESS', 15, 'F', 85, 'PASSED', 'WJ@G.COM');
INSERT INTO MARKSBOOK VALUES (010, 'YEKEEN ROFIAT', 'SCIENCE', 14, 'F', 70, 'PASSED', 'YF@G.COM');

/* RETRIEVE ALL RECORDS FROM THE TABLE */
SELECT * FROM MARKSBOOK;

/* RETRIEVE A PARTICULAR RECORD FROM A TABLE */
SELECT * FROM MARKSBOOK WHERE STUDENT_NAME = 'DICKSON AWESOME';

/* DELETE A RECORD FROM A TABLE */
DELETE FROM MARKSBOOK WHERE DEPT = 'HUMANITIES';

/* UPDATE TABLE */
-- N.B. IN THE SET PARAMETER, YOU CAN'T SET 2 COLUMNS AT A TIME
UPDATE MARKSBOOK SET AGE = 16 WHERE STUDENT_ID = 010;
UPDATE MARKSBOOK SET DEPT = 'BUSINESS' WHERE STUDENT_ID = 010;

-- FILTER & OPERATORS (N.B. -- IS FOR COMMENTING)
SELECT * FROM MARKSBOOK WHERE STUDENT_NAME LIKE 'E%'; -- START WITH 'E'
SELECT * FROM MARKSBOOK WHERE STUDENT_NAME LIKE '%E'; -- END WITH 'E'
SELECT * FROM MARKSBOOK WHERE STUDENT_NAME LIKE '%E%'; -- HAVE 'E' IN ANY POSITION
SELECT * FROM MARKSBOOK WHERE STUDENT_NAME LIKE '_E%'; -- HAVE 'E' IN 2ND POSTION
SELECT * FROM MARKSBOOK WHERE STUDENT_NAME LIKE 'A_%'; -- STARTS WITH 'A' & ARE >= 2 CHARACTERS LONG
SELECT * FROM MARKSBOOK WHERE STUDENT_NAME LIKE 'E%E'; -- STARTS WITH 'E' & ENDS WF 'E'
SELECT * FROM MARKSBOOK WHERE STUDENT_NAME LIKE 'E%' OR DEPT = 'BUSINESS';
SELECT * FROM MARKSBOOK WHERE STUDENT_NAME LIKE 'E%' AND DEPT = 'BUSINESS';
SELECT * FROM MARKSBOOK WHERE AGE = 16 AND DEPT = 'HUMANITIES';
SELECT * FROM MARKSBOOK WHERE NOT DEPT = 'SCIENCE';
SELECT * FROM MARKSBOOK WHERE STUDENT_ID IN (001, 004);
SELECT * FROM MARKSBOOK WHERE STUDENT_ID BETWEEN 001 AND 004;

-- AGGREGATE FUNCTIONS E.G. MIN, MAX, SUM; ALIAS (AS), GROUP BY, HAVING,
SELECT MIN(AGE) FROM MARKSBOOK;
SELECT STUDENT_NAME FROM MARKSBOOK WHERE AGE = 16;
SELECT COUNT(*) FROM MARKSBOOK;
SELECT COUNT(DISTINCT(DEPT)) AS AVAILABLE_DEPT FROM MARKSBOOK;
SELECT AVG(AGE) AS AVERAGE_SCI FROM MARKSBOOK WHERE DEPT = 'SCIENCE';
SELECT ROUND(AVG(AGE), 2) AS AVERAGE_SCI FROM MARKSBOOK WHERE DEPT = 'SCIENCE';
SELECT COUNT(REMARK), DEPT FROM MARKSBOOK GROUP BY REMARK;  -- NOT THE RIGHT WAY
SELECT COUNT(REMARK), DEPT FROM MARKSBOOK GROUP BY DEPT;
SELECT COUNT(REMARK), DEPT FROM MARKSBOOK GROUP BY DEPT HAVING COUNT(REMARK) > 3;

-- INSERT FROM ANOTHER TABLE
INSERT INTO TABLE_A
SELECT * FROM TABLE_B
WHERE COLUMN_B2 = 'SCIENCE'