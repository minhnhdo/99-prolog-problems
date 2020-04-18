% Modified run-length encoding of a list: if an element has no duplicates,
%   simply copy it into the resulting list.
% Example:
% ?- encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e], X).
% X = [[4,a],b,[2,c],[2,a],d,[4,e]]
encode_modified([], []).
encode_modified([H | T], R) :- encode_modified_helper(T, [1, H], [], R).
encode_modified_helper([], [1, Elem], Acc, R) :- reverse([Elem | Acc], R), !.
encode_modified_helper([], Dup, Acc, R) :- reverse([Dup | Acc], R).
encode_modified_helper([H | T], [K, H], Acc, R) :-
  K1 is K + 1, !, encode_modified_helper(T, [K1, H], Acc, R).
encode_modified_helper([H | T], [1, Elem], Acc, R) :-
  encode_modified_helper(T, [1, H], [Elem | Acc], R), !.
encode_modified_helper([H | T], [K, Elem], Acc, R) :-
  K > 1, !, encode_modified_helper(T, [1, H], [[K, Elem] | Acc], R).
