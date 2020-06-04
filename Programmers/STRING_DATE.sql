-- LV2. 루시와 엘라 찾기
SELECT ANIMAL_ID, NAME, SEX_UPON_INTAKE
FROM ANIMAL_INS
WHERE NAME IN ('Lucy', 'Ella', 'Pickle', 'Rogan', 'Sabrina', 'Mitty')
-- WHERE NAME='Lucy' OR NAME='Ella' OR NAME='Pickle' OR NAME='Rogan' OR NAME='Sabrina' OR NAME='Mitty'
ORDER BY ANIMAL_ID;

-- LV2. 이름에 el이 들어가는 동물 찾기
SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE NAME LIKE '%el%' and ANIMAL_TYPE='Dog'
ORDER BY NAME;

-- LV2. 중성화 여부 파악하기
SELECT ANIMAL_ID, NAME, 
    CASE
        WHEN SEX_UPON_INTAKE LIKE "%NEUTERED%" THEN 'O'
        WHEN SEX_UPON_INTAKE LIKE "%SPAYED%" THEN 'O'
        ELSE 'X'
    END AS "중성화"
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;

-- LV2. DATETIME에서 DATE로 형 변환
SELECT ANIMAL_ID, NAME, DATE_FORMAT(DATETIME, '%Y-%m-%d') AS "날짜"
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;

-- LV3. 오랜 기간 보호한 동물(2)
SELECT DISTINCT I.ANIMAL_ID, I.NAME
FROM ANIMAL_INS I, ANIMAL_OUTS O
WHERE I.ANIMAL_ID = O.ANIMAL_ID
ORDER BY O.DATETIME-I.DATETIME DESC LIMIT 2
