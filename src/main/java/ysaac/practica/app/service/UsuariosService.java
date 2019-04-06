package ysaac.practica.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ysaac.practica.app.model.Usuario;
import ysaac.practica.app.repository.UsuariosRepository;


@Service
public class UsuariosService implements IUsuariosService{

	@Autowired
	private UsuariosRepository usuarioRepo;
	
	@Override
	public void guardar(Usuario usuario) {
		
		usuarioRepo.save(usuario);
	}

}
