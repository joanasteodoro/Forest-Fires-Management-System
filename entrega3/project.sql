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
   dataHoraInicio 	datetime	not null unique,
   dataHoraFim 	datetime	not null unique,
   constraint fk_video_camara foreign key(numCamara) references camara(numCamara));
   constraint pk_video primary key(dataHoraInicio));

create table segmentoVideo
   (numCamara 	integer not null unique,
    dataHoraInicio  datetime not null unique,
    numSegmento 	integer not null unique,
    duracao   varchar(80)	not null unique, -- see if its an integer or numeric or varchar
    constraint fk_segmentoVideo_video foreign key(numCamara) references video(numCamara);
    constraint fk_segmentoVideo_video foreign key(dataHoraInicio) references video(dataHoraInicio);
    constraint pk_segmentoVideo primary key(numSegmento));

create table local
   (moradaLocal varchar(80)	not null unique,
   constraint pk_local primary key(moradaLocal));


create table vigia
  (numCamara 	integer not null unique,
    moradaLocal varchar(80)	not null unique,
    constraint fk_vigia_local foreign key(moradaLocal) references local(moradaLocal);
    constraint fk_vigia_camara foreign key(numCamara) references camara(numCamara));

create table eventoEmergencia
   (numTelefone integer not null unique,
   instanteChamada  datetime not null unique,
   nomePessoa varchar(80) not null,
   moradaLocal  varchar(80) not null,
   numProcessoSocorro integer, --verificar se e unique
   constraint pk_numTelefone primary key(numTelefone);
   constraint pk_instanteChamada primary key(instanteChamada);
   constraint fk_eventoEmergencia_local foreign key(moradaLocal) references local(moradaLocal);
   constraint fk_eventoEmergencia_processoSocorro foreign key(numProcessoSocorro) references processoSocorro(numProcessoSocorro);
   unique(numTelefone, nomePessoa));

create table processoSocorro
  (numProcessoSocorro integer not null unique,
  constraint pk_processoSocorro primary key(numProcessoSocorro)); -- ver ri

create table entidadeMeio
  (nomeEntidade varchar(80) not null unique,
  constraint pk_entidadeMeio primary key(nomeEntidade));

create table meio
  (numMeio  integer not null unique,
  nomeMeio  varchar(80) not null,
  nomeEntidade  varchar(80) not null,
  constraint pk_meio primary key(numMeio),
  constraint fk_meio_entidadeMeio foreign key(nomeEntidade) references entidadeMeio(nomeEntidade));

create table meioCombate
  (numMeio  integer not null unique,
  nomeEntidade  varchar(80) not null,
  constraint fk_meioCombate_meio foreign key(nomeEntidade) references meio(nomeEntidade));
  constraint fk_meioCombate_meio foreign key(numMeio) references meio(numMeio));

create table meioApoio
  (numMeio  integer not null unique,
  nomeEntidade  varchar(80) not null,
  constraint fk_meioApoio_meio foreign key(nomeEntidade) references meio(nomeEntidade));
  constraint fk_meioApoio_meio foreign key(numMeio) references meio(numMeio));

create table meioSocorro
  (numMeio  integer not null unique,
  nomeEntidade  varchar(80) not null,
  constraint fk_meioSocorro_meio foreign key(nomeEntidade) references meio(nomeEntidade));
  constraint fk_meioSocorro_meio foreign key(numMeio) references meio(numMeio));

create table transporta
  (numMeio  integer not null unique,
  nomeEntidade  varchar(80) not null,
  numVitimas  integer not null unique,
  numProcessoSocorro  integer not null,
  constraint fk_transporta_meioSocorro) foreign key(numMeio) references meioSocorro(numMeio),
  constraint fk_transporta_meioSocorro foreign key(nomeEntidade) references meioSocorro(nomeEntidade),
  constraint fk_transporta_processoSocorro foreign key(numProcessoSocorro) references processoSocorro(numProcessoSocorro));

create table alocado
  (numMeio  integer not null unique,
  nomeEntidade  varchar(80) not null,
  numHoras  integer not null,
  numProcessoSocorro  integer not null,
  constraint fk_alocado_meioApoio foreign key(numMeio) references meioApoio(numMeio),
  constraint fk_alocado_meioApoio foreign key(nomeEntidade) references meioApoio(nomeEntidade),
  constraint fk_alocado_processoSocorro foreign key(numProcessoSocorro) references processoSocorro(numProcessoSocorro));

create table acciona
  (numMeio  integer not null unique,
  nomeEntidade  varchar(80) not null,
  numProcessoSocorro  integer not null,
  constraint fk_acciona_meio foreign key(numMeio) references meio(numMeio),
  constraint fk_acciona_meio foreign key(nomeEntidade) references meio(nomeEntidade),
  constraint fk_acciona_processoSocorro foreign key(numProcessoSocorro) references processoSocorro(numProcessoSocorro));

create table coordenador
  (idCoordenador 	integer not null unique,
  constraint pk_coordenador primary key(idCoordenador));

