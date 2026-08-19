select    count(distinct id_user) as cnt_user
        , count(*) as cnt_ref
        , sum(ref_reg) / count(*) as share_reg
from skygame.referral
