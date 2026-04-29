# MATLAB Audio Signal Processing

A collection of MATLAB functions for audio signal 
processing developed as part of Signals and Systems 
coursework at the University of the Philippines Diliman.

## Functions Included

| Function | Description |
|---|---|
| `amplify.m` | Amplifies audio signal by a specified dB value |
| `fade_in.m` | Applies linear fade-in effect over a set duration |
| `fade_out.m` | Applies linear fade-out effect over a set duration |
| `downsample.m` | Downsamples audio by a specified integer factor |
| `t_reverse.m` | Reverses the audio signal in time |
| `truncate.m` | Removes low-power segments below a set threshold |
| `max_volume.m` | Normalizes audio to maximum volume |
| `test_audio_functions.m` | Test script with visualization and playback |

## How to Use
1. Open MATLAB
2. Add all `.m` files to your MATLAB path
3. Load your audio file:
```matlab
[X, fs] = audioread('your_audio.wav');
```
4. Apply any function:
```matlab
Y = amplify(X, 6);        % Amplify by 6 dB
Y = fade_in(X, 1);        % 1 second fade in
Y = fade_out(X, 2);       % 2 second fade out
Y = down_sample(X, 2);    % Downsample by factor 2
Y = t_reverse(X);         % Time reverse
Y = truncate(X, 0.01);    % Remove low power segments
Y = max_volume(X);        % Normalize to max volume
```

## Technologies Used
- **Language:** MATLAB
- **Concepts:** Digital Signal Processing, Audio Engineering,
  Linear Systems, Signal Manipulation, Visualization
- **Sampling Rate:** 44100 Hz (CD Quality)

## Course
Signals and Systems — Electronics Engineering  
University of the Philippines Diliman

## Status
Completed — University Course Project
University of the Philippines Diliman
