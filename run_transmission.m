clear;

load('images.mat');
load('dark_channel.mat');
load('atm_light.mat');

n = size(images,1);
m = size(images,2);

Te = cell(n,m);

for i = 1:n
    i
    for j = 1:m
        Te{i,j} = transmissionEstimate(double(images{i,j}),A{i,j});
    end
end

save('trans_estimated.mat', 'Te');