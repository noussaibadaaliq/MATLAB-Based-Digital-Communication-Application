function [Y e DSP f ] = RZ(M)
V=5;    % l'Amplitude 
Tb=0.01; % dur?e de bit
n=1;   % nombre de  bit par symbole
Ts=n*Tb; % dur?e de symbole 
N=length(M);
Y=zeros(1,N);
% G?neration des impulsions
for i=1:N   
    if (M(i)==0)          
        Y(i)=0;   
    else    Y(i)=1;    
    end 
end
% G?neration de la mise en forme
t= (0:0.001:Ts); 
h(1:length(t)/2)= V ;
%h(length(t)/2+1:length(t))= 0 ; 
e=kron(Y,h);   
% la Densit? spectrale de puissance 
f=-2/Ts:0.01:2/Ts;
DSP=((Ts*V*V)/4)*power((sinc(pi*f*Ts)/2),2);
end
