---
layout: default
title: Publications
next_section: smallint
---

{% comment %}
This page will list all of the publications and is generated from
`_bibliography/publications.bib`.  The Articles and Books subheadings will only
appear if the BibTeX file contains entries of the relevant type (everything
that is not of type book is counted as an article, currently).
{% endcomment %}

{% include contents.markdown %}

{% capture articles %}{% bibliography --query @article, @inproceedings %}{% endcapture %}
{% if articles.size != 30 %}
Articles
--------

{{ articles }}
{% endif %}

{% capture books %}{% bibliography --query @book %}{% endcapture %}

{% if books.size != 30 %}
Books
-----

{{ books }}
{% endif %}

{% capture techreports %}{% bibliography --query @techreport %}{% endcapture %}

{% if techreports.size != 30 %}
Tech Reports
------------

{{ techreports }}
{% endif %}
