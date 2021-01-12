package com.xjg.service.admin;

import java.util.List;

import com.xjg.bean.Energy;

public interface EnergyService {

	List<Energy> qryAllenergy();

	List<Energy> detEnergyById(int id);

}
