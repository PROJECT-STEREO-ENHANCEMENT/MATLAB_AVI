%%value as in 1st paper

clc;
clear all;
close all;
x1='Lucy .wav';
[x Fs]=audioread(x1);
z=x(:,1);

bpfilter1 = designfilt('bandpassfir','FilterOrder',32, ...
         'CutoffFrequency1',3000,'CutoffFrequency2',9000, ...
         'SampleRate',45000);

    
bpfilter2 = designfilt('bandpassfir','FilterOrder',32, ...
         'CutoffFrequency1',9000,'CutoffFrequency2',21000, ...
         'SampleRate',45000);

     
bpfilter3 = designfilt('bandpassfir','FilterOrder',32 , ...
         'CutoffFrequency1',20,'CutoffFrequency2',3000, ...
         'SampleRate',45000);
center=filter(bpfilter3,z);
center=0.5*center;
left=filter(bpfilter1,z);
left=1.5*left;
right=filter(bpfilter2,z);
right=1.5*right;
stereo=[left+center,right+center];
