clear;
clc;
close all;

image_file_name = 't10k-images-idx3-ubyte';
index_file_name = 't10k-labels-idx1-ubyte';

fid1 = fopen(image_file_name,'rb');
fid2 = fopen(index_file_name,'rb');

images_data = fread(fid1,'uint8');
index_data = fread(fid2,'uint8');

fclose(fid1);
fclose(fid2);

images_data = images_data(17:end);
index_data = index_data(9:end);
image_buffer = zeros(28, 28);

for k = 1 : 100: length(images_data)/28/28
    figure(100);
    for t = 1:100
        image_buffer = reshape(images_data((k + t -2) * 28 * 28 + 1 : (k + t - 1) * 28 * 28),  28,  28);
        subplot(10, 10, t);
        imshow(uint8(image_buffer)');
        title(num2str(index_data(k + t - 1)));
    end
    pause;
end
