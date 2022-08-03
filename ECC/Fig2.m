clc
clear all

lambda =.2;
sigma =.4;
pq=0.2;
beta=0.02;
v=0.5;
gammat=2;
gammaq=10;
eta=0.2;
c=0.05;
inits=.98;
initi=0.01;
T = 200;
n=1000;

tspan = [0 T];
y0 = [inits initi];

[t,y] = ode23(@(t,y) ODE(t,y,sigma,lambda,pq,beta,v,gammat,gammaq,eta,c), tspan, y0);
SIQv(n,sigma,lambda,pq,beta,v,gammat,gammaq,eta,c,T,y0)
hold on
plot(t,y(:,1),'--g',t,y(:,2),'--r',t,1-y(:,1)-y(:,2),'--b')


ys=(beta+c)/(2*(1-eta)*(1-sigma)*lambda*(1-v*(gammat-1)/gammat)*(1-pq*(1-v*(gammaq-1)/gammaq)));
yi=beta*((1-pq*(1-v*(gammaq-1)/gammaq)))/(beta+c)-beta/(2*(1-eta)*(1-sigma)*lambda*(1-(gammat-1)/gammat));
yq=1-yi-ys;
