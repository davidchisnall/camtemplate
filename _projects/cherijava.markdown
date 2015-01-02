---
title: CHERI sandboxing for JNI
type: 3
done: true
outcome: David Brazdil completed the project and then went to work on ART at Google
---

Java has a rich security model for code hosted in the JVM, but any native code using the JNI can trivially bypass it.

The [CHERI](http://chericpu.org) CPU provides support for fine-grained sandboxing of native code.  This can be combined with the JNI in a number of ways:

 * Provide a source-compatible JNI implementation that will run library code in a sandbox
 * Use the capability mechanism to revoke access to Java objects once they are freed
 * Allow fine-grained delegation of buffers to C code from Java without copying or violating Java memory safety

The project should explore these and contrast the performance with existing isolation techniques.
