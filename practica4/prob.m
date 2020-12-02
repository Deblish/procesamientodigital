img_original = imread('E:/Github/procesamientodigital/practica4/lenna.jpeg', 'jpg');
img_noise = imnoise(img_original, 'gaussian');

f5_1 = gaussian_derivate(5, 1).';
f7_1 = gaussian_derivate(7, 1).';
f11_1 = gaussian_derivate(11, 1).';

f5_2 = gaussian_derivate(5, 2).';
f7_2 = gaussian_derivate(7, 2).';
f11_2 = gaussian_derivate(11, 2).';

g5 = pascal_vector(5);
g7 = pascal_vector(7);
g11 = pascal_vector(11);

m5_1=f5_1*g5;
m7_1=f7_1*g7;
m11_1=f11_1*g11;

m5_2=f5_2*g5;
m7_2=f7_2*g7;
m11_2=f11_2*g11;

im51 = conv2(img_original, m5_1, 'same');
im71 = conv2(img_original, m7_1, 'same');
im11 = conv2(img_original, m11_1, 'same');

im52 = conv2(img_original, m5_2, 'same');
im72 = conv2(img_original, m7_2, 'same');
im12 = conv2(img_original, m11_2, 'same');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

imn51 = conv2(img_noise, m5_1, 'same');
imn71 = conv2(img_noise, m7_1, 'same');
imn11 = conv2(img_noise, m11_1, 'same');

imn52 = conv2(img_noise, m5_2, 'same');
imn72 = conv2(img_noise, m7_2, 'same');
imn12 = conv2(img_noise, m11_2, 'same');


%impresion
figure('Renderer', 'painters', 'Position', [350 200 800 400])
subplot(1,2,1);
imshow(im72, []);
title('Original');

subplot(1,2,2);
imshow(imn72, []);
title('Ruido');