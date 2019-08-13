
[i,lcmp]=imread('me.jpg');%=======��ȡͼ�� ��ʾͼ��

subplot(2,2,1),imshow(i,lcmp);

title('original');

ii=im2double(i); %=====��ͼ���������ת��Ϊdouble��ͼ�����ܶ��ǲ��������͵ģ���û������ᱨ���� �������������ͱ���ת��Ϊ�Ҷ�ͼ��

i1 = fft2(ii); %======����Ҷ�任

i2 =fftshift(i1); %======���任��Ƶ��ͼ���Ľ��ƶ������ģ�ԭ�����Ĳ������Ľ� �����ƶ����ģ����ں���Ĵ���

i3=log(abs(i2)); %=====��ʾ���ĵ�Ƶ���֣��Ӷ�����Ϊ�˸��õ���ʾ

subplot(2,2,2),imshow(i3,[]);

title('Fourier');

map=colormap(lcmp); %===ȡɫ��

imwrite(i3,map,'ffttank.bmp'); %===������i3���뵽ffttank�ļ���

i5 = real(ifft2(ifftshift(i2))); %===Ƶ���ͼ���任������ ��ȡʵ��

i6 = im2uint8(mat2gray(i5)); %===ȡ��Ҷ�ͼ

imwrite(i6,map,'tank2.bmp','bmp'); %===���ûҶ�ͼ��ԭ��ȡ����ɫģ�� ��ԭͼ��

subplot(2,2,3),imshow(i6);

title('anti-Fourier');

i7=rgb2gray(i);

i8=fft2(i7);%===�Ի�ɫͼ���ܹ�һ������Ϊ����2ά���󣬲�ɫͼ��3ά������Ҫת��Ϊ2ά��ͼ

m=fftshift(i8); %ֱ�������Ƶ�Ƶ������

%RR=real(m); %ȡ����Ҷ�任��ʵ��

%II=imag(m); %ȡ����Ҷ�任���鲿

A=abs(m);%����Ƶ�׷�ֵ

%A=sqrt(RR.^2+II.^2);

A=(A-min(min(A)))/(max(max(A))-min(min(A)))*225; %��һ��

subplot(2,2,4),imshow(A); %��ʾԭͼ��

colorbar; %��ʾͼ�����ɫ��

title('FFT spectrum'); %ͼ������