---
title: Efficient Arithmetic on Small Integers
layout: default
pre_section: publications
---

A common way of representing small integers in pure object-oriented languages is by storing them inside a pointer.  Pointers to objects, in most implementations, will be word-aligned.  Even on a 16-bit system, a word is two bytes, and so pointers will always have their low bit, or low bits, set to zero.  Small integers can be stored in the remaining bits.  On a typical modern system, this provides 31-bit or 63-bit integers.  If we use the top bit to represent the sign, this gives a minimum range of around two billion, centered on zero; more than enough for a large number of programs to be able to avoid the need for boxed integers.

Unlike low-level languages, such as C, where integer overflow can cause undefined results or wrap around, object oriented languages tend to treat integers as arbitrary-precision numbers.  Any integer operation with a result which does not fit in a small integer is expected to be silently turned into a real object.

This short essay describes efficient addition and multiplication routines for use with small integers implemented in this way.  These algorithms are used in LanguageKit.  After implementing these algorithms, I discovered that some (though not all) commercial Smalltalk implementations used the same trick, but no one had documented them. 

Addition
--------

The canonical mechanism for adding two small integers together is, in C-like pseudocode:

{% highlight c %}
a >>= 1;
b >>= 1;
c = a + b;
/* Check for overflow here */
return (c << 1) | 1;
{% endhighlight %}

Checking for overflow is typically done by seeing if the sign bit on a flipped.  Note that this only checks for 32-bit overflow.  We also need to check whether the result will fit into a 31-bit small integer, because the lowest bit is reserved for the flag indicating that this is not an object pointer.  A lot of comparisons are needed to determine this.

The other problem with this approach is that it performs three shifts.  Although shifts are very cheap to implement in hardware, they introduce dependencies requiring the values to traverse the pipeline before being used.

It turns out, it is possible to add two small integers without needing any shifts, using this approach:

{% highlight c %}
b = b & ~1;
return a + b;
{% endhighlight %}

The first line clears the low bit on b, and the second line adds the two together.  The two low bits will therefore be 0 and 1, respectively.  Adding these together gives 1, setting the low bit on the result.  This translates into, at worst, two loads, a bitwise and, an add, and a store operation; five CPU instructions for the entire operation.  

The main advantage in this version, however, is that we are now performing 32-bit adds.  This means that the result will *always* overflow when the result will not fit into a small integer, and will *only* overflow when the result will not fit into a small integer.  Testing for overflow is now a simple matter; just check the carry or overflow flag in the CPU.  

Note that subtraction can be implemented in exactly the same way, by negating the second operand.  This does not add any overhead; the bitwise and operation can be replaced with a bitwise exclusive-or and will simply toggle the top and bottom bits (the sign bit and the small integer flag).  Because the second operand is still a constant, it will exactly the same number of instructions.

Multiplication
--------------

Multiplication is similar, but slightly more complicated.  When multiplying two small integers, we are effectively dividing both by two, then multiplying them together, then multiplying them by two and adding one.  

The first obvious thing to notice is that we can get rid of the multiply at the end if we also remove one of the divides, because multiplication is commutative:

	(a / 2) * (b / 2) * 2 + 1 = a * (b / 2) + 1

It is not quite this simple, of course, since the division by two is an integer division which rounds downward, and small integers always have the low bit set.  We can still eliminate the multiply (the left-shift) as long as we replace the divide (the right-shift) with a bitwise and operation clearing the low bit.  This leaves something a lot like this:

{% highlight c %}
a = a & ~1;
b >>= 1;
return a * b + 1;
{% endhighlight %}

The low bit in this will always be cleared, because the low bit in `a` is 0, and so the result of multiplying the low bit in `b` by it will always be 0, with no overflow (and therefore no impact on the rest of the result).  Adding 1 at the end sets the flag indicating that this is a small integer.

Once again, the multiplication will cause a 32-bit overflow if, and only if, the result will not fit in a 31-bit value.  This is very important, because without hardware overflow checking the only reliable way of determining if a multiply has overflowed is to perform it at double the required word size (e.g. 62-bit for a 32-bit system with 31-bit small integers) and then see if the result will fit in the real word size, which is very costly.

Using these two algorithms, LanguageKit achieves good performance on integer arithmetic and provides transparent overflow, whereby any arithmetic operation with a result that does not fit into a small integer is transparently promoted to an arbitrary-precision integer object.  
