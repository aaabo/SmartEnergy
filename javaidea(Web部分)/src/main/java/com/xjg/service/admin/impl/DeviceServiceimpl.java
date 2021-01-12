package com.xjg.service.admin.impl;

import java.util.List;

import com.xjg.service.admin.DeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xjg.bean.Device;
import com.xjg.dao.DeviceMapper;

@Service
public class DeviceServiceimpl implements DeviceService {

	@Autowired
	DeviceMapper deviceMapper;

	@Override
	public List<Device> qryAllDevice() {
		// TODO Auto-generated method stub
		List<Device> deviceList=deviceMapper.qryAllDevice();
		return deviceList;
	}

	@Override
	public void delDeviceById(int id) {
		// TODO Auto-generated method stub
		deviceMapper.delDeviceById(id);
		
	}

	@Override
	public void updateDevice(Device device) {
		// TODO Auto-generated method stub
		deviceMapper.updateDevice(device);
		
	}

	@Override
	public Device detDeviceById(int id) {
		// TODO Auto-generated method stub
		Device device = deviceMapper.detDeviceById(id);
		return device;
	}

	@Override
	public void addDevice(Device device) {
		// TODO Auto-generated method stub
		deviceMapper.addDevice(device);
	}

}
