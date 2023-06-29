-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 29 Cze 2023, 23:19
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `rank_elo`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `druzyny`
--

CREATE TABLE `druzyny` (
  `id` int(11) NOT NULL,
  `team` varchar(30) NOT NULL,
  `country_code` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `druzyny`
--

INSERT INTO `druzyny` (`id`, `team`, `country_code`) VALUES
(3, 'Arsenal', 'ENG'),
(9, 'Aston Villa', 'ENG'),
(18, 'Augsburg', 'GER'),
(13, 'Bayer Leverkusen', 'GER'),
(11, 'Bayern Monachium', 'GER'),
(12, 'Borussia Dortmund', 'GER'),
(2, 'Chelsea', 'ENG'),
(10, 'Crystal Palace', 'ENG'),
(14, 'Eintracht Frankfurt', 'GER'),
(19, 'Freiburg', 'GER'),
(7, 'Leeds', 'ENG'),
(1, 'Liverpool', 'ENG'),
(20, 'Mainz', 'GER'),
(5, 'Manchester City', 'ENG'),
(4, 'Manchester United', 'ENG'),
(8, 'Newcastle', 'ENG'),
(16, 'RB Lipsk', 'GER'),
(6, 'Tottenham', 'ENG'),
(15, 'Union Berlin', 'GER'),
(17, 'Wolfsburg', 'GER');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `mecze_eng`
--

CREATE TABLE `mecze_eng` (
  `id` int(4) NOT NULL,
  `data pierw` varchar(21) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `day` int(2) DEFAULT NULL,
  `month` int(2) DEFAULT NULL,
  `year` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `home_id` int(4) DEFAULT NULL,
  `home_team` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `home_country_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `home_result` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `home_last_game` int(4) DEFAULT NULL,
  `away_id` int(4) DEFAULT NULL,
  `away_team` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `away_country_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `away_result` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `away_last_game` int(4) DEFAULT NULL,
  `link` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `margin` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `level` int(1) DEFAULT NULL,
  `game_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `mecze_eng`
--

INSERT INTO `mecze_eng` (`id`, `data pierw`, `day`, `month`, `year`, `home_id`, `home_team`, `home_country_code`, `home_result`, `home_last_game`, `away_id`, `away_team`, `away_country_code`, `away_result`, `away_last_game`, `link`, `date`, `margin`, `level`, `game_type`) VALUES
(2, NULL, 27, 5, '2023', 3, 'Arsenal', 'ENG', '2', 2023, 9, 'Aston Villa', 'ENG', '0', 2023, NULL, NULL, '1', 1, 'league'),
(3, NULL, 29, 5, '2023', 1, 'Liverpool', 'ENG', '3', 2023, 6, 'Tottenham', 'ENG', '1', 2023, NULL, '2023-05-29', '2', 1, 'league'),
(4, NULL, 27, 5, '2023', 2, 'Chelsea', 'ENG', '0', 2023, 7, 'Leeds', 'ENG', '3', 2023, NULL, '2023-05-27', '3', 1, 'league'),
(5, '', 30, 5, '2023', 4, 'Manchester United', 'ENG', '0', 2023, 5, 'Manchester City', 'ENG', '0', 2023, NULL, '2023-05-30', '0', 1, 'league'),
(6, '', 31, 5, '2023', 8, 'Newcastle', 'ENG', '1', 2023, 10, 'Crystal Palace', 'ENG', '2', 2023, NULL, '2023-05-31', '0', 1, 'league');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `mecze_europa`
--

CREATE TABLE `mecze_europa` (
  `id` int(4) NOT NULL,
  `data pierw` varchar(21) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `day` int(2) DEFAULT NULL,
  `month` int(2) DEFAULT NULL,
  `year` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `home_id` int(4) DEFAULT NULL,
  `home_team` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `home_country_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `home_result` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `home_last_game` int(4) DEFAULT NULL,
  `away_id` int(4) DEFAULT NULL,
  `away_team` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `away_country_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `away_result` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `away_last_game` int(4) DEFAULT NULL,
  `link` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `margin` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `level` int(1) DEFAULT NULL,
  `game_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `mecze_europa`
--

INSERT INTO `mecze_europa` (`id`, `data pierw`, `day`, `month`, `year`, `home_id`, `home_team`, `home_country_code`, `home_result`, `home_last_game`, `away_id`, `away_team`, `away_country_code`, `away_result`, `away_last_game`, `link`, `date`, `margin`, `level`, `game_type`) VALUES
(1, NULL, 5, 6, '2023', 3, 'Arsenal', 'ENG', '3', 2023, 16, 'RB Lipsk', 'GER', '0', 2023, NULL, '2023-06-05', '3', 1, 'cup'),
(2, NULL, 5, 6, '2023', 19, 'Freiburg', 'GER', '2', 2023, 8, 'Newcastle', 'ENG', '2', 2023, NULL, '2023-06-05', '0', 1, 'cup'),
(3, NULL, 5, 6, '2023', 2, 'Chelsea', 'ENG', '1', 2023, 11, 'Bayern Monachium', 'GER', '2', 2023, NULL, '2023-06-05', '1', 1, 'cup');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `mecze_ger`
--

CREATE TABLE `mecze_ger` (
  `id` int(4) NOT NULL,
  `data pierw` varchar(21) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `day` int(2) DEFAULT NULL,
  `month` int(2) DEFAULT NULL,
  `year` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `home_id` int(4) DEFAULT NULL,
  `home_team` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `home_country_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `home_result` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `home_last_game` int(4) DEFAULT NULL,
  `away_id` int(4) DEFAULT NULL,
  `away_team` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `away_country_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `away_result` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `away_last_game` int(4) DEFAULT NULL,
  `link` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `margin` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `level` int(1) DEFAULT NULL,
  `game_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `mecze_ger`
--

INSERT INTO `mecze_ger` (`id`, `data pierw`, `day`, `month`, `year`, `home_id`, `home_team`, `home_country_code`, `home_result`, `home_last_game`, `away_id`, `away_team`, `away_country_code`, `away_result`, `away_last_game`, `link`, `date`, `margin`, `level`, `game_type`) VALUES
(1, NULL, 27, 5, '2023', 18, 'Augsburg', 'GER', '1', 2023, 13, 'Bayer Leverkusen', 'GER', '2', 2023, NULL, '2023-05-27', '1', 1, 'league'),
(2, NULL, 27, 5, '2023', 11, 'Bayern Monachium', 'GER', '4', 2023, 12, 'Borussia Dortmund', 'GER', '2', 2023, NULL, '2023-05-27', '2', 1, 'league'),
(3, NULL, 27, 5, '2023', 14, 'Eintracht Frankfurt', 'GER', '3', 2023, 19, 'Freiburg', 'GER', '3', 2023, NULL, '2023-05-27', '0', 1, 'league'),
(4, NULL, 27, 5, '2023', 20, 'Mainz', 'GER', '0', 2023, 16, 'RB Lipsk', 'GER', '1', 2023, NULL, '2023-05-27', '1', 1, 'league'),
(5, NULL, 27, 5, '2023', 15, 'Union Berlin', 'GER', '4', 2023, 17, 'Wolfsburg', 'GER', '1', 2023, NULL, '2023-05-27', '3', 1, 'league');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `druzyny`
--
ALTER TABLE `druzyny`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team` (`team`,`country_code`),
  ADD KEY `team_2` (`team`,`country_code`);

--
-- Indeksy dla tabeli `mecze_eng`
--
ALTER TABLE `mecze_eng`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_id` (`home_id`),
  ADD KEY `away_id` (`away_id`),
  ADD KEY `home_team` (`home_team`,`home_country_code`,`away_team`,`away_country_code`);

--
-- Indeksy dla tabeli `mecze_europa`
--
ALTER TABLE `mecze_europa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_id` (`home_id`,`away_id`),
  ADD KEY `away_id` (`away_id`),
  ADD KEY `home_team` (`home_team`,`home_country_code`,`away_team`,`away_country_code`);

--
-- Indeksy dla tabeli `mecze_ger`
--
ALTER TABLE `mecze_ger`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_id` (`home_id`,`away_id`),
  ADD KEY `away_id` (`away_id`),
  ADD KEY `home_team` (`home_team`,`home_country_code`,`away_team`,`away_country_code`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `druzyny`
--
ALTER TABLE `druzyny`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT dla tabeli `mecze_eng`
--
ALTER TABLE `mecze_eng`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `mecze_europa`
--
ALTER TABLE `mecze_europa`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `mecze_ger`
--
ALTER TABLE `mecze_ger`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `mecze_eng`
--
ALTER TABLE `mecze_eng`
  ADD CONSTRAINT `1` FOREIGN KEY (`home_id`) REFERENCES `druzyny` (`id`),
  ADD CONSTRAINT `2` FOREIGN KEY (`away_id`) REFERENCES `druzyny` (`id`);

--
-- Ograniczenia dla tabeli `mecze_europa`
--
ALTER TABLE `mecze_europa`
  ADD CONSTRAINT `mecze_europa_ibfk_1` FOREIGN KEY (`away_id`) REFERENCES `druzyny` (`id`),
  ADD CONSTRAINT `mecze_europa_ibfk_2` FOREIGN KEY (`home_id`) REFERENCES `druzyny` (`id`);

--
-- Ograniczenia dla tabeli `mecze_ger`
--
ALTER TABLE `mecze_ger`
  ADD CONSTRAINT `mecze_ger_ibfk_1` FOREIGN KEY (`home_id`) REFERENCES `druzyny` (`id`),
  ADD CONSTRAINT `mecze_ger_ibfk_2` FOREIGN KEY (`away_id`) REFERENCES `druzyny` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
