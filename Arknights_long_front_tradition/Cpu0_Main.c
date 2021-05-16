#include <include.h>
#include <IfxCpu.h>
#include <IfxScuCcu.h>
#include <IfxScuWdt.h>
#include <IfxStm.h>
#include <IfxStm_reg.h>
#include <LQ_CAMERA.h>
#include <LQ_CCU6.h>
#include <LQ_GPIO_KEY.h>
#include <LQ_GPIO_LED.h>
#include <LQ_MotorServo.h>
#include <LQ_SOFTI2C.h>
#include <LQ_TFT18.h>
#include <LQ_UART.h>
#include <Main.h>
const float AN1_MAXN = 1985 , AN1_MINN=111;
const float AN2_MAXN = 2170 , AN2_MINN=98;
const float AN3_MAXN = 2370 , AN3_MINN=99;
const float AN4_MAXN = 2255 , AN4_MINN=106;
const float AN5_MAXN = 2170 , AN5_MINN=116;
const float AN6_MAXN = 2000 , AN6_MINN=123;
App_Cpu0 g_AppCpu0; // brief CPU 0 global data
IfxCpu_mutexLock mutexCpu0InitIsOk = 1;
volatile char mutexCpu0TFTIsOk=0;

float M_PID_P=0.6, M_PID_I=0.25, M_PID_D=0;

extern   int encValue1;
extern   float increase_P;
extern   int sittu;
extern   int increase_pwm;
extern   int sittu_zhi;
extern   int zhijiao;
float    S_value;
float    k3=0.1;                         //电机的积分项+k微分项里的K
short M_PID(short speednow,short targetspeed){
    short M_PWM;
    static float Lastspeeddev=0,opsitional_i=0;
    float S_deviation=targetspeed - speednow;
    opsitional_i += ((short)(M_PID_I * S_deviation)+k3*M_PID_D*(S_deviation-Lastspeeddev));
    if (opsitional_i > 100) {
        opsitional_i=100;
    }
    else if (opsitional_i < -100) {
        opsitional_i=-100;
    }

    M_PWM=(short)(M_PID_P*S_deviation + opsitional_i + M_PID_D*(S_deviation-Lastspeeddev) );
    Lastspeeddev=S_deviation;
    if(M_PWM>=1500) {
        M_PWM=1500;
    }
    else if(M_PWM<=-1500){
        M_PWM=-1500;
    }
    return M_PWM ;
}
int ad_data[7];
extern int ad_data_V[7];//传输的电感数据
extern char aierror;  //传输的转角
extern int biao;

