CREATE DATABASE ctams;

CREATE TABLE director(
director_id INT  PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(50) NOT NULL,
contact VARCHAR(20) NOT NULL,
email VARCHAR(100) NOT NULL
);
INSERT INTO `director` (`director_id`, `name`, `contact`, `email`) 
VALUES (NULL, 'Md Aslam', '0197836191', 'aslam@gmail.com'), (NULL, 'Fahim Ahmed', '0179163922', 'fahim@gmail.com'), (NULL, 'Mizanur Rahman', '01591239861', 'mizanur@gmail.com');


CREATE TABLE agencies(
agency_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(100) NOT NULL,
director_id INT NOT NULL,
head_office VARCHAR(50) NOT NULL,
location VARCHAR(100) NOT NULL,
hotline VARCHAR(20) NOT NULL,
email VARCHAR(100) NOT NULL,
FOREIGN KEY (director_id) REFERENCES director(director_id)
);
INSERT INTO `agencies` (`agency_id`, `name`, `director_id`, `head_office`, `location`, `hotline`, `email`) 
VALUES (NULL, 'AB Group', '1', 'Dhaka Branch', 'Polton, Dhaka', '202050', 'abgroup@gmail.com'), (NULL, 'XY Travels', '2', 'Mirpur Branch', 'Mirpur-10, Dhaka', '334567', 'xytravels@gmail.com'), (NULL, 'Safe Travels', '3', 'Gazipur Branch', 'Abdullahpur, Gazipur', '908075', 'safetravels@gmail.com');


CREATE TABLE branches(
branch_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
agency_id INT NOT NULL,
address VARCHAR(200) NOT NULL,
contact VARCHAR(20) NOT NULL,
FOREIGN KEY (agency_id) REFERENCES agencies(agency_id)
);
INSERT INTO `branches` (`branch_id`, `name`, `agency_id`, `address`, `contact`) 
VALUES (NULL, 'Chattogram Branch', '1', 'Chattogram city, Chattogram', '89732474'), (NULL, 'Dhaka Branch', '1', 'Polton, Dhaka', '202050'), (NULL, 'Barishal Branch', '1', 'Nothullabad, Barishal', '0217410');


