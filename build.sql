CREATE TABLE `activity` (
  `activity_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `activity_datetime` datetime NOT NULL,
  `counterpart_id` int(8) unsigned NOT NULL,
  `product_id` int(8) unsigned NOT NULL,
  `quantity` int(9) NOT NULL,
  PRIMARY KEY (`activity_id`),
  KEY `counterpart_id` (`counterpart_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8
;

CREATE TABLE `counterparts` (
  `counterpart_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `reconciliation_model_id` int(5) unsigned NOT NULL,
  `counterpart_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`counterpart_id`),
  KEY `reconciliation_model_id` (`reconciliation_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8

CREATE TABLE `products` (
  `product_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `product_type` varchar(32) NOT NULL,
  `external_id` varchar(64) DEFAULT NULL,
  `product_name` varchar(32) DEFAULT NULL,
  `product_scale` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8

CREATE TABLE `reconciliation_models` (
  `reconciliation_model_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `reconciliation_model_name` varchar(32) DEFAULT NULL,
  `reconciliation_period_id` int(5) unsigned NOT NULL,
  PRIMARY KEY (`reconciliation_model_id`),
  KEY `reconciliation_period_id` (`reconciliation_period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8


CREATE TABLE `reconciliation_periods` (
  `reconciliation_period_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `period_name` varchar(32) NOT NULL,
  PRIMARY KEY (`reconciliation_period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8

CREATE TABLE `tariffs` (
  `tariff_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(8) unsigned NOT NULL,
  `reconciliation_model_id` int(5) unsigned NOT NULL,
  `tariff_per_scale` float(4,2) NOT NULL,
  `tariff_from_date` date NOT NULL,
  `tariff_to_date` date DEFAULT NULL,
  PRIMARY KEY (`tariff_id`),
  KEY `product_id` (`product_id`),
  KEY `reconciliation_model_id` (`reconciliation_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8
