% Sorting a list of lists according to length of sublists
% Example:
% ?- lsort([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]],L).
% L = [[o], [d, e], [d, e], [m, n], [a, b, c], [f, g, h], [i, j, k, l]]
lsort(As, Bs) :-
  map_list_to_pairs(length, As, Pairs),
  sort(1, @=<, Pairs, SortedPairs),
  pairs_values(SortedPairs, Bs).

% Example:
% ?- lfsort([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]],L).
% L = [[i, j, k, l], [o], [a, b, c], [f, g, h], [d, e], [d, e], [m, n]]
lfsort(As, Bs) :-
  map_list_to_pairs(length, As, Pairs),
  pairs_keys(Pairs, Lengths),
  frequencies(Lengths, Frequencies),
  sort(2, @=<, Frequencies, Sorted),
  pairs_keys(Sorted, SortedLengthsByFreq),
  lfsort_helper(SortedLengthsByFreq, Pairs, Lists),
  flatten_once(Lists, Bs).
lfsort_helper(_, [], []).
lfsort_helper([Length|Lengths], [Pair|Pairs], [ListsSameLength|Lists]) :-
  lfsort_extract_lists(Length, [Pair|Pairs], ListsSameLength, Rest),
  lfsort_helper(Lengths, Rest, Lists).
lfsort_extract_lists(_, [], [], []) :- !.
lfsort_extract_lists(Length, [Length-List|Pairs], [List|Lists], Rest) :-
  !, lfsort_extract_lists(Length, Pairs, Lists, Rest).
lfsort_extract_lists(Length, [Length1-List|Pairs], Lists, [Length1-List|Rest]) :-
  Length \= Length1, lfsort_extract_lists(Length, Pairs, Lists, Rest).
flatten_once([], []).
flatten_once([Lists|Listss], Bs) :-
  flatten_once(Listss, Cs), append(Lists, Cs, Bs).

frequencies(As, Pairs) :- frequencies_helper(As, [], Pairs).
frequencies_helper([], Acc, Acc).
frequencies_helper([A|As], Acc, Bs) :-
  frequencies_helper_update(A, Acc, NewAcc), frequencies_helper(As, NewAcc, Bs).
frequencies_helper_update(A, [], [A-1]) :- !.
frequencies_helper_update(A, [A-N|Acc], [A-N1|Acc]) :- N1 is N + 1, !.
frequencies_helper_update(A, [B-N|Acc], [B-N|NewAcc]) :-
  A \= B, frequencies_helper_update(A, Acc, NewAcc).
