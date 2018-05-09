% real datasets
% % the C.V of MSE
statisticRow=1;
iterationTimes=10;
for q=1:1
   for w=1:5
       for e=1:iterationTimes
           statisticSetMSE_Me(statisticRow,e)=clusterMSESave_Me{1,e}(q,w);
           statisticSetMSE_S(statisticRow,e)=clusterMSESave_S{1,e}(q,w);
           statisticSetMSE_Kbs(statisticRow,e)=clusterMSESave_Kbs{1,e}(q,w);
       end 
       varianceMSE_Me(q,w)=sqrt(var(statisticSetMSE_Me(statisticRow,:)));
       varianceMSE_S(q,w)=sqrt(var(statisticSetMSE_S(statisticRow,:)));
       varianceMSE_Kbs(q,w)=sqrt(var(statisticSetMSE_Kbs(statisticRow,:)));
       statisticRow=statisticRow+1;
   end
end
cvMSE_Me=varianceMSE_Me./clusterMSEMean_Me;
cvMSE_S=varianceMSE_S./clusterMSEMean_S;
cvMSE_Kbs=varianceMSE_Kbs./clusterMSEMean_Kbs;

clear statisticSetMSE_Me;
clear statisticSetMSE_S;
clear statisticSetMSE_Kbs;
% clear varianceMSE_Me;
% clear varianceMSE_S;
% clear varianceMSE_Kbs;
clear statisticRow;
% % 
% % the C.V of iteration count
statisticRow=1;
for q=1:1
    for w=1:5
        for e=1:iterationTimes
           statisticSetCount_Me(statisticRow,e)=clusterCountSave_Me{1,e}(q,w);
           statisticSetCount_S(statisticRow,e)=clusterCountSave_S{1,e}(q,w);
       end
       varianceCount_Me(q,w)=sqrt(var(statisticSetCount_Me(statisticRow,:)));
       varianceCount_S(q,w)=sqrt(var(statisticSetCount_S(statisticRow,:)));
       statisticRow=statisticRow+1;
    end
end
cvCount_Me=varianceCount_Me./clusterCountMean_Me;
cvCount_S=varianceCount_S./clusterCountMean_S;

clear statisticSetCount_Me;
clear statisticSetCount_S;
% clear varianceCount_Me;
% clear varianceCount_S;
clear statisticRow;

% % 
% % the C.V of Time
statisticRow=1;
iterationTimes=10;
for q=1:1
    for w=1:5
        for e=1:iterationTimes
           statisticSetTime_Me(statisticRow,e)=clusterTimeSave_Me{1,e}(q,w);
           statisticSetTime_S(statisticRow,e)=clusterTimeSave_S{1,e}(q,w);
           statisticSetTime_Kbs(statisticRow,e)=clusterTimeSave_Kbs{1,e}(q,w);
       end
       varianceTime_Me(q,w)=sqrt(var(statisticSetTime_Me(statisticRow,:)));
       varianceTime_S(q,w)=sqrt(var(statisticSetTime_S(statisticRow,:)));
       varianceTime_Kbs(q,w)=sqrt(var(statisticSetTime_Kbs(statisticRow,:)));
       statisticRow=statisticRow+1;
    end
end
cvTime_Me=varianceTime_Me./clusterTimeMean_Me;
cvTime_S=varianceTime_S./clusterTimeMean_S;
cvTime_Kbs=varianceTime_Kbs./clusterTimeMean_Kbs;

clear statisticSetTime_Me;
clear statisticSetTime_S;
clear statisticSetTime_Kbs;
% clear varianceTime_Me;
% clear varianceTime_S;
% clear varianceTime_KbS;
clear statisticRow;