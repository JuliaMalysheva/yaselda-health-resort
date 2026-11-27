-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Ноя 26 2026 г., 10:03
-- Версия сервера: 5.6.37
-- Версия PHP: 7.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `myyaseldaby`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL COMMENT 'Идентификатор администратора',
  `login` varchar(80) NOT NULL COMMENT 'Логин',
  `password` varchar(80) NOT NULL COMMENT 'Пароль'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `contacts`
--

CREATE TABLE `contacts` (
  `section_id` int(11) NOT NULL COMMENT 'Идентификатор блока',
  `section_name` char(25) NOT NULL COMMENT 'Название блока ',
  `text` text NOT NULL COMMENT 'Содержание',
  `position` int(11) NOT NULL COMMENT 'Порядковый номер блока',
  `visible` int(11) NOT NULL COMMENT 'Видимость'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `doctors`
--

CREATE TABLE `doctors` (
  `doctor_id` int(11) NOT NULL COMMENT 'Идентификатор врача',
  `fio` char(255) NOT NULL COMMENT 'ФИО врача',
  `image` char(80) NOT NULL COMMENT 'Фотография врача',
  `specialization` char(255) NOT NULL COMMENT 'Специализация врача',
  `position` int(11) NOT NULL COMMENT 'Порядковый номер  карточки врача',
  `visible` int(11) NOT NULL COMMENT 'Видимость'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL COMMENT 'Идентификатор меню',
  `menu_name` char(40) NOT NULL COMMENT 'Название пункта меню',
  `menu_link` char(255) NOT NULL COMMENT 'Ссылка на страницу',
  `position` int(11) NOT NULL COMMENT 'Порядковый номер пункта меню',
  `visible` int(11) NOT NULL COMMENT 'Видимость'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL COMMENT 'Идентификатор страницы',
  `page_name` char(80) NOT NULL COMMENT 'Название страницы',
  `page_link` char(255) NOT NULL COMMENT 'Ссылка на страницу',
  `title` char(255) NOT NULL COMMENT 'Отображается в заголовке вкладки браузера',
  `keywords` char(255) NOT NULL COMMENT 'Ключевые слова',
  `description` char(255) NOT NULL COMMENT 'Описание страницы',
  `h1` char(80) NOT NULL COMMENT 'Заголовок на странице',
  `background` char(50) NOT NULL COMMENT 'Главная картинка',
  `crumbs` varchar(3000) NOT NULL COMMENT 'Навигационная цепочка',
  `page_text` text NOT NULL COMMENT 'Основное текстовое содержимое страницы',
  `template_id` int(11) NOT NULL COMMENT 'Идентификатор шаблона',
  `visible` int(11) NOT NULL COMMENT 'Видимость',
  `menu_id` int(11) NOT NULL COMMENT 'Идентификатор пункта меню'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `phoneBook`
--

CREATE TABLE `phoneBook` (
  `phone_id` int(11) NOT NULL COMMENT 'Идентификатор номера телефона',
  `fio` char(80) NOT NULL COMMENT 'ФИО специалиста',
  `role` char(80) NOT NULL COMMENT 'Должность',
  `phone` char(20) NOT NULL COMMENT 'Номер телефона',
  `position` int(11) NOT NULL COMMENT 'Порядковый номер',
  `visible` int(11) NOT NULL COMMENT 'Видимость'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `procedures`
--

CREATE TABLE `procedures` (
  `medProcedure_id` int(11) NOT NULL COMMENT 'Идентификатор процедуры',
  `procedure_name` char(255) NOT NULL COMMENT 'Название процедуры',
  `description` varchar(1000) NOT NULL COMMENT 'Описание процедуры',
  `image` char(80) NOT NULL COMMENT 'Название файла с фотографией',
  `type_id` int(11) NOT NULL COMMENT 'Определяет, к какому типу относится данная процедура',
  `position` int(11) NOT NULL COMMENT 'Порядковый номер',
  `visible` int(11) NOT NULL COMMENT 'Видимость'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `procedureTypes`
--

CREATE TABLE `procedureTypes` (
  `type_id` int(11) NOT NULL COMMENT 'Идентификатор типа процедур',
  `type_name` char(255) NOT NULL COMMENT 'Название типа процедур',
  `category` int(11) NOT NULL COMMENT 'Категория: мед.процедуры или спа-процедуры',
  `visible` int(11) NOT NULL COMMENT 'Видимость',
  `position` int(11) NOT NULL COMMENT 'Порядковый номер'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `roomCards`
--

CREATE TABLE `roomCards` (
  `roomCard_id` int(11) NOT NULL COMMENT 'Идентификатор карточки номера',
  `room_name` char(80) NOT NULL COMMENT 'Название типа номера',
  `image` char(255) NOT NULL COMMENT 'Название файла с фотографией',
  `link` char(255) NOT NULL COMMENT 'Ссылка на страницу с подробным описанием',
  `description` char(255) NOT NULL COMMENT 'Краткое описание номера',
  `position` int(11) NOT NULL COMMENT 'Порядковый номер карточки',
  `visible` int(11) NOT NULL COMMENT 'Видимость'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sliderDoctors`
--

CREATE TABLE `sliderDoctors` (
  `slide_id` int(11) NOT NULL COMMENT 'Идентификатор слайда',
  `image` char(255) NOT NULL COMMENT 'Название файла с фотографией',
  `position` int(11) NOT NULL COMMENT 'Порядковый номер',
  `visible` int(11) NOT NULL COMMENT 'Видимость'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sliderRooms`
--

CREATE TABLE `sliderRooms` (
  `photo_id` int(11) NOT NULL COMMENT 'Идентификатор слайда',
  `image` char(80) NOT NULL COMMENT 'Название файла с фотографией',
  `position` int(11) NOT NULL COMMENT 'Порядковый номер',
  `visible` int(11) NOT NULL COMMENT 'Видимость',
  `page_id` int(11) NOT NULL COMMENT 'Идентификатор страницы, на которой отображается слайдер'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Индексы таблицы `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`section_id`);

--
-- Индексы таблицы `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Индексы таблицы `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Индексы таблицы `phoneBook`
--
ALTER TABLE `phoneBook`
  ADD PRIMARY KEY (`phone_id`);

--
-- Индексы таблицы `procedures`
--
ALTER TABLE `procedures`
  ADD PRIMARY KEY (`medProcedure_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Индексы таблицы `procedureTypes`
--
ALTER TABLE `procedureTypes`
  ADD PRIMARY KEY (`type_id`);

--
-- Индексы таблицы `roomCards`
--
ALTER TABLE `roomCards`
  ADD PRIMARY KEY (`roomCard_id`);

--
-- Индексы таблицы `sliderDoctors`
--
ALTER TABLE `sliderDoctors`
  ADD PRIMARY KEY (`slide_id`);

--
-- Индексы таблицы `sliderRooms`
--
ALTER TABLE `sliderRooms`
  ADD KEY `photo_id` (`photo_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор администратора', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `contacts`
--
ALTER TABLE `contacts`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор блока', AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор врача', AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор меню', AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор страницы', AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `phoneBook`
--
ALTER TABLE `phoneBook`
  MODIFY `phone_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор номера телефона', AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `procedures`
--
ALTER TABLE `procedures`
  MODIFY `medProcedure_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор процедуры', AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT для таблицы `procedureTypes`
--
ALTER TABLE `procedureTypes`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор типа процедур', AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `roomCards`
--
ALTER TABLE `roomCards`
  MODIFY `roomCard_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор карточки номера', AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `sliderDoctors`
--
ALTER TABLE `sliderDoctors`
  MODIFY `slide_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор слайда', AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `sliderRooms`
--
ALTER TABLE `sliderRooms`
  MODIFY `photo_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор слайда', AUTO_INCREMENT=7;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`);

--
-- Ограничения внешнего ключа таблицы `procedures`
--
ALTER TABLE `procedures`
  ADD CONSTRAINT `procedures_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `procedureTypes` (`type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
