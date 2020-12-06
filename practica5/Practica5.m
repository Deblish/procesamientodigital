%Aguilera Ernesto
%Padilla Aaron

img = imread('pentagon256x256.tif', 'tif');

%%% Zerofilling de las imágenes 
n=2;
i2=zero_fill_interp(img, n);
subplot(1,2,1);
imshow(i2, []);
title('Zerofilling 2nd order');
n=4;
i4=zero_fill_interp(img, n);
subplot(1,2,2);
imshow(i4, []);
title('Zerofilling 4th order');

%%% Transformadas de Fourier del inciso anterior
f2 = log(abs(1.0+fftshift(fft2(i2))));
subplot(1,3,1);
imshow(fz2, []);
title('2nd order Zf.');
f4 = log(abs(1.0+fftshift(fft2(i4))));
subplot(1,3,2);
imshow(fl2, []);
title('4th order Zf.');
fo = log(abs(1.0+fftshift(fft2(img))));
subplot(1,3,3);
imshow(fo, []);
title('Imágen original');

%%% sobremuestreo espacial de orden 2
n=2;

mat_z2 = zero_interp(img, n);
subplot(1,3,1);
imshow(mat_z2, []);
title('Interpolación cero');

mat_l2 = linear_interp(img, n);
subplot(1,3,2);
imshow(mat_l2, []);
title('Interpolación bilineal');

mat_c2 =cubic_interp(img, n);
subplot(1,3,3);
imshow(mat_c2, []);
title('Interpolación bicúbica');

%%% transformadas de Fourier del inciso anterior
fz2 = log(abs(1.0+fftshift(fft2(mat_z2))));
subplot(2,2,1);
imshow(fz2, []);
title('Interpolación cero');
fl2 = log(abs(1.0+fftshift(fft2(mat_l2))));
subplot(2,2,2);
imshow(fl2, []);
title('Interpolación bilineal');
fc2 = log(abs(1.0+fftshift(fft2(mat_c2))));
subplot(2,2,3);
imshow(fc2, []);
title('Interpolación bicúbica');
fo = log(abs(1.0+fftshift(fft2(img))));
subplot(2,2,4);
imshow(fo, []);
title('Imágen original');

%%% Sobremuestreo espacial de orden 4
n=4;

mat_z4 = zero_interp(img, n);
subplot(1,3,1);
imshow(mat_z4, []);
title('Interpolación cero');

mat_l4 = linear_interp(img, n);
subplot(1,3,2);
imshow(mat_l4, []);
title('Interpolación bilineal');

mat_c4 =cubic_interp(img, n);
subplot(1,3,3);
imshow(mat_c4, []);
title('Interpolación bicúbica');

%%% Transformadas de Fourier del inciso anterior
fz4 = log(abs(1.0+fftshift(fft2(mat_z4))));
subplot(2,2,1);
imshow(fz4, []);
title('Interpolación cero');
fl4 = log(abs(1.0+fftshift(fft2(mat_l4))));
subplot(2,2,2);
imshow(fl4, []);
title('Interpolación bilineal');
fc4 = log(abs(1.0+fftshift(fft2(mat_c4))));
subplot(2,2,3);
imshow(fc4, []);
title('Interpolación bicúbica');
fo = log(abs(1.0+fftshift(fft2(img))));
subplot(2,2,4);
imshow(fo, []);
title('Imágen original');

%%%Interpolación en frecuencia
fo = log(abs(1.0+fftshift(fft2(img))));
figure(2);
imshow(fo, []);
title('Imágen original');

n=2;
ff2 = zero_fill_fourier(fo, n);
figure(2);
imshow(ff2, []);
title('Zerofill en Fourier de orden 2');
n=4;
ff4 = zero_fill_fourier(fo, n);
figure(2);
imshow(ff4, []);
title('Zerofill en Fourier de orden 4');

%%%comparaciones
subplot(2,2,1);
imshow(fz2, []);
title('Interpolación cero');
subplot(2,2,2);
imshow(fl2, []);
title('Interpolación bilineal');
subplot(2,2,3);
imshow(fc2, []);
title('Interpolación bicúbica');
subplot(2,2,4);
imshow(ff2, []);
title('Zerofill en Fourier de orden 2');

subplot(2,2,1);
imshow(fz4, []);
title('Interpolación cero');
subplot(2,2,2);
imshow(fl4, []);
title('Interpolación bilineal');
subplot(2,2,3);
imshow(fc4, []);
title('Interpolación bicúbica');
subplot(2,2,4);
imshow(ff4, []);
title('Zerofill en Fourier de orden 4');


%%%transformadas inversas
subplot(2,2,1);
imshow(mat_z2, []);
title('Interpolación cero');
subplot(2,2,2);
imshow(mat_l2, []);
title('Interpolación bilineal');
subplot(2,2,3);
imshow(mat_c2, []);
title('Interpolación bicúbica');
subplot(2,2,4);
imshow(I_frec_t2_final, []);
title('Inversa en Fourier orden 2');

subplot(2,2,1);
imshow(mat_z4, []);
title('Interpolación cero');
subplot(2,2,2);
imshow(mat_l4, []);
title('Interpolación bilineal');
subplot(2,2,3);
imshow(mat_c4, []);
title('Interpolación bicúbica');
subplot(2,2,4);
imshow(I_frec_t4_final, []);
title('Inversa en Fourier orden 4');

%%%
I_frec = fft2(img);
temp = fftshift(I_frec);
%Padding de ceros, con la dft en el centro
I_frec_t2 = complex(zeros(size(img,2)*2));
I_frec_t2(size(img,2)/2+1:size(img,2)+size(img,2)/2,size(img,2)/2+1:size(img,2)+size(img,2)/2) = temp;
%I_frec_t2(129:384,129:384) = temp; es lo mismo de arriba.
I_frec_t2_final = log(abs(ifft2(I_frec_t2)));
imshow(I_frec_t2_final, []);
title('Inversa en Fourier orden 2');

%Padding de ceros, con la dft en el centro
I_frec_t4 = complex(zeros(size(img,2)*4));
%I_frec_t2(size(img,2)/2+1:size(img,2)+size(img,2)/2,size(img,2)/2+1:size(img,2)+size(img,2)/2) = temp;
I_frec_t4(341:596,341:596) = temp;
I_frec_t4_final = log(abs(ifft2(I_frec_t4)));
imshow(I_frec_t4_final, []);
title('Inversa en Fourier orden 4');