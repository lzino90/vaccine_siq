function tr=SIQRv2p_tr_finder(n,nv,nn,sigma_n,sigma_v,lambda,pq,beta,gammat,gammaq,theta,nu,T,umax)
if nargin==16
    umax=1;
end
R=10;
flag=0;
tr=0;
step=umax/10;
u=0:step:umax;
M=length(u);
i=M;
while flag==0 && i>=1    
res=0;
for l=1:R
    res=res+SIQRv2p_tr(n,nv,nn,sigma_n,sigma_v,lambda,pq,beta,gammat,gammaq,theta,nu,u(i),T);
end
if res>=R/2
    flag=1;
    tr=u(i);
end
i=i-1;
end

if tr>0
    flag=0;
    u=linspace(tr-step,tr+step,12);
M=length(u);
i=M;
while flag==0 && i>=1    
res=0;
for l=1:R
    res=res+SIQRv2p_tr(n,nv,nn,sigma_n,sigma_v,lambda,pq,beta,gammat,gammaq,theta,nu,u(i),T);
end

if res>=R/2
    flag=1;
    tr=u(i);
end
i=i-1;
end
else
    flag=0;
    u=linspace(0,step,7);
M=length(u);
i=M;
while flag==0 && i>=1    
res=0;
for l=1:R
    res=res+SIQRv2p_tr(n,nv,nn,sigma_n,sigma_v,lambda,pq,beta,gammat,gammaq,theta,nu,u(i),T);
end

if res>=R/2
    flag=1;
    tr=u(i);
end
i=i-1;
end
end
end