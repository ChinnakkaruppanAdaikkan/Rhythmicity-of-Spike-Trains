% Function to get the Inter Spike Intervals
function [isi, ISIhist] = getISI(FilePath)
    [Timestamps, ScNumbers, CellNumbers, Features, Samples] = Nlx2MatSpike(FilePath, [1 1 1 1 1], 0, 1, []);
    % The Timestamps variable contains the timestamps of the spikes
    % Difference between the two gives us the interspike interval
    % diff function to find the interspike interval
    
    isi = diff(Timestamps); % This is in us
    % To convert to ms
    isi = isi*10^-3;
    
    % Prepare a histogram of the ISIs
    figure;
    ISIhist = histogram(isi,'Normalization','pdf');
    xlabel('ISI')
    ylabel('pdf')
    title('Inter-Spike Interval')

end
