m=imread('me.jpg');

M=rgb2gray(m); %==滤波函数都是对二维灰度图，Tif可直接滤波

subplot(3,3,1)

imshow(M);%显示原始图像

title('original')

P1=imnoise(M,'gaussian',0.02); %加入高斯躁声

subplot(3,3,2)

imshow(P1) %加入高斯躁声后显示图像

title('gaussian noise');

P2=imnoise(M,'salt & pepper',0.02); %=加入椒盐躁声

subplot(3,3,3)

imshow(P2) %%加入椒盐躁声后显示图像

title('salt & pepper noise');

g=medfilt2(P1); %对高斯躁声中值滤波

subplot(3,3,5)

imshow(g)

title('medfilter gaussian')

h=medfilt2(P2); %对椒盐躁声中值滤波

subplot(3,3,6)

imshow(h)

title('medfilter salt & pepper noise')

l=[1 1 1 %对高斯躁声算术均值滤波

1 1 1

1 1 1];

l=l/9;

k=conv2(P1,l);

subplot(3,3,8)

imshow(k,[])

title('arithmeticfilter gaussian')

%对椒盐躁声算术均值滤波

d=conv2(P2,l);

subplot(3,3,9)

imshow(d,[])

title('arithmeticfilter salt & pepper noise')