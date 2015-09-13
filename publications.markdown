---
layout: default
title: Publications
---

{% comment %}
This page will list all of the publications and is generated from
`_bibliography/publications.bib`.  The Articles and Books subheadings will only
appear if the BibTeX file contains entries of the relevant type (everything
that is not of type book is counted as an article, currently).
{% endcomment %}


CADETS is a new project that has not yet produced any publications.

{% comment %}
Uncomment this section when the sentence above is no longer true!

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
{% endcomment %}

Prior work
----------

Prior work by members of the CADETS project that is of relevance includes:

<div markdown='0'>
{% bibliography --file bibliography --sort date %}
</div>
