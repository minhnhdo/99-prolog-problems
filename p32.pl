% Determine the greatest common divisor of two positive integer numbers.
% Example:
% ?- gcd(36, 63, G).
% G = 9
gcd(0, N, N) :- N > 0.
gcd(N, 0, N) :- N > 0.
gcd(N, M, G) :- M > 0, N >= M, N1 is N - M, gcd(M, N1, G), !.
gcd(N, M, G) :- N > 0, M >= N, M1 is M - N, gcd(N, M1, G).
