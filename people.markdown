---
layout: default
title: People
published: false
---

{% comment %}
The people.html inclusion will list 
{% endcomment %}

{% include contents.markdown %}

Principal Investigators
-----------------------

{% include people.html role='PI' style='verbose' %}

Students
--------

{% include people.html role='PhD' %}

Everyone
--------

{% include people.html %}
