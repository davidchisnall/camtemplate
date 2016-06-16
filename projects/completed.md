---
title: Selected past projects
layout: default
---

{% capture done %}
{% for project in site.projects %}
{% if project.done %}
### {{ project.title }} ({% if project.type == 2 %}Part II{% else %}MPhil{% endif %} project)
<p><b>Prerequisites:</b> {{ project.prerequisites}}</p>
{% if project.outcome %}
<p><b>Outcome:</b> {{ project.outcome}}</p>
{% endif %}
{{ project.content }}
<hr />
{% endif %}
{% endfor %}
{% endcapture %}
{% if done.size > 20  %}


These projects have been completed and may serve as an example of the kinds of project that I would be interested in supervising.

{% include contents.markdown %}

{{ done }}
{% endif %}
