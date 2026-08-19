select    id_user
        , count(*) as cnt_ref
from skygame.referral
group by id_user
order by cnt_ref desc
limit 50
