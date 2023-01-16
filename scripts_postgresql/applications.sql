(SELECT array_to_json(array_agg(row_to_json(t))) FROM
    (SELECT
    app.id,
    app.candidate_id,
    app.status,
    app.resolution,
    app.vacancy_id,
    app.modified
FROM interviews_application AS app
ORDER BY modified ASC LIMIT %s OFFSET %s) t);