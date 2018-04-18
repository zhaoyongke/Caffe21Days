clear;
clc;
close all;
strings = {
    'airplane'
'automobile'
'bird'
'cat'
'deer'
'dog'
'frog'
'horse'
'ship'
'truck'
};
image_file_name = 'data_batch_1.bin';
fid1 = fopen(image_file_name, 'rb');
images_data = fread(fid1, 'uint8');
fclose(fid1);

images_data = reshape(images_data, 3073, [])';
image_idx = images_data(:, 1);

for k = 1 : 100 : size(images_data,1)
    figure(100);
    for t = 1 : 100
        image_r = reshape(images_data(k + t - 1, 2 : 1025), 32, [])';
        image_g = reshape(images_data(k + t - 1, 1026 : 2049), 32, [])';
        image_b = reshape(images_data(k + t - 1, 2050 : 3073), 32, [])';
        image_buffer = cat(3, image_r, image_g, image_b);
        subplot(10, 10, t);
        imshow(uint8(image_buffer));
        title(strings{image_idx(k + t - 1)+1});
    end
    input('Press Enter to next picture :');
    pause;
end
