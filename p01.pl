% Find the last element of a list.
% Example:
% ?- my_last([a,b,c,d], X).
% X = d
my_last([X], X).
my_last([_|T], X) :- my_last(T, X).
