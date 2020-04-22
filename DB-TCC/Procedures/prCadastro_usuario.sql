delimiter $
	create procedure prCadastro_usuario(
		in nome varchar(70),
        in email varchar(70),
        in senha varchar(70),
        in nascimento date,
        in cpf varchar(20),
        in cnpj varchar(20),
        in telefone varchar(18),
        in cep varchar(20)
    )
	begin
		if exists (select * from tb_usuario where ds_email = email) then
			select "Usuário já cadastrado" as msg;
		else
			insert into tb_usuario values 
				(default, email, senha, nome, nascimento, telefone, cpf, cnpj, cep);
        end if;
	end $