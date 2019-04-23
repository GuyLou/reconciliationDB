CREATE DATABASE reconciliation;

CREATE TABLE raw_info (
  ri_id INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  action_datetime DATETIME NOT NULL,
  counterpart_id INT(8) UNSIGNED NOT NULL,
  product_id INT(8) UNSIGNED,
  quantity INT(9) NOT NULL,
  PRIMARY KEY ri_id (ri_id),
  KEY counterpart_id (counterpart_id),
  KEY product_id (product_id)
)
;
CREATE TABLE counterparts (
counterpart_id INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
counterpart_type_id INT(5) UNSIGNED NOT NULL,
counterpart_name VARCHAR(32),
PRIMARY KEY counterpart_id (counterpart_id), 
)
;
CREATE TABLE counterpart_types (
counterpart_type_id,
counterpart_type_name VARCHAR(32),
reconciliation_period_id
)
;
CREATE TABLE reconciliation_periods (
reconciliation_period_id,
-- to be continued

)
CREATE TABLE products (
product_id,
product_type,
external_id,
product_name,
product_scale
)
;
CREATE TABLE rates (
product_type,
product_id,
counterpart_type_id,
rate_per_scale,
rate_validity_from_date,
rate_validity_to_date
)
;
