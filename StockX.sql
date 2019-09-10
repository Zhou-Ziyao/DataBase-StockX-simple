USE `db_zzhou18` ;

-- -----------------------------------------------------
-- Table `db_zzhou18`.`Admin`
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;DROP TABLE IF EXISTS `db_zzhou18`.`Admin`;SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE  `db_zzhou18`.`Admin` (
  `admin_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `admin_password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`admin_id`))
;


-- -----------------------------------------------------
-- Table `db_zzhou18`.`Users`
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;DROP TABLE IF EXISTS `db_zzhou18`.`Users`;SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE  `db_zzhou18`.`Users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `user_password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `admin_id` INT UNSIGNED NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `zipcode` INT NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `membership` VARCHAR(45) NOT NULL,
  `birthday` VARCHAR(45) NOT NULL,
  `credit_card_number` VARCHAR(45) NOT NULL,
  `credit_card_exp` VARCHAR(45) NOT NULL,
  `credit_card_cvs` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`admin_id`) REFERENCES `db_zzhou18`.`Admin` (`admin_id`) ON DELETE CASCADE);


-- -----------------------------------------------------
-- Table `db_zzhou18`.`Item`
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;DROP TABLE IF EXISTS `db_zzhou18`.`Item`;SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE  `db_zzhou18`.`Item` (
  `item_id` INT UNSIGNED  NOT NULL  AUTO_INCREMENT,
  `item_name` VARCHAR(45) NOT NULL,
  `market_value` DECIMAL(9) NOT NULL,
  `material` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `item_condition` VARCHAR(45) NOT NULL,
  `retail_price` VARCHAR(45) NOT NULL,
  `release_date` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `Brand_brand_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`item_id`, `item_name`))
;


-- -----------------------------------------------------
-- Table `db_zzhou18`.`Orders`
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;DROP TABLE IF EXISTS `db_zzhou18`.`Orders`;SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE `db_zzhou18`.`Orders` (
  `user_id` INT UNSIGNED NOT NULL ,
  `item_id` INT UNSIGNED NOT NULL,
  `order_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `sale_price` DECIMAL(9) NOT NULL,
  `order_date` VARCHAR(45) NOT NULL,
  `warehouse_location` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`order_id`),
  FOREIGN KEY (`user_id`) REFERENCES `db_zzhou18`.`Users` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`item_id`) REFERENCES `db_zzhou18`.`Item` (`item_id`) ON DELETE CASCADE) ;

-- -----------------------------------------------------
-- Table `db_zzhou18`.`Transaction`
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;DROP TABLE IF EXISTS `db_zzhou18`.`Transaction`;SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE `db_zzhou18`.`Transaction` (
  `buyer_user_id` INT UNSIGNED NOT NULL ,
  `seller_user_id` INT UNSIGNED NOT NULL,
  `order_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`order_id`, `buyer_user_id`, `seller_user_id`),
  FOREIGN KEY (`buyer_user_id`) REFERENCES `db_zzhou18`.`Users` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`seller_user_id`) REFERENCES `db_zzhou18`.`Users` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`order_id`) REFERENCES `db_zzhou18`.`Orders` (`order_id`) ON DELETE CASCADE) ;

-- -----------------------------------------------------
-- Table `db_zzhou18`.`Portfolio`
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;DROP TABLE IF EXISTS `db_zzhou18`.`Portfolio`;SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE  `db_zzhou18`.`Portfolio` (
  `portfolio_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_created` VARCHAR(45) NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `item_id` INT UNSIGNED  NOT NULL,
  `item_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`portfolio_id`),
  FOREIGN KEY (`user_id`) REFERENCES `db_zzhou18`.`Users` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`item_id` , `item_name`) REFERENCES `db_zzhou18`.`Item` (`item_id` , `item_name`) ON DELETE CASCADE);


-- -----------------------------------------------------
-- Table `db_zzhou18`.`Shoes`
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;DROP TABLE IF EXISTS `db_zzhou18`.`Shoes`;SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE  `db_zzhou18`.`Shoes` (
  `Shoe_Style` VARCHAR(45) NULL,
  `Shoe_Size` INT NOT NULL,
  `item_item_id` INT UNSIGNED NOT NULL,
  `item_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`item_item_id`, `item_name`),
  FOREIGN KEY (`item_item_id` , `item_name`) REFERENCES `db_zzhou18`.`Item` (`item_id` , `item_name`) ON DELETE CASCADE);


-- -----------------------------------------------------
-- Table `db_zzhou18`.`Streetwear`
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;DROP TABLE IF EXISTS `db_zzhou18`.`Streetwear`;SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE  `db_zzhou18`.`Streetwear` (
  `Streetwear_Size` VARCHAR(45) NULL,
  `item_id` INT UNSIGNED  NOT NULL,
  `item_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`item_id`, `item_name`),
  FOREIGN KEY (`item_id` , `item_name`) REFERENCES `db_zzhou18`.`Item` (`item_id` , `item_name`) ON DELETE CASCADE);


