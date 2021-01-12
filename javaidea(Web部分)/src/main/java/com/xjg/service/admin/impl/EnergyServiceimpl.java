package com.xjg.service.admin.impl;

import java.util.List;

import com.xjg.service.admin.EnergyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xjg.bean.Energy;
import com.xjg.dao.EnergyMapper;

@Service
public class EnergyServiceimpl implements EnergyService {

	@Autowired
	EnergyMapper energyMapper;
	@Override
	public List<Energy> qryAllenergy() {
		// TODO Auto-generated method stub
		List<Energy> energyList=energyMapper.qryAllEnergy();
		return energyList;
	}
	@Override
	public List<Energy> detEnergyById(int id) {
		// TODO Auto-generated method stub
		List<Energy> energyList=energyMapper.detEnergyById(id);
		return energyList;
	}

}
