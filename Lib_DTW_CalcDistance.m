function [Diff,p,q,D,WarpingPath] = Lib_DTW_CalcDistance(BH1,BH2)
% [p,q] = dp(M) 
%    Use dynamic programming to find a min-cost path through matrix M.
%    Return state sequence in p,q
% 2003-03-15 dpwe@ee.columbia.edu

% Copyright (c) 2003 Dan Ellis <dpwe@ee.columbia.edu>
% released under GPL - see file COPYRIGHT
%Alighn X2 , Y2 to X1,Y1 


[L1,t] = size(BH1);
[L2,t] = size(BH2);

% costs
D = zeros(L1, L2);

WarpingPath = 0;
%    return DTW[n, m]
D(1,:) = NaN;
D(:,1) = NaN;
D(1,1) = 0;

phi = zeros(L1,L2);
k=0;

% PMink = 1 ; % for Manhaten Distance
PMink = 2; % For Eucledean Distnace
for i = 2:L1
  for j = 2:L2
      Cost = Lib_ClacMinkowskiDist(BH2(j,:),BH1(i,:),PMink);
            
      
      [dmax, tb] = min([D(i, j-1), D(i-1, j), D(i-1, j-1)]);
      D(i,j) = dmax+Cost;
      phi(i,j) = tb;
      k=k+1;
  end
end

% Traceback from top left
i = L1; 
j = L2;
p = i;
q = j;
 while i > 1 && j > 1
   tb = phi(i,j);
   WarpingPath = [tb,WarpingPath];
   if (tb == 3)
     i = i-1;
     j = j-1;
   elseif (tb == 2)
    i = i-1;
   elseif (tb == 1)
     j = j-1;
   else    
      Diff=inf;
   end
   p = [i,p];
   q = [j,q];
 end

% Strip off the edges of the D matrix before returning
%D = D(2:(r+1),2:(c+1));
Diff = D(L1,L2)/size(p,2) ; %abs(r+c);
