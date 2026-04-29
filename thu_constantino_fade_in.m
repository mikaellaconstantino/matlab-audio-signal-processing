function Y = thu_constantino_fade_in(X, time)
 % Apply fade-in effect
% X: Input audio signal
% time: Fade duration in seconds
 [samples, channels] = size(X);
% Get the sampling rate from the original specification
 fs = 44100; % Assuming standard CD quality
% Calculate samples for fade duration
 fade_samples = floor(time * fs);
 if time * fs - fade_samples >= 0.5
    fade_samples = fade_samples + 1;
 end
% Check if fade duration exceeds audio length
if fade_samples > samples
 error('Fade duration exceeds audio length');
end
% Create linear fade envelope using vector creation with step size
 fade_env = zeros(fade_samples, 1);
 for i = 1:fade_samples
    fade_env(i) = (i-1)/(fade_samples-1);
 end
% Apply fade to each channel
 Y = X;
if channels > 1
% For multi-channel audio
for i = 1:channels
 Y(1:fade_samples, i) = Y(1:fade_samples, i) .* fade_env;
end
else
% For mono audio
 Y(1:fade_samples) = Y(1:fade_samples) .* fade_env;
end
end