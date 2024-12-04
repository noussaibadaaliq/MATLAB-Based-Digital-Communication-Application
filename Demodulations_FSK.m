function [digit,t5]= Demodulations_FSK(modSig)
M = modSig;
% ********************* Channel model h and w *****************************
h = 1;   % Signal fading 
w = 0;   % Noise
% ********************* Received signal y *********************************
y = h.*M + w;   % Convolution
% *************************** FSK Demodulation ****************************
nb = 100; 
N = length(M);
Tb = 0.0001;
t2 = Tb/nb:Tb/nb:Tb;
s = length(t2);
demodSig = [];
Ac = 10;         % Carrier amplitude for binary input  
br = 1/Tb;       % Bit rate
Fc1 = br*10;     % Carrier frequency for binary input '1'
Fc2 = br*5;      % Carrier frequency for binary input '0'
 
for n = s:s:length(y)
  t4 = Tb/nb:Tb/nb:Tb;        % Time period
  c1 = cos(2*pi*Fc1*t4);      % carrier signal for binary value '1'
  c2 = cos(2*pi*Fc2*t4);      % carrier siignal for binary value '0'
  mc1 = c1.*y((n-(s-1)):n);   % Convolution 
  mc2 = c2.*y((n-(s-1)):n);   % Convolution 
  t5 = Tb/nb:Tb/nb:Tb;
  z1 = trapz(t5,mc1);         % Intregation 
  z2 = trapz(t5,mc2);         % Intregation 
  rz1 = round(2*z1/Tb);
  rz2 = round(2*z2/Tb);
  if(rz1 > Ac/2)              % Logical condition 
    a = 1;
  else(rz2 > Ac/2)
    a = 0;
  end
  demodSig = [demodSig a];
end
% ********** Represent demodulated information as digital signal **********
digit = [];
for n = 1:length(demodSig);
    if demodSig(n) == 1;
       sig = ones(1,nb);
    else demodSig(n) == 0;
        sig = zeros(1,nb);
    end
     digit = [digit sig];
end
t5 = Tb/nb:Tb/nb:nb*length(demodSig)*(Tb/nb);
end