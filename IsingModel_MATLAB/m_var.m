function M_var = m_var(N,M)

X=0; K = length(M); M_avg = m_avg(M);
for k=1:K
    X = X + (M(k)-M_avg).^2;
end

M_var = N./K.*X;

end
