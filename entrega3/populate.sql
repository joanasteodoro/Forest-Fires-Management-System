----------------------------------------
-- Populate Relations
----------------------------------------

--camara
insert into camara values (1);
insert into camara values (2);
insert into camara values (3);
insert into camara values (4);
insert into camara values (5);
insert into camara values (6);
insert into camara values (7);
insert into camara values (8);
insert into camara values (9);
insert into camara values (10);
insert into camara values (11);
insert into camara values (12);
insert into camara values (13);
insert into camara values (14);
insert into camara values (15);
insert into camara values (16);
insert into camara values (17);
insert into camara values (18);
insert into camara values (19);
insert into camara values (20);
insert into camara values (21);
insert into camara values (22);
insert into camara values (23);
insert into camara values (24);
insert into camara values (25);
insert into camara values (26);
insert into camara values (27);
insert into camara values (28);
insert into camara values (29);
insert into camara values (30);

--video
insert into video values (1, '2018-01-01 00:00:00', '2018-01-01 00:10:00');
insert into video values (2, '2018-01-01 00:10:00', '2018-01-01 00:20:00');
insert into video values (3, '2018-01-01 00:20:00', '2018-01-01 00:30:00');
insert into video values (4, '2018-01-01 00:30:00', '2018-01-01 00:40:00');
insert into video values (5, '2018-08-01 00:20:00', '2018-09-01 00:50:00');
insert into video values (6, '2018-01-01 00:50:00', '2018-01-01 01:00:00');
insert into video values (7, '2018-01-01 01:00:00', '2018-01-01 01:10:00');
insert into video values (8, '2018-01-01 01:10:00', '2018-01-01 01:20:00');
insert into video values (9, '2018-01-01 01:20:00', '2018-01-01 01:30:00');
insert into video values (10, '2018-08-01 00:20:00', '2018-09-01 01:40:00');

--segmentoVideo
insert into segmentoVideo values (1, '2018-01-01 00:00:00', 1, 20);
insert into segmentoVideo values (1, '2018-01-01 00:00:00', 2, 24);
insert into segmentoVideo values (1, '2018-01-01 00:00:00', 3, 21);
insert into segmentoVideo values (1, '2018-01-01 00:00:00', 4, 22);
insert into segmentoVideo values (1, '2018-01-01 00:00:00', 5, 40);
insert into segmentoVideo values (2, '2018-01-01 00:10:00', 6, 14);
insert into segmentoVideo values (2, '2018-01-01 00:10:00', 7, 74);
insert into segmentoVideo values (2, '2018-01-01 00:10:00', 8, 16);
insert into segmentoVideo values (2, '2018-01-01 00:10:00', 9, 54);
insert into segmentoVideo values (5, '2018-08-01 00:20:00', 10, 84);
insert into segmentoVideo values (10, '2018-08-01 00:20:00', 14, 63);
insert into segmentoVideo values (3, '2018-01-01 00:20:00', 11, 29);
insert into segmentoVideo values (3, '2018-01-01 00:20:00', 12, 31);
insert into segmentoVideo values (3, '2018-01-01 00:20:00', 13, 39);

--local
insert into local values ('Lisboa');
insert into local values ('Madeira');
insert into local values ('Santarem');
insert into local values ('Povoa');
insert into local values ('Aveiro');
insert into local values ('Castelo Branco');
insert into local values ('Figueira da Foz');
insert into local values ('Porto');
insert into local values ('Açores');
insert into local values ('Braga');
insert into local values ('Braganca');
insert into local values ('Oliveira do Hospital');
insert into local values ('Monchique');

--vigia
insert into vigia values (1, 'Lisboa');
insert into vigia values (2, 'Monchique');
insert into vigia values (3, 'Lisboa');
insert into vigia values (4, 'Lisboa');
insert into vigia values (5, 'Monchique');
insert into vigia values (6, 'Lisboa');
insert into vigia values (7, 'Lisboa');
insert into vigia values (8, 'Lisboa');
insert into vigia values (9, 'Lisboa');
insert into vigia values (10, 'Monchique');
insert into vigia values (11, 'Monchique');

--processoSocorro
insert into processoSocorro values (1);
insert into processoSocorro values (2);
insert into processoSocorro values (3);
insert into processoSocorro values (4);
insert into processoSocorro values (5);
insert into processoSocorro values (6);
insert into processoSocorro values (7);
insert into processoSocorro values (8);
insert into processoSocorro values (9);
insert into processoSocorro values (10);

--eventoEmergencia
insert into eventoEmergencia values (123456789,	'2018-07-02 00:00:00', 'Tai',	'Lisboa', 1);
insert into eventoEmergencia values (113456789,	'2018-07-01 00:00:00', 'Bli',	'Madeira', 2);
insert into eventoEmergencia values (123556789,	'2017-07-09 00:00:00', 'Dani', 'Santarem', 3);
insert into eventoEmergencia values (123456009,	'2018-07-03 00:00:00', 'Ay',	'Povoa', 4);
insert into eventoEmergencia values (123452789,	'2018-07-07 00:02:00', 'Rocha',	'Aveiro', 5);
insert into eventoEmergencia values (123456729,	'2018-07-08 00:00:00', 'Joana',	'Castelo Branco', 6);
insert into eventoEmergencia values (123454449,	'2018-07-20 00:00:00', 'Tangerina',	'Figueira da Foz', 7);
insert into eventoEmergencia values (198454449,	'2018-06-20 00:00:00', 'Azeitona',	'Oliveira do Hospital', 8);
insert into eventoEmergencia values (129876449,	'2018-05-20 00:00:00', 'Gajas',	'Oliveira do Hospital', 9);
insert into eventoEmergencia values (187654449,	'2018-09-20 00:00:00', 'Meninos',	'Oliveira do Hospital', 10);

