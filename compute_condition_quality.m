function score = compute_condition_quality(TJ)

% dc = darkChannel(I);
% A = atmLight(I, dc);
% T = transmissionEstimate(I, A, dc);
score = sum(sum((1-TJ).^2));

end