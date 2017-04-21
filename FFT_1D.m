clc,clear,close all;
T=1/15;                             %����
fs=1000;                            %����Ƶ��
dt=1/fs;                            %�������
L=1000/fs;                          %��������
t=0:dt:L;                           %����ʱ������
N=length(t);                        %��������
df=fs/(N-1);                        %Ƶ�ʷֱ���
f=t*fs*df-max(t*fs*df)/2;           %Ƶ�ʻ���
x=2*sin(30*pi*t)+0.5*cos(120*pi*t)+4*sin(240*pi*t);%����
subplot(231),plot(t(1:ceil(T/dt)),x(1:ceil(T/dt))),title('�������ͼ��'),xlabel('t/s'),ylabel('����');
fx=fftshift(fft(x));               %����Ҷ�任,�����Ļ�
subplot(232),plot(f(:),abs(fx)),title('Ƶ�����Ļ�,��ֵ��Ƶ�ʱ仯�ķֲ�ͼ'),xlabel('f/Hz'),ylabel('Ƶ�׷���');
subplot(233),plot(f(ceil(length(f)/2):length(f)),abs(fx(ceil(length(fx)/2):length(fx)))),title('��ЧƵ�ʷ�Χ,��ֵ��Ƶ�ʱ仯�ķֲ�ͼ'),xlabel('f/Hz'),ylabel('Ƶ�׷���');

xNoise=x+2*randn(size(x));              %���������
subplot(234),plot(t(1:ceil(T/dt)),xNoise(1:ceil(T/dt))),title('(������)�������ͼ��'),xlabel('t/s'),ylabel('����');
fxNoise=fftshift(fft(xNoise));         %����Ҷ�任,�����Ļ�
subplot(235),plot(f(:),abs(fxNoise)),title('Ƶ�����Ļ�,(������)��ֵ��Ƶ�ʱ仯�ķֲ�ͼ'),xlabel('f/Hz'),ylabel('Ƶ�׷���');
subplot(236),plot(f(ceil(length(f)/2):length(f)),abs(fxNoise(ceil(length(fxNoise)/2):length(fxNoise)))),title('��ЧƵ�ʷ�Χ,(������)��ֵ��Ƶ�ʱ仯�ķֲ�ͼ'),xlabel('f/Hz'),ylabel('Ƶ�׷���');
set(gcf,'unit','normalized','position',[0,0,1.0,1.0]);%[0,0,1.0,1.0]��ʾ���½�Ϊԭ��,���Ϳ�ֱ�ռ��Ļ��100%
saveas(gcf,strcat(mfilename,'_pic'),'jpg');           %���ļ�����'_pic'Ϊ�������ļ