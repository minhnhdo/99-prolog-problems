% Remove the k-th eleemnt from a list.
% Example:
% ?- remove_at(X,[a,b,c,d],2,R).
% X = b
% R = [a,c,d]
remove_at(A, [A|As], 1, As).
remove_at(X, [A|As], N, [A|Bs]) :- N > 1, N1 is N - 1, remove_at(X, As, N1, Bs).
