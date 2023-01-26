function j = contact(i,n,nv,nn,theta)
%Determines with whom i has an interaction
if i<=nv
    if rand<theta
        j=randi(nv);
    else
        j=randi(n);
    end
else
    if rand<theta
        j=nv+randi(nn);
    else
        j=randi(n);
    end
end
end

