% y=[];
% x = 1:513;
y = 1e9 * y;
for a=1:10;         %几组数据
    y1 = y(:,a);
    y2 = y1;
    
    for i=1:3
    y2 = smooth(y2);
    plot(y2,'-');
    hold on;
    end
    hold on;
    plot(y1,'-');
    ans(:,a) = y2;  %平滑后数据
end