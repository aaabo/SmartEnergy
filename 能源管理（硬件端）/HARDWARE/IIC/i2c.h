#ifndef __i2c_H
#define __i2c_H
#include "sys.h" 	    	   		  

//IO��������	 
#define I2C_SCL    PBout(0) //SCL
#define I2C_SDA    PBout(1) //SDA	 
#define SDA_I     PBin(1)  //����SDA 
#define SDA_IN()  {GPIOB->CRL&=0XFFFFFF0F;GPIOB->CRL|=8<<4;}
#define SDA_OUT() {GPIOB->CRL&=0XFFFFFF0F;GPIOB->CRL|=3<<4;}
//IIC���в�������
void i2c_Port_Init(void);                //��ʼ��IIC��IO��				 
void I2C_Start(void);				//����IIC��ʼ�ź� �ɹ��򷵻�1
void I2C_Stop(void);	  			//����IICֹͣ�ź�
void I2C_Send_Byte(u8 txd);			//IIC����һ���ֽ�
u8 I2C_Read_Byte(unsigned char ack);//IIC��ȡһ���ֽ�
u8 I2C_Wait_Ack(void); 				//IIC�ȴ�ACK�ź�
void I2C_Ack(void);					//IIC����ACK�ź�
void I2C_NAck(void);				//IIC������ACK�ź�
	  
#endif

