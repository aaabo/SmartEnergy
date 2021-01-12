package com.xjg.service.admin;

import java.util.List;

import com.xjg.bean.Envir;


public interface EnvirService {

	List<Envir> qryAllEnvir();

	List<Envir> detEnvirById(int id);

}
