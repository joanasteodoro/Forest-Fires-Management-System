drop table camara cascade;
drop table video cascade;
drop table segmentoVideo cascade;
drop table local cascade;
drop table vigia cascade;
drop table eventoEmergencia cascade;
drop table processoSocorro cascade;
drop table entidadeMeio cascade;
drop table meio cascade;
drop table meioCombate cascade;
drop table meioApoio cascade;
drop table meioSocorro cascade;
drop table transporta cascade;
drop table alocado cascade;
drop table acciona cascade;
drop table coordenador cascade;
drop table audita cascade;
drop table solicita cascade;

----------------------------------------
-- Table Creation
----------------------------------------

-- Named constraints are global to the database.
-- Therefore the following use the following naming rules:
--   1. pk_table for names of primary key constraints
--   2. fk_table_another for names of foreign key constraints

create table camara
  (numCamara 	integer not null unique,
  constraint pk_camara primary key(numCamara));

create table video
  (numCamara 	integer not null unique,
   dataHoraInicioVideo 	timestamp	not null unique,
   dataHoraFimVideo 	timestamp	not null unique,
   constraint fk_video_camara foreign key(numCamara) references camara(numCamara),
   constraint pk_video primary key(dataHoraInicioVideo));

create table segmentoVideo
   (numCamara 	integer not null unique,
    dataHoraInicioVideo  timestamp not null unique,
    numSegmento 	integer not null unique,
    duracao   varchar(80)	not null unique, -- see if its an integer or numeric or varchar
    constraint fk_segmentoVideo_video foreign key(numCamara) references video(numCamara), foreign key(dataHoraInicioVideo) references video(dataHoraInicioVideo),
    constraint pk_segmentoVideo primary key(numSegmento));

create table local
   (moradaLocal varchar(80)	not null unique,
   constraint pk_local primary key(moradaLocal));


create table vigia
  (numCamara 	integer not null unique,
    moradaLocal varchar(80)	not null unique,
    constraint fk_vigia_local foreign key(moradaLocal) references local(moradaLocal),
    constraint fk_vigia_camara foreign key(numCamara) references camara(numCamara));

create table processoSocorro
  (numProcessoSocorro integer not null unique,
    constraint pk_processoSocorro primary key(numProcessoSocorro)); -- ver ri

create table eventoEmergencia
   (numTelefone integer not null unique,
   instanteChamada  timestamp not null unique,
   nomePessoa varchar(80) not null,
   moradaLocal  varchar(80) not null,
   numProcessoSocorro integer, --verificar se e unique
   constraint pk_numTelefone primary key(numTelefone),
   --constraint pk_instanteChamada primary key(instanteChamada),
   constraint fk_eventoEmergencia_local foreign key(moradaLocal) references local(moradaLocal),
   constraint fk_eventoEmergencia_processoSocorro foreign key(numProcessoSocorro) references processoSocorro(numProcessoSocorro),
   unique(numTelefone, nomePessoa));


create table entidadeMeio
  (nomeEntidade varchar(80) not null unique,
  constraint pk_entidadeMeio primary key(nomeEntidade));

create table meio
  (numMeio  integer not null unique,
  nomeMeio  varchar(80) not null,
  nomeEntidade  varchar(80) not null unique,
  constraint pk_meio primary key(numMeio),
  constraint fk_meio_entidadeMeio foreign key(nomeEntidade) references entidadeMeio(nomeEntidade));

create table meioCombate
  (numMeio  integer not null unique,
  nomeEntidade  varchar(80) not null unique,
  constraint fk_meioCombate_meio foreign key(nomeEntidade) references meio(nomeEntidade), foreign key(numMeio) references meio(numMeio));

create table meioApoio
  (numMeio  integer not null unique,
  nomeEntidade  varchar(80) not null unique,
  constraint fk_meioApoio_meio foreign key(nomeEntidade) references meio(nomeEntidade), foreign key(numMeio) references meio(numMeio));

create table meioSocorro
  (numMeio  integer not null unique,
  nomeEntidade  varchar(80) not null unique,
  constraint fk_meioSocorro_meio foreign key(nomeEntidade) references meio(nomeEntidade), foreign key(numMeio) references meio(numMeio));

