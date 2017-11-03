---
title: Add deoptimisation support to MysoreScript
type: mcd
---

The current version of MysoreScript treats the JIT'd code as immutable.
This is convenient for simplicity, but is not representative of real-world JITs.

This project should add some generic infrastructure for using LLVM patchpoints to allow JIT'd code to perform side exits when optimisation decisions are incorrect.
The generic infrastructure should reconstruct an interpreter state and allow the execution to resume in the interpreter from any point where the compiler decides to use a side exit.
This should use a combination of the [stack map](https://llvm.org/docs/StackMaps.html) support in LLVM and the `anyregcc` calling convention, with an interface that allows parts of the compiler to define points at which the function should exit and resume in the interpreter.

Evaluation should consist of (re)doing the polymorphic inline caching and integer optimisation parts of Exercise 2, rewritten to take advantage of the support.
