clc;
clear;

for i=1:40
  ds(i)=length(data{i});
end
cb = [ds' cluster' timeMeAve']; %cb是把三个数据都放在一起好看

t = cb(:,3);
p = cb(:,1);
k = cb(:,2);
x=min(p):1000:max(p);
y=min(k):max(k);
m =2*k+p+p.*k;
n = 2*p.*k+2*k;
d=(3*p.*k+2*k+2*p.*k)./(m.*n);
[X,Y]=meshgrid(x,y);
M=2.*Y+X+X.*Y;
N=2.*X.*Y+2.*Y;
D=(3*X.*Y+2.*Y+2*X.*Y)./(M.*N);  
Z=2.775e-6.*power(M,0.446).*N.*power(D,0.33);
surf(X,Y,Z);
shading interp;
hold on;
scatter3(p,k,t,'MarkerFaceColor','g');