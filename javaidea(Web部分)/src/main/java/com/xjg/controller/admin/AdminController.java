package com.xjg.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.xjg.service.admin.AuserService;
import com.xjg.service.admin.DeviceService;
import com.xjg.service.admin.EnergyService;
import com.xjg.service.admin.EnvirService;


import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xjg.bean.Auser;
import com.xjg.bean.Device;
import com.xjg.bean.Energy;
import com.xjg.bean.EnergyString;
import com.xjg.bean.Envir;
import com.xjg.bean.EnvirString;

@Controller
public class AdminController {

	@Autowired
	DeviceService deviceService;

	@RequestMapping("/admin")
	public String admin(Model model) {
		List<Device> devicesList = deviceService.qryAllDevice();
		// ����ѯ�����Ķ������ݴ��ݵ�ҳ��
		model.addAttribute("devicesList", devicesList);
		// System.out.println(devicesList);
		return "admin/home";
	}

	@RequestMapping(value="/admin2",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String admin2(Model model, HttpServletResponse response) {
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
		response.addHeader("text/html","charset=UTF-8");
		List<Device> devicesList = deviceService.qryAllDevice();
		// System.out.println(energysList);
		return JSON.toJSONString(devicesList);
	}

	@RequestMapping("/login")
	public String login(Model model) {

		return "admin/login";
	}

	@RequestMapping("/register")
	public String register(Model model) {

		return "admin/register";
	}

	@RequestMapping("/manage")
	public String manage(Model model) {

		return "admin/manage";
	}


	@Autowired
	EnvirService envirService;

	@RequestMapping("/environment")
	public String environment(Model model) {
		List<Envir> envirsList = envirService.qryAllEnvir();
		// ����ѯ�����Ķ������ݴ��ݵ�ҳ��
		model.addAttribute("envirsList", envirsList);
		// System.out.println(envirsList);
		return "admin/environment";
	}

	@RequestMapping(value="/environment2",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String environment2(Model model, HttpServletResponse response) {
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
		response.addHeader("text/html","charset=UTF-8");
		List<Envir> envirsList = envirService.qryAllEnvir();
		// System.out.println(energysList);
		return JSON.toJSONString(envirsList);
	}

	@Autowired
	EnergyService energyService;

	@RequestMapping("/energy")
	public String energy(Model model) {
		List<Energy> energysList = energyService.qryAllenergy();
		model.addAttribute("energysList", energysList);
		// System.out.println(energysList);
		return "admin/energy";
	}


	@RequestMapping(value="/energy2",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String energy2(Model model, HttpServletResponse response) {
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
		response.addHeader("text/html","charset=UTF-8");
		List<Energy> energysList = energyService.qryAllenergy();
		System.out.println(energysList.get(0).getDevice_name());
		// System.out.println(energysList);
		return JSON.toJSONString(energysList);
	}


	@RequestMapping("/delDeviceById")
	@ResponseBody
	public String delDeviceById(int id) {
		// System.out.println(id);
		deviceService.delDeviceById(id);
		return "ok";
	}

	@RequestMapping("/updateDevice")
	@ResponseBody
	public String updateDevice(Device device) {
		// System.out.println(id);
		deviceService.updateDevice(device);
		return "ok";
	}

	@RequestMapping("/detDeviceById")
	@ResponseBody

	public Device detDeviceById(int id, HttpSession session) {
		// System.out.println(id);
		Device device = deviceService.detDeviceById(id);

		// System.out.println(device.getDevice_name());
		return device;

	}

	@RequestMapping("/addDevice")
	@ResponseBody
	public String addDevice(Device device) {
		// System.out.println(id);
		deviceService.addDevice(device);
		return "ok";
	}

	@Autowired
	AuserService auserService;

	@RequestMapping("/auserLogin")
	@ResponseBody
	public String auserLogin(String aname, String apwd, HttpSession session) {
		// System.out.println("123");
		Auser auser = auserService.auserLogin(aname, apwd);
		// System.out.println(auser.getAname());
		if (auser != null) {
			session.setAttribute("userInfo", auser);
			return "ok";
		} else {
			return "nook";
		}

	}

	@RequestMapping("/auserregister")
	@ResponseBody
	public String auserregister(String aname, String apwd) {
		//System.out.println(aname);
		Auser auser = auserService.qryAuserByAname(aname);
		//System.out.println(auser);
		if (auser != null) {
			//System.out.println("nook");
			return "nook";
		} else {
			//System.out.println("ok");
			auserService.auserregister(aname, apwd);
			//System.out.println(aname);
			return "ok";
		}

	}


	@RequestMapping("/detEnvirById")
	@ResponseBody

	public EnvirString detEnvirById(int id, HttpServletResponse response) {
	//	System.out.println(id);
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
		EnvirString envirString = new EnvirString();
		List<Envir> envirsList = envirService.detEnvirById(id);
		int len = envirsList.size();
		for (int i = 0; i < len; i++) {
	
				envirString.temp.add(envirsList.get(i).getTemp());
				envirString.humidity.add(envirsList.get(i).getHumidity());
				envirString.smoke.add(envirsList.get(i).getSmoke());
				envirString.hetime.add(envirsList.get(i).getHetime());
				

		}
		
		return envirString;

	}


	@RequestMapping("/detEnergyById" )
	@ResponseBody

	public EnergyString detEnergyById(int id, HttpServletResponse response) {
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
		//System.out.println(id);
		EnergyString energyString = new EnergyString();
		List<Energy> energyList = energyService.detEnergyById(id);
		//System.out.println(energyList);
		int len = energyList.size();
		for (int i = 0; i < len; i++) {
			energyString.electric.add(energyList.get(i).getElectric());
			energyString.water.add(energyList.get(i).getWater());
			energyString.etime.add(energyList.get(i).getEtime());

		}
		
		return energyString;

	}
	
	
	
	@RequestMapping("/delAuser")
	@ResponseBody
	public String delAuser(String aname) {
		Auser auser = auserService.qryAuserByAname(aname);
		if (auser != null) {
			auserService.delAuser(aname);
			return "ok";
		} else {
			return "nook";
		}
	}
	
	
	@RequestMapping("/updataPwd")
	@ResponseBody
	public String updateDevice(Auser auser,String upwd) {
		Auser uauser = auserService.auserLogin(auser.getAname(), auser.getApwd());
		if (uauser != null) {
			auser.setApwd(upwd);
			auserService.updataPwd(auser);
			return "ok";
		} else {
			return "nook";
		}
	}
	
	@RequestMapping("/exitAuser")
	@ResponseBody
	public String exitAuser(HttpSession session) {
		session.removeAttribute("userInfo") ;
		return "ok";
	}
	
	

}
