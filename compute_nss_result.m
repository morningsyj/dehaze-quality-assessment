function [srocc_mean, srocc_std] = compute_nss_result()

n = 100;

srocc_mean = zeros(n,1);
srocc_std = zeros(n,2);

for i = 1:n
    fname = sprintf('../nss_result/%d.txt', i);
    x = load(fname);
    srocc_mean(i) = mean(x(:,1));
    srocc_std(i) = std(x(:,1));
end

end