package ysaac.practica.app.service;

import java.util.List;

import ysaac.practica.app.model.Pelicula;

public interface IPeliculasService {
	void insertar(Pelicula pelicula); 
	List<Pelicula> buscarTodas();
	Pelicula buscarPorId(int idPelicula);
	List<String> buscarGeneros();
	void eliminar(int idPelicila);
}
