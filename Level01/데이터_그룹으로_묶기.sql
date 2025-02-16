SELECT 
    quartet,
    ROUND(AVG(x), 3) AS x_mean,
    ROUND(SUM((x - (SELECT AVG(x) FROM points WHERE quartet = p.quartet)) * (x - (SELECT AVG(x) FROM points WHERE quartet = p.quartet))) / (COUNT(x) - 1), 3) AS x_var,
    ROUND(AVG(y), 3) AS y_mean,
    ROUND(SUM((y - (SELECT AVG(y) FROM points WHERE quartet = p.quartet)) * (y - (SELECT AVG(y) FROM points WHERE quartet = p.quartet))) / (COUNT(y) - 1), 3) AS y_var
FROM 
    points p
GROUP BY 
    quartet;
