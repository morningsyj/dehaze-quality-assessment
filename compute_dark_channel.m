function dc = compute_dark_channel(img, fname)

dc = min(img, [], 3);
if ~isempty(fname)
    imwrite(dc, fname);
end

end