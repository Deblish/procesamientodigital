clc
clear

%punto1: generar im_noise lenna
im = imread('lenna.jpeg');
imn = imnoise(im, "gaussian");

%cameraman
im = imread('cameraman.jpg');
imn = imnoise(im, "gaussian");

figure('Renderer', 'painters', 'Position', [350 200 800 400])
subplot(1,2,1);
imshow(im);
title("Original");

subplot(1,2,2);
imshow(imn);
title("Ruido");

%punto2: 4 filtros (11x11, 7x7, 5x5, 3x3) paso bajas a im e im_noise 
N = 3; %5, 7, 11
f = ones(N)/(N*N);
%im_f = filter2(f, im, 'same'); %correlacion
im_f = conv2(im, f, 'same'); %convolusion 
imshow(im_f/255)
%imn_f = filter2(f, imn, 'same'); %correlacion
imn_f = conv2(imn, f, 'same'); %convolusion
imshow(imn_f/255)


%punto2: 4 filtros (11x11, 7x7, 5x5, 3x3) paso bajas a im e im_noise
N = 11; %5, 7, 11
f = ones(N)/(N*N);
im_f = conv2(im, f, 'same'); 
imn_f = conv2(imn, f, 'same');
figure('Renderer', 'painters', 'Position', [350 200 800 400])
subplot(1,2,1);
imshow(im_f/255);
title("Original");

subplot(1,2,2);
imshow(imn_f/255);
title("Ruido");


