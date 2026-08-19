select   max(reg_date) as max_date
       , min(reg_date) as min_date
       , sum(case when reg_date is null then 1.0 else 0.0 end) as cnt_null
from skygame.users
