
function dydt = ODE(t,y,sigma,lambda,pq,beta,v,gammat,gammaq,eta,c)
dydt = zeros(2,1);
qt=(gammat-1)/gammat;
qq=(gammaq-1)/gammaq;
dydt(1) =-2*(1-eta)*lambda*(1-qt*v)*(1-sigma)*y(1).*y(2)+beta*(1-y(1));
dydt(2) =2*(1-eta)*lambda*(1-qt*v)*(1-sigma)*y(1).*y(2)*(1-pq*(1-qq*v))-(beta+c)*y(2);
