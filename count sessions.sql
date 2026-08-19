select    count(*) as cnt_session_all
      , sum(case when end_session - start_session > interval '5 minute' 
                 then 1.0 else 0.0 end) as cnt_session_signif
from skygame.game_sessions
