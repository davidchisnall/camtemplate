---
title: Implement generic abbreviations for FuncDecl in PCH
type: mcd
---

Project proposed by Anastasia Stulova.

The current problem is that the OpenCL header (included in all OpenCL compilation units) is about 20K lines of code and when compiled to precompiled header occupies 2MB of space. This header is mainly composed of functions declarations.

PCH achieves size reduction via [abbreviations](http://llvm.org/docs/BitCodeFormat.html#abbreviations) but the PCH writer doesn't abbreviate `FuncDecl`s, mainly because they can have dynamic descriptors i.e. attributes.
It might be possible to create generic (or worst case) abbreviation that would fit all `FuncDecl` and would be more efficient when general way of storing data.

Evaluation of this project should show space savings for the OpenCL header and should determine whether this is a net win for precompiled headers for C/C++ as well.
