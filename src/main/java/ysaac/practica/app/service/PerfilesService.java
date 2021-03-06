package ysaac.practica.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ysaac.practica.app.model.Perfil;
import ysaac.practica.app.repository.PerfilesRepository;


@Service
public class PerfilesService implements IPerfilesService{

	@Autowired
	private PerfilesRepository perfilesRepo;
	
	@Override
	public void guardar(Perfil perfil) {
		
		perfilesRepo.save(perfil);
	}

}
