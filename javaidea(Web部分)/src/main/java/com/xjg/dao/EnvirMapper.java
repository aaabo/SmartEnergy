package com.xjg.dao;

import java.util.List;

import com.xjg.bean.Envir;

public interface EnvirMapper {

	List<Envir> qryAllEnvir();

	List<Envir> detEnvirById(int id);

}
