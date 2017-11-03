---
title: Add GPU support to CellAtom
type: mcd
---

The cellular automata language from Exercise 3 is designed to be a simplified version of a shader language.
It is therefore likely to be amenable to GPU offloading.
As with the parallelisation cases, handling updates to globals will require some care, though the barrier operations available within work groups will make it possible to propagate these values between adjacent cells in the same group.

A good evaluation should show how the cost of transferring data to and from the GPU dominates initially and find grid sizes and iteration counts where the GPU solution starts to show a speedup.
