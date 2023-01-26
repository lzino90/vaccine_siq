% Fig 3a
clear all
clc
sigma_n_s=linspace(0,1,11);
theta_s=linspace(0.01,0.99,11);

gammat=.5;
gammaq=.9;
lambda =.2;
sigma_v =.5;
pq=0.2;
beta=0.02;
v=0.5;


M=length(theta_s);
L=length(sigma_n_s);



for i=1:M
    for j=1:L
        theta=theta_s(i);
        sigma_n=sigma_n_s(j);
        xi=(1-pq).*(1-sigma_n).*(theta+(1-theta).*(1-v))+(1-gammat).*(1-pq.*(1-gammaq)).*(1-sigma_v).*(theta+(1-theta).*v);
        u(i,j)=max(lambda.*xi-beta+lambda.*sqrt(xi.^2-4*theta.*(1-gammat).*(1-pq).*(1-pq.*(1-gammaq)).*(1-sigma_n).*(1-sigma_v)),0);
    end
end

figure
surf(theta_s,sigma_n_s, u')
view(0,90);




% Fig 3b
clear all
clc
v_s=0:0.05:1;
theta_s=linspace(0.001,0.999,30);

gammat=.5;
gammaq=.9;
lambda =.2;
sigma_v =.5;
sigma_n=0.2;
pq=0.2;
beta=0.02;
v=0.5;


M=length(theta_s);
L=length(v_s);



for i=1:M
    for j=1:L
        theta=theta_s(i);
        v=v_s(j);
        xi=(1-pq).*(1-sigma_n).*(theta+(1-theta).*(1-v))+(1-gammat).*(1-pq.*(1-gammaq)).*(1-sigma_v).*(theta+(1-theta).*v);
        u(i,j)=max(lambda.*xi-beta+lambda.*sqrt(xi.^2-4*theta.*(1-gammat).*(1-pq).*(1-pq.*(1-gammaq)).*(1-sigma_n).*(1-sigma_v)),0);
    end
end

figure
surf(theta_s,v_s, u')
view(0,90);
