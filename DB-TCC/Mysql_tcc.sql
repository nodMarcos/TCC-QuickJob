-- use heroku_bedc1debaa9dc23;
drop database if exists db_quickjob;
create database db_quickjob;

use db_quickjob;
    
create table tb_usuario(
	cd_usuario int not null auto_increment,
	ds_email varchar(70) not null,
	ds_senha varchar(70) not null,
	nm_usuario varchar(70) not null,
	dt_nascimento date not null,
	tel_usuario varchar(18),
	cd_cpf varchar(20),
	cd_cnpj varchar(20),
    cd_cep varchar(12),
	constraint pk_usuario
		primary key(cd_usuario)
);

create table tb_contato(
	cd_contato int not null auto_increment,
    tel_contato varchar(18),
    email_contato varchar(70),
    cd_usuario int,
    
    constraint pk_contato
		primary key(cd_contato),
	constraint fk_contato_usuario
		foreign key (cd_usuario)
			references tb_usuario (cd_usuario)
);
	
create table tb_servico(
	cd_servico int not null auto_increment,
	nm_servico varchar(50),
	ds_servico varchar(300),
	vl_servico decimal(9,2),
	cd_usuario int,
	visualizacoes int,
	constraint pk_servico
		primary key(cd_servico),
		
	constraint fk_servico_empregado
		foreign key(cd_usuario)
			references tb_usuario(cd_usuario)
);
        
create table tb_avaliacao(
	cd_avaliacao int not null auto_increment,
	nivel_avaliacao int,
	comentario_avaliacao varchar(100),
	cd_usuario int,
	cd_servico int,
	constraint pk_avaliacao
		primary key(cd_avaliacao),
		
	constraint fk_avaliacao_usuario
		foreign key (cd_usuario)
			references tb_usuario(cd_usuario),
			
	constraint fk_avaliacao_servico
		foreign key (cd_servico)
			references tb_servico(cd_servico)
);