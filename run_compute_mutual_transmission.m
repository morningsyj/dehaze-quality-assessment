clear;

n = 100;
m = 5;

images = cell(n,m+1);

for i = 1:n
    for j = 0:m
        fname = sprintf('H-%03d-%d.bmp', i, j);
        img = imread(['../images/' fname]);
        images{i,j+1} = img;
    end
end

save('images.mat', 'images');