{{ config(materialized='table') }}

select month(NAV_DATE) as nav_month, CODE, avg(NAV) as nav_avg,avg(REPURCHASE_PRICE) as repurchase_avg, avg(SALE_PRICE) as sale_avg
from "ASSIGNMENT"."DBT"."NAVHISTORY"
group by CODE, nav_month
