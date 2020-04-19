:- [p17].

% Rotate a list N places to the left.
% Examples:
% ?- rotate([a,b,c,d,e,f,g,h],3,X).
% X = [d,e,f,g,h,a,b,c]
% ?- rotate([a,b,c,d,e,f,g,h],-2,X).
% X = [g,h,a,b,c,d,e,f]
rotate(L, N, R) :-
  N < 0, length(L, Length), N1 is N mod Length, rotate(L, N1, R).
rotate(L, N, R) :-
  length(L, Length), N > Length, N1 is N mod Length, rotate(L, N1, R).
rotate(L, N, R) :-
  length(L, Length), Length > N, N >= 0, split(L, N, L1, L2), append(L2, L1, R).
