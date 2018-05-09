clc;
clear;

%Once Assignment statistic
    %statistic variable
iterationTimes=10;
timeMe=[];
costMe=[];
timeMeSum=zeros(1,1);
timeMeSave=cell(1,iterationTimes);
count=1;
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%produce sythetic datasets%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %
 dataCount=1;
 for s=1:40
     size=fix(rand(1,1)*95000)+5000;
     data{dataCount}=round(rand(size,2)*100);
    dataCount=dataCount+1;
 end
 clear dataCount;%clear temp variable
 cluster=fix(rand(1,40)*97)+3; 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 %start statistic processing
for j=1:iterationTimes
%     row=1;
%     for i=1:1   
        colum=1;   
       for k=cluster
           costMatMe=getCostMatMe(data{count},k);   %get cost matrix
           tic;[ ~,costMe(colum) ] = AssignmentByIntLinPro( costMatMe );timeMe(colum)=toc;
           colum=colum+1;
           count=count+1;
       end
%        row=row+1;
%        count=count+1;
%     end
    timeMeSave{j}=timeMe;
    timeMeSum=timeMeSum+timeMe;
    count=1;
end
timeMeAve=timeMeSum./iterationTimes;

