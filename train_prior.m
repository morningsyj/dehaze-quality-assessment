function train_prior(rank, feat, model_name)

disp('training nss ...');
n = size(rank,1);
m = size(rank,2);
p = size(feat,3);

%% convert to svm#light format
fq = fopen('train.dat', 'w');
for i = 1:n
    for j = 1:m
        fprintf(fq, '%d qid:%d', rank(i,j), i);
        for k = 1:p
            fprintf(fq, ' %d:%f', k, feat(i,j+1,k));
        end
        fprintf(fq, '\n');
    end
end
fclose(fq);

fcom = sprintf('./svm_rank_learn -c %d train.dat %s', n, model_name);
system(fcom);

end