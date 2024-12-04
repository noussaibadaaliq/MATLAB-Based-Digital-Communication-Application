function [modSig, t3] = Modulation_ASK(M)
bit=[]; 
bp=.000001;
for n=1:1:length(M)
    if M(n)==1;
       se=ones(1,100);
    else M(n)==0;
        se=zeros(1,100);
    end
     bit=[bit se];
end
A1=10;                      % Amplitude of carrier signal for information 1
A2=5;                       % Amplitude of carrier signal for information 0
br=1/bp;                                                         % bit rate
f=br*10;                                                 % carrier frequency 
t2=bp/99:bp/99:bp;                 
ss=length(t2);
modSig=[];
for (i=1:1:length(M))
    if (M(i)==1)
        y=A1*cos(2*pi*f*t2);
    else
        y=A2*cos(2*pi*f*t2);
    end
    modSig=[modSig y];
end
t3=bp/99:bp/99:bp*length(M);
end