---
title: OS Support for Garbage Collection
type: 2 3
prerequisites: A good knowledge of C and the ability to work with concurrent data structures using fine-grained locking
---


Microsoft Windows provides an API for receiving notifications related to which pages have been modified.  This is used in the .NET runtime, but similar interfaces are lacking on other systems.  This project will involve modifying the FreeBSD virtual memory subsystem to provide an API that allows garbage collectors to query this data and modifying the Boehm collector to use it.  

The Boehm collector provides a platform-independent mechanism for retrieving a list of dirty pages, along with multiple implementations (the Windows API, using mmap() to mark pages as read-only and catching the faults, and a few others) so these changes will be relatively small.  The OS changes will be more significant.  Some important considerations include:

 * The OS uses the dirty bit to identify pages that are candidates for swapping, so its notion of a dirty page is not the same as the garbage collector’s.  
 * Programs use multiple threads.  As a first approximation, it would be acceptable to only query for dirty bits after calling pthread_suspend_all_np().
 * For correctness in a garbage collector, it is acceptable to provide a superset of the modified pages - scanning a page that is not modified only hurts performance - but missing a write is a serious problem.

The implementation will most likely involve adding a counter to each page that is incremented when the page moves from clean to dirty status and querying a range of pages to identify whether their counters have incremented since a previous call (make sure you handle overflow in the counters sensibly!  This can be just by providing a ‘reset all counters’ API to userspace and).

Evaluation should involve running the modified Boehm collector on some benchmarks and determining whether it provides better performance.  If it doesn’t, then evaluation should describe what the overheads were that offset the speedup.
