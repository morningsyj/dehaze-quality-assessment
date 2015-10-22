clear;

in_path = '../images/';
out_path = '../dc/';
nss = zeros(100, 6, 88);
for i = 1:100
    for j = 0:5
        [i,j]
        pic_name = sprintf('H-%03d-%d.bmp', i, j);
        img = imread([in_path pic_name]);
        %compute_dark_channel(img, [out_path 'dc-' pic_name]);
        nss(i,j+1,:) = divine_feature_extract(img);
    end
end

save('nss.mat', 'nss');