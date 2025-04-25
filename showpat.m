function showpat(data)
    % data: a matrix where each row is an image (m*m pixels flattened)
    % n: number of images (rows) to display
    % m: width and height of each square image

    n = rows(data);
    m = sqrt(columns(data));

    if size(data, 2) ~= m*m
        error('Each row of data must have exactly m*m elements.');
    end

    % Limit n to the number of rows in data
    n = min(n, size(data, 1));
    
    % Calculate subplot layout (as square as possible)
    cols = ceil(sqrt(n));
    rows = ceil(n / cols);

    figure;
    for i = 1:n
        subplot(rows, cols, i);
        img = reshape(data(i, :), [m, m]);  % Reshape row to m x m
        imagesc(img); axis image off;      % Display image
        colormap gray;                     % Set grayscale colormap
        title(sprintf('Image %d', i));
    end
end

