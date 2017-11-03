---
title: Inverted dispatch tables for the GNUstep Objective-C Runtime
type: mcd
---

The [GNUstep Objective-C Runtime](https://github.com/gnustep/libobjc2) uses a dispatch table design very similar to the original NeXT runtime, with a 3-deep tree of pointers.
This is very cheap to search in microbenchmarks, but has large RAM and cache usage.

One alternative discussed in the course is an inverted dispatch table, where each selector has a (hopefully much smaller) table of the classes that implement the method.
Try implementing this in the GNUstep Objective-C runtime and measure the memory savings and the performance overheads.

A good evaluation should also include an analysis of some real-world Objective-C code using the Objective-C reflection APIs to show for the distribution of classes per selector and methods per class.
