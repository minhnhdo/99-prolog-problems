% Duplicate the elements of a list.
% Example:
% ?- dupli([a,b,c], X).
% X = [a,a,b,b,c,c]
dupli([], []).
dupli([H | T], [H, H | TR]) :- dupli(T, TR).
