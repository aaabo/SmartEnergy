package com.xjg.dao;

import java.util.List;

import com.xjg.bean.Energy;

public interface EnergyMapper {

	List<Energy> qryAllEnergy();

	List<Energy> detEnergyById(int id);

}
