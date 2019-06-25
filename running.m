files=dir('C:\Users\Armaghan\Desktop\signalProject\*.mp3');

plotPowerSpec('v0.mp3');   % any file you want to plot

maleSum = zeros(1000 , 1);
femaleSum = zeros(1000 , 1);
maleNum = 1;
femaleNum = 1;

for k=1:length(files)
   fileName=files(k).name;
   disp(fileName);
   peak = getPeak(fileName);
   %disp(peak);
   difFromMale = abs(peak- 122);
   difFromFemale = abs(peak - 212);
   [data, fs]= audioread(fileName);
   %data = data - mean(data);
   maleName = strcat('male', int2str(k), '.mp3');
   femaleName = strcat('female', int2str(k), '.mp3');
   if difFromMale < difFromFemale
       movefile(fileName, maleName);
   
       len = length(data);
       searchpow = abs(fft(data)/len).^2;
       maleSum(1:1000) = maleSum(1:1000) + searchpow(1:1000);
       maleNum = maleNum +1;
   else
       movefile(fileName, femaleName);
       
       len = length(data);
       searchpow = abs(fft(data)/len).^2;
       femaleSum(1:1000) = femaleSum(1:1000) + searchpow(1:1000);
       femaleNum = femaleNum +1;
   end
end
% the following comment is for plotting the mean power spectrum
% of male and female voices

%{   
maleMean = maleSum/maleNum;
femaleMean = femaleSum/femaleNum;

figure(1), clf
subplot(211)
plot(maleMean)
xlabel('Male'), ylabel('Mean')

subplot(212)
plot(femaleMean);
xlabel('Female'), ylabel('Mean')
set(gca,'xlim', [0 1000])
%}
