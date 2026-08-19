with loyals1 as 
(
select    id_user
from skygame.monetary m
   join skygame.item_list i
      on m.id_item_buy = i.id_item
   join skygame.log_prices p
		  on m.id_item_buy = p.id_item
      and m.dtime_pay >= p.valid_from
      and m.dtime_pay <= coalesce(valid_to, '3000-01-01')
group by id_user
having sum(cnt_buy * price) >= 1000
),

loyals2 as 
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
where id_user in (select * from loyals1)
or id_user in (select * from loyals2)
group by mm
