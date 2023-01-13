function E = TestE(S,J,h)

E = -J.*(sum(movprod(S,2))-S(1)+S(1).*S(end))-h.*sum(S);

end
