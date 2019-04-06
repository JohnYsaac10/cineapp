package ysaac.practica.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ysaac.practica.app.model.Detalle;
import ysaac.practica.app.repository.DetallesRepository;

@Service
public class DetallesServiceJPA implements IDetallesService{

	@Autowired
	private DetallesRepository detallesRepo;
	@Override
	public void insertar(Detalle detalles) {
		
		detallesRepo.save(detalles);
		
	}
	@Override
	public void eliminar(int idDetalle) {
		
		detallesRepo.deleteById(idDetalle);
		
	}

}
