% Drop every n-th element of a list.
% Example:
% ?- drop([a,b,c,d,e,f,g,h,i,k], 3, X).
% X = [a,b,d,e,g,h,k]
drop(_, 1, []).
drop(L, N, R) :- N >= 2, drop(L, N, R, 1).
drop([], _, [], _).
drop([_|As], N, Bs, N) :- drop(As, N, Bs, 1).
drop([A|As], N, [A|Bs], K) :- K < N, K1 is K + 1, drop(As, N, Bs, K1).
