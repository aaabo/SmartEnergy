package com.xjg.dao;

import java.util.List;

import com.xjg.bean.Device;

public interface DeviceMapper {

	List<Device> qryAllDevice();

	void delDeviceById(int id);

	void updateDevice(Device device);

	Device detDeviceById(int id);

	void addDevice(Device device);

}
