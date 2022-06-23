# Haskell AoC

This is a collection of solutions to the Advent of Code in Haskell.

Each year subdirectory includes modules for each individual day which
solve those days' first and second problems. They also include a module 
called Run which calls the solutions on the input data for each day.
Main strings all of these together. 

I did not include my input data, so in order to run this on your own, 
you need to create a directory under the AoC directory titled /input/ 
which contains a subdirectory for each year, each of which contains the 
input in the form of text files named input\<n\>.txt for each day n. 
Otherwise, you'll need to change the way the Run.hs files read the input.
