function [bit, t4] = demodulation_ASK(modSig)
dmodSig=[];
bp=.000001;
br=1/bp; 
f=br*10;
t2=bp/99:bp/99:bp;                 
ss=length(t2);
for n=ss:ss:length(modSig)
  t=bp/99:bp/99:bp;
  y=cos(2*pi*f*t);                                        % carrier siignal 
  mm=y.*modSig((n-(ss-1)):n);
  t4=bp/99:bp/99:bp;
  z=trapz(t4,mm)                                              % intregation 
  zz=round((2*z/bp))                                     
  if(zz>7.5)                                  % logic level = (A1+A2)/2=7.5
    a=1;
  else
    a=0;
  end
  dmodSig=[dmodSig a];
end
disp(' Binary information at Reciver :');
disp(dmodSig);
%XXXXX Representation of binary information as digital signal which achived 
%after ASK demodulation XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
bit=[];
for n=1:length(dmodSig);
    if dmodSig(n)==1;
       se=ones(1,100);
    else dmodSig(n)==0;
        se=zeros(1,100);
    end
     bit=[bit se];
end
t4=bp/100:bp/100:100*length(dmodSig)*(bp/100);

end