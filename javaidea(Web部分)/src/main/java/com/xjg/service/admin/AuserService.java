package com.xjg.service.admin;

import java.util.List;

import com.xjg.bean.Auser;

public interface AuserService {
	public Auser auserLogin(String anmae,String apwd);

	public void auserregister(String aname, String apwd);

	public Auser qryAuserByAname(String aname);

	public void delAuser(String aname);

	public void updataPwd(Auser auser);
}
