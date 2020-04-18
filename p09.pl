% Pack consecutive duplicates of list elements into sublists.
% Example:
% ?- pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e], X).
% X = [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]
pack([], []).
pack([H | T], R) :- pack_helper(T, [H], [], R).
pack_helper([], Dup, Acc, R) :- reverse([Dup | Acc], R).
pack_helper([H | T], [H | TDup], Acc, R) :-
  pack_helper(T, [H, H | TDup], Acc, R), !.
pack_helper([H | T], Dup, Acc, R) :- pack_helper(T, [H], [Dup | Acc], R).
