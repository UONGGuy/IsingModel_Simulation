%Test partition fn
a00 = [-1 -1];
a01 = [-1 1];
a10 = [1 -1];
a11 = [1 1];

Z = exp(-TestE(a00,1,1))+exp(-TestE(a01,1,1))+exp(-TestE(a10,1,1))+exp(-TestE(a11,1,1));

P = 1./Z.*exp(-TestE(a11,1,1));

n=1000;
R = zeros(n,2);
for i=1:n
    S = update(n,2,1,1,1);
    R(i,1) = S(end,2);
    R(i,2) = S(end,3);
end