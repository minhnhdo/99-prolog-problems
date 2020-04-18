% Find the k-th element of a list. The first element of a list is numbered 1.
% Example:
% ?- element_at(2, [a,b,c,d], X).
% X = b
element_at(1, [X|_], X).
element_at(K, [_|T], X) :- K > 1, K1 is K - 1, element_at(K1, T, X).
