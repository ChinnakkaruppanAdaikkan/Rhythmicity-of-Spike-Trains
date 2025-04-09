% To get the psd we will need to create a spike train 
% Create the spiketrain based on the interspike intervals
function [pxx, f, psd, Train, Traintimes] = SpikePSD(ISIarray)
    Traintimes = cumsum(ISIarray);
    
    %Initialize spike train
    len = Traintimes(end);
    len = round(len);
    Train = zeros(1,len);
    
    Traintimes = round(Traintimes);
    Train(Traintimes) = 1; % Created Spiketrain with sampling frequency of 10^6, 1 sample every us
    
    % Perform the psd analysis
    
    fs = 10^3;

    %window = hanning(4096);
    
    [pxx, f] = pwelch(Train, [], [], [],fs);
    figure;
    psd = plot(f, log10(pxx));
    xlabel('frequency')
    ylabel('Power')
    title('Spike PSD')
    xlim([0,200])
end