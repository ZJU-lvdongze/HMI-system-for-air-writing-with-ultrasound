%%  导入文件夹内所有.csv，并合并数据
% clear all;
% clc;close all;

file_read = dir('C:\Users\DELL\Desktop\手势识别\0数据\3.1\手势\*\*.csv');
file_length = length(file_read);

for i=1:file_length
   % 导入文件并分类回波
   name=file_read(i).name;
   folder=file_read(i).folder;
   path=strcat(folder,'\',name);
   data(i,:) = importfile_tezheng(path ,[1, 1]);

end

%% 
data = [data_11;data_22];

%% 预测位置
clc;
load('trainedModel_SVM.mat');


file_read = dir('C:\Users\DELL\Desktop\手势识别\0数据\12.6\train\66\*.csv');
file_length = length(file_read);

for i=1:file_length

name=file_read(i).name;
path=strcat('C:\Users\DELL\Desktop\手势识别\0数据\12.6\train\66\',name);
T = importfile_tezheng(path ,[1, 1]);
yfit(i,1) = trainedModel_SVM.predictFcn(T);

end

%%
%load('C:\Users\DELL\Desktop\手势识别\0数据\trainedModel_jichengshu.mat');
T=[14.68	0	61.23	31.88	1.17e-05	1.67e-06];
T = array2table(T,"VariableNames",["TOF1" "TOF2" "VPP1" "VPP2" "RMS1" "RMS2"]);
yfit = trainedModel_jichengshu.predictFcn(T);

