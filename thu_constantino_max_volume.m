function Y = thu_constantino_max_volume(X)
    % Maximize volume while preserving dynamic range
    % X: Input audio signal
    % Y: Normalized audio signal
    
    max_amplitude = max(abs(X));
    if max_amplitude ~= 0
        Y = X / max_amplitude;
    else
        Y = X;
    end
end