-- -----------------------------------------------------
-- Table `db_zzhou18`.`Handbags`
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;DROP TABLE IF EXISTS `db_zzhou18`.`Handbags`;SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE  `db_zzhou18`.`Handbags` (
  `Bag_Style` VARCHAR(45) NULL,
  `Bag_Size` VARCHAR(45) NULL,
  `Dimensions` VARCHAR(45) NULL,
  `item_id` INT UNSIGNED NOT NULL,
  `item_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`item_id`, `item_name`),
  FOREIGN KEY (`item_id` , `item_name`) REFERENCES `db_zzhou18`.`Item` (`item_id` , `item_name`) ON DELETE CASCADE);


-- -----------------------------------------------------
-- Table `db_zzhou18`.`Watches`
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;DROP TABLE IF EXISTS `db_zzhou18`.`Watches`;SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE `db_zzhou18`.`Watches` (
  `Reference_Number` INT UNSIGNED NOT NULL,
  `Watch_Style` VARCHAR(45) NULL,
  `Case_Size` DECIMAL NULL,
  `Dial` VARCHAR(45) NULL,
  `Movement` VARCHAR(45) NULL,
  `Band` VARCHAR(45) NULL,
  `item_id` INT UNSIGNED NOT NULL,
  `item_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Reference_Number`, `item_id`, `item_name`),
  FOREIGN KEY (`item_id` , `item_name`) REFERENCES `db_zzhou18`.`Item` (`item_id` , `item_name`) ON DELETE CASCADE)
;


-- -----------------------------------------------------
-- Table `db_zzhou18`.`History_Of_Sales`
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;DROP TABLE IF EXISTS `db_zzhou18`.`History_Of_Sales`;SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE `db_zzhou18`.`History_Of_Sales` (
  `Trade_Range` VARCHAR(45) NULL,
  `Price_Premium` DECIMAL NULL,
  `Volatility` DECIMAL NULL,
  `Number_Of_Sales` INT NULL,
  `Avg_Sale_Price` DECIMAL(10,2) NOT NULL,
  `item_id` INT UNSIGNED NOT NULL,
  `item_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`item_id`, `item_name`), 
  FOREIGN KEY (`item_id` , `item_name`) REFERENCES `db_zzhou18`.`Item` (`item_id` , `item_name`) ON DELETE CASCADE)
;


