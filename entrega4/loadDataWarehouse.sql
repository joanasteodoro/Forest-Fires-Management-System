CREATE OR REPLACE FUNCTION load_d_evento()
RETURNS VOID AS
$$
BEGIN
  INSERT INTO d_evento
  SELECT numTelefone, instanteChamada
  FROM eventoEmergencia;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION load_d_meio()
RETURNS VOID AS
$$
BEGIN
  INSERT INTO d_meio
  SELECT numMeio, nomeMeio, nomeEntidade, 'Apoio'
  FROM meioApoio NATURAL JOIN meio;

  INSERT INTO d_meio
  SELECT numMeio, nomeMeio, nomeEntidade, 'Socorro'
  FROM meioSocorro NATURAL JOIN meio;

  INSERT INTO d_meio
  SELECT numMeio, nomeMeio, nomeEntidade, 'Combate'
  FROM meioCombate NATURAL JOIN meio;

  INSERT INTO d_meio
  SELECT numMeio, nomeMeio, nomeEntidade
  FROM meio EXCEPT
  SELECT numMeio, nomeMeio, nomeEntidade
  FROM d_meio;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION load_d_tempo()
RETURNS VOID AS
$$
BEGIN
  INSERT INTO d_tempo
  SELECT date_part('day', dd), date_part('month', dd), date_part('year', dd)
  FROM generate_series
        ( '2010-01-01'::timestamp
        , '2019-12-31'::timestamp
        , '1 day'::interval) dd;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION load_factos()
RETURNS VOID AS
$$
BEGIN
  INSERT INTO factos
  SELECT idEvento, idMeio, idTempo
  from acciona natural join eventoemergencia natural join d_evento natural join d_meio NATURAL JOIN d_tempo
  WHERE dia = date_part('day', instanteChamada) AND mes = date_part('month', instanteChamada) AND ano = date_part('year', instanteChamada);

END;
$$ LANGUAGE plpgsql;

DO $$ BEGIN
  PERFORM load_d_evento();
  PERFORM load_d_meio();
  PERFORM load_d_tempo();
  PERFORM load_factos();
END $$;
