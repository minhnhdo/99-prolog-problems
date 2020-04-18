% Split a list into two parts. The length of the first part is given.
% Example:
% ?- split([a,b,c,d,e,f,g,h,i,k],3,L1,L2).
% L1 = [a,b,c]
% L2 = [d,e,f,g,h,i,k]
split(L, 0, [], L).
split([A|As], N, [A|Bs], Cs) :- N > 0, N1 is N - 1, split(As, N1, Bs, Cs).
