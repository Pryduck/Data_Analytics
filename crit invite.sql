with crit_invite as 
(
select    id_user
from skygame.referral
group by id_user
having count(*) >= 3
  and sum(ref_reg) >= 1
)

select    count(distinct id_user) as cnt_user
        , date_trunc('month', start_session) as mm
from skygame.game_sessions
where id_user in (select * from crit_invite)
group by mm
