%%4a

clc
clear all

lambda =.2;
sigma_v =.5;
sigma_n=0.5;
pq=0.2;
beta=0.02;
gammaq=.9;
u=0.05;
theta=0.5;
T = 200;
n=10000;

gammat=linspace(0.02,.98,11);
v=linspace(0.02,.98,11);
M=length(v);
L=length(gammat);
R=10;

res=zeros(M,L);

for i=1:M
    initvs=.98*v(i);
    initvi=0.01*v(i);
    initns=.98*(1-v(i));
    initni=0.01*(1-v(i));
    y0 = [initvs initvi initns initni];
    for j=1:L
        for r=1:R
            res(i,j)=res(i,j)+SIQv2p_final(n,v(i),sigma_n,sigma_v,lambda,pq,beta,gammat(j),gammaq,theta,u,T,y0);
        end
    end
    display(strcat('Progress:',num2str(round(i/M*100)),'%'))
end
figure
surf(v,gammat, res'/R)
view(0,90);


%%4b

clc
clear all

lambda =.2;
sigma_v =.5;
sigma_n=0.5;
pq=0.2;
beta=0.02;
gammat=.5;
u=0.05;
theta=0.5;
T = 200;
n=10000;

gammaq=linspace(0.02,.98,11);
v=linspace(0.02,.98,11);
M=length(v);
L=length(gammaq);
R=10;

res=zeros(M,L);

for i=1:M
    initvs=.98*v(i);
    initvi=0.01*v(i);
    initns=.98*(1-v(i));
    initni=0.01*(1-v(i));
    y0 = [initvs initvi initns initni];
    for j=1:L
        for r=1:R
            res(i,j)=res(i,j)+SIQv2p_final(n,v(i),sigma_n,sigma_v,lambda,pq,beta,gammat,gammaq(j),theta,u,T,y0);
        end
    end
    display(strcat('Progress:',num2str(round(i/M*100)),'%'))
end
figure
surf(v,gammaq, res'/R)
view(0,90);


%%4c

clc
clear all

lambda =.2;
sigma_v =.5;
sigma_n=0.5;
pq=0.2;
beta=0.02;
gammat=.5;
gammaq=.9;
u=0.05;
T = 200;
n=10000;

theta=linspace(0.02,.98,11);
v=linspace(0.02,.98,11);
M=length(v);
L=length(theta);
R=10;

res=zeros(M,L);

for i=1:M
    initvs=.98*v(i);
    initvi=0.01*v(i);
    initns=.98*(1-v(i));
    initni=0.01*(1-v(i));
    y0 = [initvs initvi initns initni];
    for j=1:L
        for r=1:R
            res(i,j)=res(i,j)+SIQv2p_final(n,v(i),sigma_n,sigma_v,lambda,pq,beta,gammat,gammaq,theta(j),u,T,y0);
        end
    end
    display(strcat('Progress:',num2str(round(i/M*100)),'%'))
end
figure
surf(v,theta, res'/R)
view(0,90);



%%4d

clc
clear all

lambda =.2;
sigma_v =.5;
pq=0.2;
beta=0.02;
gammat=.5;
gammaq=.9;
u=0.05;
theta=0.5;
T = 200;
n=10000;

sigma_n =linspace(0,1,11);
v=linspace(0.02,.98,11);
M=length(v);
L=length(sigma_n);
R=10;

res=zeros(M,L);

for i=1:M
    initvs=.98*v(i);
    initvi=0.01*v(i);
    initns=.98*(1-v(i));
    initni=0.01*(1-v(i));
    y0 = [initvs initvi initns initni];
    for j=1:L
        for r=1:R
            res(i,j)=res(i,j)+SIQv2p_final(n,v(i),sigma_n(j),sigma_v,lambda,pq,beta,gammat,gammaq,theta,u,T,y0);
        end
    end
    display(strcat('Progress:',num2str(round(i/M*100)),'%'))
end

figure
surf(v,sigma_n, res'/R)
view(0,90);

