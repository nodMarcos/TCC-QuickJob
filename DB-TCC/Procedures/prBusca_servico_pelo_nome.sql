delimiter $
	create procedure prBusca_servico_pelo_nome(in nome varchar(50))
		begin
			select s.nm_servico, s.ds_servico, s.vl_servico, s.cd_servico, u.cd_usuario
				from tb_servico s 
					join tb_usuario u 
						on u.cd_usuario = s.cd_usuario
							where s.nm_servico like concat("%", nome, "%") or s.ds_servico like concat("%", nome, "%");
	end $