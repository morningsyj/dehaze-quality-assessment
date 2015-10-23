clear;

load('images.mat');
load('trans_estimated.mat');
load('rank.txt');

n = 100;
m = 5;

pred_rank = zeros(n,m);
pred_srocc = zeros(n,1);

for i = 1:n
    scores = zeros(1,m);
    for j = 1:m
        scores(j) = compute_condition_quality(Tr{i,1}, Tr{i,j+1});
    end
    [~, idx] = sort(scores);
    pred_rank(i,idx) = 1:m;
    pred_srocc(i) = corr(pred_rank(i,:)', rank(i,:)', 'type', 'Spearman');
end