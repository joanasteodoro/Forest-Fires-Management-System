--2
SELECT nomeEntidade
FROM (SELECT nomeEntidade, COUNT(*)
      FROM acciona NATURAL JOIN eventoEmergencia
      WHERE instanteChamada BETWEEN timestamp '2018-06-21 00:00:00' AND timestamp '2018-09-21 23:59:59'
      GROUP BY nomeEntidade
      HAVING COUNT(*) >= all(SELECT COUNT(*)
                       FROM acciona NATURAL JOIN eventoEmergencia
                       WHERE instanteChamada BETWEEN TIMESTAMP '2018-06-21 00:00:00' AND TIMESTAMP '2018-09-21 23:59:59'
                       GROUP BY nomeEntidade)) as a;

--3
SELECT DISTINCT numProcessoSocorro
FROM((SELECT numProcessoSocorro, nomeEntidade, numMeio
FROM acciona NATURAL JOIN (SELECT numProcessoSocorro
                           FROM eventoEmergencia
                           WHERE instanteChamada BETWEEN TIMESTAMP '2018-01-01 00:00:00' AND TIMESTAMP '2018-12-31 23:59:59' AND moradaLocal = 'Oliveira do Hospital')as a)
EXCEPT
(SELECT numProcessoSocorro, nomeEntidade, numMeio
FROM audita)) as b;

--4
SELECT COUNT(*)
FROM (SELECT *
      FROM segmentoVideo NATURAL JOIN vigia
      WHERE dataHoraInicioVideo BETWEEN TIMESTAMP '2018-08-01 00:00:00' AND TIMESTAMP '2018-08-31 23:59:59' AND duracao > 60 AND moradaLocal = 'Monchique') as a;

--5
(SELECT numMeio, nomeEntidade
 FROM acciona NATURAL JOIN meioCombate)
EXCEPT
(SELECT numMeio, nomeEntidade
 FROM acciona NATURAL JOIN meioApoio);

--6
SELECT DISTINCT nomeEntidade
FROM acciona NATURAL JOIN meioCombate as a
WHERE NOT EXISTS (SELECT numProcessoSocorro
                  FROM acciona
                  EXCEPT
                  SELECT numProcessoSocorro
                  FROM acciona NATURAL JOIN meioCombate as b
                  WHERE a.nomeEntidade = b.nomeEntidade);
