%%  导入文件夹内所有.csv，并合并数据
 clear all;
 clc;close all;

file_read = dir('C:\Users\DELL\Desktop\手势识别\0数据\0train\手势\*\*.csv');
file_length = length(file_read);

for i=1:file_length
   % 导入文件并分类回波
   name=file_read(i).name;
   folder=file_read(i).folder;
   path=strcat(folder,'\',name);
   data(i,:) = importfile_tezheng(path ,[1, 1]);

end

% for i=1:3
%     figure;
%     stackedplot(data(:,2*i-1));
%     figure;
%     stackedplot(data(:,2*i));
% end

%% 预测位置
clear all;clc;
load('zhuangdaishu.mat');


file_read = dir('C:\Users\DELL\Desktop\手势识别\0数据\0train\手势\*\*.csv');
file_length = length(file_read);

for i=1:file_length

name=file_read(i).name;
folder=file_read(i).folder;
path=strcat(folder,'\',name);
T = importfile_tezheng(path ,[1, 1]);
gesture(i,:) = T.label;  % Gesture Lebal
yfit(i,1) = zhuangdaishu.predictFcn(T);

end

%% 测试数据
load('zhuangdaishu.mat');
load('yuanshi6_3SVM.mat');

test = data(:,1:6);
label = data.label;

for i=1:8312

T = test(i,1:6);
%yfit(i,1) = zhuangdaishu.predictFcn(T);
yfitSVM(i,1) = yuanshi_3SVM.predictFcn(T);
end



%% 训练gesture 导入文件
clear all;
clc;close all;

file_read = dir('C:\Users\DELL\Desktop\手势识别\0数据\0train\坏手势\*\*.csv');
file_length = length(file_read);

for i=1:file_length
   % 导入文件并分类  1:file_length
   name=file_read(i).name;
   folder=file_read(i).folder;
   path=strcat(folder,'\',name);
   gesture(i,:) = importfile_gesture(path ,[1,1]);  % Gesture Lebal
   data = csvread(path,0,1);% 导入单个手势数据
   train(i,:) = resample_50(data);


end

%% 处理数据
T = data';
x = T(:,1);
y = T(:,2);
len = length(x);
t = 1:1:len;
subplot(2,2,1); 
plot(x,y,'-o');

xx = 1:len/50:len; %重采样数据点数

c = polyfit(t, x, 8);  %进行拟合，c为2次拟合后的系数
d = polyfit(t, y, 8);
x1 = polyval(c, xx, 1);  %拟合后，每一个横坐标对应的值即为x1
y1 = polyval(d, xx, 1);  %拟合后，每一个横坐标对应的值即为d

% x1=interp1(t,x,xx,'nearest');%最邻近点插值
% y1=interp1(t,y,xx,'nearest');
% x1=interp1(t,x,xx,'spline');%三次样条插值
% y1=interp1(t,y,xx,'spline');




subplot(2,2,2);
plot(x,'-b');
hold on;
plot(xx,x1);

%yy_S=spline(dis_S,ALt_S,xx_S)  %样条插值
subplot(2,2,3);


plot(y, '-b');
hold on;
plot(xx, y1);
subplot(2,2,4);
plot(x1,y1,'-o');

output = [x1;y1]';
%% 预测手势
clc;
load('gesture_024hao_SVM.mat');
load('gesture_024_SVM.mat');

file_read = dir('C:\Users\DELL\Desktop\手势识别\0数据\0train\坏手势\*\*.csv');
file_length = length(file_read);

for i=1:file_length
   % 导入文件并分类
   name=file_read(i).name;
   folder=file_read(i).folder;
   path=strcat(folder,'\',name);
   data = csvread(path,0,1);% 导入单个手势数据
   T = resample_50(data);
   yfit(i,1) = gesture_024hao_SVM.predictFcn(T);
   
end
%% 绘制混淆矩阵
% c = 10.0;
% g = 0.1;
% cmd = ['-t 2','-c',num2str(c),'-g',num2str(g)];
% model = svmtrain(train,gesture,cmd);
% T_sim1 = svmpredict(train,gesture,model);
% gesture = label;
error1 = sum((yfit == gesture)) / i *100;
figure
plot(1:i,yfit,'r-*',1:i,gesture,'b-*','Linewidth',1)
legend('预测值','真实值')
xlabel('预测样本')
ylabel('预测结果')
string = {['KNN:  ' 'Accuracy=' num2str(error1) '%']};
title(string)
grid

figure
cm = confusionchart(gesture,yfit);
cm.Title = string;
xlabel('Ture label');
ylabel('Predicted label');
cm.ColumnSummary = 'column-normalized';
cm.RowSummary = 'row-normalized';

grid on;
% state ={'0','1','2','3','4','5','6','7','8','9','Z','J','U','→','←','↑'};
% state = categorical(state)