create table audita
  (idCoordenador  integer not null unique,
  numMeio integer not null unique,
  nomeEntidade  varchar(80) not null unique,
  numProcessoSocorro  integer not null unique,
  dataHoraInicio datetime not null,
  dataHoraFim datetime not null,
  dataAuditoria date not null,
  dataAtual date not null,
  texto  text not null,
  constraint fk_audita_coordenador foreign key(idCoordenador) references coordenador(idCoordenador),
  constraint fk_audita_acciona foreign key(numMeio) references acciona(numMeio),
  constraint fk_audita_acciona foreign key(nomeEntidade) references acciona(nomeEntidade),
  constraint fk_audita_acciona foreign key(numProcessoSocorro) references acciona(numProcessoSocorro),
  check(dataHoraInicio < dataHoraFim),
  check(dataAuditoria >= dataAtual));

create table solicita
  (idCoordenador  integer not null unique,
  dataHoraInicioVideo  datetime not null unique,
  numCamara integer not null unique,
  dataHoraInicio  datetime not null,
  dataHoraFim datetime not null,
  constraint fk_solicita_coordenador foreign key(idCoordenador) references coordenador(idCoordenador),
  constraint fk_solicita_video foreign key(numCamara) references video(numCamara),
  constraint fk_solicita_video foreign key(dataHoraInicioVideo) references video(dataHoraInicioVideo));
----------------------------------------
-- Populate Relations
----------------------------------------

insert into customer values ('Adams',	'Main Street',	'Lisbon');
insert into customer values ('Brown',	'Main Street',	'Oporto');
insert into customer values ('Cook',	'Main Street',	'Lisbon');
insert into customer values ('Davis',	'Church Street','Oporto');
insert into customer values ('Evans',	'Forest Street','Coimbra');
insert into customer values ('Flores',	'Station Street','Braga');
insert into customer values ('Gonzalez','Sunny Street', 'Faro');
insert into customer values ('Iacocca',	'Spring Steet',	'Coimbra');
insert into customer values ('Johnson',	'New Street',	'Cascais');
insert into customer values ('King',	'Garden Street','Aveiro');
insert into customer values ('Lopez',	'Grand Street',	'Vila Real');
insert into customer values ('Martin',	'Royal Street',	'Braga');
insert into customer values ('Nguyen',	'School Street','Castelo Branco');
insert into customer values ('Oliver',	'First Stret',	'Oporto');
insert into customer values ('Parker',	'Hope Street',  'Oporto');

insert into branch values ('Downtown',	'Lisbon',		1900000);
insert into branch values ('Central',	'Cascais',		2100000);
insert into branch values ('Uptown',	'Amadora',		1700000);
insert into branch values ('Metro',	'Amadora',	 	400200);
insert into branch values ('Round Hill','Amadora',		8000000);
insert into branch values ('Ship Terminal', 'Sintra',	 	0400000);
insert into branch values ('Bolsa',  'Oporto',		3900000);
insert into branch values ('University',	'Vila Real',	7200000);
insert into branch values ('Wine Celar', 'Oporto',		4002800);

insert into account values ('A-101',	'Downtown',	500);
insert into account values ('A-215',	'Metro',	600);
insert into account values ('A-102',	'Uptown',	700);
insert into account values ('A-305',	'Round Hill',	800);
insert into account values ('A-201',	'Uptown',	900);
insert into account values ('A-222',	'Central',	550);
insert into account values ('A-217',	'University',	650);
insert into account values ('A-333',	'Central',	750);
insert into account values ('A-444',	'Downtown',	850);

insert into depositor values ('Johnson', 'A-101');
insert into depositor values ('Brown',	 'A-215');
insert into depositor values ('Cook',	 'A-102');
insert into depositor values ('Cook',	 'A-101');
insert into depositor values ('Flores',	 'A-305');
insert into depositor values ('Johnson', 'A-201');
insert into depositor values ('Iacocca', 'A-217');
insert into depositor values ('Evans',   'A-222');
insert into depositor values ('Oliver',  'A-333');
insert into depositor values ('Brown',	 'A-444');

insert into loan values ('L-17', 'Downtown',	1000);
insert into loan values ('L-23', 'Central',	2000);
insert into loan values ('L-15', 'Uptown',	3000);
insert into loan values ('L-14', 'Downtown',	4000);
insert into loan values ('L-93', 'Metro',	5000);
insert into loan values ('L-11', 'Round Hill',	6000);
insert into loan values ('L-16', 'Uptown',	7000);
insert into loan values ('L-20', 'Downtown',	8000);
insert into loan values ('L-21', 'Central',	9000);

insert into borrower values ('Iacocca',	'L-17');
insert into borrower values ('Brown',	'L-23');
insert into borrower values ('Cook',	'L-15');
insert into borrower values ('Nguyen',	'L-14');
insert into borrower values ('Davis',	'L-93');
insert into borrower values ('Brown',	'L-11');
insert into borrower values ('Gonzalez','L-17');
insert into borrower values ('Iacocca',	'L-16');
insert into borrower values ('Parker',	'L-20');
insert into borrower values ('Brown',	'L-21');