create table transporta
  (numMeio  integer not null unique,
  nomeEntidade  varchar(80) not null,
  numVitimas  integer not null unique,
  numProcessoSocorro  integer not null,
  constraint fk_transporta_meioSocorro foreign key(numMeio) references meioSocorro(numMeio), foreign key(nomeEntidade) references meioSocorro(nomeEntidade),
  constraint fk_transporta_processoSocorro foreign key(numProcessoSocorro) references processoSocorro(numProcessoSocorro));

create table alocado
  (numMeio  integer not null unique,
  nomeEntidade  varchar(80) not null,
  numHoras  integer not null,
  numProcessoSocorro  integer not null,
  constraint fk_alocado_meioApoio foreign key(numMeio) references meioApoio(numMeio), foreign key(nomeEntidade) references meioApoio(nomeEntidade),
  constraint fk_alocado_processoSocorro foreign key(numProcessoSocorro) references processoSocorro(numProcessoSocorro));

create table acciona
  (numMeio  integer not null unique,
  nomeEntidade  varchar(80) not null unique,
  numProcessoSocorro  integer not null unique,
  constraint fk_acciona_meio foreign key(numMeio) references meio(numMeio), foreign key(nomeEntidade) references meio(nomeEntidade),
  constraint fk_acciona_processoSocorro foreign key(numProcessoSocorro) references processoSocorro(numProcessoSocorro));

create table coordenador
  (idCoordenador 	integer not null unique,
  constraint pk_coordenador primary key(idCoordenador));

create table audita
  (idCoordenador  integer not null unique,
  numMeio integer not null unique,
  nomeEntidade  varchar(80) not null unique,
  numProcessoSocorro  integer not null unique,
  dataHoraInicio timestamp not null,
  dataHoraFim timestamp not null,
  dataAuditoria date not null,
  dataAtual date not null,
  texto  text not null,
  constraint fk_audita_coordenador foreign key(idCoordenador) references coordenador(idCoordenador),
  constraint fk_audita_acciona foreign key(numMeio) references acciona(numMeio), foreign key(nomeEntidade) references acciona(nomeEntidade),
  foreign key(numProcessoSocorro) references acciona(numProcessoSocorro),
  check(dataHoraInicio < dataHoraFim),
  check(dataAuditoria >= dataAtual));

create table solicita
  (idCoordenador  integer not null unique,
  dataHoraInicioVideo timestamp not null unique,
  dataHoraInicio timestamp not null unique,
  dataHoraFim timestamp not null,
  numCamara integer not null unique,
  constraint fk_solicita_coordenador foreign key(idCoordenador) references coordenador(idCoordenador),
  constraint fk_solicita_video foreign key(numCamara) references video(numCamara), foreign key(dataHoraInicioVideo) references video(dataHoraInicioVideo));

----------------------------------------
-- Populate Relations
----------------------------------------

insert into local values ('Lisboa');
insert into local values ('Madeira');
insert into local values ('Santarem');
insert into local values ('Povoa');
insert into local values ('Aveiro');
insert into local values ('Castelo Branco');
insert into local values ('Figueira da Foz');

insert into processoSocorro values (1);
insert into processoSocorro values (2);
insert into processoSocorro values (3);
insert into processoSocorro values (4);
insert into processoSocorro values (5);
insert into processoSocorro values (6);
insert into processoSocorro values (7);

insert into eventoEmergencia values (123456789,	'2018-01-01 00:00:00', 'Tai',	'Lisboa', 1);
insert into eventoEmergencia values (113456789,	'2018-02-01 00:00:00', 'Bli',	'Madeira', 2);
insert into eventoEmergencia values (123556789,	'2017-01-01 00:00:00', 'Dani', 'Santarem', 3);
insert into eventoEmergencia values (123456009,	'2018-01-03 00:00:00', 'Ay',	'Povoa', 4);
insert into eventoEmergencia values (123452789,	'2018-01-07 00:02:00', 'Rocha',	'Aveiro', 5);
insert into eventoEmergencia values (123456729,	'2018-10-08 00:00:00', 'Joana',	'Castelo Branco', 6);
insert into eventoEmergencia values (123454449,	'2018-10-20 00:00:00', 'Tangerina',	'Figueira da Foz', 7);
