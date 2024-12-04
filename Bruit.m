function [rx, sampleValue] = Bruit(modSig)
 SNR=10;
 sampleValue=mod(randi(20),10)+10;
 rx=awgn(modSig,SNR);
end