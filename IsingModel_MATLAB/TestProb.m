function prob = TestProb(N,h,J,T)

n = 1000;
s0 = initial(N); H = zeros(n,N); P = zeros(n,1);


for i = 1:n
    S = update2(n,s0,h,J,T);
    H(i,:) = S(end,:);
end

for j = 1:n
    [C,is,ic] = unique(S(end,:));
    one_counts = accumarray(ic,1);
    P(j) = one_counts(2)./N;
end

prob = mean(P);

end

