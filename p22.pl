% Create a list containing all integers within a given range.
% Example:
% ?- range(4,9,L).
% L = [4,5,6,7,8,9]
range(I, J, []) :- I > J.
range(I, J, [I|Is]) :- J >= I, I1 is I + 1, range(I1, J, Is).
