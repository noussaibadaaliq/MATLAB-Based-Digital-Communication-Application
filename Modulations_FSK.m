function [modSig, t3] = Modulations_FSK(M)
nb = 100; 
N = length(M);
Tb = 0.0001;   
digit = []; 
for n = 1:1:N
    if M(n) == 1;
       sig = ones(1,nb);
    else M(n) == 0;
        sig = zeros(1,nb);
    end
     digit = [digit sig];
end
Ac = 10;         % Carrier amplitude for binary input  
br = 1/Tb;       % Bit rate
Fc1 = br*10;     % Carrier frequency for binary input '1'
Fc2 = br*5;      % Carrier frequency for binary input '0'
t2 = Tb/nb:Tb/nb:Tb;   % Signal time   
modSig = [];
for (i = 1:1:N)
    if (M(i) == 1)
        y = Ac*cos(2*pi*Fc1*t2);   % Modulation signal with carrier signal 1
    else
        y = Ac*cos(2*pi*Fc2*t2);   % Modulation signal with carrier signal 2
    end
    modSig = [modSig y];
end
t3 = Tb/nb:Tb/nb:Tb*N;
end