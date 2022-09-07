use sakila;

-- Creating the table films_2020 

drop table if exists films_2020;

CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8mb4;


show variables like 'local_infile';
set global local_infile = 1;

-- I've imported the data from films_2020.csv using data_import_wizard

select * from films_2020;

-- Updating rental duration, rental rate and replacement cost

Update films_2020 set rental_duration = rental_duration + 3 
where rental_duration = 0;  
Update films_2020 set rental_rate = rental_rate + 2.99 
where rental_rate = 0.00;
Update films_2020 set replacement_cost = replacement_cost + 8.99 
where replacement_cost = 0.00;
