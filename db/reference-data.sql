SET NAMES utf8mb4;

START TRANSACTION;

INSERT INTO hospitals (id, hospital_name, address, phone) VALUES
(1,  '가람동물병원', '대전광역시 동구 옥천로 193, 1층 (판암동)', '042-345-7588'),
(2,  '가양동물의료센터', '대전광역시 동구 동대전로 280 (가양동)', '042-636-8855'),
(3,  '다사랑동물병원', '대전광역시 동구 비래서로 54 (가양동)', '042-628-0075'),
(4,  '24시 더원동물메디컬센터', '대전광역시 동구 계족로 510 (용전동)', '042-623-8461'),
(5,  '라온동물병원', '대전광역시 동구 대전로 446 (가오동)', '042-273-8660'),
(6,  '라온펫동물병원', '대전광역시 동구 계족로 405 (홍도동)', '042-627-8875'),
(7,  '레인보우동물병원', '대전광역시 동구 우암로171번길 72 (성남동)', '042-636-1424'),
(8,  '미소동물병원', '대전광역시 동구 계족로 10, 일신빌딩 106호 (효동)', '042-272-3141'),
(9,  '솔펫동물병원', '대전광역시 동구 동대전로 141 (자양동, 우송 제2교육원)', '042-622-7525'),
(10, '웰니스 동물병원 대전복합터미널', '대전광역시 동구 동서대로 1689, 대전복합터미널(서관) 3층 (용전동)', '042-624-6275');

INSERT INTO specialties (id, spec_name) VALUES
(1, '내과'),
(2, '외과'),
(3, '피부과'),
(4, '치과'),
(5, '영상의학과');

INSERT INTO vets (id, hospital_id, vet_name) VALUES
(1,  1,  '김민준'),
(2,  2,  '이서연'),
(3,  3,  '박도윤'),
(4,  4,  '최지우'),
(5,  5,  '정하준'),
(6,  6,  '강수아'),
(7,  7,  '조시우'),
(8,  8,  '윤하은'),
(9,  9,  '장예준'),
(10, 10, '임서윤');

INSERT INTO vets (id, hospital_id, vet_name)
SELECT h.id + 10 * extra.n,
       h.id,
       CONCAT(ELT(h.id, '김', '이', '박', '최', '정', '강', '조', '윤', '장', '임'),
              ELT(extra.n, '지호', '서진', '현서', '도하'))
FROM hospitals h
CROSS JOIN (
    SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
) extra
WHERE h.id BETWEEN 1 AND 10
ORDER BY h.id + 10 * extra.n;

INSERT INTO vet_specialties (vet_id, specialty_id) VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 1),
(3, 5),
(4, 3),
(5, 4),
(6, 1),
(7, 2),
(7, 5),
(8, 3),
(9, 4);

INSERT INTO vet_specialties (vet_id, specialty_id)
SELECT id, MOD(id - 1, 5) + 1
FROM vets
WHERE id BETWEEN 11 AND 50;

INSERT INTO types (id, type_name) VALUES
(1, '개'),
(2, '고양이'),
(3, '토끼'),
(4, '햄스터'),
(5, '새'),
(6, '거북이'),
(7, '돼지'),
(8, '기니피그'),
(9, '친칠라'),
(10, '패럿'),
(11, '고슴도치');

COMMIT;
