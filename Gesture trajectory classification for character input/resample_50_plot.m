%% 处理数据
function output = resample_50(data)
T = data';
x = T(:,1);
y = T(:,2);
len = length(x);
t = 1:1:len;

figure;
subplot(1,2,1); 
plot(x,y,'-o');

%yy_S=spline(dis_S,ALt_S,xx_S)  %样条插值
xx = len/50:len/50:len; %重采样数据点数

% x1=interp1(t,x,xx,'nearest');%最邻近点插值
% y1=interp1(t,y,xx,'nearest');
% x1=interp1(t,x,xx,'spline');%三次样条插值
% y1=interp1(t,y,xx,'spline');

c = polyfit(t, x, 8);  %进行拟合，c为2次拟合后的系数
d = polyfit(t, y, 8);
x1 = polyval(c, xx, 1);  %拟合后，每一个横坐标对应的值即为x1
y1 = polyval(d, xx, 1);  %拟合后，每一个横坐标对应的值即为d

subplot(1,2,2);
plot(x1,y1,'-o');

output = [x1,y1];
end