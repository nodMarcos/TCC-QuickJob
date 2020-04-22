delimiter $
	create procedure prExibeServico(in codigo int)
		begin
			select s.cd_servico, s.nm_servico, s.ds_servico, s.vl_servico, s.visualizacoes, (select avg(nivel_avaliacao) from tb_avaliacao where cd_servico = codigo) avaliacao
				from tb_servico s
					join tb_usuario u 
						on u.cd_usuario = s.cd_usuario
							where s.cd_servico = codigo;
	end $