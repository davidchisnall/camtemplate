---
title: Part II project ideas
layout: default
---

{% capture partII %}
{% for project in site.projects %}
{% if !project.done and (project.type == 2) %}
###{{ project.title }}
<p><b>Prerequisites:</b> {{ project.prerequisites}}</p>
{{ project.content }}
<hr />
{% endif %}
{% endfor %}
{% endcapture %}
{% if partII.size > 20  %}
{% include contents.markdown %}
{{ partII }}
{% else %}
I currently have no Part II project suggestions.
{% endif %}
