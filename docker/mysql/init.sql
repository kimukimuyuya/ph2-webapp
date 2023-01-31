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
(32, '2023-01-01', 0),
(33, '2023-01-02', 4),
(34, '2023-01-03', 2),
(35, '2023-01-04', 2),
(36, '2023-01-05', 3),
(37, '2023-01-06', 2),
(38, '2023-01-07', 4),
(39, '2023-01-08', 3),
(40, '2023-01-09', 3),
(41, '2023-01-10', 5),
(42, '2023-01-11', 1),
(43, '2023-01-12', 0),
(44, '2023-01-13', 2),
(45, '2023-01-14', 1),
(46, '2023-01-15', 5),
(47, '2023-01-16', 0),
(48, '2023-01-17', 0),
(49, '2023-01-18', 0),
(50, '2023-01-19', 2),
(51, '2023-01-20', 3),
(52, '2023-01-21', 3),
(53, '2023-01-22', 1),
(54, '2023-01-23', 4),
(55, '2023-01-24', 0),
(56, '2023-01-25', 0),
(57, '2023-01-26', 0),
(58, '2023-01-27', 2),
(59, '2023-01-28', 4),
(60, '2023-01-29', 0),
(61, '2023-01-30', 1),
(62, '2023-01-31', 0);

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
  FOREIGN KEY (webapp_id) REFERENCES webapp(id)
  -- FOREIGN KEY (content_id) REFERENCES contents(id)
);


INSERT INTO webapp_contents (id, webapp_id, content_id) VALUES
(1, 33, 1),
(2, 33, 3),
(3, 34, 2),
(4, 34, 3),
(5, 35, 1),
(6, 36, 3),
(7, 37, 1),
(8, 38, 1),
(9, 38, 2),
(10, 39, 1),
(11, 40, 2),
(12, 41, 1),
(13, 41, 2),
(14, 41, 3),
(15, 42, 3),
(16, 44, 2),
(17, 45, 2),
(18, 46, 1),
(19, 46, 3),
(20, 50, 3),
(21, 51, 1),
(22, 52, 1),
(23, 53, 2),
(24, 54, 1),
(25, 54, 2),
(26, 58, 2),
(27, 59, 2),
(28, 59, 3),
(29, 61, 3);


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
  FOREIGN KEY (webapp_id) REFERENCES webapp(id)
  -- FOREIGN KEY (language) REFERENCES languages(id)
);

INSERT INTO webapp_languages (id, webapp_id, language) VALUES
(1, 33, 1),
(2, 33, 2),
(3, 34, 4),
(4, 35, 6),
(5, 36, 1),
(6, 36, 3),
(7, 36, 8),
(8, 37, 5),
(9, 38, 7),
(10, 38, 2),
(11, 38, 5),
(12, 38, 7),
(13, 39, 8),
(14, 40, 1),
(15, 41, 3),
(16, 41, 5),
(17, 42, 2),
(18, 44, 8),
(19, 45, 6),
(20, 46, 3),
(21, 46, 4),
(22, 50, 1),
(23, 51, 7),
(24, 51, 8),
(25, 52, 3),
(26, 53, 4),
(27, 54, 2),
(28, 54, 5),
(29, 54, 6),
(30, 58, 1),
(31, 59, 5),
(32, 59, 8),
(33, 61, 1);

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
