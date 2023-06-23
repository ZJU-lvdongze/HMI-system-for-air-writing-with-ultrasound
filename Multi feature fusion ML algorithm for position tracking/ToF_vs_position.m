%% 标签分类
load('C:\Users\DELL\Desktop\手势识别\0数据\12.6\8312_7.mat');
for i = 1:81
    [groupidx,group] = findgroups(data.label);
    t =  data(groupidx == i, :);
    b = i+10+floor((i-1)/9);
    namestr1 = ['T_' num2str(b) '=t'];
    eval(namestr1);
    all_average(i,:) = [mean(t.TOF1) , mean(t.VPP1) , mean(t.RMS1)];
    %all_average(i,:) = [mean(t.TOF2) , mean(t.VPP2) , mean(t.RMS2)];

end

%% 分成矩阵
ToF1_average = all_average(: , 1);
Vpp1_average = all_average(: , 2)/2;
Rms1_average = all_average(: , 3);
for i = 1:9
    for j = 1:9
        ToF1_matr(i , j) = ToF1_average((9*i+j-9),1);
        Vmx1_matr(i , j) = (Vpp1_average((9*i+j-9),1));
        Rms1_matr(i , j) = log(Rms1_average((9*i+j-9),1));
    end
end

%% 画3D图
close all;
[i,j] = meshgrid(1:1:9,1:1:9);
step = 0.2;
[xi,yi] = meshgrid(1:step:9,1:step:9);
z_ToF1 = interp2(i,j,ToF1_matr',xi,yi,'spline',0); %插值
z_Vpp1 = interp2(i,j,Vmx1_matr',xi,yi,'cubic',0);
z_Rms1 = interp2(i,j,Rms1_matr',xi,yi,'cubic',0);

surfc(xi,yi,z_ToF1); %surfc = surf + contour
%shading interp
colorbar()
xlabel('x'),ylabel('y'),zlabel('ToF2');
set(gca,'FontName','Arial','FontSize',12)

figure;
surfc(xi,yi,z_Vpp1); 
%shading interp
colorbar()
xlabel('x'),ylabel('y'),zlabel('Vpp1');
set(gca,'FontName','Arial','FontSize',12)

figure;
surfc(xi,yi,z_Rms1); 
%shading interp
colorbar()
xlabel('x'),ylabel('y'),zlabel('Rms2');
set(gca,'FontName','Arial','FontSize',12)






