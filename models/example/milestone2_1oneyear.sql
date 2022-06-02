select (((end_date_table.NAV - start_date_table.NAV) / start_date_table.NAV) * 100) as OneYear_Returns, start_date_table.CODE from
(select NAV, CODE, NAV_DATE from "ASSIGNMENT"."DBT"."NAVHISTORY" where NAV_DATE >= to_date('2018-02-28')) start_date_table join
(select NAV, CODE, NAV_DATE from "ASSIGNMENT"."DBT"."NAVHISTORY" where NAV_DATE = to_date('2019-02-28')) end_date_table 
on start_date_table.CODE = end_date_table.CODE