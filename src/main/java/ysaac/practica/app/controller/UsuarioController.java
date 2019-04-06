package ysaac.practica.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ysaac.practica.app.model.Perfil;
import ysaac.practica.app.model.Usuario;
import ysaac.practica.app.service.IPerfilesService;
import ysaac.practica.app.service.IUsuariosService;

@Controller

@RequestMapping("/usuarios")
public class UsuarioController {
	
	@Autowired
	private IUsuariosService usuariosService;
	
	@Autowired
	private IPerfilesService perfilesService;

	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@GetMapping("/create")
	public String crear(@ModelAttribute Usuario usuario) {
		
		return "usuarios/formUsuario";
	}
	
	
	@PostMapping("/save")
	public String guardar(@ModelAttribute Usuario usuario, @RequestParam("perfil") String rol) {
        
		String encriptada=encoder.encode(usuario.getPwd());
		usuario.setPwd(encriptada);
		
		Perfil perfil =new Perfil();
		perfil.setCuenta(usuario.getCuenta());
		perfil.setPerfil(rol);
		
		/*
		 * System.out.println(usuario); System.out.println(perfil);
		 */
		
		usuariosService.guardar(usuario);
		perfilesService.guardar(perfil);
		
		
		return "redirect:/usuarios/create";
	}
	
}
