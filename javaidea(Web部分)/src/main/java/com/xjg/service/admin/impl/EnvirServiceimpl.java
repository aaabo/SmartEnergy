package com.xjg.service.admin.impl;

import java.util.List;

import com.xjg.service.admin.EnvirService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xjg.bean.Envir;
import com.xjg.dao.EnvirMapper;

@Service
public class EnvirServiceimpl implements EnvirService {

	@Autowired
	EnvirMapper envirMapper;
	@Override
	public List<Envir> qryAllEnvir() {
		// TODO Auto-generated method stub
		List<Envir> envirList=envirMapper.qryAllEnvir();
		return envirList;
	}
	@Override
	public List<Envir> detEnvirById(int id) {
		// TODO Auto-generated method stub
		List<Envir> envirList=envirMapper.detEnvirById(id);
		return envirList;
	}
	

}
