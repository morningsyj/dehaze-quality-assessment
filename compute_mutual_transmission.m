function T = compute_mutual_transmission(I, J, A)

n = size(I,1);
m = size(I,2);

T = zeros(n,m,3);
for i = 1:3
    T(:,:,i) = (A(i) - I(:,:,i)) ./ (A(i) - J(:,:,i));
end

end