CREATE DATABASE reconciliation

CREATE TABLE raw_info (
ri_id,
action_datetime,
counterpart_id,
product_id,
quanitty
)
;
CREATE TABLE counterparts (
counterpart_id,
counterpart_type_id,
counterpart_name
)
;
CREATE TABLE counterpart_types (
counterpart_type_id,
counterpart_type_name,
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
