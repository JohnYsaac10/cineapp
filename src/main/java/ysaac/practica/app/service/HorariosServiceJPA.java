package ysaac.practica.app.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ysaac.practica.app.model.Horario;
import ysaac.practica.app.repository.HorariosRepository;

@Service
public class HorariosServiceJPA  implements IHorariosService{

	@Autowired
	private HorariosRepository horariosRepo;
	
	@Override
	public List<Horario> buscarPorIdAndFecha(int id, Date fecha) {
		
		//List<Noticia> opt=
		
		return horariosRepo.findByPelicula_IdAndFechaOrderByHora(id, fecha);
	}

}
