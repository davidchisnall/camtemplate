---
title: Hardware-assisted generation garbage collection with CHERI
type: 3
prerequisites: Knowledge of C, graph theory, virtual memory, MIPS assembly
---

Sun Labs had a project (Project Maxwell) that identified that the objects in the young generation for a generational garbage collector and the objects in the cache are similar.
This project added a full object memory to SPARC and allowed the young-generational collector to run entirely in the cache.

[CHERI](http://chericpu.org) adds a capability-oriented view of virtual memory to the MIPS ISA.
With CHERI, it is possible for the hardware to distinguish between pointers (capabilities to memory) and other data.
A previous project wrote a purely software garbage collector that worked for C.

It should be possible to combine these two approaches into a single system that would provide generation garbage collection.
The basic idea would be a young generation implemented as a semi-space collector in SRAM in a range of the virtual address space.
When a capability to this is stored in the cache, it would be marked as a root.
When a cache line containing a capability to such a location is flushed to main memory, it would trap to software, which would promote the object to an older generation.

The young generation could be collected entirely asynchronously, with read barriers implemented by trapping loads from the scratchpad, though an initial cut may prefer to make them synchronous.
