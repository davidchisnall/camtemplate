---
title: Detecting wrong memory access patterns for work groups in OpenCL
type: mcd
---

Project proposed by Anastasia Stulova.

Some ideas are expressed in [this paper](http://parse.ele.tue.nl/system/attachments/3/original/Compile-time_GPU_Memory_Access_Optimizations.pdf?1375867101).

Basically, it's beneficial to access memory in row-major order by the threads from the same work group. If we could implement an LLVM pass to detect inefficient accesses and perhaps also transform or investigate how to transform them it would be quite useful. Also something from related work here could be to detect memory redundant loads in work group. This occurs in applications like Sobel that operate on sliding window of data across threads in the same work group.

Discuss evaluation strategies with Anastasia.
