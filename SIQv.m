function SIQv(n,sigma,lambda,pq,beta,v,gammat,gammaq,eta,c,T,y0)
ys=round(y0(1)*n);
yi=round(y0(2)*n);
x=zeros(1,n);
x(1:yi)=1;
x((yi+ys):n)=2;
t=1;
time=0;
energy=n*(1+c+beta);
dp=1/(1+c+beta);

while time(t)<T
    t=t+1;
    ys(t)=ys(t-1);
    yi(t)=yi(t-1);
    time(t)=time(t-1)+randexp(energy);
    if rand<dp %contact  %SE=0, SP=1, IE=2, IP=3
        i=randi(n);
        j=randi(n);
        state_i=x(i);
        state_j=x(j);
        if state_i==0 && state_j==1 && rand<(1-sigma)*lambda*(1-eta)*(1-v*(gammat-1)/gammat)
                       if rand<pq*(1-v*(gammaq-1)/gammaq)
                            x(i)=2;
                            ys(t)=ys(t)-1;
                       else
                            x(i)=1;
                            ys(t)=ys(t)-1;
                            yi(t)=yi(t)+1;
                       end
        end
         if state_i==1 && state_j==0 && rand<(1-sigma)*lambda*(1-eta)*(1-v*(gammat-1)/gammat)
                       if rand<pq*(1-v*(gammaq-1)/gammaq)
                            x(j)=2;
                            ys(t)=ys(t)-1;
                       else
                            x(j)=1;
                            ys(t)=ys(t)-1;
                            yi(t)=yi(t)+1;
                       end
         end
    else
        if rand<beta/(beta+c)%recover
            i=randi(n);
            if x(i)==1
                x(i)=0;
                ys(t)=ys(t)+1;
                yi(t)=yi(t)-1;
            elseif x(i)==2
                x(i)=0;
                ys(t)=ys(t)+1;
            end
        else
            i=randi(n);
            if x(i)==1
                x(i)=2;
                yi(t)=yi(t)-1;
            end
        end
    end
end
            
 
 [ys,t]=reducev2(ys/n,time,400);
  [yi,t]=reducev2(yi/n,time,400);
  figure
  plot(t,ys,'g')
  hold on
  plot(t,yi,'r')
    plot(t,1-yi-ys,'b')
end

