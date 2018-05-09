clc;
clear;
load iris.dat
load wine.dat
load thyroid.dat
load s1_sub.dat
load s2.txt
s2_sub=s2(1:1500,:);
clear s2;
% load SinglePartitionDatasets;
%Once Assignment statistic
    %Once Assignment statistic variable
iterationTimes=5;
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
 costMe=[];
 costMeSum=zeros(5,5);
 costMeSave=cell(1,iterationTimes);
 costHungarian=[];
 costHungarianSum=zeros(5,5);
 costHungarianSave=cell(1,iterationTimes);
 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
 timeMe=[];
 timeMeSum=zeros(5,5);
 timeMeSave=cell(1,iterationTimes);
 timeHungarian=[];
 timeHungarianSum=zeros(5,5);
 timeHungarianSave=cell(1,iterationTimes);

%  count=1;
 data{1}=iris;
 data{2}=wine;
 data{3}=thyroid;
 data{4}=s1_sub;
 data{5}=s2_sub;
% for size=[200,600,1000,2000,5000]
%     data{count}=round(rand(size,2)*100);
%     count=count+1;
% end
% load data;
 %start statistic processing
 count=1;
for j=1:iterationTimes
    row=1;
    for i=1:5
%     for size=[200,600,1000,2000,5000]
%         data{count}=round(rand(size,2)*100);     
        colum=1;
       for k=[3,9,21,45,93]  
           %get cost matrix to test,because this two algorithm use the same
           %data set but their calculation module are not same
           costMatHungarian=getCostMat(data{count},k);
           costMatMe=costMatHungarian(1:k,:);
           tic;[~,costHungarian(row,colum)] = munkres(costMatHungarian);timeHungarian(row,colum)=toc;
           tic;[ ~,costMe(row,colum) ] = AssignmentByIntLinPro( costMatMe );timeMe(row,colum)=toc;
           colum=colum+1;
       end
       row=row+1;
       count=count+1;
    end
    timeHungarianSave{j}=timeHungarian;
    timeMeSave{j}=timeMe;
    timeHungarianSum=timeHungarianSum+timeHungarian;
    timeMeSum=timeMeSum+timeMe;
    
    costHungarianSave{j}=costHungarian;
    costMeSave{j}=costMe;
    costHungarianSum=costHungarianSum+costHungarian;
    costMeSum=costMeSum+costMe;
    
    count=1;
    j
end
timeHungarianAve=timeHungarianSum./j;
timeMeAve=timeMeSum./j;

costHungarianAve=timeHungarianSum./j;
costMeAve=costMeSum./j;