CREATE TABLE agents(
agents_id INT  PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(50) NOT NULL,
agency_id INT NOT NULL,
contact VARCHAR(20) NOT NULL,
email VARCHAR(100) NOT NULL,
FOREIGN KEY (agency_id) REFERENCES agencies(agency_id)
);
INSERT INTO `agents` (`agents_id`, `name`, `agency_id`, `contact`, `email`) 
VALUES (NULL, 'Asif', '1', '2198309127', 'asif@gmail.com'), (NULL, 'Saif', '2', '30471042', 'saif@gmail.com'), (NULL, 'Hasan', '3', '0347203709723', 'hasan@gmail.com';


CREATE TABLE packages(
package_id INT PRIMARY KEY  AUTO_INCREMENT NOT NULL,
name VARCHAR(100) NOT NULL,
agency_id INT NOT NULL,
destination VARCHAR(200) NOT NULL,
cost DECIMAL(8,2) NOT NULL,
FOREIGN KEY (agency_id) REFERENCES agencies(agency_id)
);
INSERT INTO `packages` (`package_id`, `name`, `agency_id`, `destination`, `cost`) 
VALUES (NULL, 'Bandarban Tour', '1', 'Bandarban', '7000'), (NULL, 'Cox-bazar Tour', '3', 'Cox-bazar', '5000');


CREATE TABLE package_info(
info_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
package_id INT NOT NULL,
starting_point VARCHAR(50) NOT NULL,
duration VARCHAR(50) NOT NULL,
description VARCHAR(250) NOT NULL,
transport_id INT NOT NULL,
hotel_id INT NOT NULL,
FOREIGN KEY (package_id) REFERENCES packages(package_id),
FOREIGN KEY (transport_id) REFERENCES transportation(transport_id),
FOREIGN KEY (hotel_id) REFERENCES hotel(hotle_id)
);
INSERT INTO `package_info` (`info_id`, `package_id`, `starting_point`, `duration`, `description`, `transport_id`, `hotel_id`) 
VALUES (NULL, '1', 'Dhaka', '3 Days, 2 Nights', 'Bandarban er Bandar Dorshan.', '2', '2'), (NULL, '2', 'Dhaka', '4 Days, 3 Nights', 'Sweet moments', '1', '1');


CREATE TABLE tour_group(
group_id INT PRIMARY KEY  AUTO_INCREMENT NOT NULL,
name VARCHAR(50) NOT NULL,
package_id INT NOT NULL,
descriptions VARCHAR(200) NOT NULL,
max_members INT NOT NULL,
FOREIGN KEY (package_id) REFERENCES packages(package_id)
);
INSERT INTO `tour_group` (`group_id`, `name`, `package_id`, `descriptions`, `max_members`) 
VALUES (NULL, 'group 1', '1', 'happy journey', '15'), (NULL, 'group 2', '2', 'have a safe travel', '20');


CREATE TABLE guides(
guide_id INT PRIMARY KEY  AUTO_INCREMENT NOT NULL,
name VARCHAR(50) NOT NULL,
phone VARCHAR(20) NOT NULL,
email VARCHAR(100) NOT NULL,
experiences VARCHAR(100) NOT NULL,
group_id INT NOT NULL,
FOREIGN KEY (group_id) REFERENCES tour_group(group_id)
);
INSERT INTO `guides` (`guide_id`, `name`, `phone`, `email`, `experiences`, `group_id`) 
VALUES (NULL, 'Sabbir', '0914710', 'sabbir@gmail.com', 'leading group 56 times.', '1'), (NULL, 'Imran', '01795835248', 'imran@gmail.com', 'guiding groups accorss the country.', '2');


CREATE TABLE customers(
customer_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(50) NOT NULL,
package_id INT NOT NULL,
address VARCHAR(100) NOT NULL,
contact` VARCHAR(20) NOT NULL,
email VARCHAR(100) NOT NULL ),
FOREIGN KEY (package_id) REFERENCES packages(package_id),
);
INSERT INTO `customers` (`customer_id`, `name`, `package_id`, `address`, `contact`, `email`) 
VALUES (NULL, 'Ayesha Akter', '2', 'chandpur', '18263912', 'ayakter@bu.ac.bd'), (NULL, 'Salma', '1', 'Jhinaidah', '3824792323', 'salma@gmail.com');


CREATE TABLE payment(
payment_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
customer_id INT NOT NULL,
amount DECIMAL(8,2) NOT NULL,
method VARCHAR(20) NOT NULL,
payment_date DATETIME default CURRENT_TIMESTAMP NOT NULL,
reference VARCHAR(30) NOT NULL,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO `payment` (`payment_id`, `customer_id`, `amount`, `method`, `payment_date`, `reference`) 
VALUES (NULL, '1', '5000', 'Bkash', current_timestamp(), 'idn839udn2io'), (NULL, '2', '6000', 'Nagad', current_timestamp(), '893edn23udj');


CREATE TABLE transportation(
transport_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL ,
company_name VARCHAR(100) NOT NULL,
type VARCHAR(20) NOT NULL,
starting_point VARCHAR(30) NOT NULL,
destination VARCHAR(30) NOT NULL,
hotline VARCHAR(20) NOT NULL,
);
INSERT INTO `transportation` (`transport_id`, `company_name`, `type`, `starting_point`, `destination`, `hotline`) 
VALUES (NULL, 'SR Travel', 'Bus', 'Dhaka', 'Coxbazar', '0917413'), (NULL, 'Himalay Express', 'Bus', 'Dhaka', 'Bandarban', '27230479');


CREATE TABLE hotel(
hotle_id INT PRIMARY KEY AUTO_INCREMENT  NOT NULL,
name VARCHAR(50) NOT NULL,
manager VARCHAR(50) NOT NULL,
contact VARCHAR(20) NOT NULL,
address VARCHAR(200) NOT NULL,
email VARCHAR(100) NOT NULL
);
INSERT INTO `hotel` (`hotle_id`, `name`, `manager`, `contact`, `address`, `email`) 
VALUES (NULL, 'Rest Point', 'Ifterkhar', '912740993', 'Cox-bazar,Chattogram', 'restpoint@gmail.com'), (NULL, 'Sky View Inn', 'Sabbira', '21984741', 'Bandarban', 'skyviewinn@gmail.com');


CREATE TABLE package_review(
pr_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT NOT NULL,
package_id INT NOT NULL,
rating ENUM('Very Bad', 'Bad', 'Average', 'Good', 'Very good') NOT NULL,
comments VARCHAR(250),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (package_id) REFERENCES packages(package_id)
);
INSERT INTO `package_review` (`pr_id`, `customer_id`, `package_id`, `rating`, `comments`) 
VALUES (NULL, '1', '2', 'Very good', 'Was the best experience.'), (NULL, '2', '1', 'Very good', 'All the Bandars were very cute.');


CREATE TABLE agency_review(
ar_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT NOT NULL,
agency_id INT NOT NULL,
rating ENUM('Very Bad', 'Bad', 'Average', 'Good', 'Very good') NOT NULL,
comments VARCHAR(250),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (agency_id) REFERENCES agencies(agency_id)
);
INSERT INTO `agency_review` (`ar_id`, `customer_id`, `agency_id`, `rating`, `comments`) 
VALUES (NULL, '1', '1', 'Very good', 'Very good service.'), (NULL, '2', '3', 'Good', 'Very good services.');