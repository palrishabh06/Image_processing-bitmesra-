% Read image
img = imread('img2.jpg');

% Display original image
figure; imshow(img); title('Original Image');

%% Question 1: Image Sampling with Different Interpolations
scale = 0.05;

% Nearest neighbor interpolation
nn_sampled = imresize(img, scale, 'nearest');

% Bilinear interpolation
bilinear_sampled = imresize(img, scale, 'bilinear');

% Bicubic interpolation
bicubic_sampled = imresize(img, scale, 'bicubic');

% Display sampled images
figure;
subplot(2,2,1), imshow(img), title('Original');
subplot(2,2,2), imshow(nn_sampled), title('Nearest Neighbor Sampling');
subplot(2,2,3), imshow(bilinear_sampled), title('Bilinear Sampling');
subplot(2,2,4), imshow(bicubic_sampled), title('Bicubic Sampling');

%% Question 2: Image Quantization and Intensity Histogram

% Display spatial resolution info
[rows, cols] = size(gray_img);
fprintf('Image size: %d x %d pixels\n', rows, cols);

% Number of unique intensity levels
num_levels = numel(unique(gray_img));
fprintf('Number of unique intensity levels: %d\n', num_levels);

% Display histogram
figure; imhist(gray_img);
title('Image Intensity Histogram');

%% Question 3: Image Enhancements and Transformations

% Convert grayscale image to double normalized to [0,1]
img_double = im2double(gray_img);

% 1. Negative Transformation
neg_img = imcomplement(img_double);
figure; imshow(neg_img);
title('Negative Image');

% 2. Gamma Correction
gamma = 1.5; % gamma >1 darkens, gamma <1 brightens
gamma_img = img_double .^ gamma;
figure; imshow(gamma_img);
title(['Gamma Corrected Image (Gamma = ', num2str(gamma), ')']);

% 3. Contrast Stretching
r1 = 24/255; s1 = 0.3;
r2 = 25/255; s2 = 1.0;

contrast_img = zeros(size(img_double));

% Vectorized contrast stretching
contrast_img(img_double <= r1) = (s1/r1) * img_double(img_double <= r1);
mask = img_double > r1 & img_double <= r2;
contrast_img(mask) = ((s2 - s1) / (r2 - r1)) * (img_double(mask) - r1) + s1;
contrast_img(img_double > r2) = ((1 - s2) / (1 - r2)) * (img_double(img_double > r2) - r2) + s2;

figure; imshow(contrast_img);
title('Contrast Stretched Image');

% 4. Thresholding
threshold = 0.3; % threshold in [0,1]
binary_img = img_double > threshold;

figure; imshow(binary_img);
title(['Thresholded Image (Threshold = ', num2str(threshold), ')']);