--entidadeMeio
insert into entidadeMeio values ('what');
insert into entidadeMeio values ('is');
insert into entidadeMeio values ('nome');
insert into entidadeMeio values ('entidade');
insert into entidadeMeio values ('exactly');
insert into entidadeMeio values ('gajas');

--meio
insert into meio values (1, 'Apoio', 'what');
insert into meio values (2, 'Apoio', 'is');
insert into meio values (3, 'Apoio', 'nome');
insert into meio values (4, 'Apoio', 'entidade');
insert into meio values (5, 'Apoio', 'exactly');
insert into meio values (6, 'Socorro', 'what');
insert into meio values (7, 'Combate', 'what');
insert into meio values (8, 'Socorro', 'is');
insert into meio values (9, 'Combate', 'gajas');
insert into meio values (10, 'Combate', 'gajas');
insert into meio values (11, 'Apoio', 'what');

--meioCombate
insert into meioCombate values (7, 'what');
insert into meioCombate values (1, 'what');
insert into meioCombate values (9, 'gajas');

--meioApoio
insert into meioApoio values (1, 'what');
insert into meioApoio values (2, 'is');
insert into meioApoio values (3, 'nome');
insert into meioApoio values (4, 'entidade');
insert into meioApoio values (5, 'exactly');

--meioSocorro
insert into meioSocorro values (6, 'what');

--transporta
insert into transporta values (6, 'what', 20, 1);
insert into transporta values (6, 'what', 50, 2);
insert into transporta values (6, 'what', 30, 3);
insert into transporta values (6, 'what', 20, 4);
insert into transporta values (6, 'what', 20, 5);
insert into transporta values (6, 'what', 120, 6);
insert into transporta values (6, 'what', 60, 7);

--alocado
insert into alocado values (1, 'what', 2, 1);
insert into alocado values (2, 'is', 3, 2);
insert into alocado values (3, 'nome', 5, 3);
insert into alocado values (4, 'entidade', 8, 4);
insert into alocado values (5, 'exactly', 2, 5);
insert into alocado values (1, 'what', 1, 6);
insert into alocado values (1, 'what', 3, 7);

--acciona numMeio, nomeEntidade, numProcessoSocorro
insert into acciona values (1, 'what', 1);
insert into acciona values (2, 'is', 2);
insert into acciona values (3, 'nome', 3);
insert into acciona values (4, 'entidade', 4);
insert into acciona values (5, 'exactly', 5);
insert into acciona values (6, 'what', 6);
insert into acciona values (7, 'what', 7);
insert into acciona values (9, 'gajas', 9);
insert into acciona values (10, 'gajas', 10);
insert into acciona values (1, 'what', 2);
insert into acciona values (7, 'what', 3);
insert into acciona values (1, 'what', 4);
insert into acciona values (7, 'what', 5);
insert into acciona values (1, 'what', 6);
insert into acciona values (1, 'what', 8);
insert into acciona values (7, 'what', 9);
insert into acciona values (1, 'what', 10);

--coordenador
insert into coordenador values (1);
insert into coordenador values (2);
insert into coordenador values (3);
insert into coordenador values (4);
insert into coordenador values (5);
insert into coordenador values (6);
insert into coordenador values (7);
insert into coordenador values (8);
insert into coordenador values (9);
insert into coordenador values (10);

--audita
insert into audita values (1, 1, 'what', 1, '2018-01-01 00:00:00', '2018-01-01 00:20:00', '2019-01-03', 'oi');
insert into audita values (2, 2, 'is', 2, '2018-01-01 00:10:00', '2018-01-01 01:00:00', '2019-03-01', 'tudo');
insert into audita values (3, 3, 'nome', 3, '2018-01-01 00:55:00', '2018-01-01 02:00:00', '2019-01-04', 'bem');
insert into audita values (4, 4, 'entidade', 4, '2018-01-01 01:00:00', '2018-01-01 01:50:00', '2019-01-05', 'gajas');
insert into audita values (5, 5, 'exactly', 5, '2018-01-01 00:40:00', '2018-01-01 02:00:00', '2019-03-11', 'ya');
insert into audita values (6, 6, 'what', 6, '2018-01-01 00:30:00', '2018-01-01 01:00:00', '2019-04-11', 'mais');
insert into audita values (7, 7, 'what', 7, '2018-01-01 00:05:00', '2018-01-01 01:10:00', '2019-05-01', 'texto');

--solicita
insert into solicita values (1, '2018-01-01 00:00:00', '2018-01-01 00:20:00', '2018-01-01 00:20:00', 1);
insert into solicita values (2, '2018-01-01 00:00:00', '2018-01-01 01:00:00', '2018-01-01 00:20:00', 1);
insert into solicita values (3, '2018-01-01 00:00:00', '2018-01-01 02:00:00', '2018-01-01 00:20:00', 1);
insert into solicita values (4, '2018-01-01 00:00:00', '2018-01-01 01:50:00', '2018-01-01 00:20:00', 1);
insert into solicita values (5, '2018-01-01 00:10:00', '2018-01-01 02:00:00', '2018-01-01 00:20:00', 2);
insert into solicita values (6, '2018-01-01 00:10:00', '2018-01-01 01:00:00', '2018-01-01 00:20:00', 2);
insert into solicita values (7, '2018-01-01 00:10:00', '2018-01-01 01:10:00', '2018-01-01 00:20:00', 2);
