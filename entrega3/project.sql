drop table if exists camara;
drop table if exists video;
drop table if exists segmentoVideo;
drop table if exists local;
drop table if exists vigia;
drop table if exists eventoEmergencia;
drop table if exists processoSocorro;
drop table if exists entidadeMeio;
drop table if exists meio;
drop table if exists meioCombate;
drop table if exists meioApoio;
drop table if exists meioSocorro;
drop table if exists transporta;
drop table if exists alocado;
drop table if exists acciona;
drop table if exists coordenador;
drop table if exists audita;
drop table if exists solicita;

----------------------------------------
-- Table Creation
----------------------------------------

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
