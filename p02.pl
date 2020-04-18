% Find the last but one element of a list.
% Example:
% ?- last_but_one([a,b,c,d], X).
% X = c
last_but_one([X, _], X).
last_but_one([_|T], X) :- last_but_one(T, X).
