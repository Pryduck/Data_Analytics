select    id_user
        , count(*) as cnt_ref
        , sum(ref_reg)/count(*) as share_reg

from skygame.referral
group by id_user
having count(*) > 6 and sum(ref_reg)=0
