% Insert an element at a given position in a list.
% Example:
% ?- insert_at(alfa,[a,b,c,d],2,L).
% L = [a,alfa,b,c,d]
insert_at(X, L, 1, [X|L]).
insert_at(X, [A|As], N, [A|Bs]) :- N > 1, N1 is N - 1, insert_at(X, As, N1, Bs).
