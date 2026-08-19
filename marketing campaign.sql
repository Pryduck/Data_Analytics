--DAU

select date_trunc('day', start_session) as day,

       count(distinct id_user) as "DAU"

from skygame.game_sessions

group by day

order by day



--WAU

select date_trunc('week', start_session) as week,

       count(distinct id_user) as "WAU"

from skygame.game_sessions

group by week

order by week





--MAU

select date_trunc('month', start_session) as month,

       count(distinct id_user) as "MAU"

from skygame.game_sessions

group by month

order by month
