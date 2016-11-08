---
title: Improve LLVM's optimisation of atomics
type: mcd
---

A student in 2014 improved LLVM's generation of atomics for ARM by eliding redundant barriers ([Slides](http://llvm.org/devmtg/2014-04/PDFs/Talks/Reinoud-EuroLLVM.pdf), [Writeup](http://llvm.org/devmtg/2014-04/PDFs/Talks/Reinoud-report.pdf)).
There is still a lot of scope for improvement within the allowed memory model and recent WG14 publications have enumerated some of the allowable transforms.

This project is likely to be very difficult, but has the potential for some very nice results.
