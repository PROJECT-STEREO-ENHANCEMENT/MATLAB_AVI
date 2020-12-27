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
right1=[];
while length(right1)<length(x)
    right1=[right1 ; r2 ; r3];
end
right1=right1(1:length(x),1);
left1=[];
while length(left1)<length(x)
    left1=[left1 ; r3 ; r2];
end
left1=left1(1:length(x),1);

stereo=[left1.*left right1.*right];
