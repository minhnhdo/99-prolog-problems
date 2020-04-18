% Find the number of elements of a list.
% Example:
% ?- my_length([a,b,c,d], X).
% X = 4
my_length([], 0).
my_length([_|T], X) :- my_length(T, X1), X is X1 + 1.
