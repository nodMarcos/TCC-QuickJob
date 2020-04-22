DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `prVisualiza_servico_visitante`(in codigo int)
begin
			select s.cd_servico, u.cd_usuario, s.nm_servico, s.ds_servico, s.vl_servico, (select avg(nivel_avaliacao) from tb_avaliacao where cd_servico = codigo) avaliacao, u.nm_usuario, u.tel_usuario, u.cd_cep
				from tb_servico s
					join tb_usuario u 
						on u.cd_usuario = s.cd_usuario
							where s.cd_servico = codigo;
	end$$
DELIMITER ;
