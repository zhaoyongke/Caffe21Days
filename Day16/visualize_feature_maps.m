function [] = visualize_feature_maps(w, s)
h = max(size(w, 1), size(w, 2));             % Feature map size
g = h + s;
c = size(w, 3);
cv = ceil(sqrt(c));
W = zeros(g * cv, g * cv);

for u = 1:cv
    for v = 1:cv
        tw = zeros(h, h);
        if(((u - 1) * cv + v) <= c)
            tw = w(:,:,(u -1) * cv + v,1)';
            tw = tw - min(min(tw));
            tw = tw / max(max(tw)) * 255;
        end
        W(g * (u - 1) + (1:h), g * (v -1) + (1:h)) = tw;
    end
end
W = uint8(W);
figure;imshow(W);
