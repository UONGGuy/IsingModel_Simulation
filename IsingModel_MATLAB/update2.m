%fn to update config n times

function S = update2(n,s0,h,J,T)

N = length(s0);
S = s0; %initial config in store matrix

for j=1:n
    i = randi([1,N]); %random spin to update
    X = rand; %rand 0-1 value for prob to update
    if i==1 %for end spin value
        k = h + J.*(S(2)+S(N));
        p = updateprob(k,T); %prob spin +1
        if X <= p
            S(i) = 1;
        else
            S(i) = -1;
        end
    elseif i==N %for end spin value
        k = h + J.*(S(1)+S(N-1));
        p = updateprob(k,T); %prob spin +1
        if X <= p
            S(i) = 1;
        else
            S(i) = -1;
        end
    else %spins between first and last
        k = h + J.*(S(i-1)+S(i+1));
        p = updateprob(k,T); %prob spin +1
        if X <= p
            S(i) = 1;
        else
            S(i) = -1;
        end
    end
end

end
    