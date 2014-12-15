---
title: PhD project ideas
layout: default
published: false
---

{% capture phd %}
{% for project in site.projects %}
{% if !project.done and (project.type contains 'phd') %}
###{{ project.title }}
<p><b>Prerequisites:</b> {{ project.prerequisites}}</p>
{{ project.content }}
<hr />
{% endif %}
{% endfor %}
{% endcapture %}
{% if phd.size > 20  %}
{% include contents.markdown %}
{{ phd }}
{% endif %}
