# MATLAB_AVI
// SAI CHECK THIS
[t Fs]=audioread('exp.wav');
x=t;
rightchannel = x(:, 2);
leftchannel = x(:, 1);
% semicolon=;*ones(size(leftchannel));

l1=min(leftchannel*2^(15));
d1=(leftchannel*2^(15)-l1);
leftchannelbinary=dec2bin(d1);


l2=min(q*2^(15));
d2=(q*2^(15)-l2);
rightchannelbinary=dec2bin(d2);
filnam1 = 'leftchannelbinary.txt';
filnam2 = 'rightchannelbinary.txt';


    fid = fopen(filnam1,'w');
    for i=1:size(leftchannelbinary,1)    
        fprintf(fid,'%s\n', leftchannelbinary(i,:));
    end;          
    fclose(fid);
    
        fid = fopen(filnam2,'w');
    for i=1:size(leftchannelbinary,1)    
        fprintf(fid,'%s\n', rightchannelbinary(i,:));
    end;          
    fclose(fid);
