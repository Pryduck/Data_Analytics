select gs.id_user,
       sum(extract(epoch from (end_session - start_session)) / 60) as session_minutes

from skygame.game_sessions gs
  join skygame.users u
    on gs.id_user = u.id_user

where date_part('year', u.reg_date) = 2022
  and gs.end_session is not null

group by gs.id_user
order by session_minutes desc
limit 25
