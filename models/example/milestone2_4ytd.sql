select (((end_date.NAV - start_date.NAV) / start_date.NAV) * 100) as ytd , start_date.CODE, m_table.CATEGORY_ID from
(select NAV, CODE, NAV_DATE from "ASSIGNMENT"."DBT"."NAVHISTORY" where NAV_DATE = to_date('2019-01-01')) start_date join
(select NAV, CODE, NAV_DATE from "ASSIGNMENT"."DBT"."NAVHISTORY" where NAV_DATE = to_date('2019-02-28')) end_date join
(select CODE, CATEGORY_ID from "ASSIGNMENT"."DBT"."MUTUALFUND") m_table join
(select ID, CATEGORY from "ASSIGNMENT"."DBT"."FUNDCATEGORY") f_table on start_date.CODE = end_date.CODE and m_table.CODE = start_date.CODE and m_table.CATEGORY_ID = f_table.ID 
having f_table.CATEGORY like '%liquid%'