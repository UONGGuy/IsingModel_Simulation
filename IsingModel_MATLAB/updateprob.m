%fn to give probability of spin = +1

function prob = updateprob(k,T)

p = @(x,y) (1+exp(-2.*x./y)).^(-1);
if T==0
    if k>0
        prob = 1;
    elseif k==0
        prob = 0.5;
    elseif k<0
        prob = 0;
    end
else
    prob = feval(p,k,T);
end

end
