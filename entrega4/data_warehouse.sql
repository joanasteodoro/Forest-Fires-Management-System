drop table if exists d_evento;
drop table if exists d_meio;
drop table if exists d_tempo;
drop table if exists d_cena;


create table d_evento(
  idEvento integer not null unique,
  numTelefone varchar(9) not null,
  instanteChamada timestamp not null,
  primary key(idEvento)
);

create table d_meio(
  idMeio integer not null unique,
  numMeio integer not null,
  nomeMeio varchar(60) not null,
  nomeEntidade varchar(60) not null,
  tipo varchar(60) not null,
  primary key(idMeio)
);

create table d_tempo(
  dia integer not null,
  mes integer not null,
  ano integer not null
);

create table d_cena(
  idEvento integer not null,
  idMeio integer not null,
  dia integer not null,
  mes integer not null,
  ano integer not null,
  foreign key(idEvento) references d_evento(idEvento),
  foreign key(idMeio) references d_meio(idMeio),
  foreign key(dia, mes, ano) references d_tempo(dia, mes, ano),
  primary key(idEvento, idMeio)
);
