with k_factor as
(select sum(ref_reg) / count(distinct(u.id_user))
 from skygame.users u
  left join skygame.referral r
    on u.id_user = r.id_user
),

avg_cogort as
(select count(distinct(id_user)) / count(distinct(date_trunc('month', reg_date)))
 from skygame.users
)

select (select * from k_factor)*(select * from avg_cogort) as future_cogort,
       (select * from k_factor) as "k-factor"
