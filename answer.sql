SELECT 
    it.investor_id,
    s.sector_name,
    ROUND(
        (CAST(it.no_of_shares AS FLOAT) / SUM(it.no_of_shares) OVER (PARTITION BY it.investor_id)) * 100,
        2
    ) AS share_percentage
FROM investor_transactions it
JOIN sectors s ON it.sector_id = s.sector_id
ORDER BY it.investor_id, share_percentage DESC;
