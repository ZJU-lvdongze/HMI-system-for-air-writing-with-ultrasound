clear all;
clc;close all;
 
load('C:\Users\DELL\Desktop\手势识别\0数据\12.6\8312_7.mat')
load('zhuangdaishu.mat');
load('yuanshi6_3SVM.mat');

test = data(:,1:6);
label = data.label;

%% 测试数据

for i=1:8312

T = test(i,1:6);
yfit(i,1) = trainedModel1svm.predictFcn(T);
%yfitSVM(i,1) = yuanshi_3SVM.predictFcn(T);
end

%% 绘制混淆矩阵
yfit1 = yfitSVM;

error1 = sum((yfit1 == label)) / i *100;
figure
plot(1:i,yfit1,'r-*',1:i,label,'b-*','Linewidth',1)
legend('预测值','真实值')
xlabel('预测样本')
ylabel('预测结果')
string = {['KNN:  ' 'Accuracy=' num2str(error1) '%']};
title(string)
grid

figure
cm = confusionchart(label,yfit1);
cm.Title = string;
xlabel('Ture label');
ylabel('Predicted label');
cm.ColumnSummary = 'column-normalized';
cm.RowSummary = 'row-normalized';

grid off;
% state ={'0','1','2','3','4','5','6','7','8','9','Z','J','U','→','←','↑'};
% state = categorical(state)
