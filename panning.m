clc;
clear all;
close all;

[sig Fs]=audioread('CantinaBand60.wav');

%User selected Pan knob Value
%[-100 , 100]
%-100 : panning completely left
%100  : panning completely right
%0    : pan to the center

panValue=50;
x=panValue/200 +0.5;

%linear Panning

rightAmp=x;
leftAmp=1-x;
stereo1=[leftAmp.*sig , rightAmp.*sig];

%Square law panning

rightAmp=sqrt(x);
leftAmp=sqrt(1-x);
stereo2=[leftAmp.*sig , rightAmp.*sig];

%Sine law panning

rightAmp=sin(x*pi/2);
leftAmp=sin((1-x)*pi/2);
stereo3=[leftAmp.*sig , rightAmp.*sig];

