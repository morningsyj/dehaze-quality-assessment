function [pred_rank, pred_srocc] = test_prior(rank, feat, model_name)

n = size(rank,1);
m = size(rank,2);
p = size(feat,3);

%% convert to svm#light format
fq = fopen('test.dat', 'w');
for i = 1:n
    for j = 1:m
        fprintf(fq, '%d qid:%d', rank(i,j), i);
        for k = 1:p
            fprintf(fq, ' %d:%f', k,feat(i,j+1,k));
        end
        fprintf(fq, '\n');
    end
end
fclose(fq);

fcom = sprintf('./svm_rank_classify test.dat %s predictions', model_name);
system(fcom);

score = load('predictions');
score = reshape(score, m, n)';
pred_rank = zeros(n,m);
pred_srocc = zeros(n,1);

for i = 1:n
    [~,idx] = sort(score(i,:),2);
    pred_rank(i,idx) = 1:m;
    pred_srocc(i) = corr(pred_rank(i,:)', rank(i,:)', 'type', 'Spearman');
end

end