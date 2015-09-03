---
layout: default
title: People
published: false
---

{% comment %}
The people.html inclusion will list all of the people if no role is specified.  If you set the style to 'verbose' then it will put people one per line with description text alongside their photos, otherwise it will just show names and photos.
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
