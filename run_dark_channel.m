clear;

load('images.mat');

n = size(images,1);
m = size(images,2);

dc = cell(n,m);

for i = 1:n
    i
    for j = 1:m
        dc{i,j} = darkChannel(images{i,j});
    end
end

save('dark_channel.mat', 'dc');