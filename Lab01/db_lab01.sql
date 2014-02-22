CREATE DATABASE IF NOT EXISTS `db_management` CHARACTER SET utf8 COLLATE utf8_general_ci

CREATE TABLE  `db_management`.`Order` (
`orderID` INT NOT NULL ,
`status` INT NOT NULL ,
`orderDate` DATE NOT NULL ,
`modelID` INT NOT NULL ,
`recieverID` INT NOT NULL
) ENGINE = INNODB;

CREATE TABLE  `db_management`.`Model` (
`archived` INT NOT NULL ,
`count` INT NOT NULL ,
`modelID` INT NOT NULL ,
`name` VARCHAR( 200 ) NOT NULL ,
`price` INT NOT NULL
) ENGINE = INNODB;

CREATE TABLE  `db_management`.`Reciever` (
`account` VARCHAR( 200 ) NOT NULL ,
`adress` VARCHAR( 200 ) NOT NULL ,
`archived` INT NOT NULL ,
`recieverID` INT NOT NULL ,
`name` VARCHAR( 200 ) NOT NULL ,
`phone` VARCHAR( 200 ) NOT NULL
) ENGINE = INNODB;

CREATE TABLE `db_management`.`Warehouse` (
`name` VARCHAR ( 200 ) NOT NULL ,
`modelID` INT NOT NULL
) ENGINE = INNODB;

ALTER TABLE  `db_management`.`Model` ADD PRIMARY KEY (  `modelID` )

ALTER TABLE  `db_management`.`Order` ADD PRIMARY KEY (  `orderID` )

ALTER TABLE  `db_management`.`Reciever` ADD PRIMARY KEY ( `recieverID` )

ALTER TABLE  `db_management`.`Warehouse` ADD  `warehouseID` INT NOT NULL

ALTER TABLE  `db_management`.`Warehouse` ADD PRIMARY KEY ( `warehouseID` )

ALTER TABLE  `db_management`.`Warehouse` ADD INDEX (  `modelID` )

ALTER TABLE  `db_management`.`Order` ADD INDEX (  `recieverID` )

ALTER TABLE  `db_management`.`Order` ADD INDEX (  `modelID` )

ALTER TABLE  `db_management`.`Warehouse` ADD FOREIGN KEY (  `modelID` ) REFERENCES  `db_management`.`Model` (
`modelID`
);

ALTER TABLE  `db_management`.`Order` ADD FOREIGN KEY (  `modelID` ) REFERENCES  `db_management`.`Model` (
`modelID`
);

ALTER TABLE  `db_management`.`Order` ADD FOREIGN KEY (  `recieverID` ) REFERENCES  `db_management`.`Reciever` (
`recieverID`
);