short duty = 3000;      //电机设定值
short duty_s = 3000;     //电机平滑过渡算法
short duty_cha=0;       //cha=差
int core0_main (void)
{
	IfxCpu_disableInterrupts();
	IfxScuWdt_disableCpuWatchdog(IfxScuWdt_getCpuWatchdogPassword());
	IfxScuWdt_disableSafetyWatchdog(IfxScuWdt_getSafetyWatchdogPassword());
	g_AppCpu0.info.pllFreq = IfxScuCcu_getPllFrequency();
	g_AppCpu0.info.cpuFreq = IfxScuCcu_getCpuFrequency(IfxCpu_getCoreIndex());
	g_AppCpu0.info.sysFreq = IfxScuCcu_getSpbFrequency();
	g_AppCpu0.info.stmFreq = IfxStm_getFrequency(&MODULE_STM0);
	GPIO_KEY_Init();
	GPIO_LED_Init();
	IfxCpu_enableInterrupts();
	IfxCpu_releaseMutex(&mutexCpu0InitIsOk);
	mutexCpu0TFTIsOk=0;
	float maxdeve=0;

    UART_InitConfig(UART0_RX_P14_1,UART0_TX_P14_0, 115200); //串口初始化

	//char txt[100];
	float MICVmin[9];                            //长前瞻的adc直接读取
	float ADV[9];                                //长前瞻的朴素归一化当前值
	float ADV_last[9]={0};                       //上一次循环的长前瞻朴素归一化值
	float ADV_now[9];                            //经过平均处理的最终值
	float S_PID_P=0.09,S_PID_I=0,S_PID_D=0.6;    //舵机的PID
    S_PID_P+=increase_P;                         //时代的眼泪 IP
    short k1=1,k2=1;                             //k1 对称打角补偿的对P的修正系数，k2 对称打角补偿的对D的修正系数
    float S_deviation,errror,SL_deviation,S_intergral=0;    //舵机PID使用的参数（不需要调整）
    float S_center=Servo_Center_Mid;
    float Arknights_A=1.25,Arknights_B=1;           //差比和差公式的参数 A是横电感的系数，B就是竖电感的系数
	MotorInit();
	ServoInit();
	ServoCtrl(Servo_Center_Mid);

	ENC_InitConfig(ENC2_InPut_P33_7, ENC2_Dir_P33_6); //使能编码器的定时器

	ADC_InitConfig(ADC1, 80000); //ADC初始化
	ADC_InitConfig(ADC2, 80000);
	ADC_InitConfig(ADC3, 80000);
	ADC_InitConfig(ADC4, 80000);
	ADC_InitConfig(ADC5, 80000);
	ADC_InitConfig(ADC6, 80000);
    ADC_InitConfig(ADC7, 80000);
    ADC_InitConfig(ADC11, 80000);
    ADC_InitConfig(ADC12, 80000);
    ADC_InitConfig(ADC13, 80000);
    ADC_InitConfig(ADC20, 80000);
    ADC_InitConfig(ADC10, 80000);
    ADC_InitConfig(ADC16, 80000);
    ADC_InitConfig(ADC17, 80000);

	STM_InitConfig(STM0, STM_Channel_0, 100000);     //配置定时器
	STM_InitConfig(STM0, STM_Channel_1, 10000);
    STM_InitConfig(STM1, STM_Channel_0, 100000);     //配置定时器
	while (1){
	    
	    int Enconter_Value=-0.358*encValue1+1099;        //编码器对应空转的pwm

	    MICVmin[1]=ADC_Read(ADC1);                   //长前瞻的读取
	    MICVmin[2]=ADC_Read(ADC2);
	    MICVmin[3]=ADC_Read(ADC3);
	    MICVmin[4]=ADC_Read(ADC4);
	    MICVmin[5]=ADC_Read(ADC5);
	    MICVmin[6]=ADC_Read(ADC6);

	    MICVmin[7]=ADC_Read(ADC7);                   //电源闭环的读取

	    ad_data[0] = ADC_Read(ADC10);                //短前瞻的读取
	    ad_data[1] = ADC_Read(ADC11);
	    ad_data[2] = ADC_Read(ADC12);
	    ad_data[3] = ADC_Read(ADC13);
	    ad_data[4] = ADC_Read(ADC16);
	    ad_data[5] = ADC_Read(ADC17);
	    ad_data[6] = ADC_Read(ADC20);

	    if (MICVmin[1]-AN1_MINN<=0) MICVmin[1]=AN1_MINN;    //长前瞻的限幅
	    if (MICVmin[2]-AN2_MINN<=0) MICVmin[2]=AN2_MINN;
	    if (MICVmin[3]-AN3_MINN<=0) MICVmin[3]=AN3_MINN;
	    if (MICVmin[4]-AN4_MINN<=0) MICVmin[4]=AN4_MINN;
	    if (MICVmin[5]-AN5_MINN<=0) MICVmin[5]=AN5_MINN;
	    if (MICVmin[6]-AN6_MINN<=0) MICVmin[6]=AN6_MINN;

	    ADV[1] =(float)(1000*(MICVmin[1]-AN1_MINN)/(AN1_MAXN-AN1_MINN)+1);  //朴素归一化
	    ADV[2] =(float)(1000*(MICVmin[2]-AN2_MINN)/(AN2_MAXN-AN2_MINN)+1);
        ADV[3] =(float)(1000*(MICVmin[3]-AN3_MINN)/(AN3_MAXN-AN3_MINN)+1);
        ADV[4] =(float)(1000*(MICVmin[4]-AN4_MINN)/(AN4_MAXN-AN4_MINN)+1);
        ADV[5] =(float)(1000*(MICVmin[5]-AN5_MINN)/(AN5_MAXN-AN5_MINN)+1);
        ADV[6] =(float)(1000*(MICVmin[6]-AN6_MINN)/(AN6_MAXN-AN6_MINN)+1);

        ad_data_V[0] =(char)(256*(ad_data[0])/(1830))-128;                   //短前瞻数据的处理
        ad_data_V[1] =(char)(256*(ad_data[1])/(1930))-128;
        ad_data_V[2] =(char)(256*(ad_data[2])/(1930))-128;
        ad_data_V[3] =(char)(256*(ad_data[3])/(1900))-128;
        ad_data_V[4] =(char)(256*(ad_data[4])/(1920))-128;
        ad_data_V[5] =(char)(256*(ad_data[5])/(1930))-128;
        ad_data_V[6] =(char)(256*(ad_data[6])/(1900))-128;

        if(ADV[1] <= 15) ADV[1]=1;                           //短前瞻小滤波
        if(ADV[2] <= 15) ADV[2]=1;
        if(ADV[3] <= 15) ADV[3]=1;
        if(ADV[4] <= 15) ADV[4]=1;
        if(ADV[5] <= 15) ADV[5]=1;
        if(ADV[6] <= 15) ADV[6]=1;

        ADV_now[1]=(ADV[1]+ADV_last[1])/2;                  //长前瞻的均值滤波
        ADV_now[2]=(ADV[2]+ADV_last[2])/2;
        ADV_now[3]=(ADV[3]+ADV_last[3])/2;
        ADV_now[4]=(ADV[4]+ADV_last[4])/2;
        ADV_now[5]=(ADV[5]+ADV_last[5])/2;
        ADV_now[6]=(ADV[6]+ADV_last[6])/2;

        ADV_last[1]=ADV[1];
        ADV_last[2]=ADV[2];
        ADV_last[3]=ADV[3];
        ADV_last[4]=ADV[4];
        ADV_last[5]=ADV[5];
        ADV_last[6]=ADV[6];

        ////////////////////////////////环岛的识别/////////////////////////////////////////////
        float tep_cha=MICVmin[1]-MICVmin[6];
        if(tep_cha<=0) tep_cha=-tep_cha;
        if(MICVmin[3]>2800 && tep_cha>=600 && MICVmin[6] <=1400) sittu=1;//识别阈值
        ////////////////////////////////连续直角的识别/////////////////////////////////////////( (biao==1 && sittu ==1) || (sittu == 0) )
        else if(MICVmin[1] > 1750 && MICVmin[6]<=300 && MICVmin[3] <= 2400 &&  sittu == 0 ) sittu_zhi=1;
        ////////////////////////////////  舵机PID  ////////////////////////////////////////////
        //sittu=1;
        float sq=ADV_now[1]-ADV_now[6];                                             //求竖电感差值的绝对值
        if(sq<0) sq=-sq;
        S_deviation=3000*(Arknights_A*(ADV_now[2]-ADV_now[5])/2+Arknights_B*(ADV_now[1]-ADV_now[6]))/(Arknights_A*(ADV_now[2]+ADV_now[5])/2+Arknights_B*sq);//差比和差
        S_intergral+=S_deviation;
        if(S_intergral>= 200 ) S_intergral= 200;                                    //对I限幅（虽然没有I
        if(S_intergral<= -200) S_intergral= -200;
        errror=S_deviation-SL_deviation;

        if(S_deviation*S_PID_P > 0) k1=2;                                           //对称
        if(S_deviation*S_PID_P <= 0) k1=1;
        if(errror*S_PID_D > 0) k2=1;
        if(errror*S_PID_D <= 0) k2=1;

        S_value = S_center - k1 * S_deviation*S_PID_P + S_PID_I*S_intergral + k2*errror*S_PID_D;
        SL_deviation=S_deviation;
        if(S_value>=3000) S_value=3000;                                             //对舵机限幅
        if(S_value<=0) S_value=0;
        if(S_value-increase_pwm<=0) S_value=(float)increase_pwm;
        if(sittu_zhi==1) S_value = increase_pwm + 1440 ;
        ATOM_PWM_SetDuty(ATOMSERVO1, (short)(S_value-increase_pwm-zhijiao), 100);
        if (S_deviation >= maxdeve) maxdeve=S_deviation;
        //ATOM_PWM_SetDuty(ATOMSERVO1, 1440, 100);

        aierror=S_deviation*128/3000;                              //传输的打角计算
        if(aierror >=  127) aierror =  127;
        if(aierror <= -128) aierror = -128;
        ///////////////////////////////“对电源的半闭环”//////////////////////////////////////////
        float Bat=1.0+(1.0-MICVmin[7]/1850)/10;
        float I_cir=1.1;
        ///////////////////////////////电机的平滑过渡///////////////////////////////////////////
        duty_cha=duty-duty_s;
        if(duty_cha < 0 ) duty+=10;
        if(duty_cha > 0 ) duty-=10;
        ///////////////////////////////“电机闭环”////////////////////////////////////////////////
        short correct_MOTOR = M_PID(Enconter_Value,duty);
        float temp_now_V=Bat*I_cir*(duty+correct_MOTOR);
        short now_V=temp_now_V;
        if(now_V>=0)  MotorCtrl(now_V);
        else if (now_V<0) MotorCtrl_N(-now_V);
        /////////////////////////////////////////////////////////////////////////////////////////

        /////////////////////////////////////测试区域////////////////////////////////////////////
        //sprintf(txt,"[0]:%05d  [1]:%05d  [2]:%05d  [3]:%05d  [4]:%05d  [5]:%05d  [6]:%05d  \r\n",ad_data[0],ad_data[1],ad_data[2],ad_data[3],ad_data[4],ad_data[5],ad_data[6]);
        //sprintf(txt,"[1]:%05f  [2]:%05f  [3]:%05f  [4]:%05f  [5]:%05f  [6]:%05f  \r\n",MICVmin[1],MICVmin[2],MICVmin[3],MICVmin[4],MICVmin[5],MICVmin[6]);
        //UART_PutStr(UART0,txt);
        //MotorCtrl(2000);
        //delayms(200);
        //MotorCtrl_N(2000);
        //delayms(2-000);
        //sprintf(txt,"%05f  %05f \r\n",maxdeve,S_deviation);

        /////////////////////////////////////////////////////////////////////////////////////////


	}
	//      sprintf(txt,"DUYT=%05d  \r\n",correct_MOTOR);
	//      UART_PutStr(UART0,txt);
	//      sprintf(txt,"[1]:%05f  [2]:%05f  [3]:%05f  [4]:%05f  [5]:%05f  [6]:%05f  \r\n",ADV[1],ADV[2],ADV[3],ADV[4],ADV[5],ADV[6]);
	//      sprintf(txt,"[1]:%05f  [2]:%05f  [3]:%05f  [4]:%05f  [5]:%05f  [6]:%05f  \r\n",MICVmin[1],MICVmin[2],MICVmin[3],MICVmin[4],MICVmin[5],MICVmin[6]);
	//      LED_Ctrl(LEDALL,RVS);
	//    Test_ADC_7mic();       //PASS,测试ADC\UART0、STM延时和闪灯，通过UART0打印 AN0--AN7共8个通道ADC转换数据
	//    TestServo();           //PASS,测试舵机函数，按键控制舵机输出PWM
	//    TestMotor();           //PASS,测试电机驱动，按键控制输出PWM，通过宏定义选择8701或7971、7843
	//    LQ_ATom_Servo_2chPWM();//PASS,测试GTM_ATOM、STM延时和闪灯，P33.10和P33.13作为ATOM输出口控制舵机
	//    LQ_Tom_Servo_2chPWM(); //PASS,测试GTM_TOM、STM延时和闪灯，P33.10和P33.13作为TOM输出口控制舵机
	//    Test_GPIO_Extern_Int();//PASS,测试外部第1组中断P15.8，P10.6和P10.5闪灯
	//    Test_GPIO_LED();       //PASS,测试GPIO，P10.6和P10.5闪灯
	//    Test_GPIO_KEY();       //PASS,测试外部按键输入，P22.0--2   按下按键 LED亮
	//    LQ_GPT_4mini512();     //PASS,测试编码器正交解码,OLED和UART输出
	//    Test_OLED();           //PASS,测试OLED0.96屏使用P20.14--10，显示字符串及动态数据
	//    LQ_STM_Timer();        //PASS,测试定时中断、闪灯
	//    LQ_TIM_InputCature();  //PASS,测试GTM_TOM_TIM、P20_9作为PWM输出口，P15_0作为TIM输入口，两者短接后，串口P14.0发送到上位机
	//    Test_Bluetooth();      //PASS,测试UART0(P14.0RX/P14.1TX)，

}
