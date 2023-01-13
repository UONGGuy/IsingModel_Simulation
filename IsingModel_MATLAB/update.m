%fn to update config n times

function S = update(n,s0,h,J,T)
%s0 is input matrix
N = length(s0);
S = zeros(n+1,N); %first column count iteration, rest of row store config
S(1,:) = s0; %initial config in store matrix

for j=1:n
    S(j+1,:) = S(j,:);
    i = randi([1,N]); %random spin to update
    X = rand; %rand 0-1 value for prob to update
    if i==1 %for end spin value
        k = h + J.*(S(j+1,2)+S(j+1,N));
        p = updateprob(k,T); %prob spin +1
        if X <= p
            S(j+1,i) = 1;
        else
            S(j+1,i) = -1;
        end
    elseif i==N %for end spin value
        k = h + J.*(S(j+1,1)+S(j+1,N-1));
        p = updateprob(k,T); %prob spin +1
        if X <= p
            S(j+1,i) = 1;
        else
            S(j+1,i) = -1;
        end
    else %spins between first and last
        k = h + J.*(S(j+1,i-1)+S(j+1,i+1));
        p = updateprob(k,T); %prob spin +1
        if X <= p
            S(j+1,i) = 1;
        else
            S(j+1,i) = -1;
        end
    end
end

end
    