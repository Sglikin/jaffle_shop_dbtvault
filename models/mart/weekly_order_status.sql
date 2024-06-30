{{
    config(
        enabled=True
    )
}}


select
  sod.status,
    date_trunc('week', sod.order_date) AS week,
    COUNT(sod.order_pk) AS order_count
FROM {{ref('hub_order')}} ho
left join {{ref('sat_order_details')}} sod on sod.order_pk = ho.order_pk 
GROUP BY status, week
ORDER BY week