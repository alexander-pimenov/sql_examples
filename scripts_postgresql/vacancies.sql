(SELECT array_to_json(array_agg(row_to_json(t))) FROM
    (SELECT
    vac.id AS "femida_id",
    vac.name,
    (SELECT au.first_name FROM vacancies_vacancymembership vvm JOIN auth_user au ON au.id = vvm.member_id  WHERE vvm.vacancy_id = vac.id AND vvm.role = 'head') AS first_name,
    (SELECT au.last_name FROM vacancies_vacancymembership vvm JOIN auth_user au ON au.id = vvm.member_id  WHERE vvm.vacancy_id = vac.id AND vvm.role = 'head') AS last_name,
    (SELECT au.id FROM vacancies_vacancymembership vvm JOIN auth_user au ON au.id = vvm.member_id  WHERE vvm.vacancy_id = vac.id AND vvm.role = 'main_recruiter') AS auth_user_id,
    vac.status,
    vac.deadline,
    vac.modified
FROM vacancies_vacancy AS vac
WHERE vac.status IN ('suspended', 'closed', 'offer_accepted', 'offer_processing', 'in_progress') AND vac.is_hidden = false
ORDER BY modified ASC LIMIT %s OFFSET %s) t);