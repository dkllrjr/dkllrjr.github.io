---
layout: default
title: My Sort of Inner Thoughts...
---

and really a lot of outer thoughts.

# Latest Posts

<ul>
	{% for post in site.posts %}
		{% if post.draft != 'true' %}
			<li>
				<h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
				<h3>{{ post.date | date_to_string: "ordinal", "US" }}</h3>
				{{ post.excerpt }}
			</li>
		{% endif %}
	{% endfor %}
</ul>
