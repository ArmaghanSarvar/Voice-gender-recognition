function [ peak_freq ] = getPeak( fileAddress )
[data, fs]= audioread(fileAddress);
len = length(data);
searchpow = abs(fft(data)/len).^2;
[maxpeak, maxpeakindes] = max(searchpow);
peak_freq = maxpeakindes * fs/len;
disp(peak_freq);
% we want the frequency at which the power is max
end

