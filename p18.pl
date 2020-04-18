% Extract a slice from a list. Given two indices, I and K, the slice is
%   the list containing the elements between the I-th and K-th element of
%   the original list (both inclusive). Start counting the element at 1.
% Example:
% ?- slice([a,b,c,d,e,f,g,h,i,k],3,7,L).
% L = [c,d,e,f,g]
slice(_, I, K, []) :- I > K, K >= 0.
slice([A|As], 1, K, [A|Bs]) :- K >= 1, K1 is K - 1, slice(As, 1, K1, Bs).
slice([_|As], I, K, Bs) :-
  K >= I, I > 1, I1 is I - 1, K1 is K - 1, slice(As, I1, K1, Bs).
