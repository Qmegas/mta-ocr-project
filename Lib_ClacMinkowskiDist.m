function [Dist] = Lib_ClacMinkowskiDist(V1,V2,p)
%if (size(V1,1) ~= size(V2,1))
%    [V1] = NormalizeCont(V1,200);
%    [V2] = NormalizeCont(V2,200);
%end
V1 = V1(:);
V2 = V2(:);
Dist = norm(V1 - V2, p);

end
