package ysaac.practica.app.service;

import java.util.Date;
import java.util.List;

import ysaac.practica.app.model.Horario;

public interface IHorariosService {

	List<Horario> buscarPorIdAndFecha(int id, Date fecha);
}
