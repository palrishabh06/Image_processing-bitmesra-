img=imread('img1.jpg');
figure;
subplot(3,3,1);
imshow(img);
title('Original img');

h = fspecial('gaussian', [21 21], 2);  % [size], sigma
blurred_img = imfilter(img, h, 'replicate');

subplot(3,3,4);
imshow(blurred_img);
title('Gaussian Blurred Image');

%org ---> gray
gray_img=rgb2gray(img);
subplot(3,3,2);
imshow(gray_img);
title('Gray scale');

%gray ---> binary
threshold = 0.5;  % Value between 0 and 1
gray_img_norm = im2double(gray_img);  % Normalize to 0-1
binary_img_manual = gray_img_norm > threshold;

subplot(3,3,3);
imshow(binary_img_manual);
title('Manual Binary Image (Thresh = 0.5)');

%org ---> mirror
mirror_ver_img =flip(img,2);
subplot(3,3,5);
imshow(mirror_ver_img);

mirror_hor_img = flip(img,1);
subplot(3,3,6);
imshow(mirror_hor_img);
