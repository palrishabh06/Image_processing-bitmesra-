img = imread('img1.jpg');
figure;
subplot(2,2,1)
imshow(img);
axis on;                     % Turn on axis display
xlabel('X'); ylabel('Y');    % Label axes
title('Image with X and Y Coordinates');


cropped_face = img(20:70, 110:170, :);

subplot(2,2,4);
imshow(cropped_face);
title('Manually Cropped Face Region');