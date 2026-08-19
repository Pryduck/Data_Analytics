select  date_trunc('month', start_session) as mm
				, avg(extract(epoch from end_session - start_session)/(60*60)) as avg_len_hour
from skygame.game_sessions
where end_session - start_session > interval '5 minute'
group by mm
order by mm 
