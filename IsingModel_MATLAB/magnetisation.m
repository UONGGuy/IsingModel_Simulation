function M = magnetisation(S)

N = length(S);
M = 1./N.*sum(S);

end