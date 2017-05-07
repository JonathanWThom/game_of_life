# Conway's Game of Life

Inspired by the PDX Ruby Brigade

Here are the [rules of game.](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life)


## Set Up
There is a very simple command line interface. Just clone it, then navigate to the directory and run ```ruby lib/game.rb``` to try it.

When it cues you for the "index" of living cells, it would work like this for a 3 x 3 grid:

[0, 1, 2]  
[3, 4, 5]  
[6, 7, 8]

So if you entered 1, 4, 8, your living cells (L), would be:

[D, L, D]  
[D, L, D]  
[D, D, L]
