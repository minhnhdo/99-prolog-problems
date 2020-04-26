% Determine whether a given integer number is prime.
% Example:
% ?- is_prime(7).
% Yes
is_prime(2) :- !.
is_prime(N) :- N > 2, 1 is N mod 2, is_prime_helper(N, 3).
is_prime_helper(N, K) :- K2 is K * K, K2 > N, !.
is_prime_helper(N, K) :-
  R is N mod K, R \= 0, K1 is K + 2, is_prime_helper(N, K1).
