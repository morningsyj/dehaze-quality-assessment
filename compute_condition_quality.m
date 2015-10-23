function score = compute_condition_quality(TI, TJ)

% dc = darkChannel(I);
% A = atmLight(I, dc);
% T = transmissionEstimate(I, A, dc);
score = sum(sum((TI-TJ).^2))/numel(TI);

end