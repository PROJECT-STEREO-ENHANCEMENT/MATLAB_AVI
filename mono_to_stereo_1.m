

clc;
clear all;
close all;
x1='Lucy .wav';
[x Fs]=audioread(x1);
z=x(:,1);

bpfilter1 = designfilt('bandpassfir','FilterOrder',32, ...
         'CutoffFrequency1',10,'CutoffFrequency2',900, ...
         'SampleRate',45000);

    
bpfilter2 = designfilt('bandpassfir','FilterOrder',32, ...
         'CutoffFrequency1',3500,'CutoffFrequency2',4500, ...
         'SampleRate',45000);

     
bpfilter3 = designfilt('bandpassfir','FilterOrder',32, ...
         'CutoffFrequency1',300,'CutoffFrequency2',4000, ...
         'SampleRate',45000);
center=filter(bpfilter3,z);
center=0.5*center;
left=filter(bpfilter1,z);
left=1.5*left;
right=filter(bpfilter2,z);
right=1.5*right;
stereo=[left+center,right+center];
