with ltr as (
select
sm.id_user,
sum(cnt_buy*price) as revenue
from skygame.monetary sm
join skygame.item_list il
on sm.id_item_buy = il.id_item
join skygame.log_prices lp
on sm.id_item_buy = lp.id_item
and dtime_pay between valid_from and coalesce(valid_to, '2030-01-01')
group by sm.id_user

),

lt_mm as (
select
su.id_user
, ceil(extract ('day' from max(start_session) - min(reg_date))/30) as lt_mm
from skygame.users su
join skygame.game_sessions gs
on su.id_user = gs.id_user
group by su.id_user
)

  
select ltr.id_user
, revenue/lt_mm as ltr_mm
from ltr
join lt_mm
on ltr.id_user = lt_mm.id_user
order by ltr_mm desc
limit 100
