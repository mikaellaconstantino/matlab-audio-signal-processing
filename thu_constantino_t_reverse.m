function Y = thu_constantino_t_reverse(X)
% Reverse the audio signal in time
    % X: Input audio signal
    % Y: Time-reversed audio signal
    
    % Get the length of the signal
    len = length(X);
    
    % Create reversed signal using index manipulation
    Y = X(len:-1:1);
end