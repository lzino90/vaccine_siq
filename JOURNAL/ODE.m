
function dydt = ODE(t,y,sigma_n,sigma_v,lambda,pq,beta,v,gammat,gammaq,theta,u)
dydt = zeros(4,1);
dydt(1) =-2*lambda*(1-gammat)*(theta/v+1-theta)*(1-sigma_v)*y(1).*y(2)-2*lambda*(1-gammat)*(1-theta)*(1-sigma_n)*y(1).*y(4)+beta*(v-y(1));
dydt(2)=2*lambda*(1-gammat)*(1-pq*(1-gammaq))*(theta/v+1-theta)*(1-sigma_v)*y(1).*y(2)+2*lambda*(1-gammat)*(1-pq*(1-gammaq))*(1-theta)*(1-sigma_n)*y(1).*y(4)-y(2)*(beta+u);
dydt(3) =-2*lambda*(theta/(1-v)+1-theta)*(1-sigma_n)*y(3).*y(4)-2*lambda*(1-theta)*(1-sigma_v)*y(3).*y(2)+beta*(1-v-y(3));
dydt(4) =2*lambda*(1-pq)*(theta/(1-v)+1-theta)*(1-sigma_n)*y(3).*y(4)+2*lambda*(1-pq)*(1-theta)*(1-sigma_v)*y(3).*y(2)-(beta+u)*y(4);
end
