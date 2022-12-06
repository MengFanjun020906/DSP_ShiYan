clear
close all
clc

fs=1000;fc=200;fr=300;T=0.001; 
wp1=2*pi*fc;
wr1=2*pi*fr; 
[N1,wn1]=buttord(wp1,wr1,1,25,'s'); 
[B1,A1]=butter(N1,wn1,'s'); 
[num1,den1]=impinvar(B1,A1,fs); 
[h1,w]=freqz(num1,den1); 
wp2=2*fs*tan(2*pi*fc/(2*fs)); 
wr2=2*fs*tan(2*pi*fr/(2*fs)); 
[N2,wn2]=buttord(wp2,wr2,1,25,'s'); 
[B2,A2]=butter(N2,wn2,'s'); 
[num2,den2]=bilinear(B2,A2,fs); 
[h2,w]=freqz(num2,den2); 
f=w/(2*pi)*fs; 
plot(f,20*log10(abs(h1)),'-.',f,20*log10(abs(h2)),'-'); 
axis([0,500,-80,10]);grid; xlabel('频率/Hz');ylabel('幅度/dB');title('巴特沃思数字低通滤波器'); 
legend('脉冲响应不变法','双线性变换法');