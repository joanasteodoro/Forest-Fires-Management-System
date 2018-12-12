CREATE OR REPLACE FUNCTION load_d_evento()
RETURNS VOID AS
$$
DECLARE count INTEGER DEFAULT 1;
DECLARE evento eventoEmergencia%ROWTYPE;
DECLARE cursor_event CURSOR FOR
SELECT * FROM eventoEmergencia;
BEGIN
  OPEN cursor_event;
  LOOP
    FETCH cursor_event INTO evento;
    EXIT WHEN NOT FOUND;
    INSERT INTO d_evento VALUES(count, evento.numTelefone, evento.instanteChamada);
    count := count + 1;
  END LOOP;
  CLOSE cursor_event;
END;
$$ LANGUAGE plpgsql;

DO $$ BEGIN
  PERFORM load_d_evento();
END $$;

CREATE OR REPLACE FUNCTION load_d_meio()
RETURNS VOID AS
$$
DECLARE count INTEGER DEFAULT 1;
DECLARE meio meio%ROWTYPE;
DECLARE cursor_event CURSOR FOR
SELECT * FROM eventoEmergencia;
BEGIN
  OPEN cursor_event;
  LOOP
    FETCH cursor_event INTO evento;
    EXIT WHEN NOT FOUND;
    INSERT INTO d_evento VALUES(count, evento.numTelefone, evento.instanteChamada);
    count := count + 1;
  END LOOP;
  CLOSE cursor_event;
END;
$$ LANGUAGE plpgsql;

DO $$ BEGIN
  PERFORM load_d_evento();
END $$;
