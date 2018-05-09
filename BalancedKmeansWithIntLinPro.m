function [ u,markedData,MSE_best,count,assignmentVec] = BalancedKmeansWithIntLinPro( data,k,u )
%initial some basic parameter
    MSE_best=inf;
    [dataLength,~]=size(data);
%     [~,u]=kmeanspp(data',k);
%     u=u';
    costMat=zeros(k,dataLength);
    re=zeros(dataLength,2);
    count=0;
    preCentroids=u;
%start clustering
    while 1
        clusterCount=1;
        position=0;
    %computing cost matrix
        for i=1:k
            for j=1:dataLength
                  costMat(i,j)=(u(i,:)-data(j,:))*(u(i,:)-data(j,:))';
%                     costMat(i,j)=(pdist2(u(i,:),data(j,:),'euclidean'))^2;
            end
        end
        [assignment,cost]=AssignmentByIntLinPro(costMat);
        
        for i=1:k
            clusterData=find(assignment(i,:)==1);          
            re(position+1:position+length(clusterData),1)=clusterCount;
            re(position+1:position+length(clusterData),2)=clusterData';
            position=position+length(clusterData);
            clusterCount=clusterCount+1;
        end
        %computing the average and update the centroids
        for i=1:k
            assignedDataNum=re(find(re(:,1)==i),:);
            assignedDataNum(:,1)=[];                %delete the cluster identifier of assignedDataNum,
                                                    %so we can get the data identifier of a cluster
            assignedData=data(assignedDataNum,:);
            u(i,:)=mean(assignedData);
        end
        MSE=cost/dataLength;
        if (MSE<MSE_best)
            MSE_best = MSE;
        end
        count=count+1;
        assignmentVec{count}=assignment;
        
        markedData=[];
        for i=1:k
            currentNum=re(find(re(:,1)==i),:);
            current=data(currentNum(:,2),:);
            index=linspace(i,i,length(currentNum))';
            markedData=[markedData;index,current];
        end
%         figure(count);
%         plot(u(1,1),u(1,2),'rx');
%         hold on;
%         plot(markedData(find(markedData(:,1)==1),2),markedData(find(markedData(:,1)==1),3),'r.');
%         if k>1
%             hold on;
%             plot(u(2,1),u(2,2),'bx');
%             plot(markedData(find(markedData(:,1)==2),2),markedData(find(markedData(:,1)==2),3),'b.');
%         end
%         if k>2
%             hold on;
%             plot(u(3,1),u(3,2),'mx');
%             plot(markedData(find(markedData(:,1)==3),2),markedData(find(markedData(:,1)==3),3),'m.');
%         end
%         if k>3
%             hold on;
%             plot(u(4,1),u(4,2),'gx');
%             plot(markedData(find(markedData(:,1)==4),2),markedData(find(markedData(:,1)==4),3),'g.');
%         end
        
        if norm(preCentroids-u)== 0  %iterate until it is converged
           break;
        end
        preCentroids=u;
        
        
    end
%     markedData=[];
%     for i=1:k
%         currentNum=re(find(re(:,1)==i),:);
%         current=data(currentNum(:,2),:);
%         index=linspace(i,i,length(currentNum))';
%         markedData=[markedData;index,current];
%     end
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %     
% plot
% figure;
% plot(u(1,1),u(1,2),'rx');
% hold on;
% plot(markedData(find(markedData(:,1)==1),2),markedData(find(markedData(:,1)==1),3),'r.');
% if k>1
%     hold on;
%     plot(u(2,1),u(2,2),'bx');
%     plot(markedData(find(markedData(:,1)==2),2),markedData(find(markedData(:,1)==2),3),'b.');
% end
% if k>2
%     hold on;
%     plot(u(3,1),u(3,2),'mx');
%     plot(markedData(find(markedData(:,1)==3),2),markedData(find(markedData(:,1)==3),3),'m.');
% end
end

