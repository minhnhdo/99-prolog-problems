% Decode a run-length encoded list.
% Example:
% ?- decode([[4,a],b,[2,c],[2,a],d,[4,e]], X).
% X = [a,a,a,a,b,c,c,a,a,d,e,e,e,e]
decode([], []).
decode([H | T], R) :- decode_helper(T, H, [], R).
decode_helper([], Pair, Acc, R) :- decode_process(Pair, Acc, AccR), reverse(AccR, R).
decode_helper([H | T], Pair, Acc, R) :-
  decode_process(Pair, Acc, AccR), decode_helper(T, H, AccR, R).
decode_process([1, Elem], Acc, [Elem | Acc]) :- !.
decode_process([K, Elem], Acc, R) :-
  K > 1, !, K1 is K - 1, decode_process([K1, Elem], [Elem | Acc], R).
decode_process(Elem, Acc, [Elem | Acc]) :- atomic(Elem), !.
