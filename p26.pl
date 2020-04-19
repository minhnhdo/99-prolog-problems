% Generate the combinations of K distinct objects chosen from the N elements of a list.
% Example:
% ?- combination(3,[a,b,c,d,e,f],L).
% L = [a,b,c] ;
% L = [a,b,d] ;
% L = [a,b,e] ;
% ...
combination(0, _, []).
combination(N, [A|As], [A|Bs]) :- N > 0, N1 is N - 1, combination(N1, As, Bs).
combination(N, [_|As], Bs) :- N > 0, combination(N, As, Bs).
