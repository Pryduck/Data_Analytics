select    date_trunc('month', start_session) as mm
				, count(*) as cnt_session_all
      , sum(case when end_session - start_session > interval '5 minute' 
                 then 1.0 else 0.0 end) as cnt_session_signif
			, sum(case when end_session - start_session > interval '5 minute' 
                 then 1.0 else 0.0 end) / count(*) as share_signif
from skygame.game_sessions
group by mm
order by mm 
