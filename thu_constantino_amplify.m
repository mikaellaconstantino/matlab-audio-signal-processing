function Y = thu_constantino_amplify(X, dB_value)
% Amplify the signal by specified dB value
    % X: Input audio signal
    % dB_value: Desired gain in decibels
    
    % Convert dB to linear gain
    gain = 10^(dB_value/20);
    
    % Apply gain without normalization
    Y = X * gain;
    
end