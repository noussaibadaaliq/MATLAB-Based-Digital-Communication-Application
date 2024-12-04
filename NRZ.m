function [Y e DSP f ] = NRZ(M)
V=5;
Tb=0.1;
n=1;
Ts=n*Tb;
N=length(M);
Y=zeros(1,N);

%G?neration des impulsions
for i=1:N
    if (M(i)==0)
        Y(i)=-1;
    else Y(i)=1;
    end
end

%G?neration de la mise en forme
t=(0:0.001:Ts);
h(1:length(t))=V;
e=kron(Y,h);

%la densit? spectrale de puissance
f=-5/Ts:0.1:5/Ts;
DSP=Ts*V*V*power(sinc(f*Ts),2);

end

