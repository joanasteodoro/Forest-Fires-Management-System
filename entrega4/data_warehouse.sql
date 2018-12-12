drop table if exists d_evento cascade;
drop table if exists d_meio cascade;
drop table if exists d_tempo cascade;
drop table if exists d_cena cascade;


create table d_evento(
  idEvento serial not null unique,
  numTelefone varchar(9) not null,
  instanteChamada timestamp not null,
  primary key(idEvento)
);

create table d_meio(
  idMeio serial not null unique,
  numMeio integer not null,
  nomeMeio varchar(60) not null,
  nomeEntidade varchar(60) not null,
  tipo varchar(60) not null,
  primary key(idMeio)
);

create table d_tempo(
  dia integer not null,
  mes integer not null,
  ano integer not null,
  primary key(dia, mes, ano)
);

create table d_facto(
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
