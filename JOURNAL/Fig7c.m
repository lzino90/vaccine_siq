
clc
clear all


%% Fixed parameters

v=0.821;
lambda=0.36;
pq=0.19;
beta=0.1;
gammat=0.65;
gammaq=0.92;
T=200;
nu=1/30;
n=10000;


%% Changing parameters

sigma_n=linspace(0,1,11);
theta=linspace(.01,.99,11);
sigma_v=.3;
L=length(theta);
M=length(sigma_n);
u=0.06;

%% Network


%% Initial conditions

nv=round(n*v);  
nn=n-nv;
initvs=round(.98*v*n);
initvi=nv-initvs;
initns=round(.98*(1-v)*n);
initni=nn-initns;
y0 = [initvs initvi initns initni];





%% Simulations
R=10;
res=zeros(11);
for i=1:L
    for j=1:M
for l=1:R
    res(i,j)=res(i,j)+SIQRv2p_final(n,v,sigma_n(j),sigma_v,lambda,pq,beta,gammat,gammaq,theta(i),nu,u,T,y0/n);
end
        display(strcat('Simulations:',num2str(round(((i-1)/L+j/(M*L))*100)),'%'))
    end
end
figure
surf(theta,sigma_n, res'/R)
view(0,90);