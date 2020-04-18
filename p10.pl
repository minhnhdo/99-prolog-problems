% Run-length encoding of a list.
% Example:
% ?- encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e], X).
% X = [[4,a],[1,b],[2,c],[2,a],[1,d],[4,e]]
encode([], []).
encode([H | T], R) :- encode_helper(T, [1, H], [], R).
encode_helper([], Dup, Acc, R) :- reverse([Dup | Acc], R).
encode_helper([H | T], [K, H], Acc, R) :-
  K1 is K + 1, encode_helper(T, [K1, H], Acc, R), !.
encode_helper([H | T], Dup, Acc, R) :- encode_helper(T, [1, H], [Dup | Acc], R).
