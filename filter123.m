clc;
clear all;
close all;
x1='bass.wav';
x=audioread(x1);
x=x(:,1);
y1='4000.wav';
y=audioread(y1);
y=y(1:size(x),1);
z=x+y;

bpfilter1 = designfilt('bandpassfir','FilterOrder',32, ...
         'CutoffFrequency1',400,'CutoffFrequency2',8000, ...
         'SampleRate',45000);

    
bpfilter2 = designfilt('bandpassfir','FilterOrder',32, ...
         'CutoffFrequency1',4000,'CutoffFrequency2',10000, ...
         'SampleRate',45000);

     
left=filter(bpfilter1,z);
right=filter(bpfilter2,z);
stereo=[left,right];