-- -----------------------------------------------------
-- Table `db_zzhou18`.`For_Sale`
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;DROP TABLE IF EXISTS `db_zzhou18`.`For_Sale`;SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE `db_zzhou18`.`For_Sale` (
  `Asking_Price` DECIMAL NOT NULL,
  `item_id` INT UNSIGNED NOT NULL,
  `item_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`item_id`, `item_name`),
  FOREIGN KEY (`item_id` , `item_name`) REFERENCES `db_zzhou18`.`Item` (`item_id` , `item_name`) ON DELETE CASCADE);


INSERT INTO  db_zzhou18.Admin(username,admin_password) 
VALUES ("a1","b1"), 
				("a2", "b2");
                
INSERT INTO  db_zzhou18.Users(id,username,user_password,email,admin_id,first_name,last_name,zipcode,address,gender,membership,birthday,credit_card_number,credit_card_exp,credit_card_cvs) 
VALUES (1,"a0001","b0001","a0001@gmail.com",1 , "John","Snow",52241,"123 Gilbert St IA","Male","Yes","12/04/1988","1234223432344234","08/19",123 ), 
				(2,"a0002","b0002","a0002@gmail.com",1,"Alex","Wang",23412,"234 Gilber St IA","Male","No","12/03/1987","1234567822346678","09/19",234),
                (3,"a0003","b0003","a0003@gmail.com",2,"Sherlie","Wang",23464,"123 Lin St IA","Female","Yes","11/11/1911","2132135482751098","10/20",977),
                (4,"a0004","b0004","a0004@uiowa.edu",2,"Sarah","CrenShaw",22351,"456 Lin st IA","Female","No","08/15/1996","1298376197203716","10/20",977),
                (5,"a0005","b0005","a0005@uiowa.edu",1,"Richard","James",54312,"789 Lin St IA","Male","Yes","08/08/1988","1275638103162847","12/21",996);

INSERT INTO  db_zzhou18.Item(item_id,item_name,market_value,material,color,item_condition,retail_price,release_date,gender,Brand_brand_name) 
VALUES (1,"Yeezy_350 Boost 350",300,"leather","white","new",200,"10/10/2019","Male","Adidas"), 
				(2,"Yeezy_350 Boost 350",320,"leather","black","new",220,"10/10/2019","Male","Adidas"),
                (3,"Yeezy_350 Boost 350",320,"leather","brown","new",220,"10/01/2019","Female","Adidas"),
                (4,"Jordan 4 Retro Bred",260,"Textiles leather","white","new",200,"08/08/2008","Male","Nike"),
                (5,"Jordan 4 Retro Bred",280,"Textiles leather","black","new",200,"08/08/2008","Male","Nike"),
                (6,"Jordan 4 Retro Bred",280,"Textiles leather","black","new",200,"08/08/2008","Female","Nike"),
                (7,"Jordan 4 Retro Bred",260,"Textiles leather","white","new",200,"08/08/2008","Female","Nike"),
                (8,"Epsom Kelly Sellier 32 ",15000,"leather","black","new",14950,"01/01/2018","Female","Hermes"),
                (9,"Epsom Kelly Sellier 32 ",15000,"leather","white","new",14950,"01/01/2018","Female","Hermes"),
                (10,"Crystal Accented Stainless Steel",450,"iron","white","new",400,"01/01/1988","Male","Bulova"),
                (11,"Crystal Accented Stainless Steel",450,"iron","black","new",400,"12/20/2000","Male","Bulova"),
                (12,"Pullover Parka Teal",190,"wool","green","new",100,"05/05/1999","Male","Supreme"),
                (13,"Pullover Parka Teal",190,"wool","white","new",100,"01/01/2009","Male","Supreme"),
                (14,"Pullover Parka Teal",190,"wool","black","new",100,"02/02/2004","Male","Supreme")
                ;
                
INSERT INTO  db_zzhou18.For_Sale(Asking_Price,item_id,item_name) 
VALUES (100,1,"Yeezy_350 Boost 350"), 
				(100,2,"Yeezy_350 Boost 350"),
                (100,3,"Yeezy_350 Boost 350"), 
				(200, 4,"Jordan 4 Retro Bred");
                
                
INSERT INTO db_zzhou18.Shoes(Shoe_Style,Shoe_Size,item_item_id,item_name)
VALUES ("Streetwear",10,1,"Yeezy_350 Boost 350"),
				("Streetwear",11,2,"Yeezy_350 Boost 350"),
                ("Streetwear",12,3,"Yeezy_350 Boost 350"),
                ("Basketball",10,4,"Jordan 4 Retro Bred"),
                ("Basketball",8,5,"Jordan 4 Retro Bred"),
                ("Basketball",12,6,"Jordan 4 Retro Bred"),
                ("Basketball",13,7,"Jordan 4 Retro Bred")
                ;

INSERT INTO db_zzhou18.Streetwear(Streetwear_Size,item_id,item_name)
VALUES ("Large",12,"Pullover Parka Teal"),
				("Medium",13,"Pullover Parka Teal"),
                ("Large",14,"Pullover Parka Teal")
                ;
                
INSERT INTO db_zzhou18.Watches(Reference_Number,Watch_Style,Case_Size,Dial,Movement,Band,item_id,item_name)
VALUES(1,"Sport",44,"white","Bulova","Bulova",10,"Crystal Accented Stainless Steel"),
				(2,"Sport",44,"black","Bulova","Bulova",11,"Crystal Accented Stainless Steel")
                ;
                
                
INSERT INTO db_zzhou18.Handbags(Bag_Style,Bag_Size,Dimensions,item_id,item_name)
VALUES ("Purse","MM","6H 97.5W",8,"Epsom Kelly Sellier 32 "),
				("Purse","MM","6H 97.5W",9,"Epsom Kelly Sellier 32 ")
;

INSERT INTO db_zzhou18.Portfolio(date_created,user_id,item_id,item_name)
VALUES("11/11/2011",1,10,"Crystal Accented Stainless Steel"),
				("12/12/2012",3,11,"Crystal Accented Stainless Steel"),
                ("02/03/2016",2,5,"Jordan 4 Retro Bred"),
                ("03/14/2015",4,2,"Yeezy_350 Boost 350");
                
INSERT INTO db_zzhou18.Orders(user_id,item_id,sale_price,order_date,warehouse_location)
VALUES (1,1,400,"05/05/2018","Iowa City"),
				(2,2,400,"05/04/2018","Iowa City"),
                (1,3,350,"05/05/2018","Kansas City"),
                (3,4,300,"05/05/2018","Kansas City"),
                (1,14,300,"12/05/2018","Seattle"),
                (4,6,350,"05/05/2018","Kansas City");

INSERT INTO db_zzhou18.Transaction(buyer_user_id, seller_user_id, order_id)
VALUES (1, 4, 1),
				(2, 1, 2),
                (1, 2, 3),
                (3, 1, 4),
                (1, 4, 5),
                (4, 1, 5);
                
INSERT INTO db_zzhou18.History_Of_Sales(Trade_Range,Price_Premium,Volatility,Number_Of_Sales,Avg_Sale_Price,item_id,item_name)
VALUES("$260-$380",40.5,7.7,3,250.00,1,"Yeezy_350 Boost 350"),
				("$260-$280",40.5,7.7,2,270.00,4,"Jordan 4 Retro Bred"),
				("$15000-$15000",40.5,7.7,2,15000.00,9,"Epsom Kelly Sellier 32 ");
