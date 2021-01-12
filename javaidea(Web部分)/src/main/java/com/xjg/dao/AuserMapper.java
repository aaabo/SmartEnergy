package com.xjg.dao;

import java.util.List;

import com.xjg.bean.Auser;

public interface AuserMapper {
	public Auser qryAuserByAnameAndApwd(String aname,String apwd);
	public Auser qryAuserByAname(String aname);

	public void auserregister(String aname, String apwd);
	public void delAuser(String aname);
	public void updataPwd(Auser auser);
}
