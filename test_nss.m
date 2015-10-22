clear;

load('images.mat');
load('nss.mat');
load('rank.txt');
load('result.mat');

n = 100;
m = 5;
nfold = 10;
ntrain = 50;
model_name = 'model_nss';

index = randperm(n);
train = find(index <= ntrain);
test = find(index > ntrain);

rank_train = rank(train,:);
rank_test = rank(test,:);
feat_train = nss(train,:,:);
feat_test = nss(test,:,:);

train_prior(rank_train, feat_train, model_name);
[pred_rank, pred_srocc] = test_prior(rank_test, feat_test, model_name);
result_save(pred_rank, pred_srocc, test);
progress(test) = progress(test)+1;

save('result.mat', 'progress');
