%create initial conditions as stated

function S = initial(N)

S = zeros(1,N);
for i=1:N
    S(i)=1;
end

end