%WAP to enhance the image using HISTOGRAM EQUILIZATION.
% Read the image (grayscale)
img = imread('img1.jpg'); % Replace with your image file
if size(img, 3) == 3
    img = rgb2gray(img); % Convert to grayscale if it's a color image
end

% Get image size
[M, N] = size(img);

% Calculate histogram (counts of pixel intensities)
hist_counts = imhist(img);

% Calculate PDF p(rk)
pdf = hist_counts / (M * N);

% Calculate CDF
% we can use cdf=cumsum(pdf)
cdf = zeros(size(pdf));
for k = 1:length(pdf)
    cdf(k) = sum(pdf(1:k));
end

% Normalize the CDF to [0, 255]
cdf_normalized = cdf * 255;

% Round off normalized CDF values
cdf_rounded = round(cdf_normalized);

% Initialize output image
output_img = zeros(M, N, 'uint8');

% CDF mapping
for i = 1:M
    for j = 1:N
        output_img(i, j) = cdf_rounded(img(i, j) + 1); % +1 for MATLAB indexing
    end
end

% Display original and equalized images
figure;
subplot(2,2,1), imshow(img), title('Original Image');
subplot(2,2,2), imshow(output_img), title('Histogram Equalized Image');


subplot(2,2,3), imhist(img), title('Histogram of Original Image');
subplot(2,2,4), imhist(output_img), title('Histogram of Equalized Image');