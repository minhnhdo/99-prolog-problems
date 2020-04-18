% Eliminate consecutive duplicates of list elements.
% Example:
% ?- compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e], X).
% X = [a,b,c,a,d,e]
compress([], []).
compress([X], [X]).
compress([H, H | T], R) :- compress([H | T], R), !.
compress([H | T], [H | TR]) :- compress(T, TR).
