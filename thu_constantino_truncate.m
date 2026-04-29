function Y = thu_constantino_truncate(X, power_threshold)
    % Remove segments with power below threshold
    % X: Input audio signal
    % power_threshold: Reference power level
    
    % Get sampling rate
    fs = 44100; % Assuming standard CD quality
    
    % Define segment duration (50 ms)
    segment_duration = 0.05;
    samples_per_segment = round(segment_duration * fs);
    
    % Get dimensions of input
    [num_samples, channels] = size(X);
    
    % Pre-allocate a logical index array to mark segments to keep
    keep_segments = false(num_samples, 1);
    
    % Process each segment
    for i = 1:floor(num_samples/samples_per_segment)
        % Extract segment indices
        start_idx = (i-1) * samples_per_segment + 1;
        end_idx = min(i * samples_per_segment, num_samples);
        
        % Extract segment
        segment = X(start_idx:end_idx, :);
        
        % Calculate power (using vectorized operations)
        segment_power = mean(segment.^2);
        
        % If multi-channel, take average across channels
        if channels > 1
            segment_power = mean(segment_power);
        end
        
        % Keep segment if power exceeds threshold
        if segment_power >= power_threshold
            keep_segments(start_idx:end_idx) = true;
        end
    end
    
    % Create output using only the segments we want to keep
    Y = X(keep_segments, :);
end