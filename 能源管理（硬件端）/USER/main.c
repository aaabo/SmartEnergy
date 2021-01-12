#include "led.h"
#include "delay.h"
#include "key.h"
#include "sys.h"
#include "lcd.h"
#include "usart.h"	 
#include "dht11.h" 	
#include "BH1750.h"
#include "i2c.h"
#include "stdio.h"
#include "adc.h"
#include "tm.h"

extern float result_lx;
u16 adcx;	 		    
	u8 temperature;  	    
	u8 humidity; 
	int electric=30;
	int water=40;
	int aaa=-1,bbb=0,ccc=0;
 int wificsh(){
	 printf("AT+CWMODE=1\r\n");
	 while(!(strstr(USART_RX_BUF,"OK"))){}
		 memset(USART_RX_BUF, 0x00, sizeof (char) * USART_REC_LEN);
	 LED0=0;
	printf("AT+RST\r\n");
		 while(!(strstr(USART_RX_BUF,"IP"))){}
			 memset(USART_RX_BUF, 0x00, sizeof (char) * USART_REC_LEN);
	 LED0=1;
	 printf("AT+CWJAP=\"SmartEnergy\",\"x123456789\"\r\n");
			 while(!(strstr(USART_RX_BUF,"OK"))){}
				 memset(USART_RX_BUF, 0x00, sizeof (char) * USART_REC_LEN);
	 LED0=0;
	 printf("AT+CIPMUX=0\r\n");
	while(!(strstr(USART_RX_BUF,"OK"))){}
		memset(USART_RX_BUF, 0x00, sizeof (char) * USART_REC_LEN);
	 LED0=1;
	 printf("AT+CIPSTART=\"TCP\",\"2001:da8:270:2021::108\",8086\r\n");
	while(!(strstr(USART_RX_BUF,"OK"))){}
		memset(USART_RX_BUF, 0x00, sizeof (char) * USART_REC_LEN);
	 LED0=0;
	 printf("AT+CIPMODE=1\r\n");
	while(!(strstr(USART_RX_BUF,"OK"))){}
		 memset(USART_RX_BUF, 0x00, sizeof (char) * USART_REC_LEN);
	 LED0=1;
	 printf("AT+CIPSEND\r\n");
	while(!(strstr(USART_RX_BUF,"OK"))){}
		memset(USART_RX_BUF, 0x00, sizeof (char) * USART_REC_LEN);
	 LED1=0;
	}
 int main(void)
 {
     	   
	delay_init();	    	 //延时函数初始化	  
  NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);//设置中断优先级分组为组2：2位抢占优先级，2位响应优先级
	uart_init(115200);	 	//串口初始化为115200
	LED_Init(); 		  		//初始化与LED连接的硬件接口
	wificsh();
	TIM3_Int_Init(65535,65535);//大约59秒 
	LCD_Init();			   	//初始化LCD  
	Adc_Init();		  		//ADC初始化	 
	i2c_Port_Init();
 	POINT_COLOR=RED;		//设置字体为红色 
	  
 	while(DHT11_Init())	//DHT11初始化	
	{
		LCD_ShowString(30,130,200,16,16,"DHT11 Error");
		delay_ms(200);
		LCD_Fill(30,130,239,130+16,WHITE);
 		delay_ms(200);
	}								   
	
	POINT_COLOR=BLUE;//设置字体为蓝色 
 	LCD_ShowString(30,120,200,16,16,"Temp:   C");	 
 	LCD_ShowString(30,140,200,16,16,"Humi:   %");	
	LCD_ShowString(30,160,200,16,16,"Smoke:     ");		
	while(1)
	{	
	POINT_COLOR=RED;		//设置字体为红色 					  
			DHT11_Read_Data(&temperature,&humidity);	//读取温湿度值					    
			LCD_ShowNum(30+40,120,temperature,2,16);	//显示温度	   		   
			LCD_ShowNum(30+40,140,humidity,2,16);		//显示湿度	
     adcx=Get_Adc_Average(ADC_Channel_1,10);	
     LCD_ShowNum(30+40,160,adcx,4,16);		//显示二氧化碳浓度				
			/* printf("当前温度为%d℃\r\n",temperature);
			 printf("当前湿度为%d%%\r\n",humidity);
		   printf("当前烟雾值为%d\r\n",adcx);
			 printf("\r\n");
			 printf("\r\n");*/
		}
	}

void TIM3_IRQHandler(void)   //TIM3中断
{
	if (TIM_GetITStatus(TIM3, TIM_IT_Update) != RESET) //检查指定的TIM中断发生与否:TIM 中断源 
		{
		TIM_ClearITPendingBit(TIM3, TIM_IT_Update  );  //清除TIMx的中断待处理位:TIM 中断源 
			aaa++;
			if(aaa>=1&&bbb==0){
			printf("6,ceshi,%d,%d,%d",temperature,humidity,adcx/10);
				aaa=0;
			bbb=1;}
				if(aaa>=1&&bbb==1){
					electric+=ccc%4;
					water+=ccc%4;
					ccc++;
					if(ccc>=3){
					ccc=0;}
				printf("6,ceshi,%d,%d",electric,water);
				aaa=0;
			bbb=0;
			}
				
		}
}


