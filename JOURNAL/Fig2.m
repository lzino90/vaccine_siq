clc
clear all

lambda =.2;
sigma_v =.7;
sigma_n =.2;
pq=0.2;
beta=0.02;
v=0.8;
gammat=.5;
gammaq=.9;
u=0.05;
initvs=.98*v;
initvi=0.01*v;
initns=.98*(1-v);
initni=0.01*(1-v);
theta=0.5;
T = 200;
n=20000;

tspan = [0 T];
y0 = [initvs initvi initns initni];

[t,y] = ode23(@(t,y) ODE(t,y,sigma_n,sigma_v,lambda,pq,beta,v,gammat,gammaq,theta,u), tspan, y0);
SIQv2p(n,v,sigma_n,sigma_v,lambda,pq,beta,gammat,gammaq,theta,u,T,y0)
hold on
plot(t,y(:,1),'--g',t,y(:,2),'--r',t,v-y(:,1)-y(:,2),'--b')
plot(t,y(:,3),'--g',t,y(:,4),'--r',t,1-v-y(:,3)-y(:,4),'--b')