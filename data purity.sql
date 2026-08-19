--Количество битых строк и их долю от общего числа строк.

select sum(case when end_session is null then 1.0 else 0.0 end) as f,
       sum(case when end_session is null then 1.0 else 0.0 end) / count(*) as s
from skygame.game_sessions



--Доля проблемных записей для каждого device_type

select u.dev_type,
       sum(case when end_session is null then 1.0 else 0.0 end) as f,
       sum(case when end_session is null then 1.0 else 0.0 end) / count(*) as s

from skygame.game_sessions gs
  join skygame.users u
    on gs.id_user = u.id_user

group by u.dev_type
order by u.dev_type



--Процент всех проблемных записей на ios и android

select sum(case when u.dev_type = 'android' then 1.0 else 0.0 end) / count(*) as android,
       sum(case when u.dev_type = 'ios' then 1.0 else 0.0 end) / count(*) as ios

from skygame.game_sessions gs
  join skygame.users u
    on gs.id_user = u.id_user
  
where end_session is null

