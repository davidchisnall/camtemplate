---
title: Part III / ACS project ideas
layout: default
---

{% capture partIII  %}
{% for project in site.projects %}
{% if (project.done == nil) and (project.type == '3') %}
###{{ project.title }}
<p><b>Prerequisites:</b> {{ project.prerequisites}}</p>
{{ project.content }}
<hr />
{% endif %}
{% endfor %}
{% endcapture %}
{% if partIII.size > 20  %}
{% include contents.markdown %}
{{ partIII }}
{% else %}
I currently have no Part III / ACS project suggestions.
{% endif %}

