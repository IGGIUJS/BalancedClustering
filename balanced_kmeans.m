function [MSE_best,kmeans_iteration_number,partition]=balanced_kmeans(X,k,u)
MSE_ITERATOR_S=[];
repeat_num=1;

%  load s1.dat
%  X=s1;
% load iris.dat
% X=iris;
% number of points
% n = size(X,1);
n=size(X,1);


% minimum size of a cluster

minimum_size_of_a_cluster = floor(n/k);


% dimensionality

d = size(X,2);

MSE_best = 0; % dummy value

number_of_iterations_distribution = zeros(100,1);

for repeats = 1:1      % 1:100

% initial centroids
% for j = 1:k
% pass = 0;
% while pass == 0
%     i = randi(n);
%     pass = 1;
%     for l = 1:j-1
%        if X(i,:) == C(l,:) 
%            pass = 0;
%        end
%     end
% end
% C(j,:) = X(i,:);
% end
C=u;


partition = 0;                 % dummy value
partition_previous = -1;       % dummy value
partition_changed = 1;

kmeans_iteration_number = 0;

while ((partition_changed)&&(kmeans_iteration_number<100))% kmeans iterations
    
partition_previous = partition;

% kmeans assignment step

% setting cost matrix for Hungarian algorithm
costMat = zeros(n);
for i=1:n
    for j = 1:n
        costMat(i,j) = (X(j,:)-C(mod(i,k)+1,:))*(X(j,:)-C(mod(i,k)+1,:))';
    end
end

% Execute Hungarian algorithm
[assignment,cost] = munkres(costMat);

% zero partitioning
for i = 1:n
    partition(i) = 0;
end

% find current partitioning from hungarian algorithm result
for i = 1:n 
    if assignment(i) ~= 0
            partition(assignment(i))=mod(i,k)+1;
    end
end

% kmeans update step

for j = 1:k
C(j,:) = mean(X(find(partition==j),:));
end


kmeans_iteration_number = kmeans_iteration_number +1;

partition_changed = sum(partition~=partition_previous);
MSE = 0;
for i = 1:n
    MSE = MSE + ((X(i,:)-C(partition(i),:))*(X(i,:)-C(partition(i),:))')/n;
end
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
MSE_ITERATOR_S(kmeans_iteration_number)=MSE;
repeat_num=repeat_num+1;
end  % kmeans iterations



if (MSE<MSE_best)||(repeats==1)
    MSE_best = MSE;
    C_best = C;
    partition_best = partition;
end

MSE_repeats(repeats) = MSE;

number_of_iterations_distribution(kmeans_iteration_number) = number_of_iterations_distribution(kmeans_iteration_number)+1;

end % repeats
    

% new notation

C = C_best;
partition = partition_best;
MSE = MSE_best;

mean_MSE_repeats = mean(MSE_repeats);
std_MSE_repeats = std(MSE_repeats);

% figure   
%X(:,1) = X(:,3);  % to view some other dimension
%plot(C(:,1),C(:,2),'gO');
%hold on
% plot(X(find(partition==1),1),X(find(partition==1),2),'r+');
% if k>1
%     hold on
%     plot(X(find(partition==2),1),X(find(partition==2),2),'bO');
% end
% if k>2
%     hold on
%     plot(X(find(partition==3),1),X(find(partition==3),2),'r.');
% end
% if k>3
%     hold on
%     plot(X(find(partition==4),1),X(find(partition==4),2),'b.');
% end
% if k>4
%     hold on
%     plot(X(find(partition==5),1),X(find(partition==5),2),'r+');
% end
% if k>5
%     hold on
%     plot(X(find(partition==6),1),X(find(partition==6),2),'bO');
% end
% if k>6
%     hold on
%     plot(X(find(partition==7),1),X(find(partition==7),2),'b+');
% end
% if k>7
%     hold on
%     plot(X(find(partition==8),1),X(find(partition==8),2),'b+');
% end
% if k>8
%     hold on
%     plot(X(find(partition==9),1),X(find(partition==9),2),'r.');
% end
% if k>9
%     hold on
%     plot(X(find(partition==10),1),X(find(partition==10),2),'b.');
% end
% if k>10
%     hold on
%     plot(X(find(partition==11),1),X(find(partition==11),2),'g+');
% end
% if k>11
%     hold on
%     plot(X(find(partition==12),1),X(find(partition==12),2),'gO');
% end
% if k>12
%     hold on
%     plot(X(find(partition==13),1),X(find(partition==13),2),'g+');
% end
% if k>13
%     hold on
%     plot(X(find(partition==14),1),X(find(partition==14),2),'g.');
% end
% if k>14
%     hold on
%     plot(X(find(partition==15),1),X(find(partition==15),2),'g.');
% end
% end



