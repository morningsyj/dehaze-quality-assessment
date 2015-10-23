clear;

load('images.mat');
load('trans_estimated.mat');

n = size(images,1);
m = size(images,2);

epsilon = 1e-6;
r = 7 * 4;

refined_Te = cell(n,m);

for i = 1:n
    i
    for j = 1:m
        refined_Te{i,j} = guidedfilter_color(double(images{i,j}), Te{i,j}, r, epsilon);
    end
end

save('refined_trans.mat', 'refined_Te');