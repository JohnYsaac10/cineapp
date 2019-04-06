package ysaac.practica.app.service;

import java.util.LinkedList;
import java.util.List;
//import java.util.Optional;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ysaac.practica.app.model.Pelicula;
import ysaac.practica.app.repository.PeliculasRepository;


@Service
public class PeliculaServiceJPA implements IPeliculasService{

	@Autowired
	private PeliculasRepository peliculasRepo;
	@Override
	public void insertar(Pelicula pelicula) {
		// TODO Auto-generated method stub
		peliculasRepo.save(pelicula);
	}

	@Override
	public List<Pelicula> buscarTodas() {
		// TODO Auto-generated method stub
		return peliculasRepo.findAll();
	}

	@Override
	public Pelicula buscarPorId(int idPelicula) {
		//Optional<Pelicula> opt=peliculasRepo.findById(idPelicula);
		
	    Optional<Pelicula> opt= peliculasRepo.findById(idPelicula);
	    
	    if(opt.isPresent()) {
	    	return opt.get();
	    }
		
		return null;
	}

	@Override
	public List<String> buscarGeneros() {
		// Nota: Esta lista podria ser obtenida de una BD
				List<String> generos = new LinkedList<>();
				generos.add("Accion");
				generos.add("Aventura");
				generos.add("Clasicas");
				generos.add("Comedia Romantica");
				generos.add("Drama");
				generos.add("Terror");
				generos.add("Infantil");
				generos.add("Accion y Aventura");
				generos.add("Romantica");
				generos.add("Ciencia Ficcion");
						
				return generos;
	}

	@Override
	public void eliminar(int idPelicula) {
		peliculasRepo.deleteById(idPelicula);

	}

}
