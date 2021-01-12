package com.xjg.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MyUtil {

	
	
	public static String MD5(String str,String salt)
	{
		str = str + salt;
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		md.update(str.getBytes());
		byte[] data = md.digest();
		String res = "";
		for (byte b:data)
		{
			String temp = Integer.toHexString(b + 128);
			if (temp.length() == 1)
			{
				temp = "0" + temp;
			}
			res += temp;
		}
		return res;
	}
	
	
	public static void main(String[] args) throws Exception{
		String mm= MD5("123", "xjg");
		System.out.println(mm);
		
	}
}
