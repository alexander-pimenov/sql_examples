(SELECT array_to_json(array_agg(row_to_json(t))) FROM
    (SELECT
    cm.id AS "femida_id",
    cm.text,
    au.first_name,
    au.last_name,
    cm.candidate_id,
    cm.modified,
    cm.created
FROM communications_message cm JOIN auth_user au ON cm.author_id = au.id
WHERE cm.type = 'official' AND cm.status = 'sent' AND cm.is_changed <> true
ORDER BY modified ASC LIMIT %s OFFSET %s) t);