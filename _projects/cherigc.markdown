---
title: CHERI Garbage Collection
type: 2
prerequisites: Knowledge of C, graph theory, virtual memory, MIPS assembly
done: true
outcome: Munraj Vadera continued the project as a research assistant.
---

This project depends on an ongoing research project and will involve working with the research team. It is probably best suited to a masters student.

The CHERI (Capability Enhanced RISC Instructions) architecture is a MIPS-based softcore containing a capability coprocessor. Capabilities, in this setting, are fat pointers that contain a base, a range, and a set of permissions and flags. The architecture provides tagged memory, distinguishing between memory storing capabilities and memory containing only data. All memory accesses must go via a capability and so interior pointers stored in normal memory are just offsets.

This project should implement a garbage collector that takes advantage of the ability to accurately identify memory. There are a lot of potential activities within this project. The simplest would be a single-scan for address space reclamation. In typical use, C code on CHERI will never reuse address space. A 64-bit virtual address space provides a lot of scope for this, but it will eventually be exhausted, especially for sandboxed libraries that are in a smaller address space within a larger system. Being able to identify address ranges that have no capabilities pointing to them is useful for this, allowing safe address space reuse. This project depends on an ongoing research project and will involve working with the research team. It is probably best suited to a masters student.

The CHERI (Capability Enhanced RISC Instructions) architecture is a MIPS-based softcore containing a capability coprocessor. Capabilities, in this setting, are fat pointers that contain a base, a range, and a set of permissions and flags. The architecture provides tagged memory, distinguishing between memory storing capabilities and memory containing only data. All memory accesses must go via a capability and so interior pointers stored in normal memory are just offsets.

This project should implement a garbage collector that takes advantage of the ability to accurately identify memory. There are a lot of potential activities within this project. The simplest would be a single-scan for address space reclamation. In typical use, C code on CHERI will never reuse address space. A 64-bit virtual address space provides a lot of scope for this, but it will eventually be exhausted, especially for sandboxed libraries that are in a smaller address space within a larger system. Being able to identify address ranges that have no capabilities pointing to them is useful for this, allowing safe address space reuse.
