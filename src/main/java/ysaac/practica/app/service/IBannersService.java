package ysaac.practica.app.service;

import java.util.List;

import ysaac.practica.app.model.Banner;

public interface IBannersService {

	void insertar(Banner banner); 
	List<Banner> buscarTodos();
	
}
