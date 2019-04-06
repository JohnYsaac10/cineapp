package ysaac.practica.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ysaac.practica.app.model.Banner;
import ysaac.practica.app.repository.BannerRepository;


@Service
public class BannerServiceJPA implements IBannersService{
	
	@Autowired
	private BannerRepository bannerRepo;

	@Override
	public void insertar(Banner banner) {
		
		bannerRepo.save(banner);
		
	}

	@Override
	public List<Banner> buscarTodos() {
		
		return bannerRepo.findAll();
	}

}
