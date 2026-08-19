select    date_trunc('month',reg_date) as mm
        , count(id_user) as cnt
from skygame.users
group by mm
order by mm
