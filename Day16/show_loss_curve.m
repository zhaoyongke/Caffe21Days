clear;
clc;
close all;
% 这个参数用来指定 Caffe 运行 log 文件
% 生成 log 文件方法：./examples/cifar10/train_quick.sh  >& cifar.log&
train_log_file = 'cifar.log';
% 这个参数相当于 solver.prototxt 中的 display 值
train_interval = 100;
% 这个参数相当于 solver.prototxt 中的test_interval 值
test_interval = 500;


[~, string_output] = dos(['cat ', train_log_file, ' | grep ''Train net output #0'' | awk ''{print $11}''']);
% fid = fopen('matlab_train_loss', 'r');
% train_loss = fscanf(fid, '%f\n');
% fclose(fid);
train_loss = str2num(string_output);
n = 1:length(train_loss);
idx_train = (n - 1) * train_interval;

% fid = fopen('matlab_test_loss', 'r');
% test_loss = fscanf(fid, '%f\n');
% fclose(fid);
[~, string_output] = dos(['cat ', train_log_file, ' | grep ''Test net output #1'' | awk ''{print $11}''']);
test_loss = str2num(string_output);
m = 1:length(test_loss);
idx_test = (m - 1) * test_interval;
figure;plot(idx_train, train_loss);
hold on;
plot(idx_test, test_loss);

grid on;
legend('Train Loss', 'Test Loss');
xlabel('iterations');
ylabel('loss');
title(' Train & Test Loss Curve');
