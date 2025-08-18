%WAP to read & display an image, split & display it into 4quardants

img = imread('img1.jpg');
subplot(3,3,8);
imshow(img);
title('Full Image');
[rows, cols, ~] = size(img);
mid_row = floor(rows / 2);
mid_col = floor(cols / 2);
quard_one = img(1:mid_row, 1:mid_col, :);            
quard_two = img(mid_row+1:end, mid_col+1:end, :);      
quard_three   = img(mid_row+1:end, 1:mid_col, :);             
quard_four  = img(1:mid_row, mid_col+1:end, :);     

subplot(3,3,1);
imshow(quard_one);
title('1st Quard');

subplot(3,3,2);
imshow(quard_four);
title('2nd Quard');

subplot(3,3,4);
imshow(quard_three);
title('3rd Quard');

subplot(3,3,5);
imshow(quard_two);
title('4th Quard');



%add number to each pixel0
num=1000;

for i=1:size(img,1)
    for j=1:size(img,2)
        img(i,j)=img(i,j)+num;
    end
end
subplot(3,3,3);
imshow(img)
title('added number to pixls');

% Rotate image by 45 degrees
rotated_img = imrotate(img, 45); 
subplot(3,3,6);
imshow(rotated_img);
title('Rotated Image (45°)');

% Scale image by 0.5 (downscale)
scaled_img = imresize(img, 3);
subplot(3,3,7);
imshow(scaled_img);
title('Scaled Image (3x)');

%transformation
% 50 pixels right, 30 pixels down
translation_vector = [50, 30];
translated_img = imtranslate(img, translation_vector, 'OutputView', 'full');

subplot(3,3,9);
imshow(translated_img);
title('Translated Image (+50, +30)');




