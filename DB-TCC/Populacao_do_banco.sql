-- use heroku_bedc1debaa9dc23;	
use db_quickjob;
    
    	-- Usuario
    insert into tb_usuario values
    (1, 'arya@gmail.com','123456','Arya Stark','1989-04-12','(13) 34545227','307.635.160-58',null, '11717350'),
    (2, 'bia_hora@gmail.com','123456','Beatriz Hora','2000-02-08','(13) 34545433',null,'90.879.790/0001-10', '11704730'),
    (3, 'kaike_sk@gmail.com','123456','Kaique Santos Castro','1989-07-23','(13) 34545444',null,'12.924.232/0001-15', '11725100'),
    (4, 'mario@gmail.com','123456','Mario Alberto Cunha','1999-12-07','(13) 34545411','757.109.610-35',null, '11703140'),
    (5, 'bertinho@gmail.com','123456','Bertinho Habib Paiva','2000-08-05','(13) 34545455','874.834.530-01',null, '11725525'),
    (6, 'joaquimeduardo@gmail.com','123456','Joaquim Eduardo','1988-01-25','(13) 34545466','994.381.010-63',null, '11714340'),
    (7, 'diogocarlosmateusalmeida@gmail.com','123456','Diogo Carlos', '1941-04-18','(13) 34545477','205.286.310-98',null, '11717285'),
    (8, 'pedronelsongfreitas@gmail.com','123456','Pedro Nelson Freitas','1972-11-09','(13) 34545488','364.448.850-94',null, '11702605'),
    (9, 'anthonymanueldarocha@gmail.com','123456','Anthony Manuel da Rocha','1941-10-20','(13) 34545499','641.276.730-44',null, '11707480'),
    (10, 'luizaelzadrumond@gmail.com','123456','Luiza Elza Drumond','1997-04-03','(13) 34545467','423.220.820-82',null, '11711340');
    
    
    insert into tb_contato(cd_contato, tel_contato, email_contato, cd_usuario) values(1, '(13) 35967202', 'arya@gmail.com', 1);
    insert into tb_contato(cd_contato, tel_contato, email_contato, cd_usuario) values(2, '(13) 997756351', 'pedro@gmail.com', 2);
    insert into tb_contato(cd_contato, tel_contato, email_contato, cd_usuario) values(3, '(13) 988664229', 'luana@gmail.com', 3);
    insert into tb_contato(cd_contato, tel_contato, email_contato, cd_usuario) values(4, '(13) 996661166', 'afonso@gmail.com', 4);
    insert into tb_contato(cd_contato, tel_contato, email_contato, cd_usuario) values(5, '(13) 997824371', 'george@gmail.com', 5);
    insert into tb_contato(cd_contato, tel_contato, email_contato, cd_usuario) values(6, '(11) 997766795', 'joaquimeduardo@gmail.com', 6);
    insert into tb_contato(cd_contato, tel_contato, email_contato, cd_usuario) values(7, '(17) 986579674', 'diogocarlosmateusalmeida@gmail.com', 7);
    insert into tb_contato(cd_contato, tel_contato, email_contato, cd_usuario) values(8, '(11) 985336887', 'pedronelsongfreitas@gmail.com', 8);
    insert into tb_contato(cd_contato, tel_contato, email_contato, cd_usuario) values(9, '(11) 993324627', 'anthonymanueldarocha@gmail.com', 9);
    insert into tb_contato(cd_contato, tel_contato, email_contato, cd_usuario) values(10, '(11) 994754656', 'luizaelzadrumond@gmail.com', 10);   
    
select * from tb_servico;

	-- servico    
    insert into tb_servico(cd_servico, nm_servico,ds_servico,vl_servico,cd_usuario, visualizacoes) values(1,'Babá', 'Babá de crianças e adolescentes, valor por dia', 100.00,1, 0);
    insert into tb_servico(cd_servico, nm_servico,ds_servico,vl_servico,cd_usuario, visualizacoes) values(2,'Cuidadora de idosos', 'Cuidadora de idosos, R$20 a hora', 20.00,2, 0);
    insert into tb_servico(cd_servico, nm_servico,ds_servico,vl_servico,cd_usuario, visualizacoes) values(3,'Faxineira', 'Faxinas mensais', 150.00,3, 0);
    insert into tb_servico(cd_servico, nm_servico,ds_servico,vl_servico,cd_usuario, visualizacoes) values(4,'Cozinheiro', 'Cozinheiro pessoal, cobro por dia', 80.00,4, 0);
    insert into tb_servico(cd_servico, nm_servico,ds_servico,vl_servico,cd_usuario, visualizacoes) values(5,'Pedreiro', 'Preço a negociar', 00.00,5, 0);
    insert into tb_servico(cd_servico, nm_servico,ds_servico,vl_servico,cd_usuario, visualizacoes) values(6,'Cozinheiro', 'Fazemos entregas!', 15.00,6, 0);
    insert into tb_servico(cd_servico, nm_servico,ds_servico,vl_servico,cd_usuario, visualizacoes) values(7,'Faxineiro', 'Preço por semana', 120.00,7, 0);
    insert into tb_servico(cd_servico, nm_servico,ds_servico,vl_servico,cd_usuario, visualizacoes) values(8,'Cabeleireiro', 'Cabeleireiro UNISSEX, R$15.00 as quartas!', 20.00,8, 0);    
    
    -- avaliacão
    insert into tb_avaliacao(cd_avaliacao, nivel_avaliacao, comentario_avaliacao, cd_usuario, cd_servico) values(1, 5, 'Muito bom', 5,1);
    insert into tb_avaliacao(cd_avaliacao, nivel_avaliacao, comentario_avaliacao, cd_usuario, cd_servico) values(2, 2, 'Sem paciência', 2,2);
    insert into tb_avaliacao(cd_avaliacao, nivel_avaliacao, comentario_avaliacao, cd_usuario, cd_servico) values(3, 4, 'Excelente serviço', 3,3);
    insert into tb_avaliacao(cd_avaliacao, nivel_avaliacao, comentario_avaliacao, cd_usuario, cd_servico) values(4, 2, 'Serviço muito mal feito', 1,4);
    insert into tb_avaliacao(cd_avaliacao, nivel_avaliacao, comentario_avaliacao, cd_usuario, cd_servico) values(5, 3, 'Serviço regular', 6,5);
    insert into tb_avaliacao(cd_avaliacao, nivel_avaliacao, comentario_avaliacao, cd_usuario, cd_servico) values(6, 1, 'Serviço mediocre', 4,6);
    insert into tb_avaliacao(cd_avaliacao, nivel_avaliacao, comentario_avaliacao, cd_usuario, cd_servico) values(7, 3, 'Serviço bem mais ou menos', 7,7);     
    