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
END;
$$ LANGUAGE plpgsql;

DO $$ BEGIN
  PERFORM load_d_evento();
  PERFORM load_d_meio();
END $$;
