clc
clear

%impresion
figure('Renderer', 'painters', 'Position', [350 200 800 400])
subplot(1,2,1);
imshow(im_f, []);
title("Original");

subplot(1,2,2);
imshow(imn_f, []);
title("Ruido");

%punto1: generar im_noise
im = imread('lenna.jpeg');
%im = imread('cameraman.jpg');
imn = imnoise(im, "gaussian");

%punto2: 4 filtros (11x11, 7x7, 5x5, 3x3) paso bajas de bloque a im e im_noise
N = 11; %5, 7, 11
f = ones(N)/(N*N);
%im_f = conv2(im, f, 'same'); 
im_f = filter2(f, im, 'same'); %correlacion
%imn_f = conv2(imn, f, 'same');
imn_f = filter2(f, imn, 'same'); %correlacion

%punto3: 4 filtros (11x11, 7x7, 5x5, 3x3) paso bajas binomiales a im e im_noise
binom = [1 2 1] %3
binom = [1 4 6 4 1] %5
binom = [1 6 15 20 15 6 1] %7
binom = [1 8 28 56 70 56 28 8 1] %9
binom = [1 10 45 120 210 252 210 120 45 10 1] %11

filtroB = (binom.*binom')/(sum(binom)^2);
im_f = conv2(im, filtroB, 'same'); 
imn_f = conv2(imn, filtroB, 'same');

%punto4 
%a 	
	%bloque derivada
	filtro = [1 -1]
	im_f = conv2(im, filtro, 'same'); 
	imn_f = conv2(imn, filtro, 'same');

%b 
	%Prewit X
	filtro = fspecial('prewitt');
	im_f = conv2(im, filtro, 'same'); 
	imn_f = conv2(imn, filtro, 'same');

	%Prewit Y
	filtro = fspecial('prewitt')';
	im_f = conv2(im, filtro, 'same'); 
	imn_f = conv2(imn, filtro, 'same');

%c
	%Sobel X
	filtro = fspecial('sobel');
	im_f = conv2(im, filtro, 'same'); 
	imn_f = conv2(imn, filtro, 'same');

	%Sobel Y
	filtro = fspecial('sobel')';
	im_f = conv2(im, filtro, 'same'); 
	imn_f = conv2(imn, filtro, 'same');

%d
	%primera derivada Gaussiana orden 5
	filtro = fspecial('gaussian', [5 5], 3);
	im_f = conv2(im, filtro, 'same'); 
	imn_f = conv2(imn, filtro, 'same');

	%primera derivada Gaussiana orden 7
	filtro = fspecial('gaussian', [7 7], 3);
	im_f = conv2(im, filtro, 'same'); 
	imn_f = conv2(imn, filtro, 'same');

	%primera derivada Gaussiana orden 11
	filtro = fspecial('gaussian', [11 11], 3);
	im_f = conv2(im, filtro, 'same'); 
	imn_f = conv2(imn, filtro, 'same');

%punto5
%a
	%laplaciano
	filtro = fspecial('laplacian',0);
	im_f = conv2(im, filtro, 'same'); 
	imn_f = conv2(imn, filtro, 'same');

%b
	%segunda derivada Gaussiana orden 5
	filtro = fspecial('gaussian', [5 5], 2);
	im_f = conv2(im, filtro, 'same'); 
	imn_f = conv2(imn, filtro, 'same');

	%segunda derivada Gaussiana orden 7
	filtro = fspecial('gaussian', [7 7], 2);
	im_f = conv2(im, filtro, 'same'); 
	imn_f = conv2(imn, filtro, 'same');

	%segunda derivada Gaussiana orden 11
	filtro = fspecial('gaussian', [11 11], 2);
	im_f = conv2(im, filtro, 'same'); 
	imn_f = conv2(imn, filtro, 'same');

%punto6
%a
	%unsharp masking UM 3x3
	k3 = 3;
	UMZ3 = zeros(3);
	UMZ3(2,2) = (1+k3);
	UMPB3 = (k3/(3*3)) * ones(3);
	UMF3 = UMZ3-UMPB3;

	UMS3 = conv2(im, UMF3, 'full');
	UMS3_n = conv2(imn, UMF3, 'full');

	figure('Renderer', 'painters', 'Position', [350 200 800 400])
	subplot(1,2,1);
	imshow(UMS3/255);
	title("Original");

	subplot(1,2,2);
	imshow(UMS3_n/255);
	title("Ruido");

	%unsharp masking UM 7x7
	k7 = 7;
	UMZ7 = zeros(7);
	UMZ7(4,4) = (1+k7);
	UMPB7 = (k7/(7*7)) * ones(7); 
	UMF7 = UMZ7-UMPB7;

	UMS7 = conv2(im, UMF7, 'full');
	UMS7_n = conv2(imn, UMF7, 'full');

	figure('Renderer', 'painters', 'Position', [350 200 800 400])
	subplot(1,2,1);
	imshow(UMS7/255);
	title("Original");

	subplot(1,2,2);
	imshow(UMS7_n/255);
	title("Ruido");

%b
	%unsharp masking UM 3x3 con Binomial
	binom = [1 2 1] %3

	k3 = 3;
	UMZ3 = zeros(3);
	UMZ3(2,2) = (1+k3);
	filtroB = k3*(binom.*binom')/(sum(binom)^2);
	UMF3 = UMZ3-filtroB;

	UMS3 = conv2(im, UMF3, 'full');
	UMS3_n = conv2(imn, UMF3, 'full');

	figure('Renderer', 'painters', 'Position', [350 200 800 400])
	subplot(1,2,1);
	imshow(UMS3/255);
	title("Original");

	subplot(1,2,2);
	imshow(UMS3_n/255);
	title("Ruido");

	%unsharp masking UM 7x7 con Binomial
	binom = [1 6 15 20 15 6 1] %7

	k7 = 7;
	UMZ7 = zeros(7);
	UMZ7(4,4) = (1+k7);
	filtroB = k7*(binom.*binom')/(sum(binom)^2);
	UMF7 = UMZ7-filtroB;

	UMS7 = conv2(im, UMF7, 'full');
	UMS7_n = conv2(imn, UMF7, 'full');

	figure('Renderer', 'painters', 'Position', [350 200 800 400])
	subplot(1,2,1);
	imshow(UMS7/255);
	title("Original");

	subplot(1,2,2);
	imshow(UMS7_n/255);
	title("Ruido");





