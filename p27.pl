% Group the elements of a set into disjoint subsets.
% Example:
% ?- group([aldo,beat,carla,david,evi,flip,gary,hugo,ida],[2,2,5],Gs).
% Gs = [[aldo,beat],[carla,david],[evi,flip,gary,hugo,ida]]
% ...
group([], [], []).
group([_|_], [], []).
group([], [_|_], []).
group(As, [Count|Counts], [Bs|Bss]) :-
  take_n(As, Count, Bs, Rest), group(Rest, Counts, Bss).
take_n(As, 0, [], As).
take_n([A|As], N, [A|Bs], Cs) :- N > 0, N1 is N - 1, take_n(As, N1, Bs, Cs).
take_n([A|As], N, Bs, [A|Cs]) :- N > 0, take_n(As, N, Bs, Cs).

% Example:
% ?- group3([aldo,beat,carla,david,evi,flip,gary,hugo,ida],G1,G2,G3).
% G1 = [aldo,beat], G2 = [carla,david,evi], G3 = [flip,gary,hugo,ida]
% ...
group3(As, Bs, Cs, Ds) :- group(As, [2,3,4], [Bs, Cs, Ds|_]).
