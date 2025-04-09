% Script to get the ISI and the psd of the spikes
clear; clc
filepath = 'D:\Lab\Recordings_LFP\Coh\ForPPC\BaseAll\SE16_P2_1723207478483216_1723207704763268.nse';

[isi, ISIhist] = getISI(filepath);
[pxx, f, psd, Train, Traintimes] = SpikePSD(isi);