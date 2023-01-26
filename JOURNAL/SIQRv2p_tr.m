function s=SIQRv2p_tr(n,nv,nn,sigma_n,sigma_v,lambda,pq,beta,gammat,gammaq,theta,nu,u,T)

x=zeros(1,n);
x(randperm(nv,5))=1;
x(nv+randperm(nn,5))=1;
sigma=[sigma_v*ones(1,nv) sigma_n*ones(1,nn)];
pc=[lambda*(1-gammat)*ones(1,nv) lambda*ones(1,nn)];
ps=[pq*(1-gammaq)*ones(1,nv) pq*ones(1,nn)];
tr=0.05*n;
t=1;
time=0;
energy=n*(1+u+beta+nu);
dp=1/(1+u+beta+nu);
in=10;
flag=0;
while time(t)<T && flag==0
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
                            in=in+1;
                       end
        end
         if state_i==1 && state_j==0 && rand<(1-sigma(i))*pc(j)
                       if rand<ps(j)
                            x(j)=2;
                       else
                            x(j)=1;
                            in=in+1;
                       end
         end
    else
        if rand<beta/(beta+u+nu)%recover
            i=randi(n);                
            if x(i)==1
                in=in-1;
                elseif x(i)==2
                x(i)=3;
            end
        else %test
            if rand<u/(u+nu)
            i=randi(n);
            if x(i)==1
               x(i)=2;
               in=in-1;
            end
            else
                 i=randi(n); 
            if x(i)==3
                x(i)=0;
            end
            end
        end
    end
    if in>=tr || in==0
        flag=1;
    end
end
        s=min(in,1);
   end

