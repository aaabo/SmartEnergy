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
     	   
	delay_init();	    	 //��ʱ������ʼ��	  
  NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);//�����ж����ȼ�����Ϊ��2��2λ��ռ���ȼ���2λ��Ӧ���ȼ�
	uart_init(115200);	 	//���ڳ�ʼ��Ϊ115200
	LED_Init(); 		  		//��ʼ����LED���ӵ�Ӳ���ӿ�
	wificsh();
	TIM3_Int_Init(65535,65535);//��Լ59�� 
	LCD_Init();			   	//��ʼ��LCD  
	Adc_Init();		  		//ADC��ʼ��	 
	i2c_Port_Init();
 	POINT_COLOR=RED;		//��������Ϊ��ɫ 
	  
 	while(DHT11_Init())	//DHT11��ʼ��	
	{
		LCD_ShowString(30,130,200,16,16,"DHT11 Error");
		delay_ms(200);
		LCD_Fill(30,130,239,130+16,WHITE);
 		delay_ms(200);
	}								   
	
	POINT_COLOR=BLUE;//��������Ϊ��ɫ 
 	LCD_ShowString(30,120,200,16,16,"Temp:   C");	 
 	LCD_ShowString(30,140,200,16,16,"Humi:   %");	
	LCD_ShowString(30,160,200,16,16,"Smoke:     ");		
	while(1)
	{	
	POINT_COLOR=RED;		//��������Ϊ��ɫ 					  
			DHT11_Read_Data(&temperature,&humidity);	//��ȡ��ʪ��ֵ					    
			LCD_ShowNum(30+40,120,temperature,2,16);	//��ʾ�¶�	   		   
			LCD_ShowNum(30+40,140,humidity,2,16);		//��ʾʪ��	
     adcx=Get_Adc_Average(ADC_Channel_1,10);	
     LCD_ShowNum(30+40,160,adcx,4,16);		//��ʾ������̼Ũ��				
			/* printf("��ǰ�¶�Ϊ%d��\r\n",temperature);
			 printf("��ǰʪ��Ϊ%d%%\r\n",humidity);
		   printf("��ǰ����ֵΪ%d\r\n",adcx);
			 printf("\r\n");
			 printf("\r\n");*/
		}
	}

void TIM3_IRQHandler(void)   //TIM3�ж�
{
	if (TIM_GetITStatus(TIM3, TIM_IT_Update) != RESET) //���ָ����TIM�жϷ������:TIM �ж�Դ 
		{
		TIM_ClearITPendingBit(TIM3, TIM_IT_Update  );  //���TIMx���жϴ�����λ:TIM �ж�Դ 
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


