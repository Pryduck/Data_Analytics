select case when (date_trunc('month', reg_date) in ('2022-11-01', '2022-12-01')) then 'nov-dec_22'
            else 'other' end as m_group
     , avg(end_session - start_session) as avg_len

from skygame.users u
  left join skygame.game_sessions gs
    on u.id_user = gs.id_user

where end_session - start_session > interval '5 minute'
group by m_group
