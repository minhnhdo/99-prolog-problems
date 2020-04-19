:- [p20].
% Extract a given number of randomly selected elements from a list.
% The selected items shall be put into a result list.
% Example:
% ?- rnd_select([a,b,c,d,e,f,g,h],3,L).
% L = [e,d,a]
rnd_select(_, 0, []).
rnd_select(L, N, [X|Xs]) :-
  N > 0,
  N1 is N - 1,
  length(L, Length),
  random_between(1, Length, I),
  remove_at(X, L, I, L1),
  rnd_select(L1, N1, Xs).
