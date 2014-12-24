---
title: Code Editing in Local Style
type: 2
prerequisites: Knowledge of C, understanding of coding conventions, familiarity with revision control
done: true
outcome: Peter Conn presented the work at EuroLLVM 2013
---

Most large projects have their own set of style guidelines, controlling things like indentation (tabs, spaces, tabs for indent and spaces for alignment) and braces style, where variables are declared (e.g. at point of first use versus the start of the function) and certain naming conventions (e.g. camel case, underscore separated, initial capitals for globals). When working with multiple projects, switching between the styles can be difficult. Ideally, a user would be able to check out the code, translate it into their own preferred style, edit it, and then commit it upstream in the project's style.

This project aims to use libclang to accomplish this. The first step is an automatic indent tool. This should be a more semantically-aware version of the standard UNIX tool, built using libclang. Initially, it should require an explicit style definition, but as an extension it should be able to infer a style from an example (and point to contradictions).

The other part of the puzzle involves a semantically-aware diff, so that only new parts of the code are pushed upstream. Editing code in this mode should not change any existing code, so before committing the tool must revert to the old style, including all style violations in parts of the code that were not modified.

The criteria for success would be editing, for example, LLVM and FreeBSD source code files in the same local style.

[Poster presented at EuroLLVM](http://www.llvm.org/devmtg/2013-04/conn-poster.pdf)
