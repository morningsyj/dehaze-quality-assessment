clear;

load('images.mat');
load('dark_channel.mat');

n = size(images,1);
m = size(images,2);

A = cell(n,m);

for i = 1:n
    for j = 1:m
        A{i,j} = atmLight(double(images{i,j}),dc{i,j});
    end
end

save('atm_light.mat', 'A');