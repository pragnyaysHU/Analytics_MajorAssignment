{{ config(materialized='table') }}

select NAV_DATE, t.CODE as code, t.maximum_nav, t.minimum_nav from "ASSIGNMENT"."DBT"."NAVHISTORY" nt join
(select mft.CODE as code, max(nht.NAV) as maximum_nav, min(nht.NAV) as minimum_nav from "ASSIGNMENT"."DBT"."MUTUALFUND" mft join "ASSIGNMENT"."DBT"."NAVHISTORY" nht
on mft.CODE = nht.CODE group by mft.CODE) t
where nt.CODE = t.CODE