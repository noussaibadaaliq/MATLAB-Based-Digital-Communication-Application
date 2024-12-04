function [filtData, decision] = signal_sortie(M, rx, tp, sampleValue) 
 %% D?modulation du signal re?u
 % Recherche de la fr?quence du signal ? chaque intervalle
 negative=0;
 positive=0;
 
 totalBits=length(rx)/length(tp);
 sdiff=0;
 noofzeros=0;
 zeroSample=[];
 k=1;
 for i=1:totalBits
     for j=1:length(tp)
         if(sdiff>sampleValue)
         if(rx(1,k)>0)
             positive=1;
         end
         if(rx(1,k)<0)
             negative=1;
         end
         end
         k=k+1;
         sdiff=sdiff+1;
         if(positive==1 && negative==1)
             noofzeros=noofzeros+1;
             positive=0;
             sdiff=0;
             negative=0;
         end
     end
     zeroSample=[zeroSample noofzeros];
     noofzeros=0;     
 end
 
 firstZeroSample=zeroSample(1,1);
 zeroSample=zeroSample/firstZeroSample;
 % G?n?rer des donn?es en fonction d'?chantillons de fr?quence donn?s ou de z?ro ?chantillon donn?
 filtData=[];
 for i=1:length(zeroSample)
     if(zeroSample(i)>=1)
         filtData=[filtData 1];
     else
         filtData=[filtData 0];
     end
 end
 errorRate = abs(M-filtData)  
 decision = abs(filtData - errorRate) 
end  