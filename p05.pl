% Reverse a list.
% Example:
% ?- my_reverse([a,b,c,d], X).
% X = [d,c,b,a]
my_reverse(L, R) :- my_reverse_helper(L, [], R).
my_reverse_helper([], R, R).
my_reverse_helper([H|T], Acc, R) :- my_reverse_helper(T, [H|Acc], R).
