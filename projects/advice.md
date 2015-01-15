---
title: Advice for project students
layout: default
---

{% include contents.markdown %}

Under promise and over deliver
------------------------------

The amount of time that you will have to do your project is a lot less than you think it is.  Identify the things that you think that you will have time to do.  Pick half of them and describe them in your proposal as possible extensions.  For Part II projects, part of your mark is based on how well you met the aims of your project.  It is far better to propose a relatively modest project and then do more than you claimed than it is to propose a very ambitious project and only complete half of it.

For Part III projects, the assessment is a little different.  Part III projects are expected to be research projects and most research projects change direction part way through.

Start writing early
-------------------

Your marks come from your dissertation, not your project.  Hopefully your project is fun and interesting and something that you want to spend time on but remember that it is meant to feed a dissertation.

Write the outline of your dissertation, in LaTeX, early.  Add rough notes as you go along.  Most importantly, write your results section first.  This will be full of placeholders at the start, but that helps you to structure your time.  Once you know what graphs you want to draw, you know what results you need.  You then know what you need to implement to get those results.  Focus on making those things work *first*.

By Christmas, you should have a complete outline, with a couple of paragraphs of notes or a list of bullet points for each section.  When you encounter something interesting, add more notes.  When you have a bit of spare time (or need a break from implementation), turn some of the notes into prose.

You do not want to get to a few weeks before the deadline and have to write the entire dissertation.  At that stage, you want to be refining and tidying existing text.

Your supervisor and DoS are on your side
----------------------------------------

Both your supervisor and your DoS have a vested interest in seeing you do well.  Make as much use of these resources as you can!  In particular, make sure that they get to see your work-in-progress results and your dissertations as early as possible.  Don’t be afraid that they’ll tell you that you’re doing things wrong, be afraid that no one will tell you and you’ll only find out after submitting your dissertation.

You do not lose any marks by showing your supervisor and DoS a draft that is incomplete or badly written.  Remember that they're likely to have lots of dissertations to look at.

Use good tools
--------------

There’s a saying that a bad workman blames his tools.  Mostly the reason for this is that a good workman picked good tools to start with.  Make sure that you are comfortable with the language, revision control systems, and so on.

In particular, spend some time over the summer making sure that you are *very* comfortable with a text editor.  It doesn’t matter if this is emacs, vim, or some GUI editor.  Over the course of your project and writing the dissertation, you will write a lot of text (prose and code) and if you spend the time fighting a text editor then you will be far less productive.

For the dissertation, a few LaTeX packages are very useful:

 * The hyperref package will automatically give you a clickable table of contents, make all cross-references clickable, and provide a ToC in the PDF.  Use it, or your supervisor will spend more time fighting the PDF and less time providing you with good feedback.
 * The listings package lets you typeset code listings nicely.  If you are putting code snippets into your dissertation, you probably want to use it.
 * The algorithmicx or algorithm2e packages let you typeset pseudocode algorithms in a clear and readable way.  If you want to describe an algorithm, use one of these.
 * TikZ has a fairly steep learning curve, but can produce nice diagrams that use the same fonts and so on as the rest of the document.
 * Pgfplots uses TikZ for drawing and can produce nice graphs.  Again, the learning curve is quite steep, but the results are worthwhile.
 * The latexdiff tool and the changebars package let you produce a PDF that has the changes annotated.  Each time you send a draft to your supervisor, commit it to you revision control system.  When you send the next draft, use latexdiff to produce a version highlighting the changes.

Public feedback helps
---------------------

You should be using revision control for both your code and your dissertation drafts.  Make sure that your DoS and supervisor both have access to both (at the very least, read-only access).  If you put your code somewhere public like GitHub, then you may find other people trying it.  It’s also easy to ask your supervisor to use the code review tools and spot mistakes early.  

If your code is useful and public and you get external contributors sending you patches, then make sure that you acknowledge them in the dissertation.  As long as the majority of the work is yours, it doesn't matter if other people have helped.  If other people are actually using your work and think it's interesting enough to fix bugs, then that's a great selling point to highlight in your conclusion.

Your writing sucks!
-------------------

This is the first Part II or Masters’ dissertation that you have written.  If you’re doing Part III, don’t assume that your experience from Part II directly translates.  You supervisor has read lots of dissertations and (hopefully) knows how to structure them in such a way that they’ll get marks.

Don’t be embarrassed about your writing.  It's probably terrible, but it's probably not much worse than anyone else in your year.  Let other people see it and fix the issues that they find.

Remember that the people marking your project are human.  Lots of studies have shown that people are more well-disposed towards well-written material.  If your dissertation is easy to read then it's easy to identify the things that are worth the marks.  If it's a struggle then it's very easy for to skip over some of your good work.  It's very easy to slip down a grade by making your examiners' lives difficult and very easy to get someone to proofread your work and make it better.

Common writing problems
-----------------------

Almost every use of ‘in order to’ should be removed.  You do something to do something else, or for something else to work, not in order to do something else or in order for something else to work.  

The rules for when you use ‘which’ and when to use ‘that’ are a bit complicated but the simple rule of thumb is that you only use ‘which’ after a comma.

I me mine
---------

Most of the work in your dissertation should be things that you did.  Don’t be afraid to say ‘I did this’, ‘my work included…’, and so on.  Avoid the passive voice and make it clear that you did the work.  If someone else did it, then don’t be afraid to mention them by name - you’re meant to be standing on the shoulders of giants.

It’s all about the science
--------------------------

1. Observe
2. Hypothesise
3. Test
4. Refine

Your dissertation should follow the scientific method.  Based on some informal observations (i.e. not necessarily detailed experimentation), you form an hypothesis.  From this, you make some predictions.  You then test them and refine them.

Make sure that each of these steps is visible.  The evaluation is very important.  What were you trying to test?  For example, did you want demonstrate that your technique provided a speedup to some workload?  How did you design your experiments?  For example, did you pick an off-the-shelf benchmark suite?  If so, then what criteria did you use to determine that it met your requirements?  If not, then why not?  What were the error margins in your experiment?  What statistical techniques did you use to identify experimental variations?

Once you have results, make sure that you present them well.  Graphs don’t contribute towards your word count, but don’t just put page after page of graphs and say ‘look, I have lots of results!’  Make sure that each graph is there to demonstrate a particular point and you refer to the graphs individually in the explanatory text.
