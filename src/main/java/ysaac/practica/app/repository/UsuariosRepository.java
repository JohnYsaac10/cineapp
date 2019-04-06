package ysaac.practica.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import ysaac.practica.app.model.Usuario;

public interface UsuariosRepository extends JpaRepository<Usuario, Integer> {

}
