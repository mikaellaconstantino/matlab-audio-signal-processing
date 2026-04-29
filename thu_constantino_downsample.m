function Y = thu_constantino_downsample(X, factor)
    % Downsample the audio signal by specified factor
    % X: Input audio signal
    % factor: Downsampling factor (integer)
    
    Y = X(1:factor:end);
end

