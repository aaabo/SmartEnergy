package com.xjg.service;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketAddress;
import java.util.Arrays;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.xjg.bean.Energy;
import com.xjg.bean.Envir;
import com.xjg.dao.EnergyMapper;
import com.xjg.dao.EnvirMapper;

public class servertest {
	protected ListThread lst;
	protected ServerSocket servSock;
	protected InputStream fromClient;
	protected OutputStream toClient[] = new OutputStream[100];
	protected IOHandler ioh[] = new IOHandler[100];
	protected Socket clntSock[] = new Socket[100];
	protected EnergyMapper energyMapper;
	protected EnvirMapper envirMapper;
	protected Energy energy;
	protected Envir envir;
	int i = 0;

	// 连接数据库
	public void SqlInit() throws IOException {
		String resource = "mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

		SqlSession session = sqlSessionFactory.openSession(true);

		// 获取代理对象
		energyMapper = session.getMapper(EnergyMapper.class);
		envirMapper = session.getMapper(EnvirMapper.class);
		System.out.println("energyMapper.getClass().getName()=" + energyMapper.getClass().getName());
		System.out.println("envirMapper.getClass().getName()=" + envirMapper.getClass().getName());
	}

	// 侦听线程
	class ListThread extends Thread {
		public void run() {
			clntSock[i] = null;
			while (true) {
				try {
					System.out.println("i=" + i);
					clntSock[i] = servSock.accept();
					SocketAddress clientAddress = clntSock[i].getRemoteSocketAddress();
					System.out.println("客户端地址:" + clientAddress + "连接成功");
					ioh[i] = new IOHandler(clntSock[i], i);
					toClient[i] = clntSock[i].getOutputStream();
					ioh[i].start();
					i++;

				} catch (IOException e) {
					System.out.println("侦听程序出错");
				}
			}
		}

	}

	// 数据处理线程
	class IOHandler extends Thread {
		private Socket s;
		private int a;
		private int recvMsgSize;
		private String res;

		public IOHandler(Socket s, int a) {
			this.s = s;
			this.a = a;
		}

		public void run() {
			try {

				while (true) {
					DataInputStream input = new DataInputStream(s.getInputStream());
					String res = input.readUTF();
					System.out.println(res);
					String[] result = res.split(",");
					if (result.length == 5) {
						envir = new Envir();
						envir.setDevice_id(Integer.parseInt(result[0]));
						envir.setDevice_name(result[1]);
						envir.setTemp(Integer.parseInt(result[2]));
						envir.setHumidity(Integer.parseInt(result[3]));
						envir.setSmoke(Integer.parseInt(result[4]));
						envirMapper.addEnvir(envir);
					}
					if (result.length == 4) {
						energy = new Energy();
						energy.setDevice_id(Integer.parseInt(result[0]));
						energy.setDevice_name(result[1]);
						energy.setElectric(Integer.parseInt(result[2]));
						energy.setWater(Integer.parseInt(result[3]));
						energyMapper.addEnergy(energy);
					}
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				System.out.println("处理程序出错");
				e.printStackTrace();
			}

		}

	}

	public void doStart() {
		try {
			SqlInit();

			servSock = new ServerSocket(8086); // 指定端口

			System.out.println("服务器启动成功！\n");

			lst = new ListThread();
			lst.start();
		} catch (IOException e1) {
			System.out.println("服务器启动失败！\n");
		}

	}

	public static void main(String args[]) {
		servertest myServer = new servertest();
		myServer.doStart();

	}
}