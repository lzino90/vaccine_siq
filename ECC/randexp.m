function [x] = randexp(lambda,n)
%randexp(lambda,n) genera un numero da una variabile aleatoria esponenziale di parametro
%lambda. Posso generare un vettore di esponenziali con un secondo parametro
%che indica la dimentisone (default=1). Funzione realizzata da Barbieri,
%Quadrio, Zino.
if nargin==2
    lambda=lambda*ones(1,n);
end

if lambda<=0
    error('Non ha senso un parametro negativo');
end
h=length(lambda);
u=rand(1,h);
x=-log(u)./lambda;
end

