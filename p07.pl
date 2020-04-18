% Flatten a nested list recursively.
% Example:
% ?- my_flatten([a, [b, [c, d], e]], X).
% X = [a,b,c,d,e]
my_flatten([], []).
my_flatten([H|T], R) :-
  is_list(H), !, my_flatten(H, HR), my_flatten(T, TR), append(HR, TR, R).
my_flatten([H|T], [H|TR]) :- my_flatten(T, TR).
