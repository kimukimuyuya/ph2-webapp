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
(38, '2023-01-06', 2),
(39, '2023-01-07', 4),
(40, '2023-01-08', 3),
(41, '2023-01-09', 3),
(42, '2023-01-10', 5),
(43, '2023-01-11', 1),
(44, '2023-01-12', 0),
(45, '2023-01-13', 2),
(46, '2023-01-14', 1),
(47, '2023-01-15', 5),
(48, '2023-01-16', 0),
(49, '2023-01-17', 0),
(50, '2023-01-18', 0),
(51, '2023-01-19', 2),
(52, '2023-01-20', 3),
(53, '2023-01-21', 3),
(54, '2023-01-22', 1),
(55, '2023-01-23', 4),
(56, '2023-01-24', 0),
(57, '2023-01-25', 0),
(58, '2023-01-26', 0),
(59, '2023-01-27', 2),
(60, '2023-01-28', 4),
(61, '2023-01-29', 0),
(62, '2023-01-30', 1),
(63, '2023-01-31', 0);

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
