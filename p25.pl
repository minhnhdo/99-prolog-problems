:- [p23].

% Generate a random permutation of the elements of a list.
% Example:
% ?- rnd_permu([a,b,c,d,e,f],L).
% L = [b,a,d,c,e,f]
rnd_permu(L, R) :- length(L, Length), rnd_select(L, Length, R).
