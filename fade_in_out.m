clc;
clear all;
close all;
x1='Lucy .wav';
[x Fs]=audioread(x1);
right=x(:,1);
left=x(:,2);
r1=ones(Fs/2,1);
r2=[];
for i=0:0.1:1
    r2=[r2 ; i*r1];
end

r3=flipud(r2);
fading=[r2 ; ones(length(x)-11*Fs,1) ; r3];

stereo=[left.*fading right.*fading];
