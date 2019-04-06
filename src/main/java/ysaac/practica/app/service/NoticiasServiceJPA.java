package ysaac.practica.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ysaac.practica.app.model.Noticia;
import ysaac.practica.app.repository.NoticiasRepository;

@Service
public class NoticiasServiceJPA implements INoticiasService{

	@Autowired
	private NoticiasRepository noticiaRepo;
	@Override
	public void guardar(Noticia noticia) {
		
		noticiaRepo.save(noticia);
		
	}

}
