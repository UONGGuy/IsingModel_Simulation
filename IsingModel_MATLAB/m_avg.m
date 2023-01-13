function M_avg = m_avg(M)

K = length(M);
M_avg = 1./K.*sum(M);

end