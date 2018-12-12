drop table if exists d_evento cascade;
drop table if exists d_meio cascade;
drop table if exists d_tempo cascade;
drop table if exists d_facto cascade;


create table d_evento(
  numTelefone varchar(9) not null,
  instanteChamada timestamp not null,
  idEvento serial not null,
  primary key(idEvento)
);

create table d_meio(
  numMeio integer not null,
  nomeMeio varchar(60) not null,
  nomeEntidade varchar(60) not null,
  tipo varchar(60) not null,
  idMeio serial not null,
  primary key(idMeio)
);

create table d_tempo(
  dia integer not null,
  mes integer not null,
  ano integer not null,
  idTempo serial not null,
  primary key(idTempo)
);

create table d_facto(
  idEvento integer not null,
  idMeio integer not null,
  idTempo integer not null,
  foreign key(idEvento) references d_evento(idEvento),
  foreign key(idMeio) references d_meio(idMeio),
  foreign key(idTempo) references d_tempo(idTempo),
  primary key(idEvento, idMeio, idTempo)
);
