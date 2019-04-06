package ysaac.practica.app.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ysaac.practica.app.model.Pelicula;
import ysaac.practica.app.service.IBannersService;
import ysaac.practica.app.service.IHorariosService;
import ysaac.practica.app.service.IPeliculasService;
import ysaac.practica.app.util.Utileria;

@Controller
public class HomeController {

	@Autowired
	private IBannersService serviceBanners;

	@Autowired
	private IPeliculasService servicePeliculas;

	@Autowired
	private IHorariosService serviceHorarios;

	private SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String buscar(@RequestParam("fecha") String fecha, Model model) {

		List<String> listaFechas = Utileria.getNextDays(4);

		List<Pelicula> peliculas = servicePeliculas.buscarTodas();
		model.addAttribute("fechas", listaFechas);
		model.addAttribute("fechaBusqueda", fecha);
		model.addAttribute("peliculas", peliculas);
		model.addAttribute("banners", serviceBanners.buscarTodos());

		return "home";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mostrarPrincipal(Model model) {

		List<String> listaFechas = Utileria.getNextDays(4);

		List<Pelicula> peliculas = servicePeliculas.buscarTodas();
		model.addAttribute("fechas", listaFechas);
		model.addAttribute("fechaBusqueda", dateFormat.format(new Date()));
		model.addAttribute("peliculas", peliculas);
		model.addAttribute("banners", serviceBanners.buscarTodos());

		return "home";
	}

	@RequestMapping(value = "/detail/{id}/{fecha}", method = RequestMethod.GET)
	public String mostrarDetalle(Model model, @PathVariable("id") int idPelicula, @PathVariable("fecha") Date fecha) {

		// SimpleDateFormat fmt=new SimpleDateFormat(fecha);
		model.addAttribute("pelicula", servicePeliculas.buscarPorId(idPelicula));

		model.addAttribute("horarios", serviceHorarios.buscarPorIdAndFecha(idPelicula, fecha));
		// TODO - Buscar en la base de datos los horarios.

		return "detalle";
	}

	@GetMapping(value = "/about")
	public String acerca() {
		return "acerca";
	}

	 
	 @GetMapping(value = "/formLogin" ) 
	  public String mostrarLogin() { 
		  return "formLogin"; 
	  }
	 
	 
	 
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

}
