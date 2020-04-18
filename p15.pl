% Duplicate the elements of a list given number of times.
% Example:
% ?- dupli([a,b,c], 3, X).
% X = [a,a,a,b,b,b,c,c,c]
dupli(_, 0, []).
dupli(L, 1, L).
dupli([], N, []) :- N >= 0.
dupli([X | Xs], N, R) :- N >= 2, dupli_helper(X, N, Ys, R), dupli(Xs, N, Ys).
dupli_helper(X, 1, Ys, [X | Ys]).
dupli_helper(X, N, Ys, [X | Zs]) :- N > 1, N1 is N - 1, dupli_helper(X, N1, Ys, Zs).
