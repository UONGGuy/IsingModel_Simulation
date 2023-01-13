function [M_avg,M_var] = IsingModel(N,J,h,T,K)

%parameters
nw = 1e4; %warm-up iterations
nI = 5; %additional updates
tau = 1./N; %rescaled time
k = 0;
M = zeros(1,K);

%program: warm-up update

s0 = initial(N); %init config
S = update2(nw.*N,s0,h,J,T);
tau = retime(0,nw.*N,N);
k = 1;
M(1) = magnetisation(S);

%program: additional iterations

while k<K
    S = update2(nI.*N,S,h,J,T);
    tau = retime(tau,nI.*N,N);
    k = k+1;
    M(k) = magnetisation(S);
end

%program: compute M_avg and M_var

M_avg = m_avg(M);
M_var = m_var(N,M);

end

