DROP DATABASE IF EXISTS posse;
CREATE DATABASE posse;
USE posse;




CREATE TABLE webapp (
  id INT AUTO_INCREMENT PRIMARY KEY,
  date DATETIME COMMENT '学習日',
  hours INT COMMENT '学習時間'
);

INSERT INTO webapp (id, date, hours) VALUES
(1, '2022-12-01', 3),
(2, '2022-12-02', 1),
(3, '2022-12-03', 2),
(4, '2022-12-04', 5),
(5, '2022-12-05', 6),
(6, '2022-12-06', 1),
(7, '2022-12-07', 3),
(8, '2022-12-08', 2),
(9, '2022-12-09', 2),
(10, '2022-12-10', 3),
(11, '2022-12-11', 3),
(12, '2022-12-12', 4),
(13, '2022-12-13', 2),
(14, '2022-12-14', 1),
(15, '2022-12-15', 1),
(16, '2022-12-16', 3),
(17, '2022-12-17', 1),
(18, '2022-12-18', 0),
(19, '2022-12-19', 3),
(20, '2022-12-20', 1),
(21, '2022-12-21', 2),
(22, '2022-12-22', 2),
(23, '2022-12-23', 0),
(24, '2022-12-24', 1),
(25, '2022-12-25', 1),
(26, '2022-12-26', 4),
(27, '2022-12-27', 3),
(28, '2022-12-28', 0),
(29, '2022-12-29', 3),
(30, '2022-12-30', 3),
(31, '2022-12-31', 5),
(32, '2023-02-01', 0),
(33, '2023-02-02', 4),
(34, '2023-02-03', 2),
(35, '2023-02-04', 2),
(36, '2023-02-05', 3),
(37, '2023-02-06', 2),
(38, '2023-02-07', 4),
(39, '2023-02-08', 3),
(40, '2023-02-09', 3),
(41, '2023-02-10', 5),
(42, '2023-02-11', 1),
(43, '2023-02-12', 0),
(44, '2023-02-13', 2),
(45, '2023-02-14', 1),
(46, '2023-02-15', 5),
(47, '2023-02-16', 0),
(48, '2023-02-17', 0),
(49, '2023-02-18', 0),
(50, '2023-02-19', 2),
(51, '2023-02-20', 3),
(52, '2023-02-21', 3),
(53, '2023-02-22', 1),
(54, '2023-02-23', 4),
(55, '2023-02-24', 0),
(56, '2023-02-25', 0),
(57, '2023-02-26', 0),
(58, '2023-02-27', 2),
(59, '2023-02-28', 4);


-- DROP TABLE IF EXISTS webapp;
-- CREATE TABLE webapp (
--   id INT AUTO_INCREMENT PRIMARY KEY,
--   date DATETIME COMMENT '学習日',
--   hours INT COMMENT '学習時間'
-- ) CHAESET=utf8;



CREATE TABLE webapp_contents (
  id INT AUTO_INCREMENT PRIMARY KEY,
  webapp_id INT,
  content_id INT,
  content_hour INT,
  FOREIGN KEY (webapp_id) REFERENCES webapp(id)
  -- FOREIGN KEY (content_id) REFERENCES contents(id)
);


INSERT INTO webapp_contents (id, webapp_id, content_id, content_hour) VALUES
(1, 33, 1, 2),
(2, 33, 3, 2),
(3, 34, 2, 1),
(4, 34, 3, 1),
(5, 35, 1, 2),
(6, 36, 3, 3),
(7, 37, 1, 2),
(8, 38, 1, 2),
(9, 38, 2, 2),
(10, 39, 1, 3),
(11, 40, 2, 3),
(12, 41, 1, 1),
(13, 41, 2, 1),
(14, 41, 3, 1),
(15, 42, 3, 1),
(16, 44, 2, 2),
(17, 45, 2, 1),
(18, 46, 1, 2),
(19, 46, 3, 2),
(20, 50, 3, 2),
(21, 51, 1, 3),
(22, 52, 1, 3),
(23, 53, 2, 1),
(24, 54, 1, 2),
(25, 54, 2, 2),
(26, 58, 2, 2),
(27, 59, 2, 2),
(28, 59, 3, 2);


CREATE TABLE contents (
  id INT AUTO_INCREMENT PRIMARY KEY,
  content VARCHAR(255)
);



INSERT INTO contents (id, content) VALUES
(1, 'N予備校'),
(2, 'ドットインストール'),
(3, 'POSSE課題');


CREATE TABLE webapp_languages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  webapp_id INT,
  language INT,
  language_hour INT,
  FOREIGN KEY (webapp_id) REFERENCES webapp(id)
  -- FOREIGN KEY (language) REFERENCES languages(id)
);

INSERT INTO webapp_languages (id, webapp_id, language, language_hour) VALUES
(1, 33, 1, 2),
(2, 33, 2, 2),
(3, 34, 4, 2),
(4, 35, 6, 2),
(5, 36, 1, 1),
(6, 36, 3, 1),
(7, 36, 8, 1),
(8, 37, 5, 2),
(9, 38, 7, 1),
(10, 38, 2, 1),
(11, 38, 5, 1),
(12, 38, 7, 1),
(13, 39, 8, 3),
(14, 40, 1, 3),
(15, 41, 3, 2),
(16, 41, 5, 2),
(17, 42, 2, 1),
(18, 44, 8, 2),
(19, 45, 6, 1),
(20, 46, 3, 2),
(21, 46, 4, 2),
(22, 50, 1, 2),
(23, 51, 7, 1),
(24, 51, 8, 1),
(25, 52, 3, 3),
(26, 53, 4, 1),
(27, 54, 2, 1),
(28, 54, 5, 1),
(29, 54, 6, 1),
(30, 58, 1, 2),
(31, 59, 5, 2),
(32, 59, 8, 2);

CREATE TABLE languages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  language VARCHAR(255)
);

INSERT INTO languages (id, language) VALUES
(1, 'HTML'),
(2, 'CSS'),
(3, 'JavaScript'),
(4, 'PHP'),
(5, 'Laravel'),
(6, 'SQL'),
(7, 'SHELL'),
(8, '情報システム（その他）');
