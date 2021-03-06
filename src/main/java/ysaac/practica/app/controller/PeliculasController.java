package ysaac.practica.app.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ysaac.practica.app.model.Pelicula;
import ysaac.practica.app.service.IDetallesService;
import ysaac.practica.app.service.IPeliculasService;
import ysaac.practica.app.util.Utileria;

@Controller
@RequestMapping("/peliculas")
public class PeliculasController {
	
	@Autowired
	private IDetallesService serviceDetalles;
	
	@Autowired
	private IPeliculasService servicePeliculas;
	

	@GetMapping("/index")
	public String mostrarIndex(Model model) {
		List<Pelicula> lista = servicePeliculas.buscarTodas();
		model.addAttribute("peliculas", lista);
		return "peliculas/listPeliculas";
	}
	
	@GetMapping("/create")
	public String crear(@ModelAttribute Pelicula pelicula, Model model) {
		model.addAttribute("generos", servicePeliculas.buscarGeneros());
		return "peliculas/formPelicula";
	}
	
	@PostMapping("/save")
	public String guardar(@ModelAttribute Pelicula pelicula, BindingResult result, RedirectAttributes attributes,
			@RequestParam("archivoImagen") MultipartFile multiPart, HttpServletRequest request
			) {
		
		if (result.hasErrors()) {
			//System.out.println("Existieron errores");
			return "peliculas/formPelicula";
		}
		
		if (!multiPart.isEmpty()) {
			String nombreImagen = Utileria.guardarImagen(multiPart,request);
			pelicula.setImagen(nombreImagen);
		}
		
		serviceDetalles.insertar(pelicula.getDetalle());
		
		servicePeliculas.insertar(pelicula);	
    	attributes.addFlashAttribute("mensaje", "El registro fue guardado");		
		return "redirect:/peliculas/index";
	}	
	
	@GetMapping("/edit/{id}")
	public String editar(Model model, @PathVariable("id") int idPelicula, @ModelAttribute Pelicula pelicula) {
		
		
		model.addAttribute("generos", servicePeliculas.buscarGeneros());
		model.addAttribute("pelicula", servicePeliculas.buscarPorId(idPelicula)); 
		
		return "peliculas/formPelicula";
	}
	
	@GetMapping("/delete/{idP}/{idD}")
	public String eliminar(@PathVariable("idP") int idPelicula,@PathVariable("idD") int idDetalle) {
		
		servicePeliculas.eliminar(idPelicula);
		//int idDetalle=servicePeliculas.buscarPorId(idPelicula).getDetalle().getId();
		serviceDetalles.eliminar(idDetalle);
		return "redirect:/peliculas/index";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}
	
}
