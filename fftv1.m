
[i,lcmp]=imread('me.jpg');%=======读取图像 显示图像

subplot(2,2,1),imshow(i,lcmp);

title('original');

ii=im2double(i); %=====将图像矩阵类型转换为double（图像计算很多是不能用整型的），没有这个会报错！！ ，如果不用这个就必须转化为灰度图！

i1 = fft2(ii); %======傅里叶变换

i2 =fftshift(i1); %======将变换的频率图像四角移动到中心（原来良的部分在四角 现在移动中心，便于后面的处理）

i3=log(abs(i2)); %=====显示中心低频部分，加对数是为了更好的显示

subplot(2,2,2),imshow(i3,[]);

title('Fourier');

map=colormap(lcmp); %===取色谱

imwrite(i3,map,'ffttank.bmp'); %===将上面i3输入到ffttank文件中

i5 = real(ifft2(ifftshift(i2))); %===频域的图反变换到空域 并取实部

i6 = im2uint8(mat2gray(i5)); %===取其灰度图

imwrite(i6,map,'tank2.bmp','bmp'); %===利用灰度图和原来取得颜色模板 还原图像

subplot(2,2,3),imshow(i6);

title('anti-Fourier');

i7=rgb2gray(i);

i8=fft2(i7);%===对灰色图才能归一化。因为那是2维矩阵，彩色图是3维矩阵，需要转化为2维灰图

m=fftshift(i8); %直流分量移到频谱中心

%RR=real(m); %取傅立叶变换的实部

%II=imag(m); %取傅立叶变换的虚部

A=abs(m);%计算频谱幅值

%A=sqrt(RR.^2+II.^2);

A=(A-min(min(A)))/(max(max(A))-min(min(A)))*225; %归一化

subplot(2,2,4),imshow(A); %显示原图像

colorbar; %显示图像的颜色条

title('FFT spectrum'); %图像命名