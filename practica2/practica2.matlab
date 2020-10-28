%practica2
%------------------------------------------------------------inicio
%un bit de profundidad
im = imread('lenna.jpeg');
[m n] = size(im);
mat = 128*ones(m, n);
unbit = im > mat; %1(blanco) si im > mat
imshow(unbit);

%un bit de profundidad con dithering aleatorio
im = imread('lenna.jpeg');
[m n] = size(im);
mat = randi([0 255],m,n);
ditheredA = im > mat; %1(blanco) si im > mat
imshow(dithered);

%dithering con matrices 2x2
im = imread('lenna.jpeg');
di = [64 128; 192 0] %matriz dithering 
[m n] = size(im);
mat = repmat(di, m/2, n/2); %repetimos matriz dithering en escala de la im original
dithered2 = im > mat; %decision para pintar uno de los 5 grises
imshow(dithered);

%dithering con matrices 4x4
im = imread('lenna.jpeg');
di = [0 8 2 10; 12 4 14 6; 3 11 1 9; 15 7 13 5] %matriz dithering 
[m n] = size(im);
mat = repmat(di, m/4, n/4); %repetimos matriz dithering en escala de la im original
im = im / 17;
dithered4 = im > mat; %decision para pintar uno de los 5 grises
imshow(dithered);

%dithering con difusión del error de Floyd-Steinberg
ima = imread('lenna.jpeg');
s=size(ima);
for i = 1 : s(1)
       for j = 1 : s(2)
           if(ima(i,j) < 127)
               imb(i,j)=0;
           else 
               imb(i,j) = 255;
           end;
           qerror = ima(i,j) - imb(i,j);
       if(j < s(2))
           ima(i,j+1) =  ((7/16 *qerror)+ima(i,j+1)); 
       end;
       if(i<s(1) && j > 1)
           ima(i+1,j-1) = ima(i+1,j-1) + (3/16 *qerror);
           ima(i+1,j) = ima(i+1,j) + (5/16 *qerror);
       end;
       if(j<s(2) && i<s(1))
           ima(i+1,j+1) = ima(i+1,j+1) + (1/16 *qerror);
       end;
       end;
end;
ditheredFS = imb;
imshow(ditheredFS);

%todo
im = imread('lenna.jpeg');
if true
figure;
subplot(2,3,1),imshow(im);
subplot(2,3,2),imshow(unbit);
subplot(2,3,3),imshow(ditheredA);
subplot(2,3,4),imshow(dithered2);
subplot(2,3,5),imshow(dithered4);
subplot(2,3,6),imshow(ditheredFS);
end




