select    count(*) as cnt_row  
        , count(id_user) as cnt_reg  
        , count(distinct id_user) as cnt_user   
from skygame.users  
-------  
select    id_user  
        , count(*) as cnt  
from skygame.users  
group by id_user  
having count(*) > 1  
order by cnt desc 
