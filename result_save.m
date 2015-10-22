function result_save(pred_rank, pred_srocc, index)

n = size(pred_rank, 1);
m = size(pred_rank, 2);
for i = 1:n
    fname = sprintf('../nss_result/%d.txt', index(i));
    fq = fopen(fname, 'a');
    fprintf(fq, '%f ', pred_srocc(i));
    for j = 1:m
        fprintf(fq, ' %d', pred_rank(i,j));
    end
    fprintf(fq, '\n');
    fclose(fq);
end

end