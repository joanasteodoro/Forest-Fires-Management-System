drop table if exists camara cascade;
drop table if exists video cascade;
drop table if exists segmentoVideo cascade;
drop table if exists local cascade;
drop table if exists vigia cascade;
drop table if exists eventoEmergencia cascade;
drop table if exists processoSocorro cascade;
drop table if exists entidadeMeio cascade;
drop table if exists meio cascade;
drop table if exists meioCombate cascade;
drop table if exists meioApoio cascade;
drop table if exists meioSocorro cascade;
drop table if exists transporta cascade;
drop table if exists alocado cascade;
drop table if exists acciona cascade;
drop table if exists coordenador cascade;
drop table if exists audita cascade;
drop table if exists solicita cascade;

----------------------------------------
-- Table Creation
----------------------------------------

create table camara
  (numCamara 	integer not null unique,
  constraint pk_camara primary key(numCamara));

create table video
  (numCamara	integer not null,
   dataHoraInicioVideo 	timestamp	not null,
   dataHoraFimVideo 	timestamp	not null,
   constraint fk_video_camara foreign key(numCamara) references camara(numCamara) on delete cascade on update cascade,
   constraint pk_video primary key(numCamara, dataHoraInicioVideo));

create table segmentoVideo
   (numCamara	integer not null,
    dataHoraInicioVideo  timestamp not null,
    numSegmento 	integer not null,
    duracao   numeric(16,4)	not null, -- see if its an integer or numeric or varchar
    constraint fk_segmentoVideo_video foreign key(numCamara, dataHoraInicioVideo) references video(numCamara, dataHoraInicioVideo) on delete cascade on update cascade,
    constraint pk_segmentoVideo primary key(numSegmento, dataHoraInicioVideo, numCamara));

create table local
   (moradaLocal varchar(80)	not null unique,
   constraint pk_local primary key(moradaLocal));


create table vigia
  (numCamara 	integer not null unique,
    moradaLocal varchar(80)	not null,
    constraint fk_vigia_local foreign key(moradaLocal) references local(moradaLocal),
    constraint fk_vigia_camara foreign key(numCamara) references camara(numCamara),
    constraint pk_vigia primary key (numCamara, moradaLocal));

create table processoSocorro
  (numProcessoSocorro integer not null unique,
    constraint pk_processoSocorro primary key(numProcessoSocorro)); -- ver ri

create table eventoEmergencia
   (numTelefone varchar(9) not null unique,
   instanteChamada  timestamp not null unique,
   nomePessoa varchar(80) not null,
   moradaLocal  varchar(80) not null,
   numProcessoSocorro integer not null,
   constraint pk_numTelefone primary key(numTelefone, instanteChamada),
   constraint fk_eventoEmergencia_local foreign key(moradaLocal) references local(moradaLocal),
   constraint fk_eventoEmergencia_processoSocorro foreign key(numProcessoSocorro) references processoSocorro(numProcessoSocorro),
   unique(numTelefone, nomePessoa));


create table entidadeMeio
  (nomeEntidade varchar(80) not null unique,
  constraint pk_entidadeMeio primary key(nomeEntidade));

create table meio
  (numMeio  integer not null,
  nomeMeio  varchar(80) not null,
  nomeEntidade  varchar(80) not null,
  constraint fk_meio_entidadeMeio foreign key(nomeEntidade) references entidadeMeio(nomeEntidade) on delete cascade on update cascade,
  constraint pk_meio primary key(numMeio, nomeEntidade));

create table meioCombate
  (numMeio  integer not null,
  nomeEntidade  varchar(80) not null,
  constraint fk_meioCombate_meio foreign key(nomeEntidade, numMeio) references meio(nomeEntidade, numMeio) on delete cascade on update cascade,
  constraint pk_meioCombate primary key(numMeio, nomeEntidade));


create table meioApoio
  (numMeio  integer not null,
  nomeEntidade  varchar(80) not null,
  constraint fk_meioApoio_meio foreign key(nomeEntidade, numMeio) references meio(nomeEntidade, numMeio) on delete cascade on update cascade,
  constraint pk_meioApoio primary key(numMeio, nomeEntidade));

create table meioSocorro
  (numMeio  integer not null,
  nomeEntidade  varchar(80) not null,
  constraint fk_meioSocorro_meio foreign key(nomeEntidade, numMeio) references meio(nomeEntidade, numMeio) on delete cascade on update cascade,
  constraint pk_meioSocorro primary key(numMeio, nomeEntidade));

create table transporta
  (numMeio  integer not null,
  nomeEntidade  varchar(80) not null,
  numVitimas  integer not null,
  numProcessoSocorro  integer not null,
  constraint fk_transporta_meioSocorro foreign key(numMeio, nomeEntidade) references meioSocorro(numMeio, nomeEntidade),
  constraint fk_transporta_processoSocorro foreign key(numProcessoSocorro) references processoSocorro(numProcessoSocorro),
  constraint pk_transporta primary key(numMeio, nomeEntidade, numProcessoSocorro));

create table alocado
  (numMeio  integer not null,
  nomeEntidade  varchar(80) not null,
  numHoras  integer not null,
  numProcessoSocorro  integer not null,
  constraint fk_alocado_meioApoio foreign key(numMeio, nomeEntidade) references meioApoio(numMeio, nomeEntidade),
  constraint fk_alocado_processoSocorro foreign key(numProcessoSocorro) references processoSocorro(numProcessoSocorro),
  constraint pk_alocado primary key(numMeio, nomeEntidade, numProcessoSocorro));

create table acciona
  (numMeio  integer not null,
  nomeEntidade  varchar(80) not null,
  numProcessoSocorro  integer not null,
  constraint fk_acciona_meio foreign key(numMeio, nomeEntidade) references meio(numMeio, nomeEntidade),
  constraint fk_acciona_processoSocorro foreign key(numProcessoSocorro) references processoSocorro(numProcessoSocorro),
  constraint pk_acciona primary key(numMeio, nomeEntidade, numProcessoSocorro));

create table coordenador
  (idCoordenador 	integer not null unique,
  constraint pk_coordenador primary key(idCoordenador));

create table audita
  (idCoordenador  integer not null unique,
  numMeio integer not null,
  nomeEntidade  varchar(80) not null,
  numProcessoSocorro  integer not null,
  dataHoraInicio timestamp not null,
  dataHoraFim timestamp not null,
  dataAuditoria date not null,
  texto  text not null,
  constraint fk_audita_coordenador foreign key(idCoordenador) references coordenador(idCoordenador),
  constraint fk_audita_acciona foreign key(numMeio, nomeEntidade, numProcessoSocorro) references acciona(numMeio, nomeEntidade, numProcessoSocorro),
  constraint pk_audita primary key(idCoordenador, numMeio, nomeEntidade, numProcessoSocorro),
  check(dataHoraInicio < dataHoraFim),
  check(dataAuditoria <= current_date));

create table solicita
  (idCoordenador  integer not null,
  dataHoraInicioVideo timestamp not null,
  dataHoraInicio timestamp not null,
  dataHoraFim timestamp not null,
  numCamara integer not null,
  constraint fk_solicita_coordenador foreign key(idCoordenador) references coordenador(idCoordenador),
  constraint fk_solicita_video foreign key(numCamara, dataHoraInicioVideo) references video(numCamara, dataHoraInicioVideo),
  constraint pk_solicita primary key(idCoordenador, dataHoraInicioVideo, numCamara));
