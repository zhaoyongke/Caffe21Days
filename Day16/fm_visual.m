clear;
clc;
close all;
addpath('matlab')
caffe.set_mode_cpu();
fprintf(['Caffe Version = ', caffe.version(), '\n']);

net = caffe.Net('models/bvlc_reference_caffenet/deploy.prototxt', 'models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel', 'test');

fprintf('Load net done. Net layers : ');
net.layer_names 



fprintf('Net blobs : ');
net.blob_names

fprintf('Now preparing data...\n');
im = imread('examples/images/cat.jpg');
figure;imshow(im);title('Original Image');
d = load('matlab/+caffe/imagenet/ilsvrc_2012_mean.mat');
mean_data = d.mean_data;
IMAGE_DIM = 256;
CROPPED_DIM = 227;

% Convert an image returned by Matlab's imread to im_data in caffe's data
% format: W x H x C with BGR channels
im_data = im(:, :, [3, 2, 1]);  % permute channels from RGB to BGR
im_data = permute(im_data, [2, 1, 3]);  % flip width and height
im_data = single(im_data);  % convert from uint8 to single
im_data = imresize(im_data, [IMAGE_DIM IMAGE_DIM], 'bilinear');  % resize im_data
im_data = im_data - mean_data;  % subtract mean_data (already in W x H x C, BGR)
im = imresize(im_data, [CROPPED_DIM CROPPED_DIM], 'bilinear');  % resize im_data
km = cat(4, im, im, im, im, im);
pm = cat(4, km, km);
input_data = {pm};

scores = net.forward(input_data);

scores = scores{1};
scores = mean(scores, 2);  % take average scores over 10 crops

[~, maxlabel] = max(scores);

maxlabel
figure;plot(scores);

fm_data = net.blob_vec(1);
d1 = fm_data.get_data();
fprintf('Data size = ');
size(d1)
visualize_feature_maps(d1, 1);


fm_conv1 = net.blob_vec(2);
f1 = fm_conv1.get_data();
fprintf('Feature map conv1 size = ');
size(f1)
visualize_feature_maps(f1, 1);

fm_conv2 = net.blob_vec(5);
f2 = fm_conv2.get_data();
fprintf('Feature map conv2 size = ');
size(f2)
visualize_feature_maps(f2, 1);

fm_conv3 = net.blob_vec(8);
f3 = fm_conv3.get_data();
fprintf('Feature map conv3 size = ');
size(f3)
visualize_feature_maps(f3, 1);

fm_conv4 = net.blob_vec(9);
f4 = fm_conv4.get_data();
fprintf('Feature map conv4 size = ');
size(f4)
visualize_feature_maps(f4, 1);

fm_conv5 = net.blob_vec(10);
f5 = fm_conv5.get_data();
fprintf('Feature map conv5 size = ');
size(f5)
visualize_feature_maps(f5, 1);
