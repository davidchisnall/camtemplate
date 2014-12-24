---
title: Compiler teaching resources
prev_section: index
layout: default
---

I maintain a selection of [resources for teaching about
compilers](https://github.com/CompilerTeaching) on GitHub.  This includes
several projects:

###[SimplePass](https://github.com/CompilerTeaching/SimplePass)

A trivial example LLVM transform pass.  This is intended to demonstrate most of
the key features of an LLVM pass and be easy for students to extend and use as
a skeleton for more complex techniques.

###[Pegmatite](https://github.com/CompilerTeaching/Pegmatite)

A C++11 parsing expression grammar library with automatic AST construction,
intended for easy prototyping of programming languages.  Grammars are written
as C++ classes, with delegates describing the actions.  This allows the same
debugging techniques to be used for the grammar as the rest of the program
(there are also some tracing facilities to see which rules are being matched
for which input).  

###[CellularAutomata](https://github.com/CompilerTeaching/CellularAutomata)

A simple DSL for implementing cellular automata, with an execution model that resembles (a simplified version of) a shader language.  This is intended as a sandbox for implementing vectorisation and parallelism techniques.

###[MysoreScript](https://github.com/CompilerTeaching/MysoreScript)

A simple late-bound dynamic language with REPL implementation, a JIT compiler
and an interpreter.  This is intended as a sandbox for implementing various
compilation techniques found in implementations of JavaScript and similar languages.
