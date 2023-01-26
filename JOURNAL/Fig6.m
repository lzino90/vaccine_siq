clear all
clc
v=0.821;
lambda=0.36;
pq=0.19;
beta=0.1;
gammat=0.65;
gammaq=0.92;
T=200;

sigma_n=.5;
theta=.5;
sigma_v=.7;

u=0:0.01:0.2;
n=10000;
initvs=round(.98*v*n);
initns=round(.98*(1-v)*n);
nv=round(n*v);
nn=n-nv;
y0=[0.8046    0.0082    0.1754    0.0018];


%% Initial conditions


nu=1/7;
R=100;
res=zeros(length(u),R);
for i=1:length(u)
    for j=1:R
        res(i,j)=res(i,j)+SIQRv2p_final(n,v,sigma_n,sigma_v,lambda,pq,beta,gammat,gammaq,theta,nu,u(i),T,y0);
    end
    display(strcat('Simulations:',num2str(round(i/length(u)*25)),'%'))
end
media=mean(res');
errore=sqrt(mean((res'-media).^2));


nu=1/30;
res2=zeros(length(u),R);
for i=1:length(u)
    for j=1:R
        res2(i,j)=res2(i,j)+SIQRv2p_final(n,v,sigma_n,sigma_v,lambda,pq,beta,gammat,gammaq,theta,nu,u(i),T,y0);
    end
    display(strcat('Simulations:',num2str(round(25+i/length(u)*25)),'%'))
end
media2=mean(res2');
errore2=sqrt(mean((res2'-media2).^2));


nu=1/60;
res3=zeros(length(u),R);
for i=1:length(u)
    for j=1:R
        res3(i,j)=res3(i,j)+SIQRv2p_final(n,v,sigma_n,sigma_v,lambda,pq,beta,gammat,gammaq,theta,nu,u(i),T,y0);
    end
    display(strcat('Simulations:',num2str(round(50+i/length(u)*25)),'%'))
end
media3=mean(res3');
errore3=sqrt(mean((res3'-media3).^2));



nu=1/120;
res4=zeros(length(u),R);
for i=1:length(u)
    for j=1:R
        res4(i,j)=res4(i,j)+SIQRv2p_final(n,v,sigma_n,sigma_v,lambda,pq,beta,gammat,gammaq,theta,nu,u(i),T,y0);
    end
    display(strcat('Simulations:',num2str(round(75+i/length(u)*25)),'%'))
end
media4=mean(res4');
errore4=sqrt(mean((res4'-media4).^2));



R=100;
res5=zeros(length(u),R);
for i=1:length(u)
    for j=1:R
        res5(i,j)=res5(i,j)+SIQv2p_final(n,v,sigma_n,sigma_v,lambda,pq,beta,gammat,gammaq,theta,u(i),T,y0);
    end
    display(strcat('Simulations:',num2str(round(i/length(u)*100)),'%'))
end
media5=mean(res5');
errore5=sqrt(mean((res5'-media5).^2));


%% Plot a

figure
plot(u,sum(res'==0)/R,'r','LineWidth',2)
hold on
plot(u,sum(res2'==0)/R,'b','LineWidth',2)
plot(u,sum(res3'==0)/R,'c','LineWidth',2)
plot(u,sum(res4'==0)/R,'g','LineWidth',2)
plot(u,sum(res5'==0)/R,'k','LineWidth',2)

%% Plot b
figure
errorbar(u,media,errore*1.96/sqrt(R),'r','LineWidth',2)
hold on
errorbar(u,media2,errore2*1.96/sqrt(R),'b','LineWidth',2)
errorbar(u,media3,errore3*1.96/sqrt(R),'c','LineWidth',2)
errorbar(u,media4,errore4*1.96/sqrt(R),'g','LineWidth',2)
errorbar(u,media5,errore5*1.96/sqrt(R),'k','LineWidth',2)
