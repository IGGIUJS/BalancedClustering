clc;
clear;
% load iris.dat
% load wine.dat
% load thyroid.dat
load FrogsMFCCsSubset.mat
iterationTimes=5;
%Clustering Statistic
    %Clustering statistic variable
clusterCount_S=[];
clusterMSE_S=[];
clusterTime_S=[];
clusterCountSum_S=zeros(1,5);
clusterMSESum_S=zeros(1,5);
clusterTimeSum_S=zeros(1,5);
clusterCountSave_S=cell(1,iterationTimes);
clusterMSESave_S=cell(1,iterationTimes);
clusterTimeSave_S=cell(1,iterationTimes);

clusterCount_Me=[];
clusterMSE_Me=[];
clusterTime_Me=[];
clusterCountSum_Me=zeros(1,5);
clusterMSESum_Me=zeros(1,5);
clusterTimeSum_Me=zeros(1,5);
clusterCountSave_Me=cell(1,iterationTimes);
clusterMSESave_Me=cell(1,iterationTimes);
clusterTimeSave_Me=cell(1,iterationTimes);

clusterMSE_Kbs=[];
clusterTime_Kbs=[];
clusterMSESum_Kbs=zeros(1,5);
clusterTimeSum_Kbs=zeros(1,5);
clusterMSESave_Kbs=cell(1,iterationTimes);
clusterTimeSave_Kbs=cell(1,iterationTimes);

%  data{1}=iris;
%  data{2}=wine;
%  data{3}=thyroid;
data{1}=FrogsMFCCsSubset;
%start clustering processing
for j=1:iterationTimes
    row=1;
    count=1;
    for m=1:1
        colum=1;
        for k=[3,9,21,45,93]
            [~,u]=kmeanspp(data{count}',k);
            u=u';
            %my algorithm
            tic;
            [clusterMSE_S(row,colum),clusterCount_S(row,colum)]=balanced_kmeans(data{count},k,u);
            clusterTime_S(row,colum)=toc;
            
            %the original author algorithm
            tic;
            [ ~,~,clusterMSE_Me(row,colum),clusterCount_Me(row,colum)] = BalancedKmeansWithIntLinPro( data{count},k,u );
            clusterTime_Me(row,colum)=toc;
            %kbs algorithm
            [SIZE,~]=size(data{count});
            nb=ones(1,k)*fix(SIZE/k);
            for i=1:mod(SIZE,k)
                nb(i)=nb(i)+1;
            end
            tic;
            clusterMSE_Kbs(row,colum)=BalancedKmeansWithKbs(data{count},k,nb);
            clusterTime_Kbs(row,colum)=toc;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            colum=colum+1;
        end
        row=row+1;
        count=count+1;
    end
    clusterCountSave_S{j}=clusterCount_S;
    clusterMSESave_S{j}=clusterMSE_S;
    clusterTimeSave_S{j}=clusterTime_S;
    
    clusterCountSave_Me{j}=clusterCount_Me;
    clusterMSESave_Me{j}=clusterMSE_Me;
    clusterTimeSave_Me{j}=clusterTime_Me;
    
    clusterMSESave_Kbs{j}=clusterMSE_Kbs;
    clusterTimeSave_Kbs{j}=clusterTime_Kbs;
    
    clusterCountSum_S=clusterCountSum_S+clusterCount_S;
    clusterCountSum_Me=clusterCountSum_Me+clusterCount_Me;
    
    clusterMSESum_S=clusterMSESum_S+clusterMSE_S;
    clusterMSESum_Me=clusterMSESum_Me+clusterMSE_Me;
    clusterMSESum_Kbs=clusterMSESum_Kbs+clusterMSE_Kbs;
    
    clusterTimeSum_S=clusterTimeSum_S+clusterTime_S;
    clusterTimeSum_Me=clusterTimeSum_Me+clusterTime_Me;
    clusterTimeSum_Kbs=clusterTimeSum_Kbs+clusterTime_Kbs;
    j
end
clusterCount_S=clusterCountSum_S./iterationTimes;
clusterCount_Me=clusterCountSum_Me./iterationTimes;

clusterMSE_S=clusterMSESum_S./iterationTimes;
clusterMSE_Me=clusterMSESum_Me./iterationTimes;
clusterMSE_Kbs=clusterMSESum_Kbs./iterationTimes;

clusterTime_S=clusterTimeSum_S./iterationTimes;
clusterTime_Me=clusterTimeSum_Me./iterationTimes;
clusterTime_Kbs=clusterTime_Kbs./iterationTimes;

[R,C]=size(clusterMSE_Me);
clusterCountVar_S=zeros(R,C);
clusterMSEVar_S=zeros(R,C);
clusterTimeVar_S=zeros(R,C);

clusterCountVar_Me=zeros(R,C);
clusterMSEVar_Me=zeros(R,C);
clusterTimeVar_Me=zeros(R,C);

clusterMSEVar_Kbs=zeros(R,C);
clusterTimeVar_Kbs=zeros(R,C);

for r=1:R
    for c=1:C
        tmpCount_S=zeros(1,iterationTimes);
        tmpMSE_S=zeros(1,iterationTimes);
        tmpTime_S=zeros(1,iterationTimes);
        
        tmpCount_Me=zeros(1,iterationTimes);
        tmpMSE_Me=zeros(1,iterationTimes);
        tmpTime_Me=zeros(1,iterationTimes);
        
%         tmpCount_Kbs=zeros(1,iterationTimes);
        tmpMSE_Kbs=zeros(1,iterationTimes);
        tmpTime_Kbs=zeros(1,iterationTimes);
        
        for j=1:iterationTimes
            tmpCount_S(j)=clusterCountSave_S{j}(r,c);
            tmpMSE_S(j)= clusterMSESave_S{j}(r,c);  
            tmpTime_S(j)=clusterTimeSave_S{j}(r,c);
            
            tmpCount_Me(j)=clusterCountSave_Me{j}(r,c);
            tmpMSE_Me(j)= clusterMSESave_Me{j}(r,c);  
            tmpTime_Me(j)=clusterTimeSave_Me{j}(r,c);
            
            tmpMSE_Kbs(j)= clusterMSESave_Kbs{j}(r,c);  
            tmpTime_Kbs(j)=clusterTimeSave_Kbs{j}(r,c);
        end
        clusterCountVar_S(r,c)=var(tmpCount_S);
        clusterMSEVar_S(r,c)=var(tmpMSE_S);
        clusterTimeVar_S(r,c)=var(tmpTime_S);
        
        clusterCountVar_Me(r,c)=var(tmpCount_Me);
        clusterMSEVar_Me(r,c)=var(tmpMSE_Me);
        clusterTimeVar_Me(r,c)=var(tmpTime_Me);
        
        clusterMSEVar_Kbs(r,c)=var(tmpMSE_Kbs);
        clusterTimeVar_Kbs(r,c)=var(tmpTime_Kbs);
    end
end

