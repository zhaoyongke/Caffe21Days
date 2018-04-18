function [] = visualize_weights(w, s)
h = max(size(w, 1), size(w, 2));             % Kernel size
g = h + s;          % Grid size, larger than Kernel size for better visual effects.

% Normalization for gray scale
w = w - min(min(min(min(w))));
w = w / max(max(max(max(w)))) * 255;
w = uint8(w);

W = zeros(g * size(w, 3), g * size(w, 4));
for u = 1:size(w, 3)
    for v = 1:size(w, 4)
        W(g * (u - 1) + (1:h), g * (v -1) + (1:h)) = w(:,:,u,v)';
    end
end
W = uint8(W);
figure;imshow(W);
