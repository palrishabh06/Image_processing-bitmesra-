img = imread('img1.jpg');
%if size(img,3) == 3
    %img = rgb2gray(img);
%end

% Define the intensity range to highlight
a = 100;
b = 150;

% Create a logical mask for pixels in the range
mask = (img >= a) & (img <= b);

% Initialize output image as black
output_img = zeros(size(img));

% Set pixels in the range to white (255)
output_img(mask) = 127;

% Display results
figure;
subplot(1,2,1), imshow(img),title('Original Image');
subplot(1,2,2), imshow(output_img),title('Intensity Sliced Image');
