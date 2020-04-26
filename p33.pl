:- [p32].

% Determine whether two positive integer numbers are coprime.
% Example:
% ?- coprime(35, 64).
% Yes
coprime(N, M) :- gcd(N, M, 1).
