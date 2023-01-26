function y= SIQv2p_final(n,v,sigma_n,sigma_v,lambda,pq,beta,gammat,gammaq,theta,u,T,y0)
nv=round(n*v);
nn=n-nv;
yvs=round(y0(1)*n);
yvi=round(y0(2)*n);
yns=round(y0(3)*n);
yni=round(y0(4)*n);
sigma=[sigma_v*ones(1,nv) sigma_n*ones(1,nn)];
pc=[lambda*(1-gammat)*ones(1,nv) lambda*ones(1,nn)];
ps=[pq*(1-gammaq)*ones(1,nv) pq*ones(1,nn)];
x=zeros(1,n);
x(1:yvi)=1;
x(nv:(nv+yni))=1;
x((yvs+yvi+1):nv)=2;
x((nv+yns+yni+1):n)=2;
t=1;
time=0;
energy=n*(1+u+beta);
dp=1/(1+u+beta);
while time(t)<T
    t=t+1;
    time(t)=time(t-1)+randexp(energy);
    if rand<dp %contact  %SE=0, SP=1, IE=2, IP=3
        i=randi(n);
        j=contact(i,n,nv,nn,theta);
        state_i=x(i);
        state_j=x(j);
        if state_i==0 && state_j==1 && rand<(1-sigma(j))*pc(i)
                       if rand<ps(i)
                            x(i)=2;
                       else
                            x(i)=1;
                       end
        end
         if state_i==1 && state_j==0 && rand<(1-sigma(i))*pc(j)
                       if rand<ps(j)
                            x(j)=2;
                       else
                            x(j)=1;
                       end
         end
    else
        if rand<beta/(beta+u)%recover
            i=randi(n);
            if x(i)==1
                x(i)=0;
            elseif x(i)==2
                x(i)=0;
            end
        else %test
            i=randi(n);
            if x(i)==1
                x(i)=2;
            end
        end
    end
end
y=sum(x>0)/n;
end

