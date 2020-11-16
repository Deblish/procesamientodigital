%Aguilera Ernesto
%Padilla Aaron

%Practica de convolución en Fourier

%obtenemos nuestros datos
imagen=imread('lenna.jpeg', 'jpg');
img_size = size(imagen);
padding_size = img_size(1);
%img_t=rgb2gray(imagen);
figure(1);
imshow(imagen);

%generamos los filtros
filter_7=generate_filter(7);
%G_7 = fspecial('gaussian',[7 7],2); %filtro gaussiano con desviaci�n
%est�ndar
filter_7_padding=zero_padding(filter_7, padding_size);
fft_7=fft2(filter_7_padding);
filter_11=generate_filter(11);
%G_7 = fspecial('gaussian',[11 11],2);
filter_11_padding=zero_padding(filter_11, padding_size);
fft_11=fft2(filter_11_padding);


%original en Fourier
fft_lenna=fft2(imagen);
figure(2);
plot(log(abs(fftshift(fft_lenna))));

%filtros en Fourier
figure(3);
plot(log(abs(fftshift(fft_7))));
figure(4);
plot(log(abs(fftshift(fft_11))));

%Imagenes convolucionadas
convl_7=imfilter(imagen, filter_7, 'conv');
figure(5);
imshow(convl_7);
convl_11=imfilter(imagen, filter_11, 'conv');
figure(6);
imshow(convl_11);

%multiplicacion en dominio de Fourier(conv. circular)
fourier_7=fft_lenna.*fft_7;
figure(7);
plot(log(abs(fftshift(fourier_7))));
figure(8);
imshow(ifft2(fourier_7));
fourier_11=fft_lenna.*fft_11;
figure(9);
plot(log(abs(fftshift(fourier_11))));
figure(10);
imshow(ifft2(fourier_11));

%desplegamos las convoluciones circulares
ifft_7=ifft2(fourier_7);
ifft_7=uint8(ifft_7);
figure(11);
imshow(ifft_7);
ifft_11=ifft2(fourier_11);
ifft_11=uint8(ifft_11);
figure(12);
imshow(ifft_11);

%convoluciones lineales con DFT
padding_size_l = padding_size+7-1;
lenna_padding = zero_padding(imagen, padding_size_l);
fft_lenna_lin=fft2(lenna_padding);
filter = zero_padding(filter_7, padding_size_l);
fft_filter_lin=fft2(filter);
fft_lin=fft_lenna_lin.*fft_filter_lin;
ifft_7_lin=ifft2(fft_lin);
ifft_7_lin=uint8(ifft_7_lin);
figure(13);
imshow(ifft_7_lin);

padding_size_l = padding_size+11-1;
lenna_padding = zero_padding(imagen, padding_size_l);
fft_lenna_lin=fft2(lenna_padding);
filter = zero_padding(filter_11, padding_size_l);
fft_filter_lin=fft2(filter);
fft_lin=fft_lenna_lin.*fft_filter_lin;
ifft_11_lin=ifft2(fft_lin);
ifft_11_lin=uint8(ifft_11_lin);
figure(14);
imshow(ifft_11_lin);
