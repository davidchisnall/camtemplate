---
title: Accurate garbage collection for MysoreScript
type: mcd
---

Currently, MysoreScript uses the Boehm garbage collector.
This is not the best choice, because it is a conservative collector that does not know anything about the structure of MysoreScript.

MysoreScript is inherently single threaded and so some of the complexity in writing a garbage collector is omitted.
This project should add a new garbage collector, using the existing C++ templates for holding values to identify pointers held by the interpreter, and the [LLVM statepoint](https://llvm.org/docs/Statepoints.html) intrinsics to track references in JIT'd code.

Ideally, this would be a copying collector and would allow object allocation to be inlined into the JIT'd code as a simple bump-the-pointer operation, with a call out to the GC only in low-memory conditions, though some care must be taken to ensure that interpreted code correctly handles GC updates.

Evaluation should show better performance for microbenchmarks that allocate large numbers of objects with relatively short lifespans.
