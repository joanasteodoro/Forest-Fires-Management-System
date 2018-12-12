-- select tipo, ano, mes, count(*)
-- from factos natural join d_tempo natural join d_meio
-- where idEvento = 15
-- group by tipo, ano, mes
-- union
-- select tipo, ano , null, count(*)
-- from factos natural join d_tempo natural join d_meio
-- where idEvento = 15
-- group by tipo, ano
-- union
-- select tipo, null, null, count(*)
-- from factos natural join d_tempo natural join d_meio
-- where idEvento = 15
-- group by tipo;
--
-- select tipo, ano, mes, count(*)
-- from factos natural join d_tempo natural join d_meio
-- where idEvento = 15
-- group by tipo, rollup(ano, mes);


explain SELECT dataHoraInicioVideo, dataHoraFimVideo
FROM video V, vigia I
WHERE V.numCamara = I.numCamara
AND V.numCamara = 16
AND I.moradaLocal = 'Loures';

explain select sum(numVitimas)
FROM transporta T, eventoEmergencia E
where T.numProcessoSocorro = E.numProcessoSocorro
group by numTelefone, instanteChamada;
