clear all
close all
clc

EXp=xlsread('A0000CH1.csv');
n1=1;
n22=size(EXp);n2=n22(1,1);
t1=0;
t22=((size(EXp)/n2)*1);t2=t22(1,1);%%%
FsV=n2-n1;
Vpfilter =EXp((n1:n2),1);%%%
timepV=[t1:.00025:t2-.00025]';  %%%%
subplot(2,1,1);plot(timepV,1000*Vpfilter);grid on
xlabel('Time (s)'),ylabel('Voltage (mV)')


nfft=2^[floor((log(n2-n1))/log(2))];
YVp = fft(Vpfilter,nfft);
YYVp(1:(nfft))=1000*(abs(YVp(1:(nfft))))/nfft;
fVp=(0:nfft-1)'*FsV/(nfft-1)/1;  %%%%%
%subplot(2,1,2);plot(2*.8*fVp,2.5*1000*YYVp/nfft);grid on
subplot(2,1,2);plot(fVp,YYVp);grid on

xlabel('Frequency (Hz)'),ylabel('Voltage (mV)');
% % plot(w,Y/2^8)

% xlswrite('fVp.xls',fVp)
% xlswrite('Amp-9.xlsx',YYVp)