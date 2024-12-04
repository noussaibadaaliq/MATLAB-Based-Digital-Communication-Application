function  [Y, e, DSP, f, t ] = Manchester(M)
V=3; % l'Amplitude de
Tb=0.1; % dur?e de bit
n=1; % nombre de bit par symbole
Ts=n*Tb; % dur?e de symbole
N=length(M);
Y=zeros(1,N);
% G?neration des impulsions
for i=1:N
    if (M(i)==0)
        Y(i)=-1;
    else Y(i)=1;
    end
end

% G?neration de la mise en forme
t= (0:0.001:Ts);
h(1:length(t)/2)= V ;
h(length(t)/2+1:length(t))= -V ;
e=kron(Y,h);

% la Densit? spectrale de puissance
f=-5/Ts:0.1:5/Ts;
DSP=Ts*V*V*power(sinc(f*Ts),2).*power(sin((pi*f*Ts)/2),2); 
end