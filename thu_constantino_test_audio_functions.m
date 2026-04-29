% test_audio_functions.m
% Script to test all audio processing functions 

% Read your audio file
[X, fs] = audioread('mp01_signal1.wav');

% Apply the functions with enhanced parameters for more apparent changes
Y1 = max_volume(X);
Y2 = t_reverse(X);
Y3 = down_sample(X, 10);  % Increased from 2 to 10 for more noticeable effect
Y4 = amplify(X, 20);      % Increased from 6 to 20 dB for more noticeable effect
Y5 = fade_in(X, 3);       % Increased from 1 to 3 seconds for more noticeable effect
Y6 = fade_out(X, 3);      % Increased from 2 to 3 seconds for more noticeable effect
Y7 = truncate(X, 0.005);  % Decreased from 0.01 to 0.005 to remove more segments

% Save each result with modified parameters
audiowrite('output_maxvolume.wav', Y1, fs);
audiowrite('output_reverse.wav', Y2, fs);
audiowrite('output_downsample.wav', Y3, fs/10);  % Adjusted for factor of 10
audiowrite('output_amplify.wav', Y4, fs);
audiowrite('output_fadein.wav', Y5, fs);
audiowrite('output_fadeout.wav', Y6, fs);
audiowrite('output_truncate.wav', Y7, fs);

% Visualization code
% Plot original vs max_volume
figure(1);
subplot(2,1,1); plot(X); title('Original Signal');
subplot(2,1,2); plot(Y1); title('Max Volume Signal');

% Plot original vs reverse
figure(2);
subplot(2,1,1); plot(X); title('Original Signal');
subplot(2,1,2); plot(Y2); title('Reversed Signal');

% Plot original vs downsampled
figure(3);
subplot(2,1,1); plot(X); title('Original Signal');
subplot(2,1,2); plot(Y3); title('Downsampled Signal (Factor 10)');

% Plot original vs amplified
figure(4);
subplot(2,1,1); plot(X); title('Original Signal');
subplot(2,1,2); plot(Y4); title('Amplified Signal (20 dB)');

% Plot original vs fade in
figure(5);
subplot(2,1,1); plot(X); title('Original Signal');
subplot(2,1,2); plot(Y5); title('Fade In Signal (3 sec)');

% Plot original vs fade out
figure(6);
subplot(2,1,1); plot(X); title('Original Signal');
subplot(2,1,2); plot(Y6); title('Fade Out Signal (3 sec)');

% Plot original vs truncated
figure(7);
subplot(2,1,1); plot(X); title('Original Signal');
subplot(2,1,2); plot(Y7); title('Truncated Signal (power threshold 0.005)');

% Play audio to hear differences 
fprintf('Playing original audio...\n');
sound(X, fs);
pause(length(X)/fs + 1); % Wait for original to finish

fprintf('Playing maximized volume audio...\n');
sound(Y1, fs);
pause(length(Y1)/fs + 1);

fprintf('Playing reversed audio...\n');
sound(Y2, fs);
pause(length(Y2)/fs + 1);

fprintf('Playing downsampled audio (factor 10)...\n');
sound(Y3, fs/10); % Note the adjusted sampling rate
pause(length(Y3)/(fs/10) + 1);

fprintf('Playing amplified audio (20 dB)...\n');
sound(Y4, fs);
pause(length(Y4)/fs + 1);

fprintf('Playing fade-in audio (3 sec)...\n');
sound(Y5, fs);
pause(length(Y5)/fs + 1);

fprintf('Playing fade-out audio (3 sec)...\n');
sound(Y6, fs);
pause(length(Y6)/fs + 1);

fprintf('Playing truncated audio...\n');
sound(Y7, fs);
pause(length(Y7)/fs + 1);

% Optional: Compare original with each effect back-to-back
fprintf('\n=== Direct comparisons (original followed by effect) ===\n');

% Compare original vs amplified
fprintf('Comparing original vs amplified (20 dB)...\n');
sound(X, fs);
pause(length(X)/fs + 1);
sound(Y4, fs);
pause(length(Y4)/fs + 1);

% Compare original vs downsampled
fprintf('Comparing original vs downsampled (factor 10)...\n');
sound(X, fs);
pause(length(X)/fs + 1);
sound(Y3, fs/10);
pause(length(Y3)/(fs/10) + 1);

% Compare original vs fade-in
fprintf('Comparing original vs fade-in (3 sec)...\n');
sound(X, fs);
pause(length(X)/fs + 1);
sound(Y5, fs);
pause(length(Y5)/fs + 1);

% Compare original vs fade-out
fprintf('Comparing original vs fade-out (3 sec)...\n');
sound(X, fs);
pause(length(X)/fs + 1);
sound(Y6, fs);
pause(length(Y6)/fs + 1);