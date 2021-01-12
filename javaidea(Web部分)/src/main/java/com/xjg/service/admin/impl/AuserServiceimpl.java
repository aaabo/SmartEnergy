package com.xjg.service.admin.impl;

import com.xjg.service.admin.AuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xjg.bean.Auser;
import com.xjg.dao.AuserMapper;
import com.xjg.util.MyUtil;
@Service
public class AuserServiceimpl implements AuserService {

	@Autowired
	AuserMapper auserMapper;
	
	@Override
	public Auser  auserLogin(String aname,String apwd) {
		
		apwd=MyUtil.MD5(apwd, "xjg");
		return auserMapper.qryAuserByAnameAndApwd(aname,apwd);
		

	}

	@Override
	public void auserregister(String aname, String apwd) {
		// TODO Auto-generated method stub
		apwd=MyUtil.MD5(apwd, "xjg");
		//System.out.println(apwd);
		auserMapper.auserregister(aname,apwd);
		
	}

	@Override
	public Auser qryAuserByAname(String aname) {
		// TODO Auto-generated method stub
		return auserMapper.qryAuserByAname(aname);
	}

	@Override
	public void delAuser(String aname) {
		// TODO Auto-generated method stub
		auserMapper.delAuser(aname);
		
	}

	@Override
	public void updataPwd(Auser auser) {
		// TODO Auto-generated method stub
		auser.setApwd(MyUtil.MD5(auser.getApwd(), "xjg"));
		auserMapper.updataPwd(auser);
		
	}

}
