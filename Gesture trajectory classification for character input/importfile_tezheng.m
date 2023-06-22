function data = importfile_tezheng(filename, dataLines)
%IMPORTFILE 从文本文件中导入数据
%  ECHO22110116021114 = IMPORTFILE(FILENAME)读取文本文件 FILENAME 中默认选定范围的数据。
%  以表形式返回数据。
%
%  ECHO22110116021114 = IMPORTFILE(FILE, DATALINES)按指定行间隔读取文本文件 FILENAME
%  中的数据。对于不连续的行间隔，请将 DATALINES 指定为正整数标量或 N×2 正整数标量数组。
%
%  示例:
%  echo22110116021114 = importfile("E:\Labview_work\ldz\数据\11.1\ML\11\echo_221101--16：02：11_14.csv", [1, 1]);
%
%  另请参阅 READTABLE。
%
% 由 MATLAB 于 2022-11-01 16:33:46 自动生成

%% 输入处理

% 如果不指定 dataLines，请定义默认范围
if nargin < 2
    dataLines = [1, 1];
end

%% 设置导入选项并导入数据
opts = delimitedTextImportOptions("NumVariables", 7);

% 指定范围和分隔符
opts.DataLines = dataLines;
opts.Delimiter = ",";

% 指定列名称和类型
opts.VariableNames = ["TOF1", "TOF2", "VPP1", "VPP2", "RMS1", "RMS2", "label"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double"];

% 指定文件级属性
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% 指定变量属性
opts = setvaropts(opts, ["TOF1", "TOF2", "VPP1", "VPP2", "RMS1", "RMS2", "label"], "TrimNonNumeric", true);
opts = setvaropts(opts, ["TOF1", "TOF2", "VPP1", "VPP2", "RMS1", "RMS2", "label"], "ThousandsSeparator", ",");

% 导入数据
data = readtable(filename, opts);

end