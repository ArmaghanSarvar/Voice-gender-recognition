function [] = plotPowerSpec( fileAddress )

[data, fs]= audioread(fileAddress);
len = length(data);
data = data - mean(data);
% power spec
searchpow = abs(fft(data)/len).^2;
%disp(searchpow);
hz = linspace(0, fs, len);

figure(1), clf
subplot(211)
plot(data)
xlabel('Time (s)'), ylabel('Amplitude')
title('time domain')

subplot(212)
plot(hz, searchpow, 'ms-', 'markerfacecolor','k', 'linew',1)
xlabel('Frequency (Hz)'), ylabel('power spectrum')
title('frequency domain')  
set(gca,'xlim', [0 1000])

end
