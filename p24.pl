:- [p22, p23].

% Lotto: Draw N different random numbers from the set 1..M.
% The selected numbers shall be put into a result list.
% Example:
% ?- rnd_select_range(6,49,L).
% L = [23,1,17,33,21,37]
rnd_select_range(N, M, R) :- range(1, M, Range), rnd_select(Range, N, R).
