---
title: Hardware page-table walker for BERI
type: 3
---

[BERI](http://bericpu.org) implements the MIPS R4K system-level interface, which mandates a software-managed TLB.  When the CPU can not find an entry in the TLB, it raises an interrupt and the OS is responsible for installing the relevant TLB entry.

The advantage of this approach is that it makes it much easier to experiment with different page table designs - very important when the R4K was released in the early 1990s and virtual memory was still a very active research topic.  Unfortunately, it also provides several disadvantages:

 * TLB fills must happen synchronously with respect to the main pipeline - the TLB can’t be speculatively filled waiting for a future load.
 * The TLB-handling interrupt routine consumes instruction cache space.
 * Entering the TLB-fill routine causes a pipeline flush.

A successful implementation will provide a hardware walker that can inspect the FreeBSD page table format and automatically fill the TLB if there is a page ready.  As an extension, you could make the TLB-fill logic programmable so that it can support multiple page table formats, or hard-code some others (for example, an inverted page table).

Evaluation should show whether a hardware implementation is faster for a simple in-order pipeline (BERI) by running a variety of workloads with and without the hardware support.

Note: This project requires familiarity with Bluespec SystemVerilog and so is probably best suited to a Part III / ACS student taking the Advanced Computer Design course.

