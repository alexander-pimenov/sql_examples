(SELECT array_to_json(array_agg(row_to_json(t))) FROM
  (SELECT
  modified,
  is_hidden, --should be overridden
  first_name,
  last_name,
  middle_name,
  birthday,
  country,
  city,
  login,
  id AS "femida_id",
  gender,
  status,
  original_id,
  source,
  (SELECT au.is_dismissed FROM auth_user au WHERE cand.login NOTNULL AND cand.login = au.username LIMIT 1) AS is_dismissed,
  (SELECT cc.resolution FROM candidates_consideration cc WHERE cc.candidate_id = cand.id AND cc.id = (SELECT MAX(cc2.id) FROM candidates_consideration cc2  WHERE cc2.candidate_id = cand.id)) AS consideration_resolution,
  (SELECT cc.source FROM candidates_consideration cc WHERE cc.candidate_id = cand.id AND cc.id = (SELECT MAX(cc2.id) FROM candidates_consideration cc2  WHERE cc2.candidate_id = cand.id)) AS consideration_source,
  (SELECT cc.finished FROM candidates_consideration cc WHERE cc.id = (SELECT MAX(cc2.id) FROM candidates_consideration cc2  WHERE cc2.candidate_id = cand.id and cc2.state = 'archived')) AS last_consideration_finished_date,
  (select au.first_name || ' ' || au.last_name FROM auth_user au JOIN candidates_candidate_responsibles ccr ON au.id = ccr.user_id WHERE ccr.candidate_id = cand.id AND ccr.role = 'main_recruiter') AS yandex_owner,
  (SELECT au.username FROM candidates_candidate_responsibles ccr JOIN auth_user au ON au.id = ccr.user_id WHERE ccr.candidate_id = cand.id AND ccr.role = 'main_recruiter') AS yandex_owner_id,
  (SELECT array_to_json(array_agg(row_to_json(f))) FROM (SELECT is_active, type, is_main, normalized_account_id, account_id FROM candidates_candidatecontact cont WHERE cand.id = cont.candidate_id) f) AS contacts,
  (SELECT array_to_json(array_agg(row_to_json(h))) FROM (SELECT created, employer, position, start_date, end_date FROM candidates_candidatejob job WHERE cand.id = job.candidate_id ORDER BY job.start_date ASC) h ) AS experience,
  (SELECT array_to_json(array_agg(row_to_json(k))) FROM (SELECT institution, faculty, degree, start_date, end_date FROM candidates_candidateeducation edu WHERE cand.id = edu.candidate_id) k ) AS education,
  (SELECT skills FROM (SELECT candskl.candidate_id AS id, array_agg(skl.name) AS skills FROM candidates_candidateskill candskl JOIN skills_skill skl ON skl.id = candskl.skill_id WHERE skl.name NOTNULL GROUP BY candskl.candidate_id) m WHERE cand.id = m.id) AS skills,
  (SELECT professions FROM (SELECT candprof.candidate_id AS id, array_agg(pp.name_en) AS professions FROM candidates_candidateprofession candprof JOIN professions_profession pp ON pp.id = candprof.profession_id WHERE pp.name_en NOTNULL GROUP BY candprof.candidate_id) n WHERE cand.id = n.id ) as professions,
  (SELECT professional_spheres FROM (SELECT candprof.candidate_id AS id, array_agg(pps.name_en) AS professional_spheres FROM candidates_candidateprofession candprof JOIN professions_professionalsphere pps ON pps.id = candprof.professional_sphere_id WHERE pps.name_en NOTNULL GROUP BY candprof.candidate_id) o WHERE cand.id = o.id) AS professional_spheres,
  (SELECT tags FROM (SELECT candtgs.candidate_id AS id, array_agg(tgs.name) AS tags FROM candidates_candidatetag candtgs JOIN core_tag tgs ON tgs.id = candtgs.tag_id WHERE tgs.name NOTNULL GROUP BY candtgs.candidate_id) r WHERE cand.id = r.id) AS tags,
  (SELECT array_to_json(array_agg(row_to_json(i))) FROM (SELECT interviews_interview.grade AS grade, interviews_interview.type AS type, candidates_consideration.created AS consideration_created, candidates_consideration.id AS consideration_id FROM interviews_interview JOIN candidates_consideration ON interviews_interview.consideration_id = candidates_consideration.id WHERE interviews_interview.state = 'finished' AND cand.id = candidates_consideration.candidate_id) i) AS interviews,
  (SELECT array_to_json(array_agg(row_to_json(i))) FROM (SELECT id,created,finished,resolution,source FROM candidates_consideration AS cand_cons WHERE cand.id = cand_cons.candidate_id) i) AS considerations,
  (SELECT row_to_json(tt) FROM
    (SELECT
    (SELECT CASE WHEN EXISTS (SELECT * FROM candidates_consideration cc3 WHERE cc3.candidate_id = cand.id AND cc3.state = 'in_progress' ORDER BY cc3.modified DESC LIMIT 1) THEN true ELSE false END) as state,
    (SELECT cc4.extended_status FROM candidates_consideration cc4 WHERE cc4.candidate_id = cand.id order by cc4.modified DESC LIMIT 1) as extended_status,
    (SELECT au2.username FROM auth_user au2 WHERE au2.username = cand.login LIMIT 1) as login,
    (SELECT au3.is_dismissed FROM auth_user au3 WHERE au3.username = cand.login LIMIT 1) as is_dismissed,
    (SELECT au4.is_intern FROM auth_user au4 WHERE au4.username = cand.login LIMIT 1) as is_intern
    FROM candidates_candidate cc9 WHERE cc9.id = cand.id
    ) tt) AS global_status
FROM candidates_candidate AS cand
ORDER BY modified ASC LIMIT %s OFFSET %s) t);