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

% Conv1 Weight Visualization
conv1_layer = net.layer_vec(2);
blob1 = conv1_layer.params(1);
w = blob1.get_data();
fprintf('Conv1 Weight shape: ');
size(w)
visualize_weights(w, 1);

% Conv2 Weight Visualization
conv2_layer = net.layer_vec(6);
blob2 = conv2_layer.params(1);
w2 = blob2.get_data();
fprintf('Conv2 Weight shape: ');
size(w2)
visualize_weights(w2, 1);

% Conv3 Weight Visualization
conv3_layer = net.layer_vec(10);
blob3 = conv3_layer.params(1);
w3 = blob3.get_data();
fprintf('Conv3 Weight shape: ');
size(w3)
visualize_weights(w3, 1);

% Conv4 Weight Visualization
conv4_layer = net.layer_vec(12);
blob4 = conv4_layer.params(1);
w4 = blob4.get_data();
fprintf('Conv4 Weight shape: ');
size(w4)
visualize_weights(w4, 1);

% Conv5 Weight Visualization
conv5_layer = net.layer_vec(14);
blob5 = conv5_layer.params(1);
w5 = blob5.get_data();
fprintf('Conv5 Weight shape: ');
size(w5)
visualize_weights(w5, 1);
