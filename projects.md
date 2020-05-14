---
layout: default
title: My Projects!
---

Not necessarily related to science or engineering (but usually are)!

{% assign projects = site.projects | sort: 'year' | reverse %}

<div class="project-container" id="project-list">
	<ul>
		{% for project in site.projects %}
			{% if project.draft != 'true' %}
				<li>
					<h2>
						<a href="{{ project.url }}">
							{{ project.title }}
						</a>
					</h2>
					{{ project.excerpt }}
				</li>
			{% endif %}
		{% endfor %}
	</ul>
</div>

