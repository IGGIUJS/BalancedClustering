function [ assignment,cost ] = AssignmentByIntLinPro( costMat )
%     options = optimoptions('intlinprog','Display','off','RelativeGapTolerance',0);
    options = optimoptions('intlinprog','RelativeGapTolerance',0);
    C=costMat';
    [m,n]=size(C);
    f=C(:);                     %the coefficient vector of objective function
    intcon=(1:m*n)';            %restrict every element in matrix X as integer
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Equality constraint%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Aeq=sparse(m,m*n);
    for i=1:n
        Aeq(1:m,1+(i-1)*m:i*m)=speye(m,m);
    end
    beq=ones(m,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Inequality constraints%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    A=sparse(n*2,m*n);
    for i=1:n
        A(i,1+(i-1)*m:i*m)=ones(1,m)*-1;
        A(i+n,1+(i-1)*m:i*m)=ones(1,m);
    end
    b(1:n)=floor(m/n)*-1;
    b(n+1:n*2)=ceil(m/n);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%lower and upper bound%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    lb=zeros(m*n,1);        %lb£¬low bounds£¬restrict to 0
    ub=ones(m*n,1);         %ub£¬upper bounds£¬restrict to 1                     
    [X,cost]=linprog(f,A,b,Aeq,beq,lb,ub,options);
    assignment=reshape(X,m,n);
    assignment=assignment';
end

