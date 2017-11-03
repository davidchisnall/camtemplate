---
title: Method caching for the GNUstep Objective-C Runtime
type: mcd
---

The [GNUstep Objective-C Runtime](https://github.com/gnustep/libobjc2) uses a dispatch table design very similar to the original NeXT runtime, with a 3-deep tree of pointers.
This is very cheap to search in microbenchmarks, but has large RAM and cache usage.

The codebase contains a somewhat bit-rotted low memory profile that provides a dense representation that is more expensive to search.
Either resurrect this or define a new structure, and add some caching to either classes or selectors so that the slow path is rarely required.

Evaluation should show both memory and CPU usage for some real-world code and microbenchmarks.

The runtime also provides some mechanism for safe caching.
There used to be an LLVM pass that automatically inserted caches for message sends in loops and for message sends to class objects (which are unlikely to change).
An alternative, but closely related, project would rewrite these passes and benchmark them.
