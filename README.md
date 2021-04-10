# supplier statement reconciliation database
 a simple MySQL DataBase implementation of suppliers reconciliation system

Supports multiple suppliers, for various products and commercial terms

## The tables
* activity - the acitivty log of reconciled action, by counterpart (supplier) allocation
* counterparts - the supplier tables, including the relevant reconiliation odel reference
* products - the products table, including types (to be extended) and scale (units, meters, kg, etc)
* reconciliation_models - the different reconciliation models, may be identical for various counterparts, and different for others
* reconciliation_periods - 
* tariffs - the tariffs to be paid for each product, based on the scale, and per reconciliation model

## The repository
The repository consists of a builds.sql holing the databases building commands and the selects.sql with a few simple data extraction queries from it

