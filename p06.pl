% Find out whether a list is a palindrome.
% Example:
% ?- palindrome([r,a,c,e,c,a,r]).
% true
palindrome(L) :- reverse(L, L